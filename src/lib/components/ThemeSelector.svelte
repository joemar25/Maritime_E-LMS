<script>
	import { CurrentThemeStore, Themes, setCurrentTheme } from '$lib/theme';
	import { fly } from 'svelte/transition';

	const themeDisplay = ['Light mode', 'Dark mode', 'Default'];

	let showSelection = false;
</script>

<svelte:document
	on:click={() => {
		showSelection = false;
	}}
/>

<div class="relative">
	<button
		class="px-6 py-1 text-sm bg-neutral-100 shadow dark:shadow-none dark:bg-neutral-700 rounded-md cursor-pointer transition-all duration-75 active:bg-neutral-200 dark:active:bg-neutral-600"
		class:rounded-b-none={showSelection}
		on:click|stopPropagation={() => (showSelection = !showSelection)}
	>
		{themeDisplay[Themes.indexOf($CurrentThemeStore)]}
	</button>

	{#if showSelection}
		<div
			class="absolute bg-neutral-100 w-full shadow dark:shadow-none dark:bg-neutral-700 rounded-b-md flex flex-col items-center overflow-clip"
			transition:fly={{ y: '10px', duration: 100 }}
		>
			{#each Themes as theme, i}
				<button
					class="bg-neutral-100 dark:bg-neutral-700 w-full p-1 border-t dark:border-neutral-500"
					on:click|stopPropagation={() => {
						setCurrentTheme(theme);
						showSelection = false;
					}}
				>
					{themeDisplay[Themes.indexOf(theme)]}
				</button>
			{/each}
		</div>
	{/if}
</div>
