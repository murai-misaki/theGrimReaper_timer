<template>
  <div class="container">
    <div class="space"></div>
    <div class="icon-group">
      <font-awesome-icon :icon="['fas', 'gear']" style="color: #D9D9D9;" class="setting-icon" />
      <font-awesome-icon :icon="['fas', 'circle-question']" style="color: #D9D9D9;" class="question-icon" />
      <font-awesome-icon :icon="['fas', 'book-skull']" style="color: #D9D9D9;" class="skull-icon" />
    </div>
    <div v-if="showTimer">
      <CountupTimer @getNotification="getNotification" :notificationWay="notificationWay" />
    </div>
    <div v-if="!showTimer">
      <BreaktimeTimer @getNotification="getNotification" :notificationWay="notificationWay" />
     </div>
     <p>{{notificationWay}}</p>
  </div>
</template>

<script>
  import axios from 'axios'
  import CountupTimer from '../components/CountupTimer.vue'
  import BreaktimeTimer from '../components/BreaktimeTimer.vue'

  export default {
    components: { CountupTimer, BreaktimeTimer },

    data () {
      return {
        showTimer: false,
        notificationWay: false,
      }
    },
    methods: {
      async getNotification () {
        try {
          const res = await axios.get(`http://localhost:3000/notifications`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            throw new Error('現在の通知方法を取得できませんでした')
          }
          this.notificationWay = res.data.way
        } catch (error) {
          console.log(error)
        }
      },
    }
  }
</script>

<style>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');
  @import url('https://fonts.googleapis.com/css2?family=Almendra+SC&display=swap');

  .timer-group {
    border: 2px solid #D9D9D9;
    padding-bottom: 48px;
  }
  .timer-button {
    margin-top: 80px;
    text-align: center;
  }
  button.end {
    margin-left:150px;
    font-family: 'IM Fell English SC', serif;
    font-size: 45px;
    padding: 10px 60px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #A40505;
    background: #000000;
    cursor: pointer;
  }
  button.end:hover {
  color: #A40505;;
  background: rgba(217, 217, 217, 0.2);
  }

  button.stop {
    font-family: 'IM Fell English SC', serif;
    font-size: 45px;
    padding: 10px 60px;
    border: 3px solid #8F0B0B;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }

button.stop:hover {
  color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }
  button.start {
    font-family: 'IM Fell English SC', serif;
    font-size: 45px;
    padding: 10px 50px;
    border: 3px solid #8F0B0B;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }

button.start:hover {
  color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }

  .space {
    margin-bottom: 60px;
  }

  .icon-group {
    font-size: 30px;
    padding-bottom: 20px;
    margin-left: 780px;
    cursor: pointer;
  }
  .question-icon {
    padding-left: 40px;
    padding-right: 40px;
  }

  .timer {
    margin: 0 auto;
    padding-bottom: 20px;
    margin-top: 50px;
    border: 11px solid #D9D9D9;
    width: 700px;
    font-family: 'Almendra SC', serif;
    text-align: center;
    font-size: 130px;
    color: #daf6ff; /* 文字の色 */
    text-shadow: 0 0 20px #0aafe6; /* 文字を発光させる */
  }
</style>