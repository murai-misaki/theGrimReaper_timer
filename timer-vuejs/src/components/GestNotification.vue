<template>
  <div>
    <h2>30分ごとに立ち上がりのお知らせを致します。</h2>

    <div class="explanation">
      <span>‘’ 30分に一度3分、立って動く ‘’</span>
      <p>一回に座ったまま過ごす時間が30分を超えないようにすること。これで座り過ぎのリスクはかなり減らせます。</p>
    </div>

    <div class="question">
      <p>お知らせ方法はどちらをご希望でしょうか？</p>
    </div>

    <div class="selection">
      <div class="sound-radio-button">
        <input type="radio" id="sound" v-model="radio" value="false">
        <label for="sound">サウンド通知</label>
      </div>
      <div class="push-radio-button">
        <input type="radio" id="push" v-model="radio" value="true">
        <label for="push">プッシュ通知</label>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
  data () {
    return {
      radio: 'false'
    }
  }
}
</script>

<style scoped>
  div {
    text-align: center;
  }
  h2 {
    background-color: #494949;
    padding: 10px;
    font-weight: normal;
  }
  span {
    color: #CB0101;
    font-size: 18px;
  }
  .explanation p {
    padding-bottom: 20px;
    border-bottom: 0.1px solid #D9D9D9;
  }
  .question p {
    margin-top: 50px;
  }

  input[type="radio"] {
    width: 20px;
    height: 20px;
    border-radius: 100px;
    position: relative;
    vertical-align: sub;
    margin-right: 5px;
  }
  input[type="radio"]::before, input[type="radio"]::after{
    content: "";
    display: block;
    border-radius: 50%;
    position: absolute;
    transform: translateY(-50%);
    top: 50%;
  }
  input[type="radio"]::before {
    background-color: #D9D9D9;
    border: 1px solid #494949;
    height: 20px;
    width: 20px;
    left: 0px;
  }
  input[type="radio"]::after {
    background-color: #494949;
    opacity: 0;
    height: 14px;
    width: 14px;
    left: 4px;
  }
  input[type="radio"]:checked::after {
    opacity: 1;
  }
</style>