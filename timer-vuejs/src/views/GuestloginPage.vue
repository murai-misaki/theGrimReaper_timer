<template>
  <div v-show="show">
    <SingupRecommend @showChangeToLoginuser="showChangeToLoginuser" />
  </div>
  <div v-show="!show">
    <ChangeToLoginuser />
  </div>
  <div class="footer">
    <FooterLink />
  </div>
</template>

<script>
  import SingupRecommend from '../components/SingupRecommend.vue'
  import ChangeToLoginuser from '../components/ChangeToLoginuser.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { SingupRecommend, ChangeToLoginuser, FooterLink },

    data () {
      return {
        show: true
      }
    },
    methods: {
      showChangeToLoginuser () {
        this.show = false
      }
    }
  }
</script>

<style scoped>
  .footer {
    margin-top: 80px;
  }
</style>