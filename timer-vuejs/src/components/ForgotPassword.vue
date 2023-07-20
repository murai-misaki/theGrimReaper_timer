<template>
  <div class="border">
    <h2>パスワードを忘れた場合</h2>
    <p>ご登録いただいたメールアドレスを入力してください。</p>
    <p>メールアドレス宛に、パスワード再設定ページのURLが記載されたメールを送信します。</p>
    <form @submit.prevent="send">
      <input type="email" required placeholder="メールアドレス" v-model="email">
      <div v-show="!loading">
        <button>送信</button>
      </div>
      <div v-show="loading">
        <div class="loading-block">
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data () {
      return {
        loading: false,
        email: ''
      }
    },
    methods: {
      async send() {
        this.showLoading()
        try {
          const res = await axios.post(process.env.VUE_APP_API_URL + '/auth/password', {
            email: this.email,
            redirect_url: process.env.VUE_APP_WEB_URL + '/passwordreset'
            }
          )
          if (!res) {
            throw new Error('メールを送信できませんでした')
          }
          this.endLoading()
          this.$emit('showPasswordResetSent')
        } catch (error) {
          this.endLoading()
          this.$emit('showPasswordResetSent')
        }
      },
      showLoading () {
        this.loading = true
      },
      endLoading () {
        this.loading = false
      }
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
  form {
    margin-top: 60px;
    margin-bottom: 60px;
  }
  input {
    border: 1px solid #D9D9D9;
    display: block;
    margin: 40px auto;
    padding: 12px 20px;
    width: 350px;
    background-color: #000000;
    color: #D9D9D9;
  }
  button {
    font-size: 15px;
    width: 393px;
    margin: 40px auto;
    padding: 6px 0px;
    border: 1px solid #D9D9D9;
    color: #BFBFBF;
    background: rgba(143, 11, 11, 0.7);
    cursor: pointer;
    display: block;
  }
  button:hover {
    color: #FFFFFF;
  }
</style>