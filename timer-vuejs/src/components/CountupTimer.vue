<template>
  <div class="timer-group">
    <div class="timer">
      {{ formatTime(hours) }}:{{ formatTime(minutes) }}:{{ formatTime(seconds) }}
    </div>
    <div class="timer-button">
      <button class="stop" @click="stop" v-show="timerOn">Stop</button>
      <button class="start" @click="start" v-show="!timerOn">Start</button>
      <button class="end" @click="end">End</button>
    </div>
  </div>
  <div v-show="todayTotalShortenedLifespan">
    <p><span class="english_version neontext">Your lifispan was shortened today : <span class="time">total {{ todayTotalShortenedLifespan }} minutes</span></span><br><span class="japanese_varsion">''1時間座り続けたことで本日縮んだ寿命 : 合計 {{ todayTotalShortenedLifespan }}分''</span></p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: ['guest'],

  data() {
    return {
      seconds: 0,
      minutes: 0,
      hours: 0,
      timerOn: true,
      timerInterval: null,
      startTime: null,
      elapsedTime: 0,

      totalCountUp: Number(window.localStorage.getItem('totalCountUp')),
      todayShortenedLifespan: Number(window.localStorage.getItem('todayShortenedLifespan')),
      countUp: 0,
      shortenedLifespan: 0,

      onedaytimeTodayCountUp: 0,
      checkCountUpTime: 0,
      onedaytimeTodayShortenedLifespan: 0,
      todayTotalShortenedLifespan: 0,

      riskUsed: window.localStorage.getItem('riskUsed'),
      privacy: window.localStorage.getItem('privacy'),
      shortenedLifespanMessage: '1時間座り続けたことで寿命を22分戴きました',
      riskMessage: '本日座っている時間が合計8時間を越えました。これ以上座り続けると、罹患リスクや死亡リスクが高まります',
      shinigami: true,
    }
  },
  mounted() {
    this.totalCountUp = Number(window.localStorage.getItem('totalCountUp'))
    this.todayShortenedLifespan = Number(window.localStorage.getItem('todayShortenedLifespan'))
    this.getShortenedLifespanToday().then(() => {
      this.todayTotalShortenedLifespan = this.onedaytimeTodayShortenedLifespan + this.todayShortenedLifespan
    })
    if (this.riskUsed === 'false') {
      this.riskCheck()
    }
    this.startTimer();
  },
  methods: {
    formatTime(value) {
      return value.toString().padStart(2, '0'); // 2桁の0埋めフォーマット
    },
    startTimer() {
      this.startTime = Date.now() - this.elapsedTime; // 停止前の経過時間を考慮して開始時刻を設定
      this.timerInterval = setInterval(() => {
        const currentTime = Date.now();
        this.elapsedTime = currentTime - this.startTime; // 経過時間を更新

        this.seconds = Math.floor(this.elapsedTime / 1000) % 60;
        this.minutes = Math.floor(this.elapsedTime / 1000 / 60) % 60;
        this.hours = Math.floor(this.elapsedTime / 1000 / 60 / 60);

        // 30分経過するごとにcountUpに30加算する
        if (this.minutes % 30 === 0 && this.seconds === 0) {
          if (this.totalCountUp) {
            this.countUp = this.totalCountUp + 30;
          } else {
            this.countUp += 30;
          }
          window.localStorage.setItem('totalCountUp', this.countUp)
          this.totalCountUp = Number(window.localStorage.getItem('totalCountUp'))
          this.$emit('openStandupModal')
        }

        // 1時間経過するごとにshortenedLifespanに22加算する
        if (this.hours > 0 && this.minutes === 0 && this.seconds === 0) {
          if (this.todayShortenedLifespan) {
            this.shortenedLifespan = this.todayShortenedLifespan + 22;
          } else {
            this.shortenedLifespan += 22;
          }
          window.localStorage.setItem('todayShortenedLifespan', this.shortenedLifespan)
          this.todayShortenedLifespan = Number(window.localStorage.getItem('todayShortenedLifespan'))
          this.todayTotalShortenedLifespan = this.onedaytimeTodayShortenedLifespan + this.todayShortenedLifespan
          this.sentShortenedLifespanMessage()
        }
      }, 1000);
    },
    stop() {
      clearInterval(this.timerInterval); // タイマーのインターバルをクリア
      this.timerOn = false;
    },
    start() {
      this.timerOn = true;
      if (this.riskUsed === 'false') {
        this.riskCheck()
      }
      this.startTimer(); // タイマーを再開する際にもstartTimer()を呼び出す
    },
    end() {
      this.stop()
      this.$emit('openShortenedLifespanModal')
    },
    async getCountUpToday () {
      try {
        const res = await axios.get(process.env.VUE_APP_API_URL + `/one_day_times/today_count_up`, {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })
        if (!res) {
          throw new Error('本日の座っている時間を取得できませんでした')
        }
        if (res.data.count_up) {
          this.onedaytimeTodayCountUp = res.data.count_up
        }
      } catch (error) {
        console.log(error)
      }
    },
    checkCountUp () {
      this.checkCountUpTime = this.onedaytimeTodayCountUp + this.totalCountUp

      if (this.checkCountUpTime >= 480) {
        this.sentRiskMessage()
        this.$emit('openRiskModal')
        this.riskUsed = window.localStorage.getItem('riskUsed')
      }
    },
    riskCheck () {
      if (this.totalCountUp >= 480) {
        this.sentRiskMessage()
        this.$emit('openRiskModal')
        this.riskUsed = window.localStorage.getItem('riskUsed')
      } else {
        this.getCountUpToday().then(() => {
          this.checkCountUp()
        })
      }
    },
    sentShortenedLifespanMessage () {
      if (this.guest === 'false' && this.privacy === 'false') {
        this.$emit('connectCable', this.shortenedLifespanMessage, this.shinigami)
      }
    },
    sentRiskMessage () {
      if (this.guest === 'false' && this.privacy === 'false') {
        this.$emit('connectCable', this.riskMessage, this.shinigami)
      }
    },
    async getShortenedLifespanToday () {
      try {
        const res = await axios.get(process.env.VUE_APP_API_URL + `/one_day_times/today_shortened_lifespan`, {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })
        if (!res) {
          throw new Error('本日の1時間座り続けたことで縮んだ寿命を取得できませんでした')
        }
        if (res.data.shortened_lifespan) {
          this.onedaytimeTodayShortenedLifespan = res.data.shortened_lifespan
        }
      } catch (error) {
        console.log(error)
      }
    },
  }
}
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');
  
  p {
    text-align: center;
  }
  .english_version {
    font-family: 'IM Fell English SC', serif; 
    font-size: 30px;
  }
  .time {
    margin-left: 20px;
  }

  .neontext {
  animation: flicker 1.5s infinite alternate;
  color: #fff;
  }
  @keyframes flicker {
  0%, 18%, 22%, 25%, 53%, 57%, 100% {
      text-shadow:
      0 0 4px #fff,
      0 0 11px #fff,
      0 0 19px #fff,
      0 0 40px #f09,
      0 0 80px #f09,
      0 0 90px #f09,
      0 0 100px #f09,
      0 0 150px #f09;
    } 
    20%, 24%, 55% {
      text-shadow: none;
    }
  }

</style>