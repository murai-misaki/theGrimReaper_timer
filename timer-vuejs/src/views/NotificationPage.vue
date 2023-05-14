<template>
  <div class="container">
    <GestNotification />
    <button @click="modal">Timer Start</button>
    <HowtouseOKbuttonModal ref="howtouseOkbuttonModal" />
  </div>
</template>

<script>
  import GestNotification from '../components/GestNotification.vue'
  import HowtouseOKbuttonModal from '../components/HowtouseOKbuttonModal.vue'

  export default {
    components: { GestNotification, HowtouseOKbuttonModal },

    methods: {
      modal () {
        this.$refs.howtouseOkbuttonModal.open()
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap');

  .container {
    padding: 20px 70px 50px 70px;
    border: 1px solid #D9D9D9;
  }
  
  button {
    font-family: 'IM Fell DW Pica SC', serif;
    width: 400px;
    font-size: 26px;
    background: #eee;
    position: relative;
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin: 0 auto;
    max-width: 240px;
    padding: 10px 15px;
    color: #313131;
    transition: 0.3s ease-in-out;
    font-weight: 500;
    z-index:0;
  }
  button:before {
    content: "";
    position: absolute;
    top: 0;
    bottom: 0;
    width: 0;
    display: block;
    background: #8F0B0B;
    transition: .3s;
    left:0;
  }
  button:hover {
    color: #FFF;
  }
  button:hover:before {
    width: 100%;
    z-index: -1;
  }

</style>
