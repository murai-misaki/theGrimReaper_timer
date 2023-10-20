<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">Health Risk</h1>
      <p @click="openShow1" class="body"><span class="number">1.</span>1時間座り続けると<span class="red">寿命が22分縮む</span><font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
      <div v-show="show1">
        <p class="detail">オーストラリアの研究機関が8800人を対象に6.6年にわたって追跡調査した研究によると、テレビを1日4時間以上見ている人は、1日2時間未満の人よりも、総死亡率が1.46倍になると判明。<br>さらにこの研究データを基に生命表分析を行った結果、テレビ視聴で1時間座り続けるごとに、1日22分ずつ平均寿命が短くなるという結果が報告され、世界にも衝撃を与えました。</p>
      </div>
      <p @click="openShow2" class="body"><span class="number">2.</span>1日8時間以上座っている人は、<span class="red">罹患リスクや死亡リスクが高まる</span><font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
      <div v-show="show2">
        <p class="detail">カナダでは「1日8時間以上座らないように」とガイドラインが出されています。</p>
        <p class="detail"><span class="detail_red">日本人の1日の座る時間は世界最長の平均8〜9時間</span>。これはかなり危険な数字と言えます。<br>なぜなら、さまざまな研究結果を調べてみると、『1日8時間以上座っている人は、罹患リスクや死亡リスクが高まる』ということを裏付けるデータが多く見つかるからです。</p>
      </div>
      <p @click="openShow3" class="body">座りすぎは<span class="red">肥満、がん、うつ病、糖尿病、高血圧、心血管疾患、脳卒中</span>など<br>将来的にさまざまな病気を誘発し、<span class="red">世界で年間200万人の死因</span>になっている<font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
      <div v-show="show3">
        <p class="detail">WHO（世界保健機関）は2011年に、「“座って動かない生活”は肥満や糖尿病、高血圧、がんなどの病気を誘発し、世界で年間200万人の死因になっている」というデータを公表した。<br>この内容を受け、2015年には世界中の研究者が集まり“座り過ぎのリスク”についての国際会議が開かれ、翌年ブラジル・サンパウロ大学の研究者から<span class="detail_red">「世界中で年間43万人以上が、“座り過ぎ”が原因で死んでいる」</span>との、より直接的な表現をした研究結果が発表された。</p>
        <p class="detail">「座りすぎ」が及ぼす深刻な健康被害。<br>そのメカニズムについては、長時間座り続けていると、<span class="detail_red">全身の筋肉の70％を占める下半身の活動が停止状態に陥ります。</span>もっとも大きな太ももの筋肉や、『第二の心臓』と言われるふくらはぎの筋肉が働かないため、代謝が低下して肥満や糖尿病のリスクを招くほか、血流が悪化し、高血圧の原因にもなるのです。<br><span class="detail_red">５分座っていると、血流速度は急速に下がり、30分座り続けると、血流速度は70％も低下するという実験結果もある。</span><br>肥満、糖尿病、高血圧が重なると、メタボリックシンドロームの危機が訪れます。メタボ状態になるとその先には当然、心臓病や脳卒中、がんのリスクも見えてくる…というわけです。なお、「座りすぎ」に深く関わるがんとして挙げられるのは、主に「大腸がん・乳がん」だそう。<br>さらに、座りすぎが子どもの認知の発達や、老年層の認知症に影響を及ぼすため、学力や認知機能の低下、メンタルヘルスにも悪影響を与える要因となります。</p>
      </div>
      <p @click="openShow4" class="body">座りすぎは<span class="red">がん死亡リスクを約20%も高める</span><font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
      <div v-show="show4">
        <p class="detail">アメリカで行われた10万人弱を12年間追跡した研究では、座っている時間とがんの関係も明らかに。<br>総座位時間が1日4時間未満に比べて、8～11時間の人は、がんでの死亡リスクが約20％高くなります。<br>また、女性が気になる乳がんの罹患リスクに関する研究では、仕事での座位行動が大きく影響するとわかってきています。</p>
        <p class="detail">仕事中座っている時間が２時間未満の男性は、６～８時間の男性に比べて結腸がんのリスクが37％低いというオランダでの疫学研究の報告もある。</p>
      </div>
      <p @click="openShow5" class="body">座っている時間が1日11時間以上の人は1日4時間未満の人より<span class="red">死亡リスクが40%高まる</span><font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
      <div v-show="show5">
        <p class="detail">オーストラリアの研究機関が22万2,497人を3年近く追跡し、『1日に座る時間と死亡リスク』を検証。<br>その結果、座る時間が4時間未満と比べて、8～11時間の人は15％、11時間以上の人は40％も総死亡の割合が高くなると判明。</p>
        <p class="detail">45～74歳の日本人男女8万3000人を9年近く追跡した研究において、<span class="detail_red">日頃から適度な運動をしていたとしても、座る時間が長い生活を送っていると死亡リスクが高くなる</span>ことが分かりました。特に男性において、座る時間が1日3時間未満の人たちと比べて8時間以上だった人たちは総死亡リスクが20％近く高かったのです。</p>
      </div>
      <p @click="openShow6" class="body open-body"><span class="number">3.</span><span class="red">身体活動不足</span><font-awesome-icon :icon="['fas', 'chevron-down']" style="color: #D9D9D9;" class="open-icon" /></p>
      <div v-show="show6">
        <p class="detail">「座りすぎ」の問題は、近年、世界的に蔓延している「身体活動不足」と密接に関わっているようです。<br>「身体活動不足」とは、労働・家事・通勤といった日常生活に伴う軽い運動など、安静にしている状態よりも多くのエネルギーを消費するすべての動作（いわゆる「身体活動」）が、充分に行われていない状態。<br>なんとそれは、<span class="detail_red">全世界で死亡原因の4位、日本では3位と報告されるほど深刻化しています</span>。</p>
      </div>
        <p class="reference">※ 座りすぎ研究の第一人者、早稲田大学スポーツ科学学術院教授 岡 浩一朗先生の記事参照</p>
      </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        show: false,
        show1: false,
        show2: false,
        show3: false,
        show4: false,
        show5: false,
        show6: false,
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
      openShow1 () {
        this.show1 = !this.show1
      },
      openShow2 () {
        this.show2 = !this.show2
      },
      openShow3 () {
        this.show3 = !this.show3
      },
      openShow4 () {
        this.show4 = !this.show4
      },
      openShow5 () {
        this.show5 = !this.show5
      },
      openShow6 () {
        this.show6 = !this.show6
      },
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
    margin-top: 30px;
    border-bottom: 1px solid rgba(207, 207, 207, 0.51);
    cursor: pointer;
  }
  span.red {
    color: #CB0101;
  }
  p.reference {
    margin-top: 10px;
    margin-left: 260px;
    color: #BFBFBF;
    font-size: 12px;
  }
  .open-icon {
    padding-left: 20px;
    font-size: 11px;
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
    padding: 10px 40px 30px 40px;
    margin-top: 5px;
    border: 2px solid #FFFFFF;
    max-height: 590px;
    overflow: auto;
  }
  .modal_close_btn {
    margin-left: 750px;
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