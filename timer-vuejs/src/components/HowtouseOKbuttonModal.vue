<template>
  <div v-show="show" class="modal_contents">
    <div v-on:click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <div v-on:click="close" class="modal_close_btn">×</div>
      <h1 class="heading03">How to Use</h1>
      <p><span class="number">1.</span><span class="red">30分ごとに</span>立ち上がりのお知らせを致します。</p>
      <p><span class="number">2.</span> 30分経過して通知が来ましたら、<span class="red">アプリ画面にて''立ち上がるか''を教えてください</span>。</p>
      <span class="attention">※ 1時間座り続けたことで縮んだ寿命の時間を正確にお伝えする為に、正直にお答えください。</span>
      <div class="group">
        <p><span class="number">3.</span> Yesをクリックすると、3分のブレイクタイムタイマーが開始されます。<br><span class="position">Noをクリックすると、そのままタイマーが再開します。</span></p>
        <img src="../assets/img/standup.png" alt="実際のアプリ画面イメージ" >
      </div>
      <p><span class="number">4.</span> 本日の作業を終えて、タイマーを終了される場合は、<br><span class="position1">必ずタイマーのENDボタンを押してください</span>。</p>
      <span class="attention">※ ENDボタンを押さずにタイマーを強制終了すると、タイマー記録が破損する可能性がありますのでご注意ください 。</span>
      <button>OK</button>
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
    color: rgba(39, 39, 39, 0.85);
    font-size: 50px;
    text-align: center;
  }

  span.number {
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    margin-right: 10px;
  }
  span.attention {
    color: rgba(39, 39, 39, 0.51);
    font-size: 13px;
  }
  p {
    border-bottom: 1px solid rgba(207, 207, 207, 0.51);
  }
  span.position {
    margin-left: 39px;
  }
  span.position1 {
    margin-left: 44px;
    color: #8F0B0B;
  }
  span.red {
    color: #8F0B0B;
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
    background: rgba(0,0,0,.8);
    width: 100%;
    height: 100%;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #FFF;
    width: 750px;
    height: 770px;
    margin: auto;
    transform: translate(-50%,-50%);
    padding: 20px 65px;
    color: rgba(39, 39, 39, 0.71);
  }
  .modal_close_btn {
    display: inline-block;
    cursor: pointer;
    margin-top: 30px;
    margin-left: 750px;
    font-size: 30px;
  }

  button {
    font-family: 'IM Fell English SC', serif;
    font-size: 20px;
    width: 300px;
    background: #eee;
    border-radius: 3px;
    position: relative;
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin: 40px auto;
    max-width: 280px;
    padding: 15px 25px;
    color: #313131;
    transition: 0.3s ease-in-out;
    font-weight: 500;
    cursor: pointer;
}
button:hover {
    background: #313131;
    color: #FFF;
}
button:after {
    content: '';
    width: 5px;
    height: 5px;
    border-top: 3px solid #313131;
    border-right: 3px solid #313131;
    transform: rotate(45deg) translateY(-50%);
    position: absolute;
    top: 50%;
    right: 20px;
    border-radius: 1px;
    transition: 0.3s ease-in-out;
}
button:hover:after {
    border-color: #FFF;
}

.heading03 {
  display: flex;
	justify-content: center;
	align-items: center;
}

.heading03::before,
.heading03::after {
	content: '';
	width: 70px;
	height: 3px;
	background-color: #e3bf00;
}

.heading03::before {
	margin-right: 20px;
}
.heading03::after {
	margin-left: 20px;
}
</style>