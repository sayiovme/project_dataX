<template lang="pug">
form.signup-form(@submit.prevent="handleSignup")
  h2 Signup
  input(v-model="email" type="email" placeholder="email" required)
  input(v-model="password" type="password" placeholder="password" required)
  button(type="submit") Signup
  router-link(to="/login") Already have an account?
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { signup } from '../api/auth';

const email = ref('');
const password = ref('');
const router = useRouter();

async function handleSignup() {
	try {
		await signup({ email: email.value, password: password.value });
		alert('Success! Please log in.');
		router.push('/login');
	} catch (err) {
		alert(
			err.response?.data?.message ||
				err.response?.data?.error ||
				'failed to signup',
		);
	}
}
</script>

<style scoped>
.signup-form {
	display: flex;
	flex-direction: column;
	gap: 12px;
	max-width: 300px;
	margin: 100px auto;
}
</style>
