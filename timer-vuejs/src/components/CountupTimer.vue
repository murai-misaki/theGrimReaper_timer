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
import Push from 'push.js';
import axios from 'axios'

export default {
  props: ['notificationWay'],

  data() {
    return {
      seconds: 0,
      minutes: 0,
      hours: 0,
      timerOn: true,
      timerInterval: null,
      startTime: null,
      elapsedTime: 0,

      countUp: 0,
      shortenedLifespan: 0,
      totalCountUp: Number(window.localStorage.getItem('totalCountUp')),
      todayShortenedLifespan: Number(window.localStorage.getItem('todayShortenedLifespan')),

      onedaytimeTodayCountUp: 0,
      checkCountUpTime: 0,
      onedaytimeTodayShortenedLifespan: 0,
      todayTotalShortenedLifespan: 0,

      audio: new Audio(require('@/assets/sounds/Short_Gothic_02.mp3'))
    }
  },
  mounted() {
    this.$emit('getNotification')
    this.totalCountUp = Number(window.localStorage.getItem('totalCountUp'))
    this.todayShortenedLifespan = Number(window.localStorage.getItem('todayShortenedLifespan'))
    this.getShortenedLifespanToday().then(() => {
      this.todayTotalShortenedLifespan = this.onedaytimeTodayShortenedLifespan + this.todayShortenedLifespan
    })
    if (this.totalCountUp >= 480) {
      this.$emit('openRiskModal')
    } else {
      this.getCountUpToday().then(() => {
        this.checkCountUp()
      })
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
          if (this.notificationWay === true) {
            Push.create("座ったまま30分が経ちました", {
              body: "アプリのタイマー画面にて立ち上がるか教えてください",
              icon: require('@/assets/img/push_icon.png'),
              requireInteraction: true
            });
          } else {
            this.audio.play() // 鳴らす
          }
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
        }
      }, 1000);
    },
    stop() {
      clearInterval(this.timerInterval); // タイマーのインターバルをクリア
      this.timerOn = false;
    },
    start() {
      this.timerOn = true;
      this.totalCountUp = Number(window.localStorage.getItem('totalCountUp'))
      this.todayShortenedLifespan = Number(window.localStorage.getItem('todayShortenedLifespan'))
      this.getShortenedLifespanToday().then(() => {
        this.todayTotalShortenedLifespan = this.onedaytimeTodayShortenedLifespan + this.todayShortenedLifespan
      })
      if (this.totalCountUp >= 480) {
        this.$emit('openRiskModal')
      } else {
        this.getCountUpToday().then(() => {
          this.checkCountUp()
        })
      }
      this.startTimer(); // タイマーを再開する際にもstartTimer()を呼び出す
    },
    end() {
      this.stop()
      this.$emit('openShortenedLifespanModal')
    },
    async getCountUpToday () {
      try {
        const res = await axios.get(process.env.VUE_APP_API_URL + `/one_day_times/today`, {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })
        if (!res) {
          throw new Error('本日の座っている時間を取得できませんでした')
        }
        this.onedaytimeTodayCountUp = res.data.count_up
        console.log({ res })
      } catch (error) {
        console.log(error)
      }
    },
    checkCountUp () {
      this.checkCountUpTime = this.onedaytimeTodayCountUp + this.totalCountUp

      if (this.checkCountUpTime >= 480) {
        this.$emit('openRiskModal')
      }
    },
    async getShortenedLifespanToday () {
      try {
        const res = await axios.get(process.env.VUE_APP_API_URL + `/one_day_times/today`, {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })
        if (!res) {
          throw new Error('本日の1時間座り続けたことで縮んだ寿命を取得できませんでした')
        }
        this.onedaytimeTodayShortenedLifespan = res.data.shortened_lifespan
        console.log({ res })
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
      0 0 40px #0fa,
      0 0 80px #0fa,
      0 0 90px #0fa,
      0 0 100px #0fa,
      0 0 150px #0fa;
    } 
    20%, 24%, 55% {
      text-shadow: none;
    }
  }

</style>