import { createRouter, createWebHistory } from 'vue-router';
import ChatRooms from '../components/ChatRooms.vue';
import ChatRoom from '../components/ChatRoom.vue';


const routes = [
    { path: '/', component: ChatRooms },
    { path: '/rooms/:id', component:ChatRoom, props: route => ({ roomId: route.params.id }) }, // 追加
  ];

// パス/にアクセスすると、<router-view>の中身が
// ChatRoomsコンポーネントとして置換される。

// /rooms/:id というパスを新しく追加
// このパスは ChatRoom コンポーネントにマッピング。
// :id の部分は動的なセグメント
// 任意のチャットルームIDを表す
// これはChatRoomコンポーネントに roomId として渡されます。


const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;