<template>
  <div class="accountpage-top-space"></div>
  <HomeButton />
  <div v-show="show == 'profile'">
    <AccountProfile :loading="loading" @showLoading="showLoading" @endLoading="endLoading" @showAccountPassword="showAccountPassword" @showAccountNotification="showAccountNotification" @showAccountDelete="showAccountDelete" />
  </div>
  <div v-show="show == 'password'">
    <AccountPassword :loading="loading" @showLoading="showLoading" @endLoading="endLoading" @showAccountProfile="showAccountProfile" @showAccountNotification="showAccountNotification" />
  </div>
  <div v-show="show == 'notification'">
    <AccountNotification :loading="loading" @showLoading="showLoading" @endLoading="endLoading" @showAccountProfile="showAccountProfile" @showAccountPassword="showAccountPassword" />
  </div>
  <div v-show="show == 'delete'">
    <AccountDelete />
  </div>
  <FooterLink />
</template>

<script>
  import HomeButton from '../components/HomeButton.vue'
  import AccountProfile from '../components/AccountProfile.vue'
  import AccountPassword from '../components/AccountPassword.vue'
  import AccountNotification from '../components/AccountNotification.vue'
  import AccountDelete from '../components/AccountDelete.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { HomeButton, AccountProfile, AccountPassword, AccountNotification, AccountDelete, FooterLink },

    data () {
      return {
        loading: false,
        show: 'profile'
      }
    },
    mounted () {
      window.scrollTo(0, 0);
    },
    methods: {
      showLoading () {
        this.loading = true
      },
      endLoading () {
        this.loading = false
      },
      showAccountProfile () {
        this.show = 'profile'
      },
      showAccountPassword () {
        this.show = 'password'
      },
      showAccountNotification () {
        this.show = 'notification'
      },
      showAccountDelete () {
        this.show = 'delete'
      }
    }
  }
</script>

<style>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  div.accountpage-top-space {
    margin-top: 120px;
  }
  .account-navbar button {
    border: 1px solid #D9D9D9;
    padding: 15px 50px;
    margin-bottom: 20px;
    width: 210px;
    color: #BFBFBF;
    background: #000000;
    cursor: pointer;
    display: block;
  }
  .account-navbar button:hover {
    background: rgba(217, 217, 217, 0.2);
    color: #D9D9D9;
  }
  .account-navbar button.now {
    background: rgba(217, 217, 217, 0.2);
    color: #D9D9D9;
  }
</style>