<script lang="ts">
	import { page } from '$app/stores';
	import { courses, isLoading, isSidebarVisible } from '$lib/store';
	import Icon from '@iconify/svelte';
	import LayoutHeaderButtons from './LayoutHeaderButtons.svelte';

	let routeName = $page.url.pathname;
	$: routeName = $page.url.pathname;
</script>

{#if !$isLoading && routeName === '/course'}
	<a href="/" class="flex items-center gap-2 transition text-white/50 hover:text-white">
		<Icon class="flex-shrink-0" icon="ph:arrow-left" />
		My Courses
	</a>
{/if}
<div class="flex items-center justify-between w-full gap-5 sm:flex-col sm:items-start">
	<!-- LEFT SIDE -->
	<div class="flex items-center gap-3">
		<button
			on:click={() => ($isSidebarVisible = !$isSidebarVisible)}
			class="flex items-center justify-center p-2 text-xl transition bg-transparent rounded-full group hover:bg-white/10"
		>
			<Icon
				class="flex-shrink-0 transition dark:text-white/50 dark:group-hover:text-white"
				icon="ph:list"
			/>
		</button>

		{#if routeName === '/course'}
			{#if $isLoading}
				<div class="p-1 rounded-full w-96 animate-pulse bg-white/10"></div>
			{:else}
				<h1 class="flex items-center gap-2 text-base">
					<Icon class="flex-shrink-0" icon="ph:graduation-cap" />
					Course Name
				</h1>
			{/if}
		{:else if routeName === '/'}
			<h1 class="flex items-center gap-2 text-base">
				<Icon class="flex-shrink-0" icon="ph:graduation-cap" />
				My Courses
			</h1>
		{/if}
	</div>

	<!-- LEFT SIDE -->

	<!-- RIGHT SIDE -->
	{#if routeName === '/course'}
		{#if !$isLoading}
			<LayoutHeaderButtons />
			<!-- GO TO THE NEXT LESSON -->
		{/if}
	{:else if routeName === '/'}
		{#if $isLoading}
			<div
				class="w-full p-1 rounded-full max-w-56 animate-pulse bg-black/10 dark:bg-white/10 sm:hidden"
			></div>
		{:else if $courses.length > 0}
			<h2 class="dark:text-white/50 sm:hidden">
				{$courses.length}
				{$courses.length === 1 ? 'Course Assigned' : 'Courses Assigned'}
			</h2>
		{/if}
	{/if}
	<!-- RIGHT SIDE -->
</div>
