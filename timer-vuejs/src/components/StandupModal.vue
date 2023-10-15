<template>
  <div v-show="show" class="modal_contents">
    <div class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <h1 class="neontext">Do you stand up？</h1>
      <p>''座ったまま30分が経過しました。立ち上がりますか？''</p>
      <div class="button_group">
        <button @click="restart" class="no_button">No</button>
        <button @click="startBreaktimeTimer" class="yes_button">Yes</button>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        show: false
      }
    },
    methods: {
      open () {
        this.show = true
      },
      close () {
        this.show = false
      },
      startBreaktimeTimer () {
        this.$emit('showBreaktimeTimer')
      },
      restart () {
        this.$emit('restartCountupTimer')
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
    height: 100%;
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
  .button_group {
    text-align: center;
    margin-top: 50px;
  }
  button.no_button {
    font-family: 'IM Fell English SC', serif;
    font-size: 35px;
    padding: 10px 60px;
    border: 3px solid #8F0B0B;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }
  button.no_button:hover {
    color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }
  button.yes_button {
    margin-left:100px;
    font-family: 'IM Fell English SC', serif;
    font-size: 35px;
    padding: 10px 60px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #A40505;
    background: #000000;
    cursor: pointer;
  }
  button.yes_button:hover {
  color: #A40505;;
  background: rgba(217, 217, 217, 0.2);
  }
</style>