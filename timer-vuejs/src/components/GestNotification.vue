<template>
  <div>
    <h2 @click="openShowDetail" class="neontext">30分ごとに立ち上がりのお知らせを致します。<font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></h2>

    <div v-show="showDetail" class="explanation">
      <span class="red">‘’ 30分に一度3分、立って動く ‘’</span>
      <p>一回に座ったまま過ごす時間が30分を超えないようにすること。<br>これで座り過ぎのリスクはかなり減らせます。<br><span class="postscript">※ デスクワークにおいて、夕方の疲労感が圧倒的に改善されたというデータもあります。</span></p>
    </div>

    <div class="question">
      <h3>お知らせ方法はどちらをご希望でしょうか？</h3>
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
    <button @click="push">プッシュ通知の許可をお願いします</button>
    <p class="attention">
      ※ プッシュ通知の許可を要求するポップアップが表示されます。<br>(既に許可になっている場合は表示されません)
    </p>
  </div>
</template>

<script>
  import axios from 'axios'
  import Push from 'push.js';
  import onedaytimeRemoveItem from '../common/removeItem'

  export default {
    props: ['loading'],

    data () {
      return {
        showDetail: false,
        radio: 'false'
      }
    },
    mounted () {
      onedaytimeRemoveItem()
      window.scrollTo(0, 20);
    },
    methods: {
      openShowDetail () {
        this.showDetail = !this.showDetail
      },
      async createNotification () {
        this.$emit('showLoading')
        try {
          const res = await axios.post(process.env.VUE_APP_API_URL + `/notifications`, {way: this.radio},
          {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('選択された通知方法を保存できませんでした')
          }
        } catch (error) {
          console.log(error)
        }
      },
      push () {
        Push.Permission.request();
      }
    }
  }
</script>

<style scoped>
  div {
    text-align: center;
  }
  h2 {
    font-weight: normal;
    margin-left: 20px;
    cursor: pointer;
  }
  span.red {
    color: #CB0101;
    font-size: 18px;
    padding-top: 25px;
    margin-left: 110px;
  }
  .explanation {
    border-top: 0.1px solid #525151;
    display: flex;
  }
  .explanation p {
    margin-left: 30px;
    text-align: left;
  }
  span.postscript {
    color: #BFBFBF;
    font-size: 14px;
    text-align: left;
  }
  .question h3 {
    font-weight: normal;
    width: 470px;
    margin-top: 30px;
    margin-bottom: 15px;
    margin-left: 240px;
    border: 0.1px solid #525151;
    background-color: rgba(40, 40, 40, 0.99);
  }
  .open-icon {
    font-size: 15px;
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

  .line {
    width: 400px;
    margin:  0 auto;
    border-top: 1px solid #525151;
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

  button {
    border: 1px solid #BFBFBF;
    border-radius: 10px;
    color: #BFBFBF;
    background: #000000;
    cursor: pointer;
    padding-top: 5px;
    padding-bottom: 5px;
  }
  button:hover {
  color: #D9D9D9;
  background: rgba(217, 217, 217, 0.2);
  }
</style>