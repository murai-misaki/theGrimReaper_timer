<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <div v-show="stretch != 4" @click="nextPage" class="right-button">
        <font-awesome-icon :icon="['fas', 'chevron-right']" style="color: #D9D9D9;" class="right" />
      </div>
      <div v-show="stretch != 1" @click="backPage" class="left-button">
        <font-awesome-icon :icon="['fas', 'chevron-left']" style="color: #D9D9D9;" class="left" />
      </div>
      <div v-show="stretch == 1">
        <h1 class="neontext">upper arms stretch</h1>
        <p>''二の腕ストレッチ 30秒×2回 (左右)''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text">
            <p>①両腕を頭の後ろまであげます</p>
            <p>②片方の腕のひじあたりを反対の手で押さえ、<br>押さえた手の方向に引っ張ります</p>
            <p>③脇の下あたりから二の腕にかけて伸びているところで<br>30秒保持します</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/shoulder_pain1.png" alt="二の腕ストレッチイメージ" >
          </div>
        </div>
        <div class="page">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 2">
        <h1 class="neontext">neck stretch</h1>
        <p>''首ストレッチ 30秒×2回 (左右)''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text2">
            <p>①てのひらで頭を押さえて首を傾けます</p>
            <p>②ゆっくりと首を傾けていき首の筋肉を伸ばします</p>
            <p>③首から肩にかけて伸びているところで<br>30秒保持します</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/shoulder_pain2.png" alt="首ストレッチイメージ" >
          </div>
        </div>
        <div class="page page2">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 3">
        <h1 class="neontext">shoulders stretch</h1>
        <p>''肩ストレッチ 30秒×2回 (左右)''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text text3">
            <p>①片方の手を反対側に伸ばし、<br>もう片方の手でひじを抱えながら引きつけます</p>
            <p>②肩から二の腕にかけて伸びているところで<br>30秒保持します</p>
          </div>
          <div class="howto-img img3">
            <img src="../assets/img/shoulder_pain3.png" alt="肩ストレッチイメージ" >
          </div>
        </div>
        <div class="page page3">
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #D9D9D9;" />
          <font-awesome-icon :icon="['fas', 'circle']" style="color: #525252;" />
        </div>
      </div>
      <div v-show="stretch == 4">
        <h1 class="neontext">rotate your elbow</h1>
        <p>''ひじ回し 30秒10回×2 (内外)''</p>
        <div class="line"></div>
        <div class="body">
          <div class="howto-text">
            <p>①右手は右肩へ、左手は左肩へ、ひじを曲げて軽く触れます</p>
            <p>②ひじで円を描くように大きく動かし、<br>ゆっくりと10回まわします</p>
            <p>③反対回しで10回行います</p>
          </div>
          <div class="howto-img">
            <img src="../assets/img/shoulder_pain4.png" alt="ひじ回しイメージ" >
          </div>
        </div>
        <div class="page page4">
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
    padding-top: 30px;
  }
  .body {
    display: flex;
  }
  .howto-text {
    padding-top: 40px;
  }
  .text2 {
    margin-left: 10px;
  } 
  .text3 {
    margin-left: 30px;
  }
  .page {
    display: flex;
    justify-content: center;
    padding-top: 20px;
  }
  .img3 {
    margin-left: 30px;
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
    height: 420px;
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

  .page2 {
    margin-top: 42px;
  }
  .page3 {
    margin-top: 38px;
  }
  .page4 {
    margin-top: 54px;
  }

  .flash_message {
    margin-top: 20px;
  }
  .flash_message p {
    border: 1px solid #BFBFBF;
    background: rgba(217, 217, 217, 0.2);
    width: 400px;
    margin: 0 auto;
  }
</style>