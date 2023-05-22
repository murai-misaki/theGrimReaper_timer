<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">Health Risk</h1>
      <p class="body"><span class="number">1.</span>1時間座り続けると<span class="red">寿命が22分縮む</span></p>
      <p class="body"><span class="number">2.</span>1日8時間以上座っている人は、<span class="red">罹患リスクや死亡リスクが高まる</span></p>
      <p class="detail">オーストラリアの研究機関が22万2,497人を3年近く追跡し、『1日に座る時間と死亡リスク』を検証。<br>その結果、座る時間が4時間未満と比べて、8～11時間の人は<span class="detail_red">15％</span>、11時間以上の人は<span class="detail_red">40％</span>も<span class="detail_red">総死亡の割合が高くなる</span>と判明。<br>ブラジル・サンパウロ大学の研究者らは「世界54カ国で年間43万人以上が、“座り過ぎ”が原因で亡くなっている」との、研究結果を発表。</p>
      <p class="detail">日本人の座る時間は<span class="detail_red">平均1日8~9時間</span>。多くの成人は起きている時間の3分の2を座って過ごします。<br>世界で一番、日本人は座っている時間が長いです。</p>
      <p>座りすぎは<span class="red">肥満、がん、うつ病、糖尿病、高血圧、心疾患、脳梗塞</span>など<br>将来的にさまざまな病気を誘発し、<span class="red">世界で年間200万人の死因</span>になっている</p>
      <p class="detail">長時間座り続けていると、全身の筋肉の70％を占める下半身の活動が停止状態に陥ります。<br>もっとも大きな太ももの筋肉や、『第二の心臓』と言われるふくらはぎの筋肉が働かないため、血流が滞り、代謝機能が低下。<br>５分座っていると、血流速度は急速に下がり、30分座り続けると、血流速度は70％も低下するという実験結果もあります。<br>それが積み重なり、長期化すれば全身が巻き込まれて、あらゆる病の引き金となるとされています。</p>
      <p class="body"><span class="number">3.</span><span class="red">身体活動不足</span></p>
      <p class="detail">「座りすぎ」の問題は、近年、世界的に蔓延している「身体活動不足」と密接に関わっています。<br>身体活動不足は、全世界で<span class="detail_red">死亡原因</span>の4位、<span class="detail_red">日本では3位</span>と報告されるほど深刻化しています。</p>
      <p class="body"><span class="number">4.</span>座りっぱなしは<span class="red">水分不足</span>になりやすく、これが血液の循環を悪くすることもある</p>
      <p class="reference">※ 座りすぎ研究の第一人者、早稲田大学スポーツ科学学術院教授 岡 浩一朗先生の記事参照</p>
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
  p.detail {
    color: #BFBFBF;
    font-size: 12px;
  }
  span.detail_red {
    color: #CB0101;
    font-size: 12px;
  }
  p.body {
    border-bottom: 1px solid rgba(207, 207, 207, 0.51);
  }
  span.red {
    color: #CB0101;
  }
  p.reference {
    margin-top: 50px;
    margin-left: 260px;
    color: #BFBFBF;
    font-size: 12px;
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
    height: 1000px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 750px;
    height: 620px;
    transform: translate(-50%,-50%);
    padding: 20px 65px 180px 65px;
    margin-top: 135px;
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
</style>