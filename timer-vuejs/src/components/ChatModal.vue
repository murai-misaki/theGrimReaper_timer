<template>
  <div v-show="show" class="modal_contents">
    <div @click="close" class="modal_contents_bg"></div>
    <div class="modal_contents_wrap">
      <span @click="close" class="modal_close_btn"><font-awesome-icon :icon="['fas', 'xmark']" style="color: #D9D9D9;" /></span>
      <h1 class="neontext">Chat</h1>
      <div v-if="messages" class="messages">
        <ul v-for="message in messages" :key="message.id">
          <li :class="{ received: message.email !== uid, sent: message.email === uid }">
            <span class="name">{{ message.name }}</span>
            <div class="message" @dblclick="handleLike(message)">
              {{ message.content }}
              <div v-if="message.likes.length" class="heart-container">
                <font-awesome-icon :icon="['fas', 'heart']" class="heart" />
                <span class="heart-count">{{ message.likes.length }}</span>
              </div>
            </div>
            <span class="created-at">{{ message.created_at }}</span>
          </li>
        </ul>
      </div>
      <form>
        <textarea placeholder="メッセージを入力してEnterを押してください" v-model="newMessage" @keypress.enter.prevent="handleSubmit"></textarea>
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios' 

  export default {
    props: ['messages'],

    data () {
      return {
        show: false,
        uid: localStorage.getItem('uid'),
        newMessage: '',
        shinigami: false
      }
    },
    methods: {
      open () {
        this.show = true
        window.scrollTo(0, 0);
      },
      close () {
        this.show = false
      },
      handleSubmit () {
        this.$emit('connectCable', this.newMessage, this.shinigami)
        this.newMessage = ''
      },
      handleLike (message) {
        for (let i = 0; i < message.likes.length; i++) {
          const like = message.likes[i]
          if (like.email === this.uid) {
            this.deleteLike(like.id)
            return
          }
        }
        this.createLike(message.id)
      },
      async createLike (messageId) {
        try {
          const res = await axios.post(process.env.VUE_APP_API_URL + `/messages/${messageId}/likes`, {},
            {
              headers: {
                uid: this.uid,
                "access-token": window.localStorage.getItem('access-token'),
                client: window.localStorage.getItem('client')
              }
            })
          if (!res) {
            new Error('いいねできませんでした')
          }
          this.$emit('connectCable')
        } catch (error) {
          console.log(error)
        }
      },
      async deleteLike(likeId) {
        try {
          const res = await axios.delete(process.env.VUE_APP_API_URL + `/likes/${likeId}`,
            {
              headers: {
                uid: this.uid,
                "access-token": window.localStorage.getItem('access-token'),
                client: window.localStorage.getItem('client')
              }
            })
          if (!res) { 
            new Error('いいねを削除できませんでした')
          }
          this.$emit('connectCable')
        } catch (error) {
          console.log(error)
        }      
      },
    }
  }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=IM+Fell+English+SC&display=swap');

  h1 {
    font-family: 'IM Fell English SC', serif;
    font-size: 38px;
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
    height: 940px;
  }
  .modal_contents_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    background-color: #000000;
    width: 750px;
    transform: translate(-50%,-50%);
    padding: 20px 50px 40px 50px;
    margin-top: 5px;
    border: 2px solid #FFFFFF;
  }
  .modal_close_btn {
    margin-left: 760px;
    cursor: pointer;
  }

.neontext {
    color: #fff;
    text-shadow:
      0 0 7px #fff,
      0 0 10px #fff,
      0 0 21px #fff,
      0 0 42px #D9D9D9,
      0 0 82px #D9D9D9,
      0 0 92px #D9D9D9,
      0 0 102px #D9D9D9,
      0 0 151px #D9D9D9;
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
      0 0 40px #D9D9D9,
      0 0 80px #D9D9D9,
      0 0 90px #D9D9D9,
      0 0 100px #D9D9D9,
      0 0 150px #D9D9D9;
    }
    0% {
      text-shadow:
      0 0 4px #fff,
      0 0 10px #fff,
      0 0 18px #fff,
      0 0 38px #D9D9D9,
      0 0 73px #D9D9D9,
      0 0 80px #D9D9D9,
      0 0 94px #D9D9D9,
      0 0 140px #D9D9D9;
    }
  }

  ul {
    list-style: none;
    margin: 0;
    padding: 0;
  }
  ul li {
    display:inline-block;
    clear: both;
  }
  .received .message {
    background: rgba(90, 3, 3, 0.6);
    padding: 10px;
    display: inline-block;
    border: 1px solid #D9D9D9;
    border-radius: 30px;
    margin-bottom: 2px;
    max-width: 400px;
    color: #D9D9D9;
  }
  .received {
    float: left;
  }
  .sent {
    float: right;
  }
  .sent .message {
    background: rgba(217, 217, 217, 0.2);
    color: #D9D9D9;
    padding: 10px;
    display: inline-block;
    border: 1px solid #D9D9D9;
    border-radius: 30px;
    margin-bottom: 2px;
    max-width: 400px;
  }
  .name {
    position: relative;
    margin-right: 6px;
    display: block;
    font-size: 13px;
  }
  .created-at {
    display: block;
    color: #999;
    font-size: 12px;
    margin-bottom: 20px;
    margin-left: 4px;
  }
  .messages {
    max-height: 400px;
    overflow: auto;
  }

  form {
    margin-top: 10px;
  }
  textarea {
    width: 100%;
    max-width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border-radius: 10px;
    font-family: inherit;
    outline: none;
    background-color: #000000;
    border: 1px solid #D9D9D9;
    color: #D9D9D9;
  }

  .message {
    position: relative;
  }

  .heart-container {
    position: absolute;
    display: flex;
    justify-content: space-around;
    align-items: center;
    border-radius: 30px;
    min-width: 25px;
    padding: 1px 2px;
    z-index: 2;
    bottom: -7px;
    right: -15px;
    font-size: 12px;
  }
  .heart {
    color: rgb(236, 29, 29);
  }
  .heart-count {
    color: #D9D9D9;
  }

  .received .message::selection {
    background: rgba(90, 3, 3, 0);
  }

  .sent .message::selection {
    background: rgba(217, 217, 217, 0);
  }
</style>