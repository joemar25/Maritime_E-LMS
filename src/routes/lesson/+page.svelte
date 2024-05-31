<script lang="ts">
	import { isLoading } from '$lib/store';
	import Icon from '@iconify/svelte';
	// import type { PageData } from './$types';

	// export let data: PageData;
	// $: ({ lessons, supabase, user } = data);
</script>

<!-- <p>{JSON.stringify(user)}</p> -->
<!-- <p>{lessons}</p> -->

{#if $isLoading}
	<div
		class="flex items-center justify-center flex-grow w-full p-5 rounded-md animate-pulse bg-white/10"
	>
		<Icon class="flex-shrink-0 text-6xl text-white/10" icon="svg-spinners:bars-scale-fade" />
	</div>
{/if}

<!-- Add the lessons here -->
