<template>
  <div v-show="show" class="modal_contents">
    <div v-on:click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
        <p>モーダルウィンドウ</p>
        <span v-on:click="close" class="modal_close_btn">閉じる</span>
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
      }
    }
  }
</script>

<style scoped>
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
  background: rgba(0,0,0,.8);
  width: 100%;
  height: 100%;
  }
  .modal_contents_wrap {
  position: absolute;
  top: 50%;
  left: 50%;
  background-color: #fff;
  width: 50%;
  height: 50%;
  margin: auto;
  transform: translate(-50%,-50%);
  padding: 30px;
  }
  .modal_close_btn {
  display: inline-block;
  cursor: pointer;
  margin-top: 10px;
  }
</style>