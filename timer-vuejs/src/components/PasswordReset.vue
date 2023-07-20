<template>
  <div class="border">
    <h2>パスワード再設定</h2>
    <p>新しいパスワードを入力してください。</p>
    <form @submit.prevent="reset">
      <input type="password" required placeholder="パスワード(6文字以上)" v-model="password">
      <input type="password" required placeholder="パスワード（確認用）" v-model="passwordConfirmation">
      <div v-show="!loading">
        <button>パスワード再設定</button>
      </div>
      <div class="error">{{ error }}</div>
      <div v-show="loading">
        <div class="loading-block">
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
          <div class="loading-circle"></div>
        </div>
      </div>
      <div class="line"></div>
      <p class="small">パスワード再設定が完了すると、自動的にトップページが表示されます。<br>新しいパスワードを使用してログインしてください。</p>
    </form>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data () {
      return {
        loading: false,
        password: '',
        passwordConfirmation: '',
        resetPasswordToken: null,
        accessToken: null,
        client: null,
        uid: null,
        error: null,
      }
    },
    mounted () {
      const searchParams = new URLSearchParams(window.location.search);
      this.resetPasswordToken = searchParams.get("token");
      this.accessToken = searchParams.get("access-token");
      this.client = searchParams.get("client");
      this.uid = searchParams.get("uid");
    },
    methods: {
      async reset () {
        this.showLoading()
        this.error = null
        try {
          const res = await axios.patch(process.env.VUE_APP_API_URL + '/auth/password', {
            password: this.password,
            password_confirmation: this.passwordConfirmation,
            reset_password_token: this.resetPasswordToken
            },
            {
            headers: {
              uid: this.uid,
              "access-token": this.accessToken,
              client: this.client
            }
          })

          if (!res) {
            throw new Error('パスワードを再設定できませんでした')
          }

          if (!this.error) {
            this.$router.push({ name: 'Top' })
          }

        } catch (error) {
          this.endLoading()
          console.log({ error })
          if (error.response.data.errors.full_messages[0]) {
            this.error = error.response.data.errors.full_messages[0]
          } else {
            this.error = 'パスワードを再設定できませんでした'
          }
        }
      },
      showLoading () {
        this.loading = true
      },
      endLoading () {
        this.loading = false
      },
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
    margin: 40px auto;
    border-bottom: 1px solid #B4B4B4;
    width: 500px;
  }
  p {
    text-align: center;
  }
  p.small {
    font-size: 14px;
  }
  form {
    margin-top: 40px;
    margin-bottom: 50px;
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
  .error {
    color: #CB0101;
    font-size: 13px;
    text-align: center;
  }
  .line {
    border-top: 1px solid #525151;
    margin: 0 auto;
    width: 500px;
    margin-top: 40px;
    margin-bottom: 30px;
  }
</style>