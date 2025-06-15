import { defineStore } from 'pinia';
import axios from '../api/axios';

export const useAuthStore = defineStore('auth', {
	state: () => ({
		user: null,
		loading: false,
	}),

	actions: {
		async fetchCurrentUser() {
			try {
				const res = await axios.get('/me', { withCredentials: true });
				this.user = res.data;
				console.log('✅ /me 성공:', res.data);
			} catch (e) {
				console.warn('❌ /me 실패:', e.response?.data || e);
				this.user = null;
			}
		},

		setUser(user) {
			this.user = user;
		},

		clearUser() {
			console.log('pinia: 유저 삭제');
			this.user = null;
		},
	},
});
