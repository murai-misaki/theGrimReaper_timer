<template>
  <div class="border">
    <div class="shortened-lifespan-ranking">
      <h3>Shortened Lifespan Ranking</h3>
      <p>"死神が縮めた寿命ランキング"</p>
      <table>
        <ol>
          <tr v-for="shortenedLifespanRankingTime in shortenedLifespanRankingTimes" :key="shortenedLifespanRankingTime.id">
            <li class="shortend-lifespan-ranking-number"></li>
            <td class="name">{{shortenedLifespanRankingTime.name}}</td>
            <td class="time shortend-lifespan-ranking-time">{{shortenedLifespanRankingTime.time}}</td>
            <td class="time-text">minutes</td>
          </tr>
        </ol>
      </table>
    </div>
    <div class="exercise-ranking">
      <h3>Shortened Lifespan Ranking</h3>
      <p>"本日の身体活動量ランキング"</p>
      <table>
        <ol>
          <tr v-for="todayExerciseRankingTime in todayExerciseRankingTimes" :key="todayExerciseRankingTime.id">
            <li class="exercise-ranking-number"></li>
            <td class="name">{{todayExerciseRankingTime.name}}</td>
            <td class="time"><span :class="timeColorClasses(todayExerciseRankingTime)">{{todayExerciseRankingTime.exercise}}</span></td>
            <td class="time-text">minutes</td>
          </tr>
        </ol>
      </table>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

  export default {
    data () {
      return {
        shortenedLifespanRankingTimes: [],
        todayExerciseRankingTimes: []
      }
    },
    mounted () {
      this.getShortenedLifespanRanking()
      this.getTodayExerciseRanking()
    },
    methods: {
      async getShortenedLifespanRanking () {
        try {
          const res = await axios.get(process.env.VUE_APP_API_URL + `/total_shortened_lifespans/ranking`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            throw new Error('死神が縮めた寿命ランキングを取得できませんでした')
          }
          this.shortenedLifespanRankingTimes = res.data
        } catch (error) {
          console.log(error)
        }
      },
      async getTodayExerciseRanking () {
        try {
          const res = await axios.get(process.env.VUE_APP_API_URL + `/one_day_times/today_exercise_ranking`, {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })
          if (!res) {
            throw new Error('本日の身体活動量ランキングを取得できませんでした')
          }
          this.todayExerciseRankingTimes = res.data
        } catch (error) {
          console.log(error)
        }
      },
      timeColorClasses(todayExerciseRankingTime) {
        const time = todayExerciseRankingTime.exercise
        
        return {
          'normal-time': time < 10,
          'green-time': time >= 10,
        }
      },
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h3 {
    font-family: 'IM Fell English SC', serif;
    font-size: 30px;
  }
  p {
    text-align: center;
    color: #BFBFBF;
    margin-top: -20px;
  }
  .border {
    display: flex;
    width: 1200px;
    margin: 120px auto;
    padding-top: 50px;
  }
  .shortened-lifespan-ranking {
    padding: 0px 100px;
    margin-left: 10px;
    margin-right: 40px;
    border: 1px solid #D9D9D9;
  }
  .exercise-ranking {
    padding: 0px 100px;
    border: 1px solid #D9D9D9;
  }
  li {
    font-family: 'IM Fell English SC', serif;
    font-size: 35px;
  }
  .shortend-lifespan-ranking-number {
    color: #A40505;
  }
  .exercise-ranking-number {
    color: #006D01;
  }
  .time {
    font-family: 'IM Fell English SC', serif;
    font-size: 35px;
    margin-left: 10px;
  }
  .shortend-lifespan-ranking-time {
    color: #A40505;
  }
  .normal-time {
    color: #D9D9D9;
  }
  .green-time {
    color: #006D01;
  }
  .time-text {
    font-family: 'IM Fell English SC', serif;
    font-size: 20px;
    margin-left: 10px;
  }
</style>