<template lang="pug">
  div
    p {{ counter.count }}
    button(@click="counter.increment") Increment
    button(@click="counter.decrement") Decrement
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { useCounterStore } from './stores/counter';

export default defineComponent({
	setup() {
		const counter = useCounterStore(); // Pinia store 사용

		return {
			counter,
		};
	},
});
</script>
