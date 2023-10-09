<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">Notification</h1>
      <h3 @click="openShowDetail" class="title">30分ごとに立ち上がりのお知らせを致します。<font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></h3>
      <div v-show="showDetail" class="explanation">
        <span class="red">‘’ 30分に一度3分、立って動く ‘’</span>
        <p>一回に座ったまま過ごす時間が30分を超えないようにすること。<br>これで座り過ぎのリスクはかなり減らせます。<br><span class="postscript">※ デスクワークにおいて、夕方の疲労感が圧倒的に改善されたというデータもあります。</span></p>
      </div>
      <h3 class="question">お知らせ方法を変更されますか？</h3>

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
      <div v-show="!loading">
        <button class="update-button" @click="update">Update</button>
      </div>
      <div v-show="loading">
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
</template>

<script>
  import axios from 'axios'
  import Push from 'push.js';

  export default {
    props: ['notificationWay', 'loading'],

    data () {
      return {
        show: false,
        showDetail: false,
        radio: 'false',
        flashMessage: false,
      }
    },
    methods: {
      open () {
        this.$emit('getNotification')
        this.radio = this.notificationWay
        this.show = true
        window.scrollTo(0, 0);
      },
      close () {
        this.show = false
      },
      openShowDetail () {
        this.showDetail = !this.showDetail
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
      update () {
        this.updateNotification().then(() => {
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
    transform: translate(-50%,-50%);
    padding: 20px 50px 40px 50px;
    margin-top: 5px;
    border: 2px solid #FFFFFF;
  }
  .modal_close_btn {
    margin-left: 760px;
    cursor: pointer;
  }
  h3 {
    font-weight: normal;
    margin: 0 auto;
  }
  h3.title {
    cursor: pointer;
  }
  span.red {
    color: #CB0101;
    padding-top: 23px;
    margin-left: 50px;
  }
  .open-icon {
    font-size: 12px;
  }
  .explanation {
    border-top: 0.1px solid #525151;
    display: flex
  }
  .explanation p {
    margin-left: 30px;
    padding-bottom: 20px;
    font-size: 13px;
    text-align: left;
  }
  span.postscript {
    color: #BFBFBF;
    font-size: 11px;
    text-align: left;
  }
  h3.question {
    border: 0.1px solid #525151;
    background-color: rgba(40, 40, 40, 0.99);
    width: 400px;
    margin-top: 20px;
    margin-bottom: 15px;
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