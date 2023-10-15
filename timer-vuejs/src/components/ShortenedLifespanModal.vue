<template>
  <div v-show="show" class="modal_contents">
    <div class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <h1 class="neontext">Thank you for using.</h1>
      <div class="text-group">
        <div v-show="todayShortenedLifespan">
          <p>''今回は<span>{{todayShortenedLifespan}}分</span>の寿命を戴きました。''<br>またのご利用をお待ちしております。</p>
        </div>
        <div v-show="!todayShortenedLifespan">
          <p>''今回戴いた寿命はございません。''<br>またのご利用をお待ちしております。</p>
        </div>
      </div>
      <div v-show="!loading">
        <button class="ok_button" @click="recordOnedaytimeToday">OK</button>
      </div>
      <div v-show="loading">
        <div class="loading-block">
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import onedaytimeRemoveItem from '../common/removeItem'

  export default {
    props: ['totalCountUp', 'todayExercise', 'todayShortenedLifespan', 'loading'],

    data () {
      return {
        show: false,
        onedaytimeTodayId: null,
        onedaytimeTodayCountUp: 0,
        onedaytimeTodayExercise: 0,
        onedaytimeTodayShortenedLifespan: 0,
        totalShortenedLifespan: 0,

        guest: localStorage.getItem('guest')
      }
    },
    methods: {
      open () {
        this.show = true
        window.scrollTo(0, 0);
        document.body.style.overflow = 'hidden';
      },
      async getOnedaytimeToday () {
        try {
          const res = await axios.get(process.env.VUE_APP_API_URL + `/one_day_times/today`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            throw new Error('本日のタイマー記録をを取得できませんでした')
          }
          this.onedaytimeTodayId = res.data.id
          this.onedaytimeTodayCountUp = res.data.count_up
          this.onedaytimeTodayExercise = res.data.exercise
          this.onedaytimeTodayShortenedLifespan = res.data.shortened_lifespan
        } catch (error) {
          console.log(error)
        }
      },
      async createOnedaytime () {
        try {
          const res = await axios.post(process.env.VUE_APP_API_URL + `/one_day_times`, {
            count_up: this.totalCountUp,
            exercise: this.todayExercise,
            shortened_lifespan: this.todayShortenedLifespan,
            },
          {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('本日のタイマー記録を保存できませんでした')
          }
          this.recordTotalShortenedLifespan()
          this.redirectToPage()
        } catch (error) {
          console.log(error)
        }
      },
      async updateOnedaytime(onedaytimeId) {
        try {
          const res = await axios.patch(process.env.VUE_APP_API_URL + `/one_day_times/${onedaytimeId}`, {
            count_up: this.totalCountUp + this.onedaytimeTodayCountUp,
            exercise: this.todayExercise + this.onedaytimeTodayExercise,
            shortened_lifespan: this.todayShortenedLifespan + this.onedaytimeTodayShortenedLifespan,
            },
          {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('本日のタイマー記録を更新できませんでした')
          }
          this.recordTotalShortenedLifespan()
          this.redirectToPage()
        } catch (error) {
          console.log(error)
        }
      },
      async getTotalShortenedLifespan () {
        try {
          const res = await axios.get(process.env.VUE_APP_API_URL + `/total_shortened_lifespans`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            throw new Error('1時間座り続けたことで縮んだ寿命の合計時間を取得できませんでした')
          }
          this.totalShortenedLifespan = res.data.data.attributes.time
        } catch (error) {
          console.log(error)
        }
      },
      async updateTotalShortenedLifespan () {
        try {
          const res = await axios.patch(process.env.VUE_APP_API_URL + `/total_shortened_lifespans`, {time: this.totalShortenedLifespan + this.todayShortenedLifespan },
          {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('1時間座り続けたことで縮んだ寿命の合計時間を更新できませんでした')
          }
        } catch (error) {
          console.log(error)
        }
      },
      recordOnedaytimeToday () {
        this.$emit('showLoading')
        if (this.totalCountUp || this.todayExercise || this.todayShortenedLifespan) {
          this.getOnedaytimeToday().then(() => {
            if (this.onedaytimeTodayId) {
              this.updateOnedaytime(this.onedaytimeTodayId)
            } else {
              this.createOnedaytime()
            }
          })
        } else {
          this.redirectToPage()
        }
      },
      recordTotalShortenedLifespan () {
        if (this.todayShortenedLifespan) {
          this.getTotalShortenedLifespan().then(() => {
            this.updateTotalShortenedLifespan()
          })
        }
      },
      redirectToPage () {
        onedaytimeRemoveItem()
        if(this.guest === 'false') {
          this.$router.push({ name: 'Mypage' })
        } else {
          this.$router.push({ name: 'Guestlogin' })
        }
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-weight: normal;
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    text-align: center;
  }
  p {
    text-align: center;
  }
  span {
    color: #CB0101;
  }
  .modal_contents {
    position: absolute;
    top: 0;
    left: 0;
    z-index:100;
    width: 100%;
    height: 100%;
    width: 100%;
  }
  .modal_contents_bg {
    background: rgba(40, 40, 40, 0.56);
    width: 100%;
    height: 100%;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 650px;
    height: 300px;
    transform: translate(-50%,-50%);
    margin-top: 20px;
    border: 2px solid #FFFFFF;
  }

.neontext {
  animation: flicker 1.5s infinite alternate;
  color: #fff;
  }
  @keyframes flicker {
  0%, 18%, 22%, 25%, 53%, 57%, 100% {
      text-shadow:
      0 0 4px #fff,
      0 0 11px #fff,
      0 0 19px #fff,
      0 0 40px #D9D9D9,
      0 0 80px #D9D9D9,
      0 0 90px #D9D9D9,
      0 0 100px #D9D9D9,
      0 0 150px #D9D9D9;
    } 
    20%, 24%, 55% {
      text-shadow: none;
    }
  }
  div.text-group {
    margin-bottom: 46px;
  }
  button.ok_button {
    margin-left: 240px;
    font-family: 'IM Fell English SC', serif;
    font-size: 30px;
    padding: 10px 60px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #A40505;
    background: #000000;
    cursor: pointer;
  }
  button.ok_button:hover {
  color: #A40505;;
  background: rgba(217, 217, 217, 0.2);
  }
</style>