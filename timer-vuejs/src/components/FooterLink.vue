<template>
  <div class="footer-line"></div>
  <footer class="footer">
  <div class="md-flex md-justify-between">
      <p><span>the Grim Reaper Timer</span><br>shinigami-timer.com 2023</p>
    <ul class="footer__navi flex">
      <li @click="redirectToTermsOfServicePage">利用規約</li>
      <li @click="redirectToPrivacyPolicyPage">プライバシーポリシー</li>
      <li @click="gotoTwitter">運営元</li>
    </ul>
  </div>
</footer>
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    methods: {
      redirectToTermsOfServicePage () {
        this.$router.push({ name: 'Termsofservice' })
      },
      redirectToPrivacyPolicyPage () {
        this.$router.push({ name: 'Privacypolicy' })
      },
      gotoTwitter () {
        window.open('https://twitter.com/mi_web_engineer/', '_blank');
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  span {
    font-family: 'IM Fell English SC', serif;
    color: #D9D9D9;
    font-size: 26px;
  }
  p {
    margin-left: 15px;
  }
  .footer-line {
    border-top: 1px solid #525151;
  }
  ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

li {
  padding-top: 25px;
  padding-right: 25px;
  color: #9ca3af;
  text-decoration: none;
  cursor: pointer;
}

li:hover {
  color: #fff;
}

.flex {
  display: flex;
}

.footer {
  padding: 2rem;
  font-size: 15px;
  color: #9ca3af;
}

.footer__navi {
  flex-wrap: wrap;
}

.footer__navi li {
  display: inline-block;
}

.footer__navi li:not(:last-child) {
  margin-right: 16px;
}

.footer__logo {
  display: inline-block;
}

@media (min-width: 768px) {
  .md-flex {
    display: flex;
  }

  .md-justify-between {
    justify-content: space-between;
  }
}
</style>