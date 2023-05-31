<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <div v-show="stretch != 5" @click="nextPage" class="right-button">
        <font-awesome-icon :icon="['fas', 'chevron-right']" style="color: #D9D9D9;" class="right" />
      </div>
      <div v-show="stretch != 1" @click="backPage" class="left-button">
        <font-awesome-icon :icon="['fas', 'chevron-left']" style="color: #D9D9D9;" class="left" />
      </div>
      <div v-show="stretch == 1">
        <h1 class="neontext">stand on one leg</h1>
        <p>''片足立ち 1分×2回 (左右)''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text1">
            <p>①姿勢をまっすぐにして立ち上がります</p>
            <p>②床につかない程度に片足を上げて、1分保持します</p>
            <p class="attention">※ 転倒しないように、必ずつかまるものがある場所で行いましょう</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/leg_muscle1.png" alt="片足立ちイメージ" class="img1" >
          </div>
        </div>
        <div class="page">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 2">
        <h1 class="neontext">sit with one leg raised</h1>
        <p>''座り片足上げ 30秒×2回 (左右)''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text">
            <p>①イスに浅く腰かけます</p>
            <p>②片方の足は床につけたまま、もう片方は足首を直角に曲げ、膝をまっすぐに伸ばします</p>
            <p>③伸ばした足のかかとを床から約10cm以上離し、<br>30秒保持します</p>
            <p class="attention">※ 股関節痛、人工股関節の方は行わないようにしましょう</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/leg_muscle2.png" alt="座り片足上げイメージ" >
          </div>
        </div>
        <div class="page page2">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 3">
        <h1 class="neontext">heel raise</h1>
        <p>''ヒールレイズ 1分:15回''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text3">
            <p>①立った状態で両足のかかとを上げて、<br>ゆっくりかかとを下ろします</p>
            <p class="attention">※ かかとを上げすぎると転びやすくなるので注意しましょう</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/leg_muscle3.png" alt="ヒールレイズイメージ" class="img3" >
          </div>
        </div>
        <div class="page page3">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 4">
        <h1 class="neontext">squats</h1>
        <p>''スクワット 1分:10回''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text4">
            <p>①肩幅より少し広めに足を広げて立ちます</p>
            <p>②つま先は左右に30度くらいずつ開きます</p>
            <p>③膝がつま先より前に出ないように、<br>また膝が足の人差し指の方向に向くように注意して、<br>お尻を後ろに引くようにゆっくりと体を沈めます</p>
            <p>④ゆっくりと元に戻します</p>
            <p class="attention">※ 膝に負担がかからないよう、膝は90度以上曲げないようにします</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/leg_muscle4.png" alt="スクワットイメージ" class="img4" >
          </div>
        </div>
        <div class="page page4">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 5">
        <h1 class="neontext">stand up</h1>
        <p>''立ち上がり 1分''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text5">
            <p>①イスに浅く座り、胸を張りおなかをひっこめて背すじを伸ばします</p>
            <p>②良い姿勢を保ったまま、軽くお辞儀をします</p>
            <p>③ゆっくりと立ち上がります</p>
            <p>④立ち上がった後も、しっかりと背すじを伸ばし、<br>お尻をギュッとしめ、膝の裏をまっすぐ伸ばします</p>
            <p>⑤おしりをゆっくりと下ろすように座ります</p>
            <p>⑥これを自分のペースで繰り返し行います</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/leg_muscle5.png" alt="立ち上がりイメージ" class="img5" >
          </div>
        </div>
        <div class="page page5">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
        </div>
      </div>
      <div v-show="flashMessage" class="flash_message">
        <p>本日の身体活動量として記録しました。</p>
      </div>
      <button @click="record">Finished</button>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        show: false,
        stretch: 1,
        flashMessage: false,
      }
    },
    methods: {
      open () {
        this.show = true
      },
      close () {
        this.show = false
      },
      nextPage () {
        this.stretch += 1
      },
      backPage () {
        this.stretch -= 1
      },
      showFlashMessage () {
        this.flashMessage = true
      },
      closeFlashMessage () {
        this.flashMessage = false
      },
      record () {
        this.showFlashMessage()
        setTimeout(this.closeFlashMessage, 2000);
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 38px;
  }
  .line {
    border-bottom: 0.1px solid #525151;
    width: 350px;
    margin: 0 auto;
  }
  .right {
    font-size: 50px;
    float:right;
    margin-top: 250px;
    cursor: pointer;
  }
  .left {
    font-size: 50px;
    float:left;
    margin-top: 250px;
    cursor: pointer;
  }
  img {
    width: 200px;
    margin-left: 30px;
    padding-top: 20px;
  }
  .body {
    display: flex;
  }
  .howto-text {
    padding-top: 20px;
  }
  .text1 {
    margin-left: 50px;
    margin-top: 40px;
  }
  .text3 {
    margin-left: 50px;
    margin-top: 40px;
  }
  .text4 {
    margin-left: 20px;
  }
  .page {
    display: flex;
    justify-content: center;
    padding-top: 20px;
  }

  .modal_contents {
    position: absolute;
    top: 0;
    left: 0;
    z-index:100;
    width: 100%;
    height: 100%;
    width: 100%;
  }
  .modal_contents_bg {
    background: rgba(40, 40, 40, 0.56);
    width: 100%;
    height: 950px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 700px;
    height: 430px;
    transform: translate(-50%,-50%);
    padding: 20px 65px 100px 65px;
    margin-top: 270px;
    border: 2px solid #FFFFFF;
    text-align: center;
  }
  .modal_close_btn {
    margin-left: 720px;
    cursor: pointer;
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

  button {
    margin: 20px auto;
    font-family: 'IM Fell English SC', serif;
    font-size: 35px;
    padding: 10px 60px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }
  button:hover {
  color: #fcfc04;
  }

  .flash_message {
    margin-top: 10px;
  }
  .flash_message p {
    border: 1px solid #BFBFBF;
    background: rgba(217, 217, 217, 0.2);
    width: 400px;
    margin: 0 auto;
  }

  .img1 {
    width: 120px;
    margin-left: 80px;
  }
  .img3 {
    width: 130px;
    margin-left: 60px;
  }
  .img4 {
    width: 160px;
    margin-left: 40px;
  }
  p.attention {
    color: #BFBFBF;
    font-size: 12px;
  }
  .text5 {
    font-size: 14px;
  }
  .img5 {
    margin-top: 60px;
  }
  .page2 {
    margin-top: 18.5px;
  }
  .page3 {
    margin-top: 9px;
  }
  .page4 {
    margin-top: 1px;
  }
  .page5 {
    margin-top: 10px;
  }
</style>