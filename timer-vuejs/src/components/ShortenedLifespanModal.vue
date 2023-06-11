<template>
  <div class="modal_contents">
    <div class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <h1 class="neontext">Thank you for using.</h1>
      <div v-show="todayShortenedLifespan">
        <p>''今回は<span>{{todayShortenedLifespan}}分</span>の寿命を戴きました。''<br>またのご利用をお待ちしております。</p>
      </div>
      <div v-show="!todayShortenedLifespan">
        <p>''今回戴いた寿命はございません。''<br>またのご利用をお待ちしております。</p>
      </div>
      <button class="ok_button" @click="end">OK</button>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import onedaytimeRemoveItem from '../onedaytime/removeItem'

  export default {
    props: ['totalCountUp', 'todayExercise', 'todayShortenedLifespan'],

    data () {
      return {
        onedaytimeTodayId: null,
        onedaytimeTodayCountUp: 0,
        onedaytimeTodayExercise: 0,
        onedaytimeTodayShortenedLifespan: 0,
        totalShortenedLifespan: 0,

        guest: localStorage.getItem('guest')
      }
    },
    methods: {
      close () {
        this.$emit('closeShortenedLifespanModal')
      },
      async getOnedaytimeToday () {
        try {
          const res = await axios.get(`http://localhost:3000/one_day_times/today`, {
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
          console.log({ res })
        } catch (error) {
          console.log(error)
        }
      },
      async createOnedaytime () {
        try {
          const res = await axios.post(`http://localhost:3000/one_day_times`, {
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
        } catch (error) {
          console.log(error)
        }
      },
      async updateOnedaytime(onedaytimeId) {
        try {
          const res = await axios.patch(`http://localhost:3000/one_day_times/${onedaytimeId}`, {
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
        } catch (error) {
          console.log(error)
        }
      },
      async getTotalShortenedLifespan () {
        try {
          const res = await axios.get(`http://localhost:3000/total_shortened_lifespans`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            throw new Error('1時間座り続けたことで縮んだ寿命の合計時間を取得できませんでした')
          }
          this.totalShortenedLifespan = res.data.time
        } catch (error) {
          console.log(error)
        }
      },
      async updateTotalShortenedLifespan () {
        try {
          const res = await axios.patch(`http://localhost:3000/total_shortened_lifespans`, {time: this.totalShortenedLifespan + this.todayShortenedLifespan },
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
      end () {
        this.close()
        if (this.totalCountUp || this.todayExercise || this.todayShortenedLifespan) {
          this.getOnedaytimeToday().then(() => {
            if (this.onedaytimeTodayId) {
              this.updateOnedaytime(this.onedaytimeTodayId)
            } else {
              this.createOnedaytime()
            }
          })
        }
        if (this.todayShortenedLifespan) {
          this.getTotalShortenedLifespan().then(() => {
            this.updateTotalShortenedLifespan()
          })
        }
        onedaytimeRemoveItem()

        if(this.guest === 'false') {
          this.$router.push({ name: 'Mypage' })
        } else {
          this.$router.push({ name: 'Guestlogin' })
        }
      },
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
    height: 700px;
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
      0 0 40px #0fa,
      0 0 80px #0fa,
      0 0 90px #0fa,
      0 0 100px #0fa,
      0 0 150px #0fa;
    } 
    20%, 24%, 55% {
      text-shadow: none;
    }
  }
  button.ok_button {
    margin-top: 30px;
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