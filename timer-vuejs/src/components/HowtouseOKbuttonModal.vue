<template>
  <div v-show="show" class="modal_contents">
    <div class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <h1 class="neontext">How to Use</h1>
      <p class="subtitle">''アプリの主な使い方4ステップ''</p>
      <p class="body"><span class="number">1.</span><span class="red">30分ごとに</span>立ち上がりのお知らせを致します。</p>
      <p class="attention"><font-awesome-icon :icon="['fas', 'triangle-exclamation']" />端末がスリープ状態になっている場合は、タイマーの通知が届きませんのでご注意ください。</p>
      <p class="body"><span class="number">2.</span> 30分経過して通知が来ましたら、<span class="red">アプリ画面にて''立ち上がるか''を教えてください</span>。</p>
      <span class="attention">※ 1時間座り続けたことで縮んだ寿命の時間を正確にお伝えする為に、正直にお答えください。</span>
      <div class="group">
        <p class="body"><span class="number">3.</span> Yesをクリックすると、3分のブレイクタイムタイマーが開始されます。<br><span class="position">Noをクリックすると、そのままタイマーが再開します。</span></p>
        <img src="../assets/img/standup.png" alt="実際のアプリ画面イメージ" >
      </div>
      <p class="body"><span class="number">4.</span> タイマーを終了される場合は、<span class="red">必ず''ENDボタン''を押してください</span>。</p>
      <span class="attention"><font-awesome-icon :icon="['fas', 'triangle-exclamation']" />ENDボタンを押さずにタイマーを強制終了すると、タイマー記録(座っていた時間・1時間座り続けたことで縮んだ寿命・ブレイクタイム時に行った身体活動量)が保存されませんのでご注意ください 。</span>
      <button @click="openBrowserModal">OK</button>
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
        document.body.style.overflow = 'hidden';
      },
      close () {
        this.show = false
        document.body.style.overflow = 'auto';
      },
      openBrowserModal () {
        this.$emit('openBrowserModal')
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 38px;
    text-align: center;
  }

  span.number {
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    margin-right: 10px;
  }
  span.attention, p.attention {
    color: #BFBFBF;
    font-size: 12px;
  }
  p.body {
    border-bottom: 1px solid rgba(207, 207, 207, 0.51);
  }
  span.position {
    margin-left: 39px;
  }
  span.red {
    color: #CB0101;
  }
  img {
    width: 180px;
    margin-left: 20px;
  }
  .group p {
    display: inline-block;
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
    height: 100%;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 750px;
    transform: translate(-50%,-50%);
    padding: 0px 40px 30px 40px;
    margin-top: 5px;
    border: 2px solid #FFFFFF;
    max-height: 650px;
    overflow: auto;
  }

  button {
    font-size: 25px;
    width: 300px;
    margin-left:240px;
    margin-top: 30px;
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

  p.subtitle {
    text-align: center;
    margin-top: -20px;
    font-size: 14px;
  }
</style>