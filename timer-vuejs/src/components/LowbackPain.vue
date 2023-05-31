<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <div v-show="stretch != 3" @click="nextPage" class="right-button">
        <font-awesome-icon :icon="['fas', 'chevron-right']" style="color: #D9D9D9;" class="right" />
      </div>
      <div v-show="stretch != 1" @click="backPage" class="left-button">
        <font-awesome-icon :icon="['fas', 'chevron-left']" style="color: #D9D9D9;" class="left" />
      </div>
      <div v-show="stretch == 1">
        <h1 class="neontext">back of thighs stretch</h1>
        <p>''ふともも裏ストレッチ 30秒×2回 (左右)''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text1">
            <p>①イスに浅く腰かけます</p>
            <p>②片側の膝を伸ばし、体を前に倒していきます<br>(つま先を上げると効果的)</p>
            <p>③ももの付け根から前傾します</p>
            <p>④ふともも裏が伸びているところで30秒保持します</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/lowback_pain1.png" alt="ふともも裏ストレッチイメージ" >
          </div>
        </div>
        <div class="page">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 2">
        <h1 class="neontext">lower back stretch</h1>
        <p>''腰ストレッチ 30秒''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text">
            <p>①膝を伸ばしたまま、両手を地面に向かって<br>伸ばしていきます</p>
            <p>②ふともも裏のつっぱりがなくなるように<br>膝を軽く曲げます</p>
            <p>③このとき背中から腰にかけて伸びているところで<br>30秒保持します</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/lowback_pain2.png" alt="腰ストレッチイメージ" >
          </div>
        </div>
        <div class="page page2">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 3">
        <h1 class="neontext">back stretch</h1>
        <p>''背中ストレッチ 30秒''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text3">
            <p>①両手を重ね、前に腕を伸ばしていきます</p>
            <p>②このときお腹をへこませるようにすると背中の筋肉が<br>伸びやすくなります</p>
            <p>③背中の筋肉が伸びているところで30秒保持します</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/lowback_pain3.png" alt="背中ストレッチイメージ" class="img3" >
          </div>
        </div>
        <div class="page page3">
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
    padding-top: 30px;
  }
  .text1 {
    margin-left: 30px;
  }
  .text3 {
    margin-left: 40px;
    padding-top: 50px;
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

  .img3 {
    width: 150px;
  }
  .page2 {
    margin-top: 3px;
  }
  .page3 {
    margin-top: 8px;
  }
</style>