<template>
  <SingupRecommend @showChangeToLoginuser="showChangeToLoginuser" @openChangeToLoginuserModal="openChangeToLoginuserModal" />
  <ChangeToLoginuserModal ref="changeToLoginuserModal" />
  <div class="footer">
    <FooterLink />
  </div>
</template>

<script>
  import SingupRecommend from '../components/SingupRecommend.vue'
  import ChangeToLoginuserModal from '../components/ChangeToLoginuserModal.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { SingupRecommend, ChangeToLoginuserModal, FooterLink },

    data () {
      return {
      }
    },
    methods: {
      openChangeToLoginuserModal () {
        this.$refs.changeToLoginuserModal.open()
      }
    }
  }
</script>

<style scoped>
  .footer {
    margin-top: 80px;
  }
</style>