<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">Whta is locomotion?</h1>
      <p>''ロコモってなに?''</p>
      <p>筋肉や関節など運動器の障害で、「立つ」「歩く」といった移動機能が低下している状態のことです。<br>正式には、ロコモティブシンドロームと言います。</p>
      <div class="line"></div>
      <div class="check">
        <div class="check-text">
          <p class="title">ロコモチェック</p>
          <p>①イスから両足で立ち上がれますか？</p>
          <p>②イスから片足で立ち上がれますか？</p>
          <p>③反対の足でもできますか？</p>
        </div>
        <div class="check-img">
          <img src="../assets/img/locomo_check.png" alt="ロコモチェックイメージ" >
          <p class="reference">※ ロコモONLINE HPより</p>
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
    width: 800px;
    margin: 0 auto;
  }
  .check {
    display: flex;
  }
  .check-text {
    margin-left: 80px;
    padding-top: 50px;
  }
  img {
    width: 400px;
    margin-left: 50px;
    padding-top: 30px;
  }
  p.reference {
    color: #BFBFBF;
    font-size: 12px;
    margin-left: 350px;
  }
  p.title {
    border: 1px solid #BFBFBF;
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
    width: 850px;
    height: 450px;
    transform: translate(-50%,-50%);
    padding: 20px 65px 100px 65px;
    margin-top: 270px;
    border: 2px solid #FFFFFF;
    text-align: center;
  }
  .modal_close_btn {
    margin-left: 860px;
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
</style>