<template>
  <div class="container">
    <div class="group">
      <div class="account-navbar">
        <button @click="showAccountProfile">プロフィール</button>
        <button @click="showAccountPassword">パスワード</button>
        <button class="now">タイマー通知方法</button>
      </div>
      <div class="notification">
        <h1 class="neontext">Notification</h1>
        <p class="title">30分ごとに立ち上がりのお知らせを致します。</p>
      <div class="question">
        <p>お知らせ方法を変更されますか？</p>
      </div>

      <div class="selection">
        <div class="sound-group">
          <div>
            <input type="radio" id="sound" v-model="radio" value="false">
            <label for="sound">サウンド通知</label>
          </div>
          <div>
            <font-awesome-icon :icon="['fas', 'volume-up']" style="color: #D9D9D9;" />
            音でお知らせ
          </div>
        </div>
        <div class="line"></div>

        <div class="push-group">
          <div>
            <input type="radio" id="push" v-model="radio" value="true">
            <label for="push">プッシュ通知</label>
          </div>
          <div>
            <font-awesome-icon :icon="['fas', 'eye']" style="color: #D9D9D9;" />
            視覚でお知らせ
          </div>
        </div>
      </div>
      <button @click="push" class="push-button">プッシュ通知の許可をお願いします</button>
      <p class="attention">
        ※ プッシュ通知の許可を要求するポップアップが表示されます。<br>(既に許可になっている場合は表示されません)
      </p>
      <div v-show="!loading">
        <button class="update-button" @click="updateNotification">更新</button>
      </div>
      <div v-show="loading" class="loading-space">
        <div class="loading-block">
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
        </div>
      </div>
      <div v-show="flashMessage" class="flash_message">
        <p>お知らせ方法を更新しました。</p>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import Push from 'push.js';

  export default {
    props: ['loading'],
    
    data () {
      return {
        notificationWay: false,
        radio: 'false',
        flashMessage: false
      }
    },
    mounted () {
      this.getNotification().then(() => {
        this.radio = this.notificationWay
      })
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
      async updateNotification () {
        this.$emit('showLoading')
        try {
          const res = await axios.patch(process.env.VUE_APP_API_URL + `/notifications`, {way: this.radio},
          {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('選択された通知方法を更新できませんでした')
          }
          this.$emit('endLoading')
          this.showFlashMessage()
          setTimeout(this.closeFlashMessage, 3000);
        } catch (error) {
          console.log(error)
        }
      },
      push () {
        Push.Permission.request();
      },
      showFlashMessage () {
        this.flashMessage = true
      },
      closeFlashMessage () {
        this.flashMessage = false
      },
      showAccountProfile () {
        this.$emit('showAccountProfile')
      },
      showAccountPassword () {
        this.$emit('showAccountPassword')
      }
    }
  }
</script>

<style scoped>
  .group {
    display: flex;
  }
  .notification {
    border: 1px solid #D9D9D9;
    margin-left: 50px;
    padding: 30px 110px;
    margin-top: -50px;
    margin-bottom: 30px;
  }
  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    text-align: center;
  }
  
  .update-button {
    font-size: 15px;
    width: 393px;
    margin: 0 auto;
    padding: 6px 0px;
    border: 1px solid #D9D9D9;
    color: #BFBFBF;
    background: rgba(143, 11, 11, 0.7);
    cursor: pointer;
    display: block;
    margin-bottom: 10px;
  }
  .update-button:hover {
    color: #FFFFFF;
  }

  .neontext {
    color: #fff;
    text-shadow:
      0 0 7px #fff,
      0 0 10px #fff,
      0 0 21px #fff,
      0 0 42px #D9D9D9,
      0 0 82px #D9D9D9,
      0 0 92px #D9D9D9,
      0 0 102px #D9D9D9,
      0 0 151px #D9D9D9;
  }
  h1.neontext {
    color: #fff;
    font-size: 3em;
    line-height: 1em;
    animation: pulsate 0.11s ease-in-out infinite alternate;
  }
  @keyframes pulsate {
    100% {
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
    0% {
      text-shadow:
      0 0 4px #fff,
      0 0 10px #fff,
      0 0 18px #fff,
      0 0 38px #D9D9D9,
      0 0 73px #D9D9D9,
      0 0 80px #D9D9D9,
      0 0 94px #D9D9D9,
      0 0 140px #D9D9D9;
    }
  }

  .flash_message p {
    border: 1px solid #BFBFBF;
    background: rgba(217, 217, 217, 0.2);
    width: 300px;
    margin: 0 auto;
    text-align: center;
    font-size: 14px;
    margin-top: 20px;
  }
  .loading-space {
    margin-top: 40px;
  }

  p.title {
    border-bottom: 0.1px solid #525151;
    width: 380px;
    margin: 0 auto;
    text-align: center;
    background-color: rgba(40, 40, 40, 0.99);
  }
  .question p {
    text-align: center;
  }

  input[type="radio"] {
    width: 20px;
    height: 20px;
    border-radius: 100px;
    position: relative;
    vertical-align: sub;
    margin-right: 5px;
    cursor: pointer;
  }
  input[type="radio"]::before, input[type="radio"]::after{
    content: "";
    display: block;
    border-radius: 50%;
    position: absolute;
    transform: translateY(-50%);
    top: 50%;
  }
  input[type="radio"]::before {
    background-color: #D9D9D9;
    border: 1px solid #494949;
    height: 20px;
    width: 20px;
    left: 0px;
  }
  input[type="radio"]::after {
    background-color: #494949;
    opacity: 0;
    height: 14px;
    width: 14px;
    left: 4px;
  }
  input[type="radio"]:checked::after {
    opacity: 1;
  }

  .selection label {
    font-size: 20px;
  }
  .selection div {
    font-size: 20px;
  }

  .sound-group, .push-group {
    display: flex;
    justify-content: center;
  }
  .sound-group div, .push-group div {
    margin: 24px;
  }

  .attention {
    color: #BFBFBF;
    font-size: 13px;
    text-align: center;
    margin-bottom: 40px;
  }
  
  .line {
    width: 400px;
    margin:  0 auto;
    border-top: 1px solid #525151;
  }

  button.push-button {
    border: 1px solid #BFBFBF;
    border-radius: 10px;
    color: #BFBFBF;
    background: #000000;
    cursor: pointer;
    padding-top: 5px;
    padding-bottom: 5px;
    margin-left: 90px;
  }
  button.push-button:hover {
    color: #D9D9D9;
    background: rgba(217, 217, 217, 0.2);
  }
</style>