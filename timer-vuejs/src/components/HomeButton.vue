<template>
  <div v-show="!loading" @click="redirectToMyPage">
    <font-awesome-icon :icon="['fas', 'house']" style="color: #D9D9D9;" class="home-icon" />
  </div>
  <div v-show="loading">
    <div class="loading-block-home">
      <div class="loading-circle-home"></div>
      <div class="loading-circle-home"></div>
      <div class="loading-circle-home"></div>
    </div>
  </div>
  <p class="home-text">MyPage Top</p>
</template>

<script>
  export default {
    data () {
      return {
        loading: false
      }
    },
    methods: {
      redirectToMyPage () {
        this.showLoading()
        this.$router.push({ name: 'Mypage' })
      },
      showLoading () {
        this.loading = true
      },
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  .home-icon {
    float: right;
    margin-top: -90px;
    font-size: 30px;
    margin-right: 70px;
    border: solid 1px #D9D9D9;
    border-radius: 50%;
    padding: 8px;
    width: 29px;
    cursor: pointer;
 }
  .home-icon:hover {
    background: rgba(217, 217, 217, 0.2);
  }
  .home-text {
    font-family: 'IM Fell English SC', serif;
    margin-top: -40px;
    margin-right: 50px;
    float: right;
  }
  .loading-block-home {
    display: flex;
    justify-content: space-between;
    margin-top: -13px;
    margin-left: 43px;
    border: solid 1px #D9D9D9;
    border-radius: 50%;
    padding: 18px 8px;
    width: 29px;
    float: right;
    margin-top: -90px;
    margin-right: 70px;
  }
  .loading-circle-home {
    width: 10px;
    height: 10px;
    background-color: #ffffff;
    border-radius: 50%;
    animation: loading 1s infinite;
    &:nth-child(2) {
    animation-delay: 0.1s;
    }
    &:nth-child(3) {
      animation-delay: 0.2s;
    }
  }
  @keyframes loading {
    0% {
      transform: scale(0.1);
    }
    100% {
      transform: scale(1);
    }
  }
</style>