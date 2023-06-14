<template>
  <div>
    <Bar v-if="loaded" :data="chartData" :options="chartOptions" />
  </div>
</template>

<script>
import axios from 'axios'
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
  name: 'BarChart',
  components: { Bar },
  data() {
    return {
      loaded: false,
      chartData: null,
      chartOptions: {
        responsive: true,
        scales: {
          x: {
            grid: {
              color: '#313131' // X軸の目盛り線の色
            },
            ticks: {
              color: '#D9D9D9' // X軸目盛りの色
            }
          },
          y: {
            grid: {
              color: '#313131' // Y軸の目盛り線の色
            },
            ticks: {
              color: '#D9D9D9', // Y軸目盛りの色
              callback: function (value) {
                return value + '分';
              }
            }
          }
        },
        plugins: {
          legend: {
            labels: {
              color: '#D9D9D9' // ラベルの文字の色
            }
          }
        }
      }
    }
  },
  mounted() {
    this.loadData()
  },
  methods: {
    async loadData() {
      try {
        const res = await axios.get(process.env.VUE_APP_API_URL + `/one_day_times`, {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })
        if (!res) {
          throw new Error('今週の座っている時間と縮んだ寿命を取得できませんでした')
        }
        this.generateChart(res.data.count_up, res.data.shortened_lifespan)
        this.loaded = true
        console.log({ res })
      } catch (error) {
        console.log(error)
      }
    },
    generateChart(count_up, shortened_lifespan) {
      this.chartData = {
        labels: [ 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun' ],
        datasets: [
          {
            label: "座っている時間",
            data: count_up,
            borderColor: "rgba(217, 217, 217, 0.9)",
            backgroundColor: count_up.map(value => value >= 480 ? "rgba(143, 11, 11, 0.6)" : "rgba(217, 217, 217, 0.9)"),
            borderWidth: 2
          },
          {
            label: "縮んだ寿命",
            data: shortened_lifespan,
            borderColor: "rgba(143, 11, 11, 0.9)",
            backgroundColor: "rgba(143, 11, 11, 0.9)",
            borderWidth: 2
          }
        ]
      }
    }
  }
}
</script>