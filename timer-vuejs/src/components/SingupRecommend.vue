<template>
  <p class="title"><span class="app-name">The Grim Reaper Timer</span> をご利用いただき、誠にありがとうございます。<br><span class="red">日常使い</span>をしていただける方は、アカウント登録 がおすすめです。</p>
  <div class="line"></div>
  <p class="subtitle neontext">''あなた専用のマイページを作成いたします''</p>
  <p class="text-top">ログイン後すぐに、タイマー利用ができ、日常使いに大変便利！</p>
  <div class="introduce-group">
    <div class="introduce3">
      <img src="../assets/img/to_introduce3.png" alt="該当の機能画面" class="img-left" >
      <p class="top">縮んだ寿命の合計時間を知れる</p>
      <img src="../assets/img/ranking_img.png" alt="該当の機能画面" class="img-left" >
      <p>・死神が縮めた寿命ランキング<br>・1日の身体活動量ランキング</p>
    </div>
    <div class="introduce2">
    <img src="../assets/img/to_introduce2.png" alt="該当の機能画面" class="img-center-left" >
     <p>1日ごとの座っている時間と1時間座り続けたことで<br>縮んだ寿命を記録し、直近1週間分をグラフ化</p>
    </div>
    <div class="introduce6">
      <img src="../assets/img/to_introduce6.png" alt="該当の機能画面" class="img-center-right" >
      <p>ブレイクタイム時に行った1日ごとの<br>身体活動量を記録し、直近1週間分をグラフ化</p>
    </div>
    <div class="chat">
      <img src="../assets/img/chat_img.png" alt="該当の機能画面" class="img-right" >
      <p>座りすぎによる健康リスクが高まると<br>ユーザーの死神がチャットをします</p>
    </div>
  </div>
  <p class="text-right-purpose">(※ 自分の縮んだ寿命・身体活動量は<br>プロフィールから非公開にできます)</p>
  <div class="line2"></div>
  <div v-show="!loading">
    <div class="button-group">
      <button @click="redirectToTopPage" class="left">To Top</button>
      <button @click="openChangeToLoginuserModal" class="right">Sign Up</button>
    </div>
    <p class="attention-left">(※ ゲストアカウントを削除し、トップページに戻ります。)</p>
    <p class="attention-right">(※ 今回のタイマー記録も引き継げます。)</p>
  </div>
  <div v-show="loading">
    <div class="loading-block">
      <div class="loading-circle"></div>
      <div class="loading-circle"></div>
      <div class="loading-circle"></div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import authRemoveItem from '../auth/removeItem'

  export default {
    props: ['loading'],

    data () {
      return {
      }
    },
    methods: {
      redirectToTopPage () {
        this.$emit('showLoading')
        this.deleteGuestloginUser().then(() => {
          authRemoveItem()
          this.$router.push({ name: 'Top' })
        })
      },
      openChangeToLoginuserModal () {
        this.$emit('openChangeToLoginuserModal')
      },
      async deleteGuestloginUser () {
        try {
          const res = await axios.delete(process.env.VUE_APP_API_URL + '/auth', {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('ゲストログインユーザーのアカウントを削除できませんでした')
          }

          if (!this.error) {
            console.log("ゲストログインユーザーのアカウントを削除しました")
            authRemoveItem()
            this.$router.push({ name: 'Top' })
          }

          return res 
        } catch (error) {
          console.log(error)
        }
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  p.title {
    font-size: 26px;
    text-align: center;
    margin-top: 27px;
  }
  span.app-name {
    font-family: 'IM Fell English SC', serif;
  }
  .red {
    color: #CB0101;
  }
  .line {
    border-top: 1px solid #848484;
    width: 1100px;
    margin: -15px auto;
  }
  .line2 {
    border-top: 1px solid #848484;
    width: 1100px;
    margin: 25px auto;
  }
  p.subtitle {
    text-align: center;
    margin-top: 50px;
    font-size: 20px;
  }
  img {
    border: 1px solid rgba(207, 207, 207, 0.51);
  }
  .img-center-left {
    width: 300px;
  }
  .img-center-right {
    width: 300px;
  }
  .img-left {
    width: 200px;
  }
  .img-right {
    width: 220px;
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
  .introduce-group {
    display: flex;
  }
  .introduce-group p {
    font-size: 12px;
    text-align: center;
  }
  .introduce3 {
    margin-left: 170px;
  }
  .introduce3 p.top {
    margin-top: -5px;
  }
  .introduce2, .introduce6, .chat {
    margin-left: 20px;
    margin-top: 10px;
  }
  .text-right-purpose {
    font-size: 11px;
    color: #BFBFBF;
    margin-left: 1050px;
    margin-top: -40px;
  }
  
  .text-top {
    text-align: center;
    margin-top: 35px;
  }

  .button-group {
    text-align: center;
  }
  button.right {
    margin-left:150px;
    font-family: 'IM Fell English SC', serif;
    font-size: 30px;
    padding: 10px 90px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #A40505;
    background: #000000;
    cursor: pointer;
  }
  button.right:hover {
  color: #A40505;;
  background: rgba(217, 217, 217, 0.2);
  }

  button.left {
    font-family: 'IM Fell English SC', serif;
    font-size: 30px;
    padding: 10px 90px;
    border: 3px solid #8F0B0B;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }
  button.left:hover {
    color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }
  .attention-left {
    font-size: 11px;
    margin-left: 350px;
    color: #BFBFBF;
  }
  .attention-right {
    font-size: 11px;
    margin-left: 825px;
    margin-top: -25px;
    color: #BFBFBF;
  }
</style>