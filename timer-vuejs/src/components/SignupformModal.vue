<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">SignUp</h1>
      <form @submit.prevent="signUp">
        <input type="text" required placeholder="ユーザー名" v-model="name">
        <input type="email" required placeholder="メールアドレス" v-model="email">
        <input type="password" required placeholder="パスワード" v-model="password">
        <input type="password" required placeholder="パスワード（確認用）" v-model="passwordConfirmation">
        <button>新規登録</button>
        <div class="error">{{ errorMessage }}</div>
        <div class="line"></div>
        <p>すでにアカウントをお持ちですか？<span @click="changLoginformModal">ログイン</span></p>
    </form>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import setItem from '../auth/setItem'

  export default {
    data () {
      return {
        show: false,
        name: '',
        email: '',
        password: '',
        passwordConfirmation: '',
        error: null,
        errorMessage: null,
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
      changLoginformModal () {
        this.$emit('changLoginformModal')
      },
      async signUp () {
        this.error = null
        this.errorMessage = null
        try {
          const res = await axios.post('http://localhost:3000/auth', {
            name: this.name,
            email: this.email,
            password: this.password,
            password_confirmation: this.passwordConfirmation
            }
          )

          if (!res) {
            throw new Error('アカウントを登録できませんでした')
          }

          if (!this.error) {
            setItem(res.headers, res.data.data.guest)
            this.$router.push({ name: 'Notification' })
          }
        
          console.log({ res })

        } catch (error) { // もしtryの中の処理でエラーが発生した場合はcatch内の処理が実行される
          console.log({ error })
          this.error = error.response.data.errors.full_messages[0]
          if (this.error === "Password confirmation doesn't match Password") {
            this.errorMessage = 'パスワードの確認がパスワードと一致しません'
          } else if (this.error === "Password is too short (minimum is 6 characters)") {
            this.errorMessage = 'パスワードが短すぎます(最低6文字)'
          } else if (this.error === "Name is too long (maximum is 10 characters)") {
            this.errorMessage = '名前が長すぎます (最大 10 文字)'
          } else if (this.error === "Email has already been taken") {
            this.errorMessage = 'メールアドレスは、すでに使われています'
          } else {
            this.errorMessage = 'アカウントを登録できませんでした'
          }
        }
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
    height: 550px;
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
    margin-top: 40px;
  }
  input {
    border: 1px solid #D9D9D9;
    display: block;
    margin: 30px auto;
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

  .line {
    border-top: 1px solid rgba(207, 207, 207, 0.51);
    margin: 45px auto;
    width: 393px;
  }

  p {
    text-align: center;
    font-size: 13px;
    color: #BFBFBF;
    margin-top: -10px;
  }
  span {
    margin-left: 20px;
  }
  span:hover {
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