<template>
  <div v-show="show">
    <ForgotPassword @showPasswordResetSent="showPasswordResetSent" />
  </div>
  <div v-show="!show">
    <PasswordResetSent />
  </div>
  <FooterLink />
</template>

<script>
  import ForgotPassword from '../components/ForgotPassword.vue'
  import PasswordResetSent from '../components/PasswordResetSent.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { ForgotPassword, PasswordResetSent, FooterLink },

    data () {
      return {
        show: true
      }
    },
    methods: {
      showPasswordResetSent () {
        this.show = false
      }
    }
  }
</script>

<style scoped>
</style>