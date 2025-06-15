// src/router/index.ts
import { createRouter, createWebHistory } from 'vue-router';
import LoginView from '../views/LoginView.vue';
import SignupView from '../views/SignupView.vue';
import DashboardView from '../views/DashboardView.vue';

const routes = [
	{
		path: '/',
		name: 'Home',
		component: DashboardView,
	},
	{ path: '/login', name: 'Login', component: LoginView },
	{ path: '/signup', name: 'Signup', component: SignupView },
];

const router = createRouter({
	history: createWebHistory(),
	routes,
});

export default router;
