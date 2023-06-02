<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">Let's have a drink of water</h1>
      <p class="title">''水をひと口飲みましょう''</p>
      <p>座りっぱなしは水分不足になりやすく、これが血液の循環を悪くすることもあります。</p>
      <div class="line"></div>
      <div class="body">
        <div class="text">
          <p class="title">''こまめに、少しずつ''</p>
          <p>のどが渇いていなくても水を飲むだけで<br>注意力(集中力)・記憶力がUPします。</p>
        </div>
        <div class="drink-img">
          <img src="../assets/img/drink_water.png" alt="片足立ちイメージ" >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        show: false
      }
    },
    methods: {
      open () {
        this.show = true
      },
      close () {
        this.show = false
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
    width: 700px;
    margin: 0 auto;
  }
  .title {
    color: #27b5d6;
  }
  .body {
    display: flex;
  }
  img {
    width: 180px;
    margin-left: 70px;
    padding-top: 30px;
  }
  .text {
    padding-top: 60px;
    margin-left: 70px;
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
    height: 400px;
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
      0 0 42px #27b5d6,
      0 0 82px #27b5d6,
      0 0 92px #27b5d6,
      0 0 102px #27b5d6,
      0 0 151px #27b5d6;
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
      0 0 40px #27b5d6,
      0 0 80px #27b5d6,
      0 0 90px #27b5d6,
      0 0 100px #27b5d6,
      0 0 150px #27b5d6;
    }
    0% {
      text-shadow:
      0 0 4px #fff,
      0 0 10px #fff,
      0 0 18px #fff,
      0 0 38px #27b5d6,
      0 0 73px #27b5d6,
      0 0 80px #27b5d6,
      0 0 94px #27b5d6,
      0 0 140px #27b5d6;
    }
  }
</style>