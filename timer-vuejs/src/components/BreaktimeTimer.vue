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
      minutes: 3,
      hours: 0,
      timerOn: false,
      timerInterval: null,
      startTime: null,
      elapsedTime: 0,

      audio: new Audio(require('@/assets/sounds/Short_Gothic_07.mp3'))
    };
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
      this.timerOn = true;
      this.startTime = Date.now() - this.elapsedTime; // 停止前の経過時間を考慮して開始時刻を設定
      this.timerInterval = setInterval(() => {
        const currentTime = Date.now();
        this.elapsedTime = currentTime - this.startTime; // 経過時間を更新

        const remainingTime = Math.max(180000 - this.elapsedTime, 0); // 残り時間を計算（最低0にする）
        this.seconds = Math.floor(remainingTime / 1000) % 60;
        this.minutes = Math.floor(remainingTime / 1000 / 60) % 60;
        this.hours = Math.floor(remainingTime / 1000 / 60 / 60);

        if (this.hours === 0 && this.minutes === 0 && this.seconds === 0) {
          if (this.notificationWay === true) {
            Push.create("立ち上がって3分が経ちました", {
              body: "ブレイクタイムを終了します",
              icon: require('@/assets/img/push_icon.png'),
              requireInteraction: true
            });
          } else {
            this.audio.play() // 鳴らす
          }
          clearInterval(this.timerInterval); // タイマーのインターバルを停止
          this.$emit('showCountupTimer')
        }
      }, 990);
    },
    stop() {
      clearInterval(this.timerInterval); // タイマーのインターバルをクリア
      this.timerOn = false;
    },
    start() {
      this.timerOn = true;
      this.startTimer(); // タイマーを再開する際にもstartTimer()を呼び出す
    },
    end() {
      this.stop()
      this.$emit('openShortenedLifespanModal')
    },
  }
};
</script>

<style scoped>
</style>