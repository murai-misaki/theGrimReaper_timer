<template>
  <div class="navbar">
    <h1>The Grim Reaper Timer</h1>
    <button @click="openBrowserModal">Start</button>
    <div @click="redirectToAccountPage" class="account">
      <p class="account-text">Account</p>
      <font-awesome-icon :icon="['fas', 'user']" style="color: #D9D9D9;" class="user-icon" />
    </div>
    <div v-show="!loading">
      <div @click="logout">
        <p class="logout-text">Logout</p>
        <font-awesome-icon :icon="['fas', 'arrow-right-from-bracket']" style="color: #D9D9D9;" class="logout-icon" />
      </div>
    </div>
    <div v-show="loading">
      <p class="logout-text">Logout</p>
      <div class="loading-block-logout">
        <div class="loading-circle-logout"></div>
        <div class="loading-circle-logout"></div>
        <div class="loading-circle-logout"></div>
      </div>
    </div>
  </div>
  <BrowserModal ref="browserModal" />
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
  <div class="button-group">
    <div @click="redirectToTotalshortenedlifespanPage" class="shortened-lifespan">
      <div>
        <img src="../assets/img/shortened_lifespan.png" alt="死神イラスト" class="shortene-lifespan-img" >
      </div>
      <div class="shortened-lifespan-div">
        <p class="shortened-lifespan-text">shortened<br>lifespan</p>
      </div>
    </div>
    <div @click="redirectToRankingPage" class="ranking">
      <div>
        <img src="../assets/img/ranking.png" alt="ランキングイラスト" class="ranking-img" >
      </div>
      <div class="ranking-div">
        <p class="ranking-text">ranking</p>
      </div>
    </div>
  </div>
  <div class="footer">
    <FooterLink />
  </div>
</template>

<script>
  import axios from 'axios'
  import authRemoveItem from '../auth/removeItem'
  import SittingtimeChart from '../components/SittingtimeChart.vue'
  import ExercisetimeChart from '../components/ExercisetimeChart.vue'
  import BrowserModal from '../components/BrowserModal.vue'
  import FooterLink from '../components/FooterLink.vue'
  import onedaytimeRemoveItem from '../common/removeItem'

  export default {
    components: { SittingtimeChart, ExercisetimeChart, BrowserModal, FooterLink },

    data () {
      return {
        show: null,
        error: null,
        loading: false
      }
    },
    mounted () {
      this.showSitting()
      onedaytimeRemoveItem()
    },
    methods: {
      showExercise () {
        this.show = false
      },
      showSitting () {
        this.show = true
      },
      redirectToAccountPage () {
        this.$router.push({ name: 'Accountpage' })
      },
      openBrowserModal () {
        this.$refs.browserModal.open()
      },
      redirectToTotalshortenedlifespanPage () {
        this.$router.push({ name: 'Totalshortenedlifespan' })
      },
      redirectToRankingPage () {
        this.$router.push({ name: 'Rankingpage' })
      },
      async logout () {
        this.showLoading()
        this.error = null

        try {
          const res = await axios.delete(process.env.VUE_APP_API_URL + '/auth/sign_out', {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('ログアウトできませんでした')
          }

          if (!this.error) {
            console.log("ログアウトしました")
            authRemoveItem()
            this.$router.push({ name: 'Top' })
          }

          return res 
        } catch (error) {
          this.endLoading()
          this.error = 'ログアウトできませんでした'
        }
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
    font-size: 28px;
    margin-top: -13px;
    margin-left: 160px;
    border: solid 1px #D9D9D9;
    border-radius: 50%;
    padding: 8px;
    width: 28px;
    cursor: pointer;
  }
  .user-icon:hover {
    background: rgba(217, 217, 217, 0.2);
  }
  .logout-icon {
    font-size: 28px;
    margin-top: -13px;
    margin-left: 44px;
    cursor: pointer;
    border: solid 1px #D9D9D9;
    border-radius: 50%;
    padding: 8px;
    width: 28px;
  }
  .logout-icon:hover {
    background: rgba(217, 217, 217, 0.2);
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

  .shortened-lifespan {
    display: flex;
    border: 1px solid #D9D9D9;
    width: 350px;
    height: 110px;
    margin-left: 310px;
    cursor: pointer;
  }
  .shortened-lifespan:hover {
    background: rgba(217, 217, 217, 0.2);
  }
  .ranking {
    display: flex;
    border: 1px solid #D9D9D9;
    width: 350px;
    height: 110px;
    margin-left: 140px;
    cursor: pointer;
  }
  .ranking:hover {
    background: rgba(217, 217, 217, 0.2);
  }
  
  .shortene-lifespan-img {
    width: 60px;
    margin-left: 35px;
    margin-top: 25px;
  }
  .ranking-img {
    width: 100px;
    margin-left: 28px;
    margin-top: 25px;
  }
  .shortened-lifespan-div {
    margin-top: -40px;
  }
  .ranking-div {
    margin-top: -30px;
  }
  .shortened-lifespan-text {
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    margin-left: 35px;
  }
  .ranking-text {
    font-family: 'IM Fell English SC', serif;
    font-size: 50px;
    margin-left: 25px;
  }
  .button-group {
    display: flex;
    margin-top: 50px;
  }

  .footer {
    margin-top: 120px;
  }

  p.account-text {
    font-family: 'IM Fell English SC', serif;
    margin-left: 153px;
  }
  p.logout-text {
    font-family: 'IM Fell English SC', serif;
    margin-left: 39px;
    margin-top: 17px;
  }

  .loading-block-logout {
    display: flex;
    justify-content: space-between;
    margin-top: -13px;
    margin-left: 43px;
    border: solid 1px #D9D9D9;
    border-radius: 50%;
    padding: 17px 8px;
    width: 28px;
  }
  .loading-circle-logout {
    width: 10px;
    height: 10px;
    background-color: #ffffff;
    border-radius: 50%;
    animation: loading 1s infinite;
    &:nth-child(2) {
    animation-delay: 0.1s;
    }
    &:nth-child(3) {
      animation-delay: 0.2s;
    }
  }
  @keyframes loading {
    0% {
      transform: scale(0.1);
    }
    100% {
      transform: scale(1);
    }
  }
</style>