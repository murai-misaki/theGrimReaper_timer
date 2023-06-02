<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">radio exercises</h1>
        <p>''ラジオ体操3分''</p>
      <video src="../assets/video/radio_exercises.mp4" controls></video>
      <p class="reference">※ 引用 : かんぽ生命(図解)ラジオ体操第一・立位</p>
      <div v-show="flashMessage" class="flash_message">
          <p>本日の身体活動量として記録しました。</p>
        </div>
        <button @click="record">Finished</button>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        show: false,
        todayExercise: Number(window.localStorage.getItem('todayExercise')),
        exerciseTime: 0,
        flashMessage: false,
      }
    },
    methods: {
      open () {
        this.show = true
        this.todayExercise = Number(window.localStorage.getItem('todayExercise'))
      },
      close () {
        this.show = false
      },
      setItemExerciseTime3 () {
        if (this.todayExercise) {
            this.exerciseTime = this.todayExercise + 3;
        } else {
          this.exerciseTime += 3;
        }
        window.localStorage.setItem('todayExercise', this.exerciseTime)
      },
      record () {
        this.setItemExerciseTime3()
        this.flashMessage = true
        setTimeout(this.closeFlashMessage, 3000);
      },
      closeFlashMessage () {
        this.flashMessage = false
      },
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 38px;
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
    height: 950px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 700px;
    height: 450px;
    transform: translate(-50%,-50%);
    padding: 20px 65px 100px 65px;
    margin-top: 270px;
    border: 2px solid #FFFFFF;
    text-align: center;
  }
  .modal_close_btn {
    margin-left: 720px;
    cursor: pointer;
  }

.neontext {
    color: #fff;
    text-shadow:
      0 0 7px #fff,
      0 0 10px #fff,
      0 0 21px #fff,
      0 0 42px #0fa,
      0 0 82px #0fa,
      0 0 92px #0fa,
      0 0 102px #0fa,
      0 0 151px #0fa;
  }
  h1.neontext {
    color: #fff;
    font-size: 3em;
    line-height: 1em;
    animation: pulsate 0.11s ease-in-out infinite alternate;
  }
  @keyframes pulsate {
    100% {
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
    0% {
      text-shadow:
      0 0 4px #fff,
      0 0 10px #fff,
      0 0 18px #fff,
      0 0 38px #0fa,
      0 0 73px #0fa,
      0 0 80px #0fa,
      0 0 94px #0fa,
      0 0 140px #0fa;
    }
  }
  video {
    width: 520px;
    display: block;
    margin: 0 auto;
  }

  button {
    margin: 0px auto;
    font-family: 'IM Fell English SC', serif;
    font-size: 35px;
    padding: 10px 60px;
    border: 3px solid #D9D9D9;
    border-radius: 0;
    color: #D9D9D9;
    background: #000000;
    cursor: pointer;
  }
  button:hover {
  color: #fcfc04;
  }

  .flash_message p {
    border: 1px solid #BFBFBF;
    background: rgba(217, 217, 217, 0.2);
    width: 400px;
    margin: 0 auto;
  }
  p.reference {
    color: #BFBFBF;
    font-size: 7px;
    margin-left: 480px;
  }
</style>