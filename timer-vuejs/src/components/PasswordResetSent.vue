<template>
  <div class="border">
    <h2>メール送信完了</h2>
    <p>パスワード再設定用のURLをご入力のメールアドレスに送信しました。</p>
    <p>記載された内容に従って、パスワードの再設定を行なってください。</p>
    <div class="line"></div>
    <p>メールが届かない場合は以下の場合が考えられます</p>
    <ul>
      <li>迷惑メールフォルダに入ってしまっている場合</li>
      <li>メールアドレスが間違っている場合</li>
      <li>メールアドレスが登録されていない場合</li>
    </ul>
  </div>
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  div.border {
    margin: 50px auto;
    width: 900px;
    border: 1px solid #B4B4B4;
  }
  h2 {
    font-family: 'IM Fell English SC', serif;
    text-align: center;
    margin: 50px auto;
    border-bottom: 1px solid #B4B4B4;
    width: 500px;
  }
  p {
    text-align: center;
  }
  .line {
    border-top: 1px solid #525151;
    margin: 0 auto;
    width: 500px;
    margin-top: 40px;
    margin-bottom: 30px;
  }
  ul {
    margin-left: 250px;
    margin-bottom: 50px;
  }
</style>