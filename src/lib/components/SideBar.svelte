<script>
	import Icon from '@iconify/svelte';

	import { quintOut } from 'svelte/easing';
	import { slide } from 'svelte/transition';
	// import { t } from '../lib/i18n';

	import { courses, isLoading, isSearchVisible, isSidebarVisible, resources } from '$lib/store';
	import ThemeSelector from './ThemeSelector.svelte';

	export let isCoursesVisible = true;
</script>

{#if $isSidebarVisible}
	<aside
		transition:slide="{{
			duration: 300,
			easing: quintOut,
			axis: 'x',
		}}"
		class="flex h-full w-80 flex-none flex-col gap-5 border-r-[1.5px] dark:border-r-white/5 border-r-black/5 bg-black/5 dark:bg-white/5 p-5 lg:w-full lg:border-none"
	>
		<div class="flex items-center justify-between">
			<img
				aria-hidden="true"
				style="width: 110px;"
				class="transition cursor-pointer hover:opacity-80"
				src="assets/logo.svg"
				alt="Maritime_E-LMS"
			/>
			<button
				on:click="{() => ($isSidebarVisible = !isSidebarVisible)}"
				class="items-center justify-center hidden p-2 transition bg-transparent rounded-full group hover:bg-white/10 lg:flex"
			>
				<Icon
					class="flex-shrink-0 text-lg transition text-white/50 group-hover:text-white"
					icon="ph:arrow-line-left"
				/>
			</button>
		</div>

		{#if $isLoading}
			<div
				class="hidden w-full p-1 rounded-full max-w-56 animate-pulse bg-black/10 dark:bg-white/10 sm:block"
			></div>
		{:else if $courses.length > 0}
			<h2
				class="items-center hidden gap-2 px-3 py-2 rounded-md bg-black/5 dark:bg-white/5 dark:text-white/50 sm:flex"
			>
				<Icon class="flex-shrink-0" icon="ph:graduation-cap" />
				{$courses.length}
				{$courses.length === 1 ? 'Course Assigned' : 'Courses Assigned'}
			</h2>
		{/if}

		<button
			on:click="{() => ($isSearchVisible = !$isSearchVisible)}"
			class="flex w-full items-center gap-2 rounded-md border-[1.5px] dark:border-white/10 text-black/50 border-black/10 bg-transparent p-2 dark:text-white/50 outline-none transition dark:hover:border-transparent dark:hover:bg-white/10 hover:border-black/20"
		>
			<Icon class="flex-shrink-0 text-base" icon="ph:magnifying-glass" />
			<!-- {$t('search')} -->
			Search
		</button>

		<div class="flex flex-col flex-grow gap-5 overflow-y-auto scrollbar-hide">
			{#if $isLoading && isCoursesVisible}
				<div class="w-full space-y-3">
					<div
						class="w-1/3 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-1/2 lg:max-w-28"
					></div>
					<div
						class="w-1/2 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-full lg:max-w-44"
					></div>
					<div
						class="w-1/3 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-1/2 lg:max-w-28"
					></div>
					<div
						class="w-1/2 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-full lg:max-w-44"
					></div>
				</div>
			{:else if isCoursesVisible && $courses.length > 0}
				<div class="flex flex-col gap-2 lg:hidden">
					<h3
						class="flex items-center gap-2 text-xs tracking-[2px] dark:text-white/50 font-semibold"
					>
						<Icon class="flex-shrink-0 text-base" icon="ph:graduation-cap" />
						<!-- {$t('COURSES')} -->
						COURSES
					</h3>
					<div>
						{#each $courses as course (course.id)}
							<button
								aria-hidden="true"
								class="w-full p-2 truncate transition bg-transparent rounded-md line-clamp-1 text-start dark:text-white/50 dark:hover:bg-white/10 hover:bg-black/10 dark:hover:text-white"
							>
								{course.title}
								<!-- on:click={() => scrollToCourse(course.id)} -->
							</button>
						{/each}
					</div>
				</div>
			{/if}

			{#if $isLoading}
				<div class="w-full space-y-3">
					<div
						class="w-1/3 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-1/2 lg:max-w-28"
					></div>
					<div
						class="w-1/2 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-full lg:max-w-44"
					></div>
					<div
						class="w-1/3 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-1/2 lg:max-w-28"
					></div>
					<div
						class="w-1/2 p-1 rounded-full animate-pulse dark:bg-white/10 bg-black/10 lg:w-full lg:max-w-44"
					></div>
				</div>
			{:else if $resources.length > 0}
				<div class="flex flex-col gap-2">
					<h3
						class="flex items-center gap-2 text-xs tracking-[2px] font-semibold dark:text-white/50"
					>
						<Icon class="flex-shrink-0 text-base" icon="ph:link" />
						<!-- {$t('RESOURCES')} -->
						RESOURCES
					</h3>
					<div>
						{#each $resources as resource}
							<a
								class="w-full p-2 truncate transition bg-transparent rounded-md line-clamp-1 text-start dark:text-white/50 hover:bg-black/10 dark:hover:bg-white/10 dark:hover:text-white"
								href="{resource.link}"
								target="_blank">{resource.name}</a
							>
						{/each}
					</div>
				</div>
			{/if}
		</div>
		<ThemeSelector />
		{#if $isLoading}
			<div class="flex items-center w-full gap-3">
				<div class="p-4 rounded-full animate-pulse bg-white/10"></div>
				<div class="flex-1 space-y-3">
					<div class="w-1/2 p-1 rounded-full animate-pulse bg-white/10 lg:max-w-28"></div>
					<div class="w-full p-1 rounded-full animate-pulse bg-white/10 lg:max-w-44"></div>
				</div>
			</div>
		{:else}
			<div class="flex items-center justify-between gap-5">
				<div class="flex items-center gap-2">
					<!-- <img
						class="inline-block w-6 h-6 rounded-full ring-2 ring-white"
						src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
						alt=""
					/> -->

					<div
						class="flex justify-center w-8 h-8 text-center text-white rounded-full bg-main dark:text-black"
					>
						<span class="self-center font-semibold">S</span>
					</div>
					<div>
						<h3 class="break-all truncate line-clamp-1 text-wrap dark:text-white/50">Tatadmin</h3>
						<h4 class="break-all truncate line-clamp-1 text-wrap dark:text-white/50">
							tatadmin@email.com
						</h4>
					</div>
				</div>
				<!-- Logout Button -->

				<button
					on:click
					class="flex items-center justify-center rounded-md bg-transparent p-2 text-red-400 outline outline-[1.5px] outline-red-400/20 transition hover:bg-red-400/20"
				>
					<Icon class="flex-shrink-0 text-base" icon="ph:sign-out" />

					<!-- 	on:click={logout} -->
				</button>

				<!-- Logout Button -->
			</div>
		{/if}
	</aside>
{/if}
