<template>
  <div>
    <h2 class="neontext">30分ごとに立ち上がりのお知らせを致します。</h2>

    <div class="explanation">
      <span>‘’ 30分に一度3分、立って動く ‘’</span>
      <p>一回に座ったまま過ごす時間が30分を超えないようにすること。これで座り過ぎのリスクはかなり減らせます。</p>
    </div>

    <div class="question">
      <p>お知らせ方法はどちらをご希望でしょうか？</p>
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
    <div class="attention">
      ※プッシュ通知の許可をお願い致します。
    </div>
  <div class="error">{{ error }}</div>
  </div>
</template>

<script>

import axios from 'axios'

  export default {
    data () {
      return {
        radio: 'false'
      }
    },
    methods: {
      async createNotification () {
        try {
          const res = await axios.post(`http://localhost:3000/notifications`, {way: this.radio},
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
  }
  span {
    color: #CB0101;
    font-size: 18px;
  }
  .explanation p {
    padding-bottom: 20px;
    border-bottom: 0.1px solid #525151;
  }
  .question p {
    width: 480px;
    margin-top: 40px;
    margin-bottom: 15px;
    margin-left: 240px;
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
    margin: 20px;
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
</style>