<template lang="pug">
div
  header.gnb
    h1 Task App

    // 로그인 여부에 따라 다른 GNB 출력
    div.right
      template(v-if="auth.user")
        span 👤 {{ auth.user.email }}
        button(@click="handleLogout") Logout
      template(v-else)
        router-link(to="/login") Login

  main
    router-view
</template>

<script setup lang="ts">
import { useAuthStore } from './stores/auth';
import { logout } from './api/auth';
import { useRouter } from 'vue-router';

const auth = useAuthStore();
const router = useRouter();

async function handleLogout() {
	try {
		await logout();
		auth.clearUser();
		router.push('/login');
	} catch (e) {
		alert('Fail to logout');
	}
}
</script>

<style scoped>
.gnb {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem 2rem;
	background-color: #f1f1f1;
	border-bottom: 1px solid #ccc;
}

.gnb .right {
	display: flex;
	align-items: center;
	gap: 1rem;
}

main {
	padding: 2rem;
}
</style>
