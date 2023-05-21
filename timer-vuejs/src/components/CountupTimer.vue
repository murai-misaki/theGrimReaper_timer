<template>
  <div class="timer-group">
    <div class="timer">
      {{ formatTime(hours) }}:{{ formatTime(minutes) }}:{{ formatTime(seconds) }}
    </div>
    <div class="timer-button">
      <button class="stop" @click="stop" v-show="timerOn">Stop</button>
      <button class="start" @click="start" v-show="!timerOn">Start</button>
      <button class="end">End</button>
    </div>
  </div>
  <p>{{ count_up }}</p>
  <p>{{ shortened_lifespan }}</p>
  <p>{{total_shortened_lifespan}}</p>
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
      timerOn: false,
      timerInterval: null,
      startTime: null,
      elapsedTime: 0,

      count_up: 0,
      shortened_lifespan: 0,
      total_shortened_lifespan: 0,

      audio: new Audio(require('@/assets/sounds/Short_Gothic_02.mp3'))
    }
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

        // 30分経過するごとにcount_upに30加算する
        if (this.minutes % 30 === 0 && this.seconds === 0) {
          this.count_up += 30;
          if (this.notificationWay === true) {
            Push.create("座ったまま30分が経ちました", {
              body: "アプリのタイマー画面にて立ち上がるか教えてください",
              icon: require('@/assets/img/push_icon.png'),
              requireInteraction: true
            });
          } else {
            this.audio.play() // 鳴らす
          }
          clearInterval(this.timerInterval); // タイマーのインターバルを停止
        }

        // 1時間経過するごとにshortened_lifespanとtotal_shortened_lifespanに22加算する
        if (this.hours > 0 && this.minutes === 0 && this.seconds === 0) {
          this.shortened_lifespan += 22;
          this.total_shortened_lifespan += 22;
        }
      }, 1000);
    },
    stop() {
      clearInterval(this.timerInterval); // タイマーのインターバルをクリア
      this.timerOn = false;
    },
    start() {
      this.timerOn = true;
      Push.Permission.request();
      this.$emit('getNotification')
      this.startTimer(); // タイマーを再開する際にもstartTimer()を呼び出す
    },
  }
}
</script>

<style scoped>
</style>