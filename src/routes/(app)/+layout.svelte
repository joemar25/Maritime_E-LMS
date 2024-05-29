<script>
	import LayoutHeader from '$lib/components/LayoutComponents/LayoutHeader.svelte';
	import SideBar from '$lib/components/SideBar.svelte';
	import { BrowserThemeStore } from '$lib/theme';
	import '../../app.css';
</script>

<div
	class="mx-auto h-screen max-w-[2560px] font-circular text-sm dark:text-white antialiased overflow-hidden {$BrowserThemeStore}"
>
	<main class="flex justify-between h-dvh lg:overflow-x-hidden dark:bg-dark dark:text-white">
		<SideBar />

		<div class="flex flex-col flex-1 gap-5 p-5 overflow-y-scroll dark:bg-dark">
			<LayoutHeader />

			<slot />
		</div>
	</main>
</div>
