<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">SignUp</h1>
      <form @submit.prevent="userUpdate">
        <input type="text" required placeholder="ユーザー名" v-model="name">
        <input type="email" required placeholder="メールアドレス" v-model="email">
        <input type="password" required placeholder="パスワード" v-model="password">
        <input type="password" required placeholder="パスワード（確認用）" v-model="passwordConfirmation">
        <div v-show="!loading">
          <button>新規登録</button>
        </div>
        <div v-show="loading">
          <div class="loading-block">
            <div class="loading-circle"></div>
            <div class="loading-circle"></div>
            <div class="loading-circle"></div>
          </div>
        </div>
        <div class="error">{{ error }}</div>
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
        name: '',
        email: '',
        password: '',
        passwordConfirmation: '',
        error: null,
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
      async userUpdate () {
        this.$emit('showLoading')
        this.error = null
        try {
          const res = await axios.patch(process.env.VUE_APP_API_URL + '/auth', {
            name: this.name,
            email: this.email,
            password: this.password,
            password_confirmation: this.passwordConfirmation,
            guest: false
            },
            {
              headers: {
                uid: window.localStorage.getItem('uid'),
                "access-token": window.localStorage.getItem('access-token'),
                client: window.localStorage.getItem('client')
              }
            })

          if (!res) {
            throw new Error('アカウントを登録できませんでした')
          }

          if (!this.error) {
            setItem(res.headers, res.data.data.guest)
            this.$router.push({ name: 'Mypage' })
          }
        
          return res
        } catch (error) { // もしtryの中の処理でエラーが発生した場合はcatch内の処理が実行される
          this.$emit('endLoading')
          console.log({ error })
          if (error.response.data.errors.full_messages[0]) {
            this.error = error.response.data.errors.full_messages[0]
          } else {
            this.error = 'アカウントを登録できませんでした'
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
    height: 900px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 430px;
    height: 500px;
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
    margin: 35px auto;
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

  .error {
    color: #CB0101;
    font-size: 13px;
    text-align: center;
    margin-top: 20px;
  }
</style>