<script>
	import SideBar from '$lib/components/SideBar.svelte';
	import { BrowserThemeStore } from '$lib/theme';
	import '../../app.css';
</script>

<div
	class="mx-auto h-screen max-w-[2560px] font-circular text-sm dark:text-white antialiased overflow-hidden {$BrowserThemeStore}"
>
	<main class="flex h-dvh justify-between lg:overflow-x-hidden dark:bg-dark dark:text-white">
		<SideBar />
		<slot />
	</main>
</div>
