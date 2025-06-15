<template lang="pug">
form.login-form(@submit.prevent="handleLogin")
  h2 Login
  input(v-model="email" type="email" placeholder="email" required)
  input(v-model="password" type="password" placeholder="password" required)
  button(type="submit") Login
  router-link(to="/signup") Don't have an account?
</template>

<script setup>
import { ref } from 'vue';
import { login } from '../api/auth';
import { useRouter } from 'vue-router';
import { useAuthStore } from '../stores/auth';

const email = ref('');
const password = ref('');
const router = useRouter();
const auth = useAuthStore();

async function handleLogin() {
	try {
		await login({ email: email.value, password: password.value });
		await auth.fetchCurrentUser(); // 전역변수 저장
		router.push('/dashboard'); // 로그인 성공 시 이동
	} catch (err) {
		alert(
			'Failed to login: ' + err.response?.data?.message || 'Error Occurred',
		);
	}
}
</script>

<style scoped>
.login-form {
	display: flex;
	flex-direction: column;
	gap: 12px;
	max-width: 300px;
	margin: 100px auto;
}
</style>
