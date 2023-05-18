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
</template>

<script>
export default {
  data() {
    return {
      seconds: 0,
      minutes: 0,
      hours: 0,
      timerOn: true
    };
  },
  mounted() {
    const startTime = Date.now(); // 現在の時刻を取得
    setInterval(() => {
      const elapsedTime = Date.now() - startTime; // 開始時刻からの経過時間を計算
      this.seconds = Math.floor(elapsedTime / 1000) % 60;
      this.minutes = Math.floor(elapsedTime / 1000 / 60) % 60;
      this.hours = Math.floor(elapsedTime / 1000 / 60 / 60);
    }, 1000);
  },
  methods: {
    formatTime(value) {
      return value.toString().padStart(2, '0'); // 2桁の0埋めフォーマット
    },
    stop () {
      this.timerOn = false
    },
    start () {
      this.timerOn = true
    }
  },
};
</script>

<style scoped>
</style>