<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">How to Use</h1>
      <p class="body"><span class="number">1.</span><span class="red">30分ごとに</span>立ち上がりのお知らせを致します。</p>
      <p class="attention"><font-awesome-icon :icon="['fas', 'triangle-exclamation']" />タイマーの通知が届かない場合<br>・ご使用のブラウザの通知をオフにしている可能性があります。端末の設定画面から使用されているブラウザアプリの通知をオンにしてください。<br>・端末がスリープ状態になっている場合もタイマーの通知が届きません。</p>
      <p class="body"><span class="number">2.</span> 30分経過して通知が来ましたら、<span class="red">アプリ画面にて''立ち上がるか''を教えてください</span>。</p>
      <span class="attention">※ 1時間座り続けたことで縮んだ寿命の時間を正確にお伝えする為に、正直にお答えください。</span>
      <div class="group">
        <p class="body"><span class="number">3.</span> Yesをクリックすると、3分のブレイクタイムタイマーが開始されます。<br><span class="position">Noをクリックすると、そのままタイマーが再開します。</span></p>
        <img src="../assets/img/standup.png" alt="実際のアプリ画面イメージ" >
      </div>
      <p class="body"><span class="number">4.</span> タイマーを終了される場合は、<span class="red">必ず''ENDボタン''を押してください</span>。</p>
      <span class="attention"><font-awesome-icon :icon="['fas', 'triangle-exclamation']" />ENDボタンを押さずにタイマーを強制終了すると、タイマー記録(座っていた時間・1時間座り続けたことで縮んだ寿命・ブレイクタイム時に行った身体活動量)が保存されませんのでご注意ください 。</span>
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
    height: 940px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 750px;
    height: 570px;
    transform: translate(-50%,-50%);
    padding: 20px 65px 100px 65px;
    margin-top: 80px;
    border: 2px solid #FFFFFF;
  }
  .modal_close_btn {
    margin-left: 760px;
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