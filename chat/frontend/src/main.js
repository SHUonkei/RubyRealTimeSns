// import './assets/main.css'

// import { createApp } from 'vue'
// import App from './App.vue'

// createApp(App).mount('#app')
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import ActionCable from 'actioncable';

//Rails側のActionCableサーバとの接続を作成
const cable = ActionCable.createConsumer('ws://localhost:3000/cable');

//新しいVueアプリケーションインスタンスを作成
const app = createApp(App);

//vue-routerの作法？？
app.use(router);

// mountメソッドを使用して、VueアプリケーションをDOMにマウント
// '#app'は、アプリケーションをアタッチするHTML要素のセレクタ
// を示しています。
// HTMLファイル内に<div id="app"></div>という要素が存在
// この要素にVueアプリケーションがアタッチ

app.provide('cable', cable);
//アプリケーション全体から利用できるようにしています。


app.mount('#app');