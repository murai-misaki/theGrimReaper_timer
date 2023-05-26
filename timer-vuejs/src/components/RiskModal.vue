<template>
  <div class="modal_contents">
    <div class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <h1 class="neontext">Please be careful !</h1>
      <div>
        <p>''1日座っている時間が合計8時間を越えました。''<br>これ以上座り続けると、<span>罹患リスクや死亡リスクが高まります</span>。</p>
      </div>
      <button class="ok_button" @click="close">OK</button>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    methods: {
      close () {
        this.$emit('closeRiskModal')
      }
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
      0 0 40px #f09,
      0 0 80px #f09,
      0 0 90px #f09,
      0 0 100px #f09,
      0 0 150px #f09;
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