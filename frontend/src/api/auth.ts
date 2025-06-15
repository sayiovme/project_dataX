import axios from './axios';

export const login = (payload: { email: string; password: string }) =>
	axios.post('/login', payload, { withCredentials: true });

export const logout = () => axios.delete('/logout', { withCredentials: true });

export const signup = (payload: { email: string; password: string }) =>
	axios.post('/signup', payload, { withCredentials: true });
