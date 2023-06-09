<template>
  <div v-show="show">
    <AppTitle />
  </div>
  <div v-show="!show">
    <div class="navbar">
      <div @click="openLoginformModal" class="login-link">LogIn</div>
      <div @click="openSignupformModal" class="signup-link">SignUp</div>
    </div>
    <SubTitle />
    <ToIntroduce />
    <LoginformModal ref="loginformModal" @changeSignupformModal="changeSignupformModal" />
    <SignupformModal ref="signupformModal" @changLoginformModal="changLoginformModal" />
    <FooterLink />
  </div>
</template>

<script>
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
    background-color: #000000;
    position: fixed;
    top: 30px;
    left: 1200px;
  }
  .login-link {
    margin-right: 30px;
    cursor: pointer;
  }
  .signup-link {
    cursor: pointer;
  }
</style>