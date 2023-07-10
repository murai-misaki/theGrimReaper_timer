<template>
  <div @click="redirectToMyPage">
    <font-awesome-icon :icon="['fas', 'house']" style="color: #D9D9D9;" class="home-icon" />
  </div>
  <p class="home-text">MyPage Top</p>
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    methods: {
      redirectToMyPage () {
        this.$router.push({ name: 'Mypage' })
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
</style>