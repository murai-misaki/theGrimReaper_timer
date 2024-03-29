<template>
  <div class="container">
    <div class="group">
      <div class="account-navbar">
        <button class="now">プロフィール</button>
        <button @click="showAccountPassword">パスワード</button>
        <button @click="showAccountNotification">タイマー通知方法</button>
      </div>
      <div class="profile">
        <h1 class="neontext">Profile</h1>
        <form @submit.prevent="updateProfile">
          <p class="input-text">ユーザー名</p>
          <input type="text" required placeholder="ユーザー名" v-model="name">
          <p class="input-text">メールアドレス</p>
          <input type="email" required placeholder="メールアドレス" v-model="email">
          <p class="input-text">チャット・ランキング機能のプライバシー設定</p>
          <div class="checkbox-group">
            <input id="checkbox" class="checkbox" type="checkbox" v-model="privacy">
            <label for="checkbox">自分の座りすぎで縮んだ寿命・身体活動量を非公開にする</label>
          </div>
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
          <p>プロフィールを更新しました。</p>
        </div>
        <div class="line"></div>
        <p @click="showAccountDelete" class="account-delete" >アカウントを削除される場合はこちら</p>
      </div>
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
        name: window.localStorage.getItem('name'),
        email: window.localStorage.getItem('uid'),
        privacy: window.localStorage.getItem('privacy'),
        error: null,
        flashMessage: false
      }
    },
    methods: {
      async updateProfile () {
        this.$emit('showLoading')
        this.error = null
        try {
          const res = await axios.patch(process.env.VUE_APP_API_URL + '/auth', {
            name: this.name,
            email: this.email,
            privacy: this.privacy
            },
            {
              headers: {
                uid: window.localStorage.getItem('uid'),
                "access-token": window.localStorage.getItem('access-token'),
                client: window.localStorage.getItem('client')
              }
            })

          if (!res) {
            throw new Error('プロフィールを更新できませんでした')
          }

          if (!this.error) {
            this.$emit('endLoading')
            setItem(res.headers, res.data.data.guest, res.data.data.name, res.data.data.privacy)
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
            this.error = 'プロフィールを更新できませんでした'
          }
        }
      },
      showFlashMessage () {
        this.flashMessage = true
      },
      closeFlashMessage () {
        this.flashMessage = false
      },
      showAccountPassword () {
        this.$emit('showAccountPassword')
      },
      showAccountNotification () {
        this.$emit('showAccountNotification')
      },
      showAccountDelete () {
        this.$emit('showAccountDelete')
      }
    }
  }
</script>

<style scoped>
  .group {
    display: flex;
  }
  .profile {
    border: 1px solid #D9D9D9;
    margin-left: 50px;
    padding: 20px 110px;
    margin-top: -80px;
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
  .line {
    border-top: 1px solid rgba(207, 207, 207, 0.51);
    margin: 50px auto;
    width: 393px;
  }
  p.account-delete {
    text-align: center;
    font-size: 14px;
    margin-top: -30px;
    color: #BFBFBF;
  }
  p.account-delete:hover {
    color: #D9D9D9;
    cursor: pointer;
    border-bottom: 1px solid #D9D9D9;
    width: 250px;
    margin: 13px auto;
    margin-top: -30px;
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
    margin: -20px auto;
    text-align: center;
    font-size: 14px;
  }
  .loading-space {
    margin-top: 40px;
  }

  .checkbox-group {
    display: flex;
    margin-bottom: 30px;
  }
  label {
    font-size: 13px;
    margin-left: -310px;
  }
  input[type="checkbox"] {
    margin: 0;
    padding: 0;
    background: none;
    border: none;
    border-radius: 0;
    outline: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
  }
  /* チェックボックスデザイン */
  input[type="checkbox"] {
    cursor: pointer;
    padding-left: 30px;/*label手前にチェックボックス用の余白を開ける*/
    vertical-align: middle;
    position: relative;
  }
 
  input[type="checkbox"]::before,
  input[type="checkbox"]::after {
    content: "";
    display: block; 
    position: absolute;
  }
 
  input[type="checkbox"]::before {
    background-color: #000000;
    border-radius: 0%;
    border: 1px solid #D9D9D9;
    width: 20px;/*チェックボックスの横幅*/
    height: 20px;/*チェックボックスの縦幅*/
    transform: translateY(-50%);
    top: 50%;
    left: 5px;
  }
 
  input[type="checkbox"]::after {
    border-bottom: 3px solid #D9D9D9;/*チェックの太さ*/
    border-left: 3px solid #D9D9D9;/*チェックの太さ*/
    opacity: 0;/*チェック前は非表示*/
    height: 6px;/*チェックの高さ*/
    width: 11px;/*チェックの横幅*/
    transform: rotate(-45deg);
    top: 3px;/*チェック時の位置調整*/
    left: 10px;/*チェック時の位置調整*/
  }
 
  input[type="checkbox"]:checked::after {
    opacity: 1;/*チェック後表示*/
  }
  
</style>