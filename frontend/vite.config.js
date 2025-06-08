import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import vuePugPlugin from 'vue-pug-plugin';

export default defineConfig({
	plugins: [
		vue({
			template: {
				preprocessOptions: {
					plugins: [vuePugPlugin],
				},
			},
		}),
	],
	server: {
		proxy: {
			'/rails': 'http://localhost:3000', // Rails API 서버와의 통신을 위한 프록시 설정
		},
	},
	build: {
		rollupOptions: {
			input: './index.html', // 루트 디렉토리로 설정
		},
	},
});
