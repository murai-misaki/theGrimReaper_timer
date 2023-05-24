<template>
  <div class="modal_contents">
    <div class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <h1 class="neontext">Thank you for using.</h1>
      <div v-show="todayShortenedLifespan">
        <p>''本日は<span>{{todayShortenedLifespan}}分</span>の寿命を戴きました。''<br>またのご利用をご利用をお待ちしております。</p>
      </div>
      <div v-show="!todayShortenedLifespan">
        <p>''本日戴いた寿命はございません。''<br>またのご利用をご利用をお待ちしております。</p>
      </div>
      <button class="ok_button" @click="close">OK</button>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        todayShortenedLifespan: window.localStorage.getItem('todayShortenedLifespan'),
      }
    },
    methods: {
      close () {
        this.$emit('closeShortenedLifespanModal')
      },
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-weight: normal;
    font-family: 'IM Fell English SC', serif;
    font-size: 40px;
    text-align: center;
  }
  p {
    text-align: center;
  }
  span {
    color: #CB0101;
  }
  .modal_contents {
    position: absolute;
    top: 0;
    left: 0;
    z-index:100;
    width: 100%;
    height: 100%;
    width: 100%;
  }
  .modal_contents_bg {
    background: rgba(40, 40, 40, 0.56);
    width: 100%;
    height: 700px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 650px;
    height: 300px;
    transform: translate(-50%,-50%);
    margin-top: 20px;
    border: 2px solid #FFFFFF;
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
      0 0 40px #0fa,
      0 0 80px #0fa,
      0 0 90px #0fa,
      0 0 100px #0fa,
      0 0 150px #0fa;
    } 
    20%, 24%, 55% {
      text-shadow: none;
    }
  }
  button.ok_button {
    margin-top: 30px;
    margin-left: 240px;
    font-family: 'IM Fell English SC', serif;
    font-size: 30px;
    padding: 10px 60px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #A40505;
    background: #000000;
    cursor: pointer;
  }
  button.ok_button:hover {
  color: #A40505;;
  background: rgba(217, 217, 217, 0.2);
  }
</style>