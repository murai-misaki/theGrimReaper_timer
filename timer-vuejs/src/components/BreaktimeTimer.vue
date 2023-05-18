<template>
  <div>
    <p>{{ formatTime(hours) }}:{{ formatTime(minutes) }}:{{ formatTime(seconds) }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      seconds: 0,
      minutes: 3,
      hours: 0,
    };
  },
mounted() {
  const startTime = Date.now(); // 現在の時刻を取得
  setInterval(() => {
    const elapsedTime = Date.now() - startTime; // 開始時刻からの経過時間を計算
    const remainingTime = Math.max(180000 - elapsedTime, 0); // 残り時間を計算（最低0にする）
    this.seconds = Math.floor(remainingTime / 1000) % 60;
    this.minutes = Math.floor(remainingTime / 1000 / 60) % 60;
    this.hours = Math.floor(remainingTime / 1000 / 60 / 60);
  }, 990);
},
  methods: {
    formatTime(value) {
      return value.toString().padStart(2, '0'); // 2桁の0埋めフォーマット
    },
  },
};
</script>
<style scoped>
</style>