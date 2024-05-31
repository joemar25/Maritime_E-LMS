<script>
	import { courses, isSearchVisible, lessons } from '$lib/store';
	import Icon from '@iconify/svelte';
	import { scale } from 'svelte/transition';

	// import { navigate } from "svelte-routing";
	// import slugify from "slugify";
	// import { t } from "../lib/i18n";

	let searchTerm = '';

	// onMount(() => {
	// 	window.addEventListener('keydown', handleKeydown);
	// });

	// onDestroy(() => {
	// 	window.removeEventListener('keydown', handleKeydown);
	// });

	$: if (!$isSearchVisible) {
		searchTerm = '';
	}

	// search through the lesson title, course title and course description
	$: filteredLessons = $lessons.filter((lesson) => {
		const lessonTitleMatch = lesson.title.toLowerCase().includes(searchTerm.toLowerCase());
		const course = $courses.find((course) => course.id === lesson.courseId);
		const courseTitleMatch =
			course && course.title.toLowerCase().includes(searchTerm.toLowerCase());
		const courseDescriptionMatch =
			course && course.description.toLowerCase().includes(searchTerm.toLowerCase());
		return lessonTitleMatch || courseTitleMatch || courseDescriptionMatch;
	});

	const handleKeydown = (/** @type {{ key: string; }} */ event) => {
		if (event.key === 'Escape') {
			isSearchVisible.set(false);
		}
	};
</script>

{#if $isSearchVisible}
	<div
		aria-hidden="true"
		on:click="{() => ($isSearchVisible = false)}"
		on:keydown="{handleKeydown}"
		class="fixed inset-0 z-20 flex items-center justify-center p-5 bg-black/50 backdrop-blur-sm"
	>
		<div
			aria-hidden="true"
			on:click|stopPropagation
			transition:scale="{{ duration: 250, opacity: 0.001, start: 0.98 }}"
			class="{filteredLessons.length > 5
				? 'hide-scrollbar relative m-auto h-[461px] w-[700px] overflow-y-scroll rounded-md bg-dark outline outline-[1.5px] outline-white/10'
				: 'hide-scrollbar relative m-auto w-[700px] overflow-y-scroll rounded-md bg-dark outline outline-[1.5px] outline-white/10'}"
		>
			<div
				class="sticky inset-x-0 top-0 flex w-full items-center justify-between gap-2 border-b-[1.5px] border-b-white/10 bg-dark px-4"
			>
				<Icon class="flex-shrink-0 text-xl text-white/50" icon="ph:magnifying-glass" />
				<input
					bind:value="{searchTerm}"
					class="flex-1 py-4 bg-transparent placeholder:text-white/50 focus:outline-none"
					type="text"
					placeholder="Find Lesson"
				/>
				<button on:click="{() => ($isSearchVisible = false)}">
					<Icon
						class="flex-shrink-0 text-xl transition rotate-45 text-white/50 hover:text-white"
						icon="ph:plus"
					/>
				</button>
			</div>
			<div class="w-full p-4">
				<p class="p-2 text-white/50">
					{#if filteredLessons.length === 0}
						No Lessons Found.
					{:else}
						<!-- To translate -->
						Showing <span class="text-main">{filteredLessons.length}</span>
						{filteredLessons.length === 1 ? 'lesson' : 'lessons'}
					{/if}
				</p>
				{#each $courses as course (course.id)}
					{#each filteredLessons as lesson (lesson.id)}
						{#if course.id === lesson.courseId}
							<button
								on:click="{() => {
									// navigate(`/${slugify(lesson.title, { lower: true, strict: true })}`);
									isSearchVisible.set(false);
								}}"
								class="flex items-center justify-between w-full gap-5 p-3 transition bg-transparent rounded-md hover:bg-white/5"
							>
								<div class="space-y-1">
									<h3 class="line-clamp-1 text-start">
										{lesson.title}
									</h3>
									<h4 class="line-clamp-1 text-start text-white/50">
										{course.title}
									</h4>
								</div>
								<h3 class="text-main">View</h3>
							</button>
						{/if}
					{/each}
				{/each}
			</div>
		</div>
	</div>
{/if}
