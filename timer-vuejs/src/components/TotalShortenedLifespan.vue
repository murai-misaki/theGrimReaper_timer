<template>
  <div class="border">
    <div class="total-shortened-lifespan">
      <div>
        <p>1時間座り続けたことで寿命を<br><span>合計 {{ time }} 分</span><br>戴きました。</p>
      </div>
      <video src="../assets/video/the_grim_reaper.mp4" loop autoplay muted></video>
    </div>
  </div>
  <div class="tweet-border">
    <p>1時間座り続けたことで寿命が合計 {{ time }} 分縮みました...30分ごとに立ち上がります！</p>
    <p>#the Grim Reaper Timer #死神タイマー<br>#座りすぎによるリスク #1時間座り続けると寿命が22分縮む</p>
  </div>
  <button @click="twitterShare">懺悔ツイートする</button>
  <div class="space"></div>
</template>

<script>
  import axios from 'axios'

  export default {
    data () {
      return {
        time: 0,
      }
    },
    mounted () {
      this.getTotalShortenedLifespan()
      window.scrollTo(0, 0);
    },
    methods: {
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
          this.time = res.data.data.attributes.time
        } catch (error) {
          console.log(error)
        }
      },
      twitterShare () {
        var shareURL = 'https://twitter.com/intent/tweet?text=' +
          "1時間座り続けたことで寿命が合計" + this.time + "分縮みました...30分ごとに立ち上がります！" +
          "%20%23theGrimReaperTimer" +
          "%20%23死神タイマー" +
          "%20%23座りすぎによるリスク" +
          "%20%231時間座り続けると寿命が22分縮む" +
          '&url=' + "https://www.shinigami-timer.com";  
        window.open(shareURL, '_blank');
      }
    }
  }
</script>

<style scoped>
  div.border {
    border: 2px solid #D9D9D9;
    width: 1000px;
    margin: 120px auto;
  }
  div.total-shortened-lifespan {
    display: flex;
    margin-left: 125px;
  }
  video {
    width: 300px;
  }
  .total-shortened-lifespan p {
    text-align: center;
    font-size: 35px;
    margin-top: 70px;
  }
  span {
    background: #8F0B0B;
    padding-right: 110px;
    padding-left: 110px;
  }
  .tweet-border {
    border: 1px solid #BFBFBF;
    width: 650px;
    margin-left: 300px;
    margin-top: -80px;
  }
  .tweet-border p {
    padding-left: 25px;
    color: #BFBFBF;
  }
  button {
    background: rgba(25, 105, 180, 0.76);
    color: #BFBFBF;
    padding: 10px;
    border: 1px solid #BFBFBF;
    float: right;
    margin-right: 310px;
    margin-top: -41px;
  }
  button:hover {
    cursor: pointer;
    color: #D9D9D9;
    border: 1px solid #D9D9D9;
  }
  .space {
    margin-bottom: 100px;
  }
</style>