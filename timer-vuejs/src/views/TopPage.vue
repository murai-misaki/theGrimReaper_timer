<template>
  <div v-show="show">
    <AppTitle />
  </div>
  <div v-show="!show">
    <div class="navbar">
      <div @click="openLoginformModal" class="login-link">LogIn</div>
      <div @click="openSignupformModal" class="signup-link">SignUp</div>
    </div>
    <SubTitle @guestSignUp="guestSignUp" :guestSignupError="guestSignupError" :loading="loading" />
    <ToIntroduce @guestSignUp="guestSignUp" :guestSignupError="guestSignupError" :loading="loading" />
    <LoginformModal ref="loginformModal" @changeSignupformModal="changeSignupformModal" :loading="loading" @showLoading="showLoading" @endLoading="endLoading" />
    <SignupformModal ref="signupformModal" @changLoginformModal="changLoginformModal" @createTotalShortenedLifespan="createTotalShortenedLifespan" :loading="loading" @showLoading="showLoading" @endLoading="endLoading" />
    <FooterLink />
  </div>
</template>

<script>
  import axios from 'axios'
  import setItem from '../auth/setItem'
  import AppTitle from '../components/AppTitle.vue'
  import SubTitle from '../components/SubTitle.vue'
  import ToIntroduce from '../components/ToIntroduce.vue'
  import LoginformModal from '../components/LoginformModal.vue'
  import SignupformModal from '../components/SignupformModal.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { AppTitle, SubTitle, ToIntroduce, LoginformModal, SignupformModal, FooterLink },

    data () {
      return {
        show: true,
        guestSignupError: null,
        loading: false
      }
    },
    mounted () {
      setTimeout(this.closeTitle, 2000);
    },
    methods: {
      closeTitle () {
        this.show = false
      },
      openLoginformModal () {
        this.$refs.loginformModal.open()
      },
      openSignupformModal () {
        this.$refs.signupformModal.open()
      },
      changLoginformModal () {
        this.$refs.signupformModal.close()
        this.$refs.loginformModal.open()
      },
      changeSignupformModal () {
        this.$refs.loginformModal.close()
        this.$refs.signupformModal.open()
      },
      async createTotalShortenedLifespan () {
        try {
          const res = await axios.post(process.env.VUE_APP_API_URL + `/total_shortened_lifespans`, {},
          {
            headers: {
              uid: window.localStorage.getItem('uid'),
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

          if (!res) {
            throw new Error('縮んだ寿命の合計時間を記録する機能の準備に失敗しました')
          }
        } catch (error) {
          console.log(error)
        }
      },
      async guestSignUp () {
        this.showLoading()
        this.guestSignupError = null
        try {
          // ユーザー登録のパラメータ情報をランダムに生成する
          const randomName = Math.random().toString(36).substring(2, 8);
          const randomEmail = randomName + '@example.com'
          const randomPassword = Math.random().toString(36).substring(2, 12);

          const res = await axios.post(process.env.VUE_APP_API_URL + '/auth', {
            name: randomName,
            email: randomEmail,
            password: randomPassword,
            password_confirmation: randomPassword,
            guest: true
            }
          )

          if (!res) {
            throw new Error('エラーが発生しました')
          }

          if (!this.guestSignupError) {
            setItem(res.headers, res.data.data.guest)
            this.createTotalShortenedLifespan()
            this.$router.push({ name: 'Notification' })
          }
        
          console.log({ res })

        } catch (error) {
          console.log({ error })
          this.endLoading()
          this.guestSignupError = 'エラーが発生しました'
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

  .navbar {
    font-family: 'IM Fell English SC', serif;
    display: flex;
    font-size: 30px;
    background-color: transparent;
    position: sticky;
    top: 30px;
    justify-content: flex-end;
    margin-right: 27px;
  }
  .login-link {
    margin-right: 30px;
    cursor: pointer;
    background-color: #000000;
  }
  .signup-link {
    cursor: pointer;
    background-color: #000000;
  }
</style>