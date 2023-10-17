<template>
  <div class="container">
    <div class="timerpage-top-space"></div>
    <div class="icon-group">
      <div v-show="guest === 'false'" @click="openChatModal">
        <font-awesome-icon :icon="['fas', 'comment-dots']" style="color: #D9D9D9;" class="chat-icon" />
      </div>
      <div @click="openNotificationModal">
        <font-awesome-icon :icon="['fas', 'gear']" style="color: #D9D9D9;" />
      </div>
      <div @click="openHowtouseModal">
        <font-awesome-icon :icon="['fas', 'circle-question']" style="color: #D9D9D9;" class="question-icon" />
      </div>
      <div @click="openHealthriskModal">
        <font-awesome-icon :icon="['fas', 'book-skull']" style="color: #D9D9D9;" />
      </div>
    </div>
    <div v-if="showTimer">
      <CountupTimer ref="countupTimer" @getNotification="getNotification" @openStandupModal="openStandupModal" :notificationWay="notificationWay" @openShortenedLifespanModal="openShortenedLifespanModal" @openRiskModal="openRiskModal" @connectCable="connectCable" :guest="guest" />
    </div>
    <div v-if="!showTimer">
      <BreaktimeTimer @getNotification="getNotification" :notificationWay="notificationWay" @showCountupTimer="showCountupTimer" @openShortenedLifespanModal="openShortenedLifespanModal" />
    </div>
    <div v-show="!showTimer">
      <p class="exercise-title">体を動かしましょう。</p>
      <div class="exercise-button-group">
        <button @click="openFullBodyModal" class="exercise-button1">全身バランスよく</button>
        <button @click="openShoulderPainModal" class="exercise-button2">肩こり・肩痛予防</button>
        <button @click="openLowbackPainModal" class="exercise-button3">腰痛・膝痛予防</button>
        <button @click="openLegMuscleModal" class="exercise-button4">下肢筋力アップ</button>
        <button @click="openLocomoCheckModal" class="exercise-button5">ロコモチェック</button>
      </div>
      <p class="exercise-reference">※ 引用 : 千葉県健康福祉部健康づくり支援課(監修:千葉県理学療法士会)「WORK+10 (ワークプラステン) 」</p>
    </div>
    <ChatModal ref="chatModal" :messages="formattedMessages" @connectCable="connectCable" />
    <NotificationModal ref="notificationModal" @getNotification="getNotification" :notificationWay="notificationWay" :loading="loading" @showLoading="showLoading" @endLoading="endLoading" />
    <HowtouseModal ref="howtouseModal" />
    <HealthriskModal ref="healthriskModal" />
    <StandupModal ref="standupModal" @showBreaktimeTimer="showBreaktimeTimer" @restartCountupTimer="restartCountupTimer" />
    <ShortenedLifespanModal ref="shortenedLifespanModal" :loading="loading" @showLoading="showLoading" :guest="guest" />
    <RiskModal ref="risakModal" />
    <FullBody ref="fullBody" />
    <ShoulderPain ref="shoulderPain" />
    <LowbackPain ref="lowbackPain" />
    <LegMuscle ref="legMuscle" />
    <LocomoCheck ref="locomoCheck" />
  </div>
</template>

<script>
  import axios from 'axios'
  import ActionCable from 'actioncable'
  import { formatDistanceToNow } from 'date-fns'
  import { ja } from 'date-fns/locale'
  import CountupTimer from '../components/CountupTimer.vue'
  import BreaktimeTimer from '../components/BreaktimeTimer.vue'
  import ChatModal from '../components/ChatModal.vue'
  import NotificationModal from '../components/NotificationModal.vue'
  import HowtouseModal from  '../components/HowtouseModal.vue'
  import HealthriskModal from '../components/HealthriskModal.vue'
  import StandupModal from '../components/StandupModal.vue'
  import ShortenedLifespanModal from '../components/ShortenedLifespanModal.vue'
  import RiskModal from '../components/RiskModal.vue'
  import FullBody from '../components/FullBody.vue'
  import ShoulderPain from '../components/ShoulderPain.vue'
  import LowbackPain  from '../components/LowbackPain.vue'
  import LegMuscle from '../components/LegMuscle.vue'
  import LocomoCheck from '../components/LocomoCheck.vue'

  export default {
    components: { CountupTimer, BreaktimeTimer, ChatModal, NotificationModal, HowtouseModal, HealthriskModal, StandupModal, ShortenedLifespanModal, RiskModal, FullBody, ShoulderPain, LowbackPain, LegMuscle, LocomoCheck },

    data () {
      return {
        showTimer: true,
        notificationWay: false,
        loading: false,
        messages: [],
        guest: window.localStorage.getItem('guest'),
      }
    },
    mounted () {
      if (this.guest === 'false') {
        this.initializeMessageChannel()
      }
      window.addEventListener("beforeunload", this.confirmSave);
      document.body.style.overflow = 'auto';
    },
    beforeUnmount () { 
      if (this.guest === 'false') {
        this.messageChannel.unsubscribe()
      }
    },
    unmounted () {
      window.removeEventListener("beforeunload", this.confirmSave);
    },
    computed: {
      formattedMessages () {
        if (!this.messages.length) { return [] }
        return this.messages.map(message => {
          let time = formatDistanceToNow(new Date(message.created_at), { locale: ja })
          return { ...message, created_at: time }
        })
      }
    },  
    methods: {
      async getNotification () {
        try {
          const res = await axios.get(process.env.VUE_APP_API_URL + `/notifications`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            throw new Error('現在の通知方法を取得できませんでした')
          }
          this.notificationWay = res.data.data.attributes.way
        } catch (error) {
          console.log(error)
        }
      },
      openChatModal () {
        this.$refs.chatModal.openScrollToBottom()
      },
      openNotificationModal () {
        this.$refs.notificationModal.open()
      },
      openHowtouseModal () {
        this.$refs.howtouseModal.open()
      },
      openHealthriskModal () {
        this.$refs.healthriskModal.open()
      },
      openStandupModal () {
        this.$refs.countupTimer.stop()
        this.$refs.standupModal.open()
      },
      showBreaktimeTimer () {
        this.$refs.standupModal.close()
        this.showTimer = false
      },
      showCountupTimer () {
        this.showTimer = true
      },
      restartCountupTimer () {
        this.$refs.standupModal.close()
        this.$refs.countupTimer.start()
      },
      openShortenedLifespanModal () {
        this.$refs.shortenedLifespanModal.open()
      },
      openRiskModal () {
        this.$refs.risakModal.open()
      },
      confirmSave (event) {
        event.returnValue = "タイマー記録は保存されませんが、よろしいですか？";
      },
      openFullBodyModal () {
        this.$refs.fullBody.open()
      },
      openShoulderPainModal () {
        this.$refs.shoulderPain.open()
      },
      openLowbackPainModal () {
        this.$refs.lowbackPain.open()
      },
      openLegMuscleModal () {
        this.$refs.legMuscle.open()
      },
      openLocomoCheckModal () {
        this.$refs.locomoCheck.open()
      },
      showLoading () {
        this.loading = true
      },
      endLoading () {
        this.loading = false
      },
      initializeMessageChannel () {
        const cable = ActionCable.createConsumer(process.env.VUE_APP_WS_URL)
        this.messageChannel = cable.subscriptions.create('RoomChannel', {
          connected: () => {
            this.getMessages()
          },
          received: () => {
            this.getMessages().then(() => {
              this.$refs.chatModal.scrollToBottom()
            })
          }
        })
      },
      async getMessages () {
        try {
          const res = await axios.get(process.env.VUE_APP_API_URL + `/messages`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client:window.localStorage.getItem('client')
            }
          })
          if (!res) {
            new Error('メッセージ一覧を取得できませんでした')
          }
          this.messages = res.data
        } catch (err) {
          console.log(err)
        }
      },
      connectCable (message, shinigami) {
        this.messageChannel.perform('receive', {
          message: message,
          shinigami: shinigami,
          email: window.localStorage.getItem('uid')
        })
      }
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

  .timerpage-top-space {
    margin-bottom: 60px;
  }

  .icon-group {
    font-size: 30px;
    padding-bottom: 20px;
    margin-left: 700px;
    display: flex
  }
  .icon-group div {
    cursor: pointer;
  }
  .chat-icon {
    padding-right: 40px;
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

  p.exercise-title {
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
    margin-left: 55px;
    cursor: pointer;
    font-size: 14px;
  }
  .exercise-button1:hover {
    background: rgba(10, 71, 20, 0.6);
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
    margin-left: 50px;
    cursor: pointer;
    font-size: 14px;
  }
  .exercise-button2:hover {
    background: rgba(10, 71, 20, 0.6);
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
    margin-left: 50px;
    cursor: pointer;
    font-size: 14px;
  }
  .exercise-button3:hover {
    background: rgba(10, 71, 20, 0.6);
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
    margin-left: 50px;
    cursor: pointer;
    font-size: 14px;
  }
  .exercise-button4:hover {
    background: rgba(10, 71, 20, 0.6);
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
    margin-left: 50px;
    cursor: pointer;
    font-size: 14px;
  }
  .exercise-button5:hover {
    background: rgba(10, 71, 20, 0.6);
  }
  p.exercise-reference {
    color: #BFBFBF;
    font-size: 7px;
  }
</style>