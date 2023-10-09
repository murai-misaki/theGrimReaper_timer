<template>
  <h1 class="neontext">Application Function</h1>
  <p class="title">''主なアプリ機能''</p>
  <div class="introduction">
    <h2>30分ごとに立ち上がりのお知らせを致します</h2>
    <div class="explanation">
      <span class="red">‘’ 30分に一度3分、立って動く ‘’</span>
      <p>一回に座ったまま過ごす時間が30分を超えないようにすること。<br>これで座りすぎのリスクはかなり減らせます。<br><span class="postscript">※ デスクワークにおいて、夕方の疲労感が圧倒的に改善されたというデータもあります。</span></p>
    </div>
  </div>
  <div class="introduction">
    <h2>お好きなお知らせ方法を選択できます</h2>
    <div class="notification">
      <div class="sound">
        <p><font-awesome-icon :icon="['fas', 'volume-up']" style="color: #D9D9D9;" /> <span>音でお知らせ</span></p>
        <p class="sound-text">サウンド通知</p>
      </div>
      <div class="push">
        <p><font-awesome-icon :icon="['fas', 'eye']" style="color: #D9D9D9;" /> <span>視覚でお知らせ</span></p>
        <p class="push-text">プッシュ通知</p>
      </div>
    </div>
  </div>
  <div class="introduction">
    <h2>座りすぎで縮んだ寿命を可視化し、その危機感から<br>「30分に1回立ち上がること」を怠らないように促す機能</h2>
    <div class="body">
      <img src="../assets/img/to_introduce1.png" alt="該当の機能画面" class="img-left" >
      <span class="number number-right">1</span>
      <p class="text-right">立ち上がらずに座り続けて1時間が経過すると、<br>座りすぎによって縮んだ寿命がリアルタイムで表示されます</p>
    </div>
    <div class="body">
      <span class="number number-left">2</span>
      <p class="text-left">1日ごとの、座っている時間と<br>1時間座り続けたことで縮んだ寿命を記録し、<br>直近1週間分をグラフ化します</p>
      <img src="../assets/img/to_introduce2.png" alt="該当の機能画面" class="img-right" >
    </div>
    <div class="body-last">
      <img src="../assets/img/to_introduce3.png" alt="該当の機能画面" class="img-left3" >
      <span class="number number-right3">3</span>
      <p class="text-right3">1時間座り続けたことで縮んだ寿命の合計時間を知れます</p>
    </div>
  </div>
  <div class="introduction">
    <h2>1日8時間以上座ることによって高まる罹患リスクや死亡リスク、<br>身体活動不足についても対策できる機能が備わっています</h2>
    <div class="body">
      <img src="../assets/img/to_introduce4.png" alt="該当の機能画面" class="img-left" >
      <span class="number number-right4">1</span>
      <p class="text-right4">1日に8時間以上座り続けている場合に注意喚起を行い、<br>罹患リスクや死亡リスクが高まるのを防ぎます</p>
    </div>
    <div class="body">
      <div>
        <div class="number5">
          <span class="number number-left5">2</span>
          <p class="text-left5">立ち上がって3分間のブレイクタイム時に<br>体を動かす4ジャンル計13種類<br>1分程度の軽い運動をご紹介します</p>
        </div>
        <p class="genre">1. 全身バランスよく(ラジオ体操)<br>2. 肩こり・肩痛予防<br>3. 腰痛・膝痛予防<br>4. 下肢筋力アップ</p>
      </div>
      <div>
        <img src="../assets/img/to_introduce5.png" alt="該当の機能画面" class="img-right5" >
      </div>
    </div>
    <div class="body-last">
      <div>
        <img src="../assets/img/to_introduce6.png" alt="該当の機能画面" class="img-left" >
      </div>
      <div>
        <div class="number7">
          <span class="number number-right7">3</span>
          <p class="text-right7">ブレイクタイム時に行った<br>1日ごとの身体活動量を記録し、<br>直近1週間分をグラフ化します</p>
        </div>
        <p class="reference">1日の身体活動量が10分(1回1分の運動を10回)増加すると、<br>3.2%のリスク※が減少することが明らかになっています。<br><span>※ 死亡、生活習慣病・がん・ロコモ・認知症の発症 (厚生労働省 : 健康づくりのための身体活動基準2013)</span></p>
      </div>
    </div>
  </div>
  <div v-show="!loading">
    <button @click="guestSignUp">Let's Start !</button>
  </div>
  <div v-show="loading">
    <div class="loading-block">
      <div class="loading-circle"></div>
      <div class="loading-circle"></div>
      <div class="loading-circle"></div>
    </div>
  </div>
  <p class="guest-login">( ゲストログインで当サービスをお試しいただけます。 )</p>
  <div class="error">{{ guestSignupError }}</div>
  <div class="line"></div>
  <p class="attention"><font-awesome-icon :icon="['fas', 'triangle-exclamation']" />アカウントをお持ちの方は <span>LogIN</span>リンクからログインして下さい。</p>
</template>

<script>
  export default {
    props: ['guestSignupError', 'loading'],

    data () {
      return {
      }
    },
    methods: {
      guestSignUp () {
        this.$emit('guestSignUp')
      }
    }
  }
</script>

<style scoped>
  .introduction {
    border: 1px solid #D9D9D9;
    margin: 50px auto;
    width: 1000px;
  }
   h2 {
    font-weight: normal;
    text-align: center;
    background: rgba(73, 73, 73, 0.87);
    border: 1px solid rgba(207, 207, 207, 0.51);
    width: 800px;
    margin: 40px auto;
  }
  .explanation span.red {
    color: #CB0101;
    padding-top: 28px;
    margin-left: 120px;
    font-size: 19px;
  }
  .explanation {
    display: flex;
    margin-top: -30px;
    margin-bottom: 25px;
  }
  .explanation p {
    margin-left: 30px;
    font-size: 16px;
  }
  span.postscript {
    color: #BFBFBF;
    font-size: 12px;
  }
  .notification {
    display: flex;
    margin-top: -30px;
    margin-bottom: 25px;
  }
  .sound {
    font-size: 20px;
    margin-left: 250px;
  }
  .push {
    font-size: 20px;
    margin-left: 90px;
    border-left: 1px solid #727272;
    padding-left: 90px;
  }
  .sound-text {
    padding-left: 15px;
  }
  .push-text {
    padding-left: 27px;
  }

  .body {
    display: flex;
    padding-bottom: 15px;
    border-bottom: 1px solid #727272;
    width: 900px;
    margin: 20px auto;
  }
  .body-last {
    display: flex;
    padding-bottom: 15px;
    width: 900px;
    margin: 20px auto;
  }
  span.number {
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    margin-right: 10px;
    margin-left: 20px;
  }
  img {
    width: 250px;
    border: 1px solid rgba(207, 207, 207, 0.51);
  }
  .img-left {
    margin-left: 80px;
  }
  span.number-right {
    margin-left: 30px;
    margin-top: 35px;
    font-size: 60px;
  }
  p.text-right {
    font-size: 18px;
    margin-top: 50px;
    margin-left: 20px;
  }
  .img-right {
    margin-left: 50px;
  }
  span.number-left {
    font-size: 60px;
    margin-left: 80px;
    margin-top: 34px;
  }
  p.text-left {
    font-size: 18px;
    margin-left: 20px;
    margin-top: 35px;
  }
  .img-left3 {
    margin-left: 30px;
    width: 300px;
  }

  p.text-right3 {
    font-size: 18px;
    margin-top: 35px;
    margin-left: 20px;
  }
  span.number-right3 {
    margin-left: 30px;
    font-size: 60px;
  }

  span.number-right4 {
    margin-left: 30px;
    margin-top: 15px;
    font-size: 60px;
  }
  p.text-right4 {
    font-size: 18px;
    margin-top: 30px;
    margin-left: 20px;
  }

  .number5 {
    display: flex;
  }
  span.number-left5 {
    font-size: 60px;
    margin-left: 80px;
    margin-top: 5px;
  }
  p.text-left5 {
    font-size: 18px;
    margin-left: 20px;
    margin-top: 5px;
  }
  p.genre {
    font-size: 14px;
    color: #BFBFBF;
    margin-left: 140px;
    margin-top: -10px;
  }
  .img-right5 {
    margin-left: 90px;
  }
  span.number-right7 {
    margin-left: 30px;
    font-size: 60px;
  }
  p.text-right7 {
    font-size: 18px;
    margin-top: 10px;
    margin-left: 20px;
  }
  .number7 {
    display: flex;
  }
  .reference {
    margin-left: 40px;
    margin-top: -10px;
    color: #0EA401;
    font-size: 15px;
  }
  .reference span {
    font-size: 11px;
  }

  button {
    font-family: 'IM Fell English SC', serif;
    font-size: 25px;
    border: 3px solid #8F0B0B;
    color: #D9D9D9;
    background: #8F0B0B;
    cursor: pointer;
    margin-left: 585px;
    padding: 10px 30px;
    width: 250px;
  }
  button:hover {
    color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }

  .guest-login {
    text-align: center;
    color: #BFBFBF;
  }
  .line {
    margin: -10px auto;
    width: 1000px;
    border-top: 1px solid #727272;
  }
  p.attention {
    text-align: center;
    color: #BFBFBF;
    margin-bottom: 100px;
  }
  .attention span {
    font-family: 'IM Fell English SC', serif;
  }

  h1 {
    font-family: 'IM Fell English SC', serif;
    text-align: center;
    font-size: 35px;
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
  p.title {
    text-align: center;
    margin-top: -10px;
  }

  .error {
    color: #CB0101;
    font-size: 15px;
    text-align: center;
    background: rgba(90, 3, 3, 0.6);
    width: 420px;
    margin: 20px auto;
  }

</style>