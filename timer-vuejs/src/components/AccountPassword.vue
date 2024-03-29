<template>
  <div class="container">
    <div class="group">
      <div class="account-navbar">
        <button @click="showAccountProfile">プロフィール</button>
        <button class="now">パスワード</button>
        <button @click="showAccountNotification">タイマー通知方法</button>
      </div>
      <div class="password">
        <h1 class="neontext">Password</h1>
        <form @submit.prevent="updatePassword">
          <p class="input-text">新しいパスワード</p>
          <input type="password" required placeholder="パスワード(6文字以上)" v-model="password">
          <p class="input-text">新しいパスワードの確認</p>
          <input type="password" required placeholder="パスワード（確認用）" v-model="passwordConfirmation">
          <div v-show="!loading">
            <button class="form-button">更新</button>
          </div>
          <div class="error">{{ error }}</div>
          <div v-show="loading" class="loading-space">
            <div class="loading-block">
              <div class="loading-circle"></div>
              <div class="loading-circle"></div>
              <div class="loading-circle"></div>
            </div>
          </div>
        </form>
        <div v-show="flashMessage" class="flash_message">
          <p>パスワードを更新しました。</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    props: ['loading'],
    
    data () {
      return {
        password: '',
        passwordConfirmation: '',
        error: null,
        flashMessage: false
      }
    },
    methods: {
      async updatePassword () {
        this.$emit('showLoading')
        this.error = null
        try {
          const res = await axios.patch(process.env.VUE_APP_API_URL + '/auth', {
            password: this.password,
            password_confirmation: this.passwordConfirmation,
            },
            {
              headers: {
                uid: window.localStorage.getItem('uid'),
                "access-token": window.localStorage.getItem('access-token'),
                client: window.localStorage.getItem('client')
              }
            })

          if (!res) {
            throw new Error('パスワードを更新できませんでした')
          }

          if (!this.error) {
            this.$emit('endLoading')
            this.formClear()
            this.showFlashMessage()
            setTimeout(this.closeFlashMessage, 3000);
          }
        
          return res
        } catch (error) { // もしtryの中の処理でエラーが発生した場合はcatch内の処理が実行される
          this.$emit('endLoading')
          console.log({ error })
          if (error.response.data.errors.full_messages[0]) {
            this.error = error.response.data.errors.full_messages[0]
          } else {
            this.error = 'パスワードを更新できませんでした'
          }
        }
      },
      formClear () {
        this.password = ''
        this.passwordConfirmation = ''
      },
      showFlashMessage () {
        this.flashMessage = true
      },
      closeFlashMessage () {
        this.flashMessage = false
      },
      showAccountProfile () {
        this.$emit('showAccountProfile')
      },
      showAccountNotification () {
        this.$emit('showAccountNotification')
      }
    }
  }
</script>

<style scoped>
  .group {
    display: flex;
  }
  .password {
    border: 1px solid #D9D9D9;
    margin-left: 50px;
    padding: 30px 110px;
    margin-top: -20px;
    margin-bottom: 30px;
  }
  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    text-align: center;
  }
  p.input-text {
    color: #BFBFBF;
    font-size: 15px;
    margin-top: 30px;
  }
  input {
    border: 1px solid #D9D9D9;
    display: block;
    margin: 0 auto;
    padding: 12px 20px;
    width: 350px;
    background-color: #000000;
    color: #D9D9D9;
  }
  .form-button {
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
  .form-button:hover {
    color: #FFFFFF;
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

  .error {
    color: #CB0101;
    font-size: 13px;
    text-align: center;
  }

  .flash_message p {
    border: 1px solid #BFBFBF;
    background: rgba(217, 217, 217, 0.2);
    width: 300px;
    margin: 0 auto;
    text-align: center;
    font-size: 14px;
  }
  .loading-space {
    margin-top: 40px;
  }
</style>