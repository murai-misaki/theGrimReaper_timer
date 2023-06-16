<template>
  <div v-show="show" class="modal_contents">
    <div class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <h1 class="neontext">Attention</h1>
      <p class="subtitle">''ご使用のブラウザで複数のタブを開いている場合''</p>
      <p class="main-body">当アプリのタブを別ウィンドウに切り離し、独立のウィンドウとしてご使用ください。</p>
      <p class="reason">※ ご使用のブラウザがGoogle ChromeやSafariの場合、バックグラウンドでの動作が制限されているため、<br>タイマー開始後に他のタブに移動すると、非アクティブになる当アプリは、タイマー通知が正常に動作されなくなってしまいます。</p>
      <img src="../assets/img/browser_modal.png" alt="独立ウィンドウとする方法" >
      <p class="body">独立ウィンドウとすることで、他のウィンドウなどに移動していても、タイマー通知は正常に動作します。</p>
      <div class="exception-border">
        <p class="exception">※ 独立のウィンドウとする必要がない場合</p>
        <p class="exception">・ ご使用のブラウザがFirefoxの場合</p>
        <p class="exception">・ タイマー作動中に他のタブに移動せず、当アプリのタブがアクティブなタブ(現在表示しているページのタブ)の場合</p>
      </div>
      <button @click="redirectToTimer">OK</button>
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
        window.scrollTo(0, 0);
      },
      redirectToTimer () {
        this.$router.push({ name: 'Timer' })
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-weight: normal;
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    text-align: center;
  }
  p.main-body {
    text-align: center;
    border-bottom: 1px solid #D9D9D9;
    width: 750px;
    margin: 0 auto;
  }
  p.body {
    text-align: center;
    font-size: 15px;
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
    height: 1200px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 750px;
    height: 650px;
    transform: translate(-50%,-50%);
    padding: 20px 65px 120px 65px;
    margin-top: 80px;
    border: 2px solid #FFFFFF;
  }
  .modal_close_btn {
    margin-left: 760px;
    cursor: pointer;
  }

  button {
    font-size: 25px;
    width: 300px;
    margin-left:240px;
    margin-top: 10px;
    font-family: 'IM Fell English SC', serif;
    max-width: 280px;
    padding: 10px 25px;
    border: 2px solid #D9D9D9;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }
  button:hover {
  color: #D9D9D9;
  background: rgba(217, 217, 217, 0.2);
  }

.neontext {
      color: #fff;
      text-shadow:
        0 0 7px #fff,
        0 0 10px #fff,
        0 0 21px #fff,
        0 0 42px #f09,
        0 0 82px #f09,
        0 0 92px #f09,
        0 0 102px #f09,
        0 0 151px #f09;
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
        0 0 40px #f09,
        0 0 80px #f09,
        0 0 90px #f09,
        0 0 100px #f09,
        0 0 150px #f09;
      }
      0% {
        text-shadow:
        0 0 4px #fff,
        0 0 10px #fff,
        0 0 18px #fff,
        0 0 38px #f09,
        0 0 73px #f09,
        0 0 80px #f09,
        0 0 94px #f09,
        0 0 140px #f09;
      }
    }

  p.subtitle {
    text-align: center;
    margin-top: -20px;
    font-size: 14px;
    margin-bottom: 35px;
  }

  img {
    width: 600px;
    margin-left: 70px;
  }
  p.exception {
    color: #BFBFBF;
    font-size: 13px;
    margin-left: 30px;
  }
  div.exception-border {
    border: 1px solid #BFBFBF;
    margin: 15px 0px;
  }
  p.reason {
    color: #BFBFBF;
    font-size: 12px;
    margin-left: 20px;
  }
</style>