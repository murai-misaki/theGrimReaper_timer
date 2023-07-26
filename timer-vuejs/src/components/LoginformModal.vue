<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">LogIN</h1>
      <form @submit.prevent="login">
        <input type="email" required placeholder="メールアドレス" v-model="email">
        <input type="password" required placeholder="パスワード" v-model="password">
        <div v-show="!loading">
          <button>ログイン</button>
        </div>
        <div v-show="loading">
          <div class="loading-block">
            <div class="loading-circle"></div>
            <div class="loading-circle"></div>
            <div class="loading-circle"></div>
          </div>
        </div>
        <div class="error">{{ error }}</div>
        <p @click="redirectToForgotPasswordPage" class="password-forget">パスワードをお忘れですか？</p>
        <div class="line"></div>
        <p @click="changeSignupformModal" class="signup">アカウントをお持ちでないですか？<span>アカウントを作成(無料)</span></p>
      </form>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import setItem from '../auth/setItem'

  export default {
    props: ['loading'],

    data () {
      return {
        show: false,
        email: '',
        password: '',
        error: null
      }
    },
    methods: {
      open () {
        this.show = true
        window.scrollTo(0, 0);
      },
      close () {
        this.show = false
      },
      changeSignupformModal () {
        this.$emit('changeSignupformModal')
      },
      async login() {
        this.$emit('showLoading')
        this.error = null
        try {
          const res = await axios.post(process.env.VUE_APP_API_URL + '/auth/sign_in', {
            email: this.email,
            password: this.password,
            }
          )
        if (!res) {
          throw new Error('メールアドレスもしくはパスワードが違います')
        }

        if (!this.error) {
          setItem(res.headers, res.data.data.guest, res.data.data.name)
          this.$router.push({ name: 'Mypage' })
        }
        return res
        } catch (error) {
          console.log({ error })
          this.$emit('endLoading')
          this.error = 'メールアドレスもしくはパスワードが違います。'
        }
      },
      redirectToForgotPasswordPage () {
        this.$router.push({ name: 'Forgotpassword' })
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
    height: 4320px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 430px;
    height: 520px;
    transform: translate(-50%,-50%);
    padding: 10px 50px 70px 50px;
    margin-top: 30px;
    border: 2px solid #FFFFFF;
  }
  .modal_close_btn {
    margin-left: 450px;
    cursor: pointer;
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

  form {
    margin-top: 60px;
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
    margin-left: 19px;
    padding: 6px 0px;
    border: 2px solid #D9D9D9;
    border-radius: 0;
    color: #BFBFBF;
    background: rgba(217, 217, 217, 0.2);
    cursor: pointer;
  }
  button:hover {
    color: #FFFFFF;
  }

  p.password-forget {
    text-align: center;
    font-size: 14px;
    margin-top: 50px;
    color: #BFBFBF;
  }
  p.password-forget:hover {
    color: #D9D9D9;
    cursor: pointer;
    border-bottom: 1px solid #D9D9D9;
    width: 200px;
    margin: 0 auto;
    margin-top: 50px;
  }
  .line {
    border-top: 1px solid rgba(207, 207, 207, 0.51);
    margin: 40px auto;
    width: 393px;
  }

  p.signup {
    text-align: center;
    font-size: 13px;
    margin-top: 40px;
    color: #BFBFBF;
  }
  .signup span {
    margin-left: 20px;
  }
  .signup span:hover {
    color: #D9D9D9;
    cursor: pointer;
    border-bottom: 1px solid #D9D9D9;
    width: 200px;
    margin-left: 20px;
    margin-top: 40px;
  }

  .error {
    color: #CB0101;
    font-size: 13px;
    text-align: center;
    margin-top: 20px;
  }
</style>