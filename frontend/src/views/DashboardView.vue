<template lang="pug">
section.dashboard
  h1 Dashboard
  button(@click="handleLogout") Logout
</template>

<script setup>
import { logout } from '../api/auth';
import { useRouter } from 'vue-router';
import { useAuthStore } from '../stores/auth';

const router = useRouter();
const auth = useAuthStore();

async function handleLogout() {
	try {
		await logout();
		auth.clearUser(); //전역변수 삭제
		router.push('/login');
	} catch (e) {
		alert('Failed to');
	}
}
</script>

<style scoped>
.dashboard {
	max-width: 600px;
	margin: 60px auto;
	padding: 24px;
	border: 1px solid #ccc;
	border-radius: 8px;
}
</style>
