<template>
  <div class="border">
    <h2>プライバシーポリシー</h2>
    <div class="line"></div>
    <p><span>the Grim Reaper Timer</span> 運営（以下，「当方」といいます。）は，本ウェブサイト上で提供するサービス（以下,「本サービス」といいます。）における，ユーザーの個人情報の取扱いについて，以下のとおりプライバシーポリシー（以下，「本ポリシー」といいます。）を定めます。</p>
    <div class="content">
      <h3>第1条（お客様から取得する情報）</h3>
      当方は、お客様から以下の情報を取得します。
      <ol>
        <li>メールアドレス</li>
        <li>システムによって生成された一意の識別情報</li>
        <li>本ウェブサイトの滞在時間、入力履歴等の本ウェブサイトにおけるお客様の行動履歴</li>
      </ol>
    </div>
    <div class="content">
      <h3>第2条（お客様の情報を利用する目的）</h3>
      当方がお客様から取得した情報を利用する目的は，以下のとおりです。
      <ol>
        <li>本サービスに関する登録の受付、お客様の本人確認、認証のため</li>
        <li>お客様の本サービスの利用履歴を管理するため</li>
        <li>本サービスにおけるお客様の行動履歴を分析し、本サービスの維持改善に役立てるため</li>
        <li>お客様からのお問い合わせに対応するため</li>
        <li>本サービスの利用規約や法令に違反する行為に対応するため</li>
        <li>本サービスの変更、提供中止、終了、契約解除をご連絡するため</li>
        <li>本サービス規約の変更等を通知するため</li>
        <li>以上の他、管理者サービスの提供、維持、保護及び改善のため</li>
      </ol>
    </div>
    <div class="content">
      <h3>第3条（利用目的の変更）</h3>
      <ol>
        <li>当社は，利用目的が変更前と関連性を有すると合理的に認められる場合に限り，個人情報の利用目的を変更するものとします。</li>
        <li>利用目的の変更を行った場合には，変更後の目的について，当社所定の方法により，ユーザーに通知し，または本ウェブサイト上に公表するものとします。</li>
      </ol>
    </div>
    <div class="content">
      <h3>第4条（第三者提供）</h3>
      <ol>
        <li class="only">お客様からお預かりした個人情報を、個人情報保護法その他の法令に基づき開示が認められる場合を除き、お客様ご本人の同意を得ずに第三者に提供することはありません。</li>
      </ol>
    </div>
    <div class="content">
      <h3>第5条（アクセス解析ツール）</h3>
      <ol>
        <li class="only">当方は、お客様のアクセス解析のために、「Googleアナリティクス」を利用しています。Googleアナリティクスは、トラフィックデータの収集のためにCookieを使用しています。トラフィックデータは匿名で収集されており、個人を特定するものではありません。Cookieを無効にすれば、これらの情報の収集を拒否することができます。詳しくはお使いのブラウザの設定をご確認ください。Googleアナリティクスについて、詳しくは以下からご確認ください。</li>
        <li class="only link" @click="gotoGoogleanalyticsTerms">Googleアナリティクス利用規約</li>
      </ol>
    </div>
    <div class="content">
      <h3>第6条（プライバシーポリシーの変更）</h3>
      <ol>
        <li>本ポリシーの内容は，法令その他本ポリシーに別段の定めのある事項を除いて，ユーザーに通知することなく，変更することができるものとします。</li>
        <li>当方が別途定める場合を除いて，変更後のプライバシーポリシーは，本ウェブサイトに掲載したときから効力を生じるものとします。</li>
      </ol>
    </div>
    <div class="content">
      <h3>第7条（お問い合わせ窓口）</h3>
      <ol>
        <li class="only">本ポリシーに関するお問い合わせは，「運営元」までお願いいたします。</li>
      </ol>
    </div>
    <p class="end">以上</p>
  </div>
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    mounted () {
      window.scrollTo(0, 0);
    },
    methods: {
      gotoGoogleanalyticsTerms () {
        window.open('https://marketingplatform.google.com/about/analytics/terms/jp/', '_blank');
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  div.border {
    margin: 0 auto;
    width: 1100px;
  }
  h2 {
    font-family: 'IM Fell English SC', serif;
    text-align: center;
    margin: 0 auto;
    border-bottom: 1px solid #D9D9D9;
    width: 500px;
    margin-top: 70px;
    margin-bottom: 50px;
  }
  span {
    font-family: 'IM Fell English SC', serif;
  }
  .content {
    margin: 50px 0px;
  }
  p.end {
    text-align: right;
    margin-top: 50px;
    margin-bottom: 100px;
  }
  li.only {
    list-style: none;
  }
  li.link {
    margin-top: 20px;
    color: #BFBFBF;
    cursor: pointer;
  }
  li.link:hover {
    color: #D9D9D9;
    border-bottom: 1px solid #D9D9D9;
    width: 230px;
  }
</style>