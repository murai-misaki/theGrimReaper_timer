<template>
  <div class="container">
    <GestNotification ref="gestNotification" />
    <button @click="selection">Timer Start</button>
    <HowtouseOKbuttonModal ref="howtouseOkbuttonModal" />
  </div>
    <FooterLink />
</template>

<script>
  import GestNotification from '../components/GestNotification.vue'
  import HowtouseOKbuttonModal from '../components/HowtouseOKbuttonModal.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { GestNotification, HowtouseOKbuttonModal, FooterLink },

    methods: {
      selection () {
        this.$refs.gestNotification.createNotification().then(() => {
        this.$refs.howtouseOkbuttonModal.open()
        })
      }
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  .container {
    padding: 20px 70px 40px 70px;
    border: 1px solid #D9D9D9;
  }
  
  button {
    font-family: 'IM Fell English SC', serif;
    width: 470px;
    font-size: 30px;
    padding: 15px 15px;
    margin-left: 250px;
    margin-top: 10px;
    border: 3px solid #8F0B0B;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }
  button:hover {
    color: #D9D9D9;
    background: rgba(90, 3, 3, 0.6);
  }

</style>
