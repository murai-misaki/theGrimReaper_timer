<template>
  <div class="navbar">
    <h1>The Grim Reaper Timer</h1>
    <button @click="redirectToTimer">Start</button>
    <div @click="redirectToAccountPage" class="account">
      <font-awesome-icon :icon="['fas', 'user']" style="color: #D9D9D9;" class="user-icon" />
    </div>
  </div>
  <div v-show="show" class="chart">
    <div class="time-group">
      <div class="time">
        <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" class="circle" />
        <p>Sitting time</p>
      </div>
      <div class="time">
        <div @click="showExercise">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #000000;" class="circle" />
        </div>
        <p>Exercise time</p>
      </div>
    </div>
    <SittingtimeChart />
    <p class="sitting-attention">1日8時間(480分)以上座ると、罹患リスクや死亡リスクが高まります。</p>
  </div>

  <div v-show="!show" class="chart">
    <div class="time-group">
      <div class="time">
        <div @click="showSitting">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #000000;" class="circle" />
        </div>
        <p>Sitting time</p>
      </div>
      <div class="time">
        <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" class="circle" />
        <p>Exercise time</p>
      </div>
    </div>
    <ExercisetimeChart />
    <p class="exercise-attention">1日の身体活動が10分(1回1分の運動を10回)増加すると、3.2%のリスク※が減少することが明らかになっています。<br><span>※ 死亡、生活習慣病・がん・ロコモ・認知症の発症(厚生労働省 : 健康づくりのための身体活動基準2013)</span></p>
  </div>
  <div class="footer">
    <FooterLink />
  </div>
</template>

<script>
  import SittingtimeChart from '../components/SittingtimeChart.vue'
  import ExercisetimeChart from '../components/ExercisetimeChart.vue'
  import FooterLink from '../components/FooterLink.vue'
  import removeItem from '../onedaytime/removeItem'

  export default {
    components: { SittingtimeChart, ExercisetimeChart, FooterLink },

    data () {
      return {
        show: true
      }
    },
    mounted () {
      removeItem()
    },
    methods: {
      showExercise () {
        this.show = false
      },
      showSitting () {
        this.show = true
      },
      redirectToAccountPage () {
        this.$router.push({ name: 'AccountPage' })
      },
      redirectToTimer () {
        this.$router.push({ name: 'Timer' })
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 44px;
    margin-left: 440px;
  }
  button {
    font-family: 'IM Fell English SC', serif;
    width: 130px;
    height: 55px;
    font-size: 40px;
    border: 3px solid #8F0B0B;
    color: #D9D9D9;
    background: #8F0B0B;
    cursor: pointer;
    margin-top: 30px;
    margin-left: 30px;
  }
  button:hover {
    color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }

  .navbar {
    margin-top: 40px;
    display: flex;
  }
  .user-icon {
    font-size: 30px;
    margin-top: 32px;
    margin-left: 160px;
    border: solid 1px #D9D9D9;
    border-radius: 50%;
    padding: 10px;
    width: 30px;
    cursor: pointer;
  }

  .chart {
    width: 950px;
    margin: 0px auto;
    padding-top: 20px;
  }
  .time-group {
    display: flex;
  }
  .time {
    display: flex;
  }
  .time p {
    font-family: 'IM Fell English SC', serif;
    font-size: 22px;
    margin-left: 10px;
  }
  .circle {
    border: solid 1px #D9D9D9;
    border-radius: 50%;
    padding: 5px;
    margin-left: 40px;
    margin-top: 20px;
    cursor: pointer;
  }

  .sitting-attention {
    background: rgba(143, 11, 11, 0.6);
    text-align: center;
    margin-top: 15px;
    padding-top: 7px;
    height: 30px;
  }
  .exercise-attention {
    background: rgba(10, 109, 1, 0.6);
    text-align: center;
    margin-top: 15px;
    
  }
  span {
    font-size: 14px;
  }

  .footer {
    margin-top: 120px;
  }
</style>