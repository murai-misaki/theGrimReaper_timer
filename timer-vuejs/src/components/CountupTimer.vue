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
</template>

<script>
import Push from 'push.js';

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

      audio: new Audio(require('@/assets/sounds/Short_Gothic_02.mp3'))
    }
  },
  mounted() {
    this.$emit('getNotification')
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
      this.startTimer(); // タイマーを再開する際にもstartTimer()を呼び出す
    },
    end() {
      this.stop()
      this.$emit('openShortenedLifespanModal')
    },
  }
}
</script>

<style scoped>
</style>