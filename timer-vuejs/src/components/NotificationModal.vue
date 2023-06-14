<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">Notification</h1>
      <h3>30分ごとに立ち上がりのお知らせを致します。</h3>
      <div class="explanation">
        <span>‘’ 30分に一度3分、立って動く ‘’</span>
        <p>一回に座ったまま過ごす時間が30分を超えないようにすること。<br>これで座り過ぎのリスクはかなり減らせます。</p>
      </div>
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
        <div class="line2"></div>

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
      <button class="update-button" @click="update">Update</button>
      <div v-show="flashMessage" class="flash_message">
        <p>お知らせ方法を更新しました。</p>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import Push from 'push.js';

  export default {
    props: ['notificationWay'],

    data () {
      return {
        show: false,
        radio: 'false',
        flashMessage: false,
      }
    },
    methods: {
      open () {
        this.$emit('getNotification')
        this.radio = this.notificationWay
        this.show = true
      },
      close () {
        this.show = false
      },
      async updateNotification () {
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
      update () {
        this.updateNotification().then(() => {
          this.showFlashMessage()
          setTimeout(this.closeFlashMessage, 3000);
          this.$emit('getNotification')
        })
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 55px;
    text-align: center;
  }

  .modal_contents {
    position: absolute;
    top: 0;
    left: 0;
    z-index:100;
    width: 100%;
    height: 100%;
    width: 100%;
    text-align: center;
  }
  .modal_contents_bg {
    background: rgba(40, 40, 40, 0.56);
    width: 100%;
    height: 940px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 750px;
    height: 620px;
    transform: translate(-50%,-50%);
    padding: 20px 65px 120px 65px;
    margin-top: 105px;
    border: 2px solid #FFFFFF;
  }
  .modal_close_btn {
    margin-left: 760px;
    cursor: pointer;
  }

  h3 {
    font-weight: normal;
    border-bottom: 0.1px solid #525151;
    width: 700px;
    margin: 0 auto;
  }
  span {
    color: #CB0101;
    padding-top: 23px;
    margin-left: 80px;
    font-size: 16px;
  }
  .explanation {
    display: flex
  }
  .explanation p {
    margin-left: 25px;
    padding-bottom: 20px;
    font-size: 13px;
  }
  .question p {
    width: 480px;
    margin-top: 20px;
    margin-bottom: 15px;
    margin-left: 130px;
    background-color: rgba(40, 40, 40, 0.99);
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
    font-size: 22px;
  }
  .selection div {
    font-size: 22px;
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
    margin-bottom: 50px;
  }
  .line1 {
    width: 700px;
    margin:  0 auto;
    border-top: 0.1px solid #525151;
  }
  .line2 {
    width: 400px;
    margin:  0 auto;
    border-top: 1px solid #525151;
  }

  .neontext {
    color: #fff;
    text-shadow:
      0 0 7px #fff,
      0 0 10px #fff,
      0 0 21px #fff,
      0 0 42px #0fa,
      0 0 82px #0fa,
      0 0 92px #0fa,
      0 0 102px #0fa,
      0 0 151px #0fa;
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
      0 0 40px #0fa,
      0 0 80px #0fa,
      0 0 90px #0fa,
      0 0 100px #0fa,
      0 0 150px #0fa;
    }
    0% {
      text-shadow:
      0 0 4px #fff,
      0 0 10px #fff,
      0 0 18px #fff,
      0 0 38px #0fa,
      0 0 73px #0fa,
      0 0 80px #0fa,
      0 0 94px #0fa,
      0 0 140px #0fa;
    }
  }

  button.push-button {
    border: 1px solid #BFBFBF;
    border-radius: 10px;
    color: #BFBFBF;
    background: #000000;
    cursor: pointer;
    padding-top: 5px;
    padding-bottom: 5px;
  }
  button.push-button:hover {
    color: #D9D9D9;
    background: rgba(217, 217, 217, 0.2);
  }
  button.update-button {
    margin: 0 auto;
    font-family: 'IM Fell English SC', serif;
    font-size: 35px;
    padding: 10px 60px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #A40505;
    background: #000000;
    cursor: pointer;
  }
  button.update-button:hover {
  color: #A40505;;
  background: rgba(217, 217, 217, 0.2);
  }

  .flash_message {
    padding-top: 20px;
  }
  .flash_message p {
    border: 1px solid #BFBFBF;
    background: rgba(217, 217, 217, 0.2);
    width: 300px;
    margin: 0 auto;
  }
</style>