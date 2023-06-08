<template>
  <p class="subtitle">1時間座り続けるごとに<br>あなたの<span class="red">寿命</span>を<br><span class="red">22分</span>戴きます。</p>
  <div class="updown">
    <p class="scroll-text">scroll</p>
    <font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="scroll-down" />
  </div>
  <div class="health-risk">
    <p class="risk-subtitle">ー 何気ないその行動が未来を縮める ー</p>
    <p class="risk-title">座りすぎによる<span class="red">リスク</span></p>
    <p class="body1"><span class="number">1.</span>1時間座り続けると<span class="red">寿命が22分縮む</span></p>
    <p @click="openShow1" class="body open-body"><span class="number">2.</span>1日8時間以上座っている人は、<span class="red">罹患リスクや死亡リスクが高まる</span><font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
    <div v-show="show1">
      <p class="detail">オーストラリアの研究機関が22万2,497人を3年近く追跡し、『1日に座る時間と死亡リスク』を検証。<br>その結果、座る時間が4時間未満と比べて、8～11時間の人は<span class="detail_red">15％</span>、11時間以上の人は<span class="detail_red">40％</span>も<span class="detail_red">総死亡の割合が高くなる</span>と判明。<br>ブラジル・サンパウロ大学の研究者らは「世界54カ国で年間43万人以上が、“座り過ぎ”が原因で亡くなっている」との、研究結果を発表。</p>
      <p class="detail">日本人の座る時間は<span class="detail_red">平均1日8~9時間</span>。多くの成人は起きている時間の3分の2を座って過ごします。<br>世界で一番、日本人は座っている時間が長いです。</p>
    </div>
    <p @click="openShow2" class="body2 open-body">座りすぎは<span class="red">肥満、がん、うつ病、糖尿病、高血圧、心疾患、脳梗塞</span>など<br>将来的にさまざまな病気を誘発し、<span class="red">世界で年間200万人の死因</span>になっている<font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
    <div v-show="show2">
      <p class="detail">長時間座り続けていると、全身の筋肉の70％を占める下半身の活動が停止状態に陥ります。<br>もっとも大きな太ももの筋肉や、『第二の心臓』と言われるふくらはぎの筋肉が働かないため、血流が滞り、代謝機能が低下。<br>５分座っていると、血流速度は急速に下がり、30分座り続けると、血流速度は70％も低下するという実験結果もあります。<br>それが積み重なり、長期化すれば全身が巻き込まれて、あらゆる病の引き金となるとされています。</p>
    </div>
    <p @click="openShow3" class="body open-body"><span class="number">3.</span><span class="red">身体活動不足</span><font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
    <div v-show="show3">
      <p class="detail">「座りすぎ」の問題は、近年、世界的に蔓延している「身体活動不足」と密接に関わっています。<br>身体活動不足は、全世界で<span class="detail_red">死亡原因</span>の4位、<span class="detail_red">日本では3位</span>と報告されるほど深刻化しています。</p>
    </div>
    <p class="body"><span class="number">4.</span>座りっぱなしは<span class="red">水分不足</span>になりやすく、これが血液の循環を悪くすることもある</p>
    <p class="reference">※ 座りすぎ研究の第一人者、早稲田大学スポーツ科学学術院教授 岡 浩一朗先生の記事参照</p>
  </div>
  <p class="summary">この <span>the Grim Reaper Timer</span> では<br>これらの座りすぎのリスクに対して、手軽に効果的な対策が行えます。</p>
  <button>Let's use the Grim Reaper Timer</button>
  <p class="guest-login">( Guest LogIn )</p>
  <div class="line"></div>
  <p class="attention"><font-awesome-icon :icon="['fas', 'triangle-exclamation']" />アカウントをお持ちの方は <span>LogIN</span>リンクからログインして下さい。</p>
</template>

<script>
  export default {
    data () {
      return {
        show1: false,
        show2: false,
        show3: false,
      }
    },
    methods: {
      openShow1 () {
        this.show1 = !this.show1
      },
      openShow2 () {
        this.show2 = !this.show2
      },
      openShow3 () {
        this.show3 = !this.show3
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  p.subtitle {
    text-align: center;
    padding-top: 110px;
    font-size: 70px;
  }
  p.scroll-text {
    font-family: 'IM Fell English SC', serif;
    font-size: 25px;
    text-align: center;
    margin-top: 90px;
  }
  .red {
    color: #A40505;
  }
  .scroll-down {
    font-size: 60px;
    margin-left: 682px;
    margin-top: -40px;
    margin-bottom: 40px;
  }

  /*アニメーション用CSS*/
  .updown{
    /* アニメーションの名前 */
    animation-name:UpDown;
    /* アニメーションの１回分の長さ */
    animation-duration: 1.5s;
    /* アニメーションの回数 */
    animation-iteration-count: infinite;
    /* アニメーションの進行具合 */
    animation-timing-function: ease-in-out;
    /* アニメーション再生の向き */
    animation-direction: alternate;
  }
  /* アニメーションの設定 */
  @keyframes UpDown{
    /* 開始地点 */
    0%{
    /* Y軸0px */
    transform: translateY(0);
    }
    /* 終了地点 */
    100%{
    /* Y軸20px */
    transform: translateY(20px);
    }
  }
  
  .health-risk {
    width: 1000px;
    margin: 0 auto;
    padding-top: 30px;
    padding-bottom: 30px;
    border: 1px solid #D9D9D9;
  }
  
  .risk-subtitle {
    text-align: center;
    color: #BFBFBF;
  }
  .risk-title {
    font-size: 30px;
    text-align: center;
    margin: -10px auto;
    border-bottom: 1px solid #D9D9D9;
    width: 380px;
  }
  span.number {
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    margin-right: 10px;
    margin-left: 20px;
  }
  p.detail {
    color: #BFBFBF;
    font-size: 13px;
    margin-left: 100px;
  }
  span.detail_red {
    color: #CB0101;
    font-size: 14px;
  }
  p.body {
    font-size: 20px;
    border: 1px solid rgba(207, 207, 207, 0.51);
    margin-left: 100px;
    width: 800px;
  }
  p.body1 {
    font-size: 20px;
    border: 1px solid rgba(207, 207, 207, 0.51);
    margin-left: 100px;
    width: 800px;
    margin-top: 50px;
  }
  p.body2 {
    font-size: 20px;
    margin-left: 100px;
    text-align: center;
    width: 800px;
    border: 1px solid rgba(207, 207, 207, 0.51);
  }
  .open-body {
    cursor: pointer;
  }
  .open-icon {
    padding-left: 40px;
  }
  span.red {
    color: #CB0101;
  }
  p.reference {
    margin-top: 10px;
    margin-left: 450px;
    color: #BFBFBF;
    font-size: 11px;
  }

  .summary {
    font-size: 25px;
    text-align: center;
    margin-top: 30px;
  }
  .summary span {
    font-family: 'IM Fell English SC', serif;
  }

  button {
    font-family: 'IM Fell English SC', serif;
    font-size: 25px;
    border: 3px solid #8F0B0B;
    color: #D9D9D9;
    background: #8F0B0B;
    cursor: pointer;
    margin-left: 500px;
    padding: 10px 30px;
  }
  button:hover {
    color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }

  .guest-login {
    text-align: center;
    font-family: 'IM Fell English SC', serif;
    font-size: 20px;
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
</style>