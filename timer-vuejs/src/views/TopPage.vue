<template>
  <div v-show="show">
    <AppTitle />
  </div>
  <div v-show="!show">
    <div class="navbar">
      <div class="login-link">LogIn</div>
      <div class="signup-link">SignUp</div>
    </div>
    <SubTitle />
    <ToIntroduce />
    <FooterLink />
  </div>
</template>

<script>
  import AppTitle from '../components/AppTitle.vue'
  import SubTitle from '../components/SubTitle.vue'
  import ToIntroduce from '../components/ToIntroduce.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { AppTitle, SubTitle, ToIntroduce, FooterLink },

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