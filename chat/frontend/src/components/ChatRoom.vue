<template>
    <div>
        <a href = "/">チャットルーム一覧に戻る</a>
      <h1>チャットルーム {{ this.roomId }} </h1>
  
      <ul>
        <li v-for="message in messages" :key="message.id">
          <strong>{{ message.sender_name }}:</strong> {{ message.content }}
        </li>
      </ul>
      <form @submit.prevent="sendMessage">
        <!-- @submit.prevent="sendMessage" は、フォームが送信されたときに
         sendMessage メソッドを実行するように設定 -->
      <div>
        <h3>名前</h3>
        <input type="text" v-model="senderName" placeholder="名前を入力" required />
      </div>
      <div>
        <h3>メッセージ</h3>
        <input type="text" v-model="newMessageContent" placeholder="メッセージを入力" required />
      </div>
      <div>
        <button type="submit">送信</button>
      </div>
    </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import { inject } from 'vue'; // 追加
  
  export default {
    props: ['roomId'],
    data() {
      return {
        roomName: '',
        messages: [],
        senderName: '',
        newMessageContent: '',
      };
    },
    // setupフックを追加
    setup() {
      const cable = inject('cable');
      return { cable };
    },
    created() {
      this.fetchMessages();
      this.createSubscription(); // createdフック内でcreateSubscriptionメソッドを呼び出す
    },
    methods: {
      // 追加
      createSubscription() {
        this.subscription = this.cable.subscriptions.create(
          { channel: 'RoomChannel', room_id: this.roomId },
          {
            received: message => {
              console.log(message);
              this.messages.push(message);
            },
          }
        );
      },
    fetchMessages() {
      axios
        .get(`${import.meta.env.VITE_API_URL}/rooms/${this.roomId}/messages`)
        .then((response) => {
          this.messages = response.data
        })
        .catch((error) => {
          console.error(error)
        })
    },
    // 以下を追加
    sendMessage() {
      axios
        .post(`${import.meta.env.VITE_API_URL}/rooms/${this.roomId}/messages`, {
          content: this.newMessageContent,
          sender_name: this.senderName
        })
        .then(() => {
          this.newMessageContent = ''
        })
        .catch((error) => {
          console.error(error)
        })
    },
  },
}
  </script>