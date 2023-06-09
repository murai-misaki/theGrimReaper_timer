<template>
  <div class="container">
    <div class="space"></div>
    <div class="icon-group">
      <div @click="openNotificationModal">
        <font-awesome-icon :icon="['fas', 'gear']" style="color: #D9D9D9;" class="setting-icon" />
      </div>
      <div @click="openHowtouseModal">
        <font-awesome-icon :icon="['fas', 'circle-question']" style="color: #D9D9D9;" class="question-icon" />
      </div>
      <div @click="openHealthriskModal">
        <font-awesome-icon :icon="['fas', 'book-skull']" style="color: #D9D9D9;" class="skull-icon" />
      </div>
    </div>
    <div v-if="showTimer">
      <CountupTimer ref="countupTimer" @getNotification="getNotification" @openStandupModal="openStandupModal" :notificationWay="notificationWay" @openShortenedLifespanModal="openShortenedLifespanModal" @openRiskModal="openRiskModal" :totalCountUp="totalCountUp" :todayShortenedLifespan="todayShortenedLifespan" />
    </div>
    <div v-if="!showTimer">
      <BreaktimeTimer @getNotification="getNotification" :notificationWay="notificationWay" @showCountupTimer="showCountupTimer" @openShortenedLifespanModal="openShortenedLifespanModal" />
    </div>
    <div v-if="!showTimer">
      <p class="exercise-title">体を動かしましょう。</p>
      <div class="exercise-button-group">
        <button @click="openFullBodyModal" class="exercise-button1">全身バランスよく</button>
        <button @click="openShoulderPainModal" class="exercise-button2">肩こり・肩痛予防</button>
        <button @click="openLowbackPainModal" class="exercise-button3">腰痛・膝痛予防</button>
        <button @click="openLegMuscleModal" class="exercise-button4">下肢筋力アップ</button>
        <button @click="openLocomoCheckModal" class="exercise-button5">ロコモチェック</button>
        <button @click="openDrinkWater" class="exercise-button6">水を飲みましょう</button>
      </div>
      <p class="exercise-reference">※ 引用 : 千葉県健康福祉部健康づくり支援課(監修:千葉県理学療法士会)「WORK+10 (ワークプラステン) 」</p>
    </div>
    <NotificationModal ref="notificationModal" @getNotification="getNotification" :notificationWay="notificationWay" :loading="loading" @showLoading="showLoading" @endLoading="endLoading" />
    <HowtouseModal ref="howtouseModal" />
    <HealthriskModal ref="healthriskModal" />
    <div v-show="showStandupModal">
      <StandupModal @showBreaktimeTimer="showBreaktimeTimer" @restartCountupTimer="restartCountupTimer" />
    </div>
    <div v-show="showShortenedLifespanModal">
      <ShortenedLifespanModal :totalCountUp="totalCountUp" :todayExercise="todayExercise" :todayShortenedLifespan="todayShortenedLifespan" :loading="loading" @showLoading="showLoading" />
    </div>
    <div v-show="showRiskModal">
      <RiskModal @closeRiskModal="closeRiskModal" />
    </div>
    <FullBody ref="fullBody" />
    <ShoulderPain ref="shoulderPain" />
    <LowbackPain ref="lowbackPain" />
    <LegMuscle ref="legMuscle" />
    <LocomoCheck ref="locomoCheck" />
    <DrinkWater ref="drinkWater" />
  </div>
</template>

<script>
  import axios from 'axios'
  import CountupTimer from '../components/CountupTimer.vue'
  import BreaktimeTimer from '../components/BreaktimeTimer.vue'
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
  import DrinkWater from '../components/DrinkWater.vue'

  export default {
    components: { CountupTimer, BreaktimeTimer, NotificationModal, HowtouseModal, HealthriskModal, StandupModal, ShortenedLifespanModal, RiskModal, FullBody, ShoulderPain, LowbackPain, LegMuscle, LocomoCheck, DrinkWater },

    data () {
      return {
        showTimer: true,
        notificationWay: false,
        showStandupModal: false,
        showShortenedLifespanModal: false,
        showRiskModal: false,
        totalCountUp: Number(window.localStorage.getItem('totalCountUp')),
        todayExercise: Number(window.localStorage.getItem('todayExercise')),
        todayShortenedLifespan: Number(window.localStorage.getItem('todayShortenedLifespan')),
        loading: false,
      }
    },
    mounted () {
      window.addEventListener("beforeunload", this.confirmSave);
    },
    unmounted () {
      window.removeEventListener("beforeunload", this.confirmSave);
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
        this.showStandupModal = true
      },
      showBreaktimeTimer () {
        this.showStandupModal = false
        this.showTimer = false
      },
      showCountupTimer () {
        this.totalCountUp = Number(window.localStorage.getItem('totalCountUp'))
        this.todayShortenedLifespan = Number(window.localStorage.getItem('todayShortenedLifespan'))
        this.showTimer = true
      },
      restartCountupTimer () {
        this.showStandupModal = false
        this.totalCountUp = Number(window.localStorage.getItem('totalCountUp'))
        this.todayShortenedLifespan = Number(window.localStorage.getItem('todayShortenedLifespan'))
        this.$refs.countupTimer.start()
      },
      openShortenedLifespanModal () {
        window.scrollTo(0, 0);
        this.showShortenedLifespanModal = true
        this.totalCountUp = Number(window.localStorage.getItem('totalCountUp'))
        this.todayExercise = Number(window.localStorage.getItem('todayExercise'))
        this.todayShortenedLifespan = Number(window.localStorage.getItem('todayShortenedLifespan'))
      },
      openRiskModal () {
        this.showRiskModal = true
      },
      closeRiskModal () {
        this.showRiskModal = false
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
      openDrinkWater () {
        this.$refs.drinkWater.open()
      },
      showLoading () {
        this.loading = true
      },
      endLoading () {
        this.loading = false
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

  .space {
    margin-bottom: 60px;
  }

  .icon-group {
    font-size: 30px;
    padding-bottom: 20px;
    margin-left: 780px;
    display: flex
  }
  .icon-group div {
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
    cursor: pointer;
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
    margin-left: 35px;
    cursor: pointer;
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
    margin-left: 35px;
    cursor: pointer;
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
    margin-left: 35px;
    cursor: pointer;
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
  p.exercise-reference {
    color: #BFBFBF;
    font-size: 7px;
  }
</style>