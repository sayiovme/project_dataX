import { createApp } from 'vue';
import App from './App.vue';
import axios from 'axios';
import { createPinia } from 'pinia';

// Axios의 기본 URL 설정
axios.defaults.baseURL = 'https://jsonplaceholder.typicode.com';

// Vue 애플리케이션에 Axios를 전역적으로 추가
const app = createApp(App);
app.config.globalProperties.$axios = axios;
app.use(createPinia()); // Pinia 사용 설정
app.mount('#app');
