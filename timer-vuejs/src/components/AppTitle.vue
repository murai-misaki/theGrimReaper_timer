<template>
  <div>
    <p><span class="title"><span class="neontext">t</span>he <span class="neontext">G</span>rim Re<span class="neontext">a</span>per <span class="neontext">t</span>imer</span><br>''座りすぎが寿命を縮める''</p>
  </div>
  <img src="../assets/img/top.png" alt="死神イラスト" >
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  .title {
    font-family: 'IM Fell English SC', serif;
    font-size: 70px;
    color: #FFFFFF;
  }
  p {
    text-align: center;
    margin-top: 75px;
  }

  img {
    width: 300px;
    margin-top: 30px;
    margin-left: 590px;
  }
  
  .neontext {
  animation: flicker 1.5s infinite alternate;
  color: #fff;
  }
  @keyframes flicker {
  0%, 18%, 22%, 25%, 53%, 57%, 100% {
      text-shadow:
      0 0 4px #fff,
      0 0 11px #fff,
      0 0 19px #fff,
      0 0 40px #D9D9D9,
      0 0 80px #D9D9D9,
      0 0 90px #D9D9D9,
      0 0 100px #D9D9D9,
      0 0 150px #D9D9D9;
    } 
    20%, 24%, 55% {
      text-shadow: none;
    }
  }
</style>