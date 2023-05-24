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
  <p>体を動かしましょう。</p>
  <div class="exercise-button-group">
    <button class="exercise-button1">全身バランスよく</button>
    <button class="exercise-button2">肩こり・肩痛予防</button>
    <button class="exercise-button3">腰痛・膝痛予防</button>
    <button class="exercise-button4">下肢筋力アップ</button>
    <button class="exercise-button5">ロコモチェック</button>
    <button class="exercise-button6">水を飲みましょう</button>
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
      this.$emit('openShortenedLifespanModal')
    },
  }
};
</script>

<style scoped>
  p {
    margin-top: 50px;
    padding-left: 25px;
    padding-right: 20px;
    font-size: 20px;
    border-bottom: 1px solid #525151;
    width: 200px;
  }

.exercise-button-group {
  margin-top: 30px;
}
.exercise-button1 {
  display: inline-block;
  text-decoration: none;
  color: #D9D9D9;
  width: 130px;
  height: 130px;
  line-height: 120px;
  border-radius: 50%;
  border: double 3px #D9D9D9;
  overflow: hidden;
  transition: .6s;
  background: #000000;
  cursor: pointer;
}
.exercise-button1:hover {
  -webkit-transform: rotateY(360deg);
  transform: rotateY(360deg);
}

.exercise-button2 {
  display: inline-block;
  text-decoration: none;
  color: #D9D9D9;
  width: 130px;
  height: 130px;
  line-height: 120px;
  border-radius: 50%;
  border: double 3px #D9D9D9;
  overflow: hidden;
  transition: .6s;
  background: #000000;
  margin-left: 35px;
  cursor: pointer;
}
.exercise-button2:hover {
  -webkit-transform: rotateY(360deg);
  transform: rotateY(360deg);
}

.exercise-button3 {
  display: inline-block;
  text-decoration: none;
  color: #D9D9D9;
  width: 130px;
  height: 130px;
  line-height: 120px;
  border-radius: 50%;
  border: double 3px #D9D9D9;
  overflow: hidden;
  transition: .6s;
  background: #000000;
  margin-left: 35px;
  cursor: pointer;
}
.exercise-button3:hover {
  -webkit-transform: rotateY(360deg);
  transform: rotateY(360deg);
}

.exercise-button4 {
  display: inline-block;
  text-decoration: none;
  color: #D9D9D9;
  width: 130px;
  height: 130px;
  line-height: 120px;
  border-radius: 50%;
  border: double 3px #D9D9D9;
  overflow: hidden;
  transition: .6s;
  background: #000000;
  margin-left: 35px;
  cursor: pointer;
}
.exercise-button4:hover {
  -webkit-transform: rotateY(360deg);
  transform: rotateY(360deg);
}
.exercise-button5  {
  display: inline-block;
  text-decoration: none;
  color: #D9D9D9;
  width: 130px;
  height: 130px;
  line-height: 120px;
  border-radius: 50%;
  border: solid 2px #D9D9D9;
  overflow: hidden;
  transition: .4s;
  background: #000000;
  margin-left: 35px;
  cursor: pointer;
}
.exercise-button5:hover {
  background: rgba(10, 71, 20, 0.6);
}

.exercise-button6 {
  display: inline-block;
  text-decoration: none;
  color: #D9D9D9;
  width: 130px;
  height: 130px;
  line-height: 120px;
  border-radius: 50%;
  border: solid 2px #D9D9D9;
  overflow: hidden;
  transition: .4s;
  background: #000000;
  margin-left: 35px;
  cursor: pointer;
}

.exercise-button6:hover {
  background: rgba(12, 63, 109, 0.6);
}

</style>