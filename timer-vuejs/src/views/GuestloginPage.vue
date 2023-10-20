<template>
  <SingupRecommend @showChangeToLoginuser="showChangeToLoginuser" @openChangeToLoginuserModal="openChangeToLoginuserModal" :loading="loading" @showLoading="showLoading" />
  <ChangeToLoginuserModal ref="changeToLoginuserModal" :loading="loading" @showLoading="showLoading" @endLoading="endLoading" />
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
        loading: false
      }
    },
    mounted () {
      document.body.style.overflow = 'auto';
    },
    methods: {
      openChangeToLoginuserModal () {
        this.$refs.changeToLoginuserModal.open()
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
  .footer {
    margin-top: 80px;
  }
</style>