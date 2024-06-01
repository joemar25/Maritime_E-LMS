<script lang="ts">
	import { goto, invalidate } from '$app/navigation';
	import { page } from '$app/stores';
	import LayoutHeader from '$lib/components/LayoutComponents/LayoutHeader.svelte';
	import SideBar from '$lib/components/SideBar.svelte';
	import { BrowserThemeStore } from '$lib/theme';
	import { onMount } from 'svelte';
	import '../app.css';

	let pathName = $page.url.pathname;
	$: pathName = $page.url.pathname;

	export let data;
	$: ({ session, supabase } = data);

	onMount(() => {
		const { data } = supabase.auth.onAuthStateChange((_, newSession) => {
			if (!newSession) {
				setTimeout(() => {
					goto('/', { invalidateAll: true });
				});
			}
			if (newSession?.expires_at !== session?.expires_at) {
				invalidate('supabase:auth');
			}
		});

		return () => data.subscription.unsubscribe();
	});

	const logout = async () => {
		const { error } = await supabase.auth.signOut();
		if (error) {
			console.error('Error logging out:', error);
		} else {
			await goto('/login', { invalidateAll: true });
		}
	};
</script>

<div
	class="mx-auto h-screen max-w-[2560px] font-circular text-sm dark:text-white antialiased overflow-hidden {$BrowserThemeStore}"
>
	<main class="flex justify-between h-dvh lg:overflow-x-hidden dark:bg-dark dark:text-white">
		{#if pathName !== '/login' && pathName !== '/signup'}
			<SideBar on:click="{logout}" />
		{/if}

		<div class="flex flex-col flex-1 gap-5 p-5 overflow-y-scroll dark:bg-dark">
			{#if pathName !== '/login' && pathName !== '/signup'}
				<LayoutHeader />
			{/if}

			<slot />
		</div>
	</main>
</div>
