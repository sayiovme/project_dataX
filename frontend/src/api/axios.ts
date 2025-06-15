import axios from 'axios';

const instance = axios.create({
	baseURL: 'http://localhost:3000',
	withCredentials: true, // ★ 쿠키 자동 포함
});

export default instance;
