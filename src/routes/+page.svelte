<script lang="ts">
	import { goto } from '$app/navigation';
	import Search from '$lib/components/Search.svelte';
	import { courses, isLoading, lessons, progress } from '$lib/store';
	import Icon from '@iconify/svelte';
	import { onMount, tick } from 'svelte';

	let isOpen: { [key: string]: boolean } = {};
	let loading: { [key: string]: boolean } = {};
	let openCourseId = '';

	onMount(() => {
		$isLoading = true;
		setTimeout(() => {
			$isLoading = false;
		}, 2000);
	});

	$: {
		(async () => {
			await tick();
			if (isOpen[openCourseId]) {
				const courseElement = document.getElementById(openCourseId);
				if (courseElement) {
					courseElement.scrollIntoView({ behavior: 'smooth' });
				}
			}
		})();
	}

	const gotoCourse = (route: string) => {
		$isLoading = true;
		setTimeout(() => {
			$isLoading = false;
		}, 2000);

		goto(route);
	};

	const toggleCourse = (courseId: string) => {
		isOpen[courseId] = !isOpen[courseId];
		openCourseId = courseId;
	};

	const resetProgress = async (courseId: string) => {
		loading[courseId] = true;
		await new Promise((resolve) => setTimeout(resolve, 2000)); // Mock async operation
		$progress = $progress.map((progressRecord) =>
			progressRecord.course === courseId
				? { ...progressRecord, status: 'Not Started' }
				: progressRecord,
		);
		loading[courseId] = false;
	};

	// const startOrContinueCourse = async (courseId: string) => {
	// 	$progress = $progress.map((progressRecord) =>
	// 		progressRecord.course === courseId
	// 			? {
	// 					...progressRecord,
	// 					status: progressRecord.status === 'Not Started' ? 'In Progress' : progressRecord.status
	// 				}
	// 			: progressRecord
	// 	);
	// };

	// const goToFirstLessonOfCourse = (courseId: string) => {
	// 	const courseLessons = $lessons.filter((lesson) => lesson.courseId === courseId);
	// 	if (courseLessons.length > 0) {
	// 		const firstLesson = courseLessons[0];
	// 		console.log(`Navigate to lesson: ${firstLesson.title}`);
	// 		// Implement navigation logic here
	// 	}
	// };
</script>

<Search />
{#if $isLoading}
	<div
		class="flex items-center justify-center flex-1 w-full p-5 rounded-md animate-pulse dark:bg-white/10 bg-black/10"
	>
		<Icon class="flex-shrink-0 text-6xl dark:text-white/10" icon="svg-spinners:bars-scale-fade" />
	</div>
{:else if $courses.length === 0}
	<div class="flex items-center justify-center flex-1 w-full">
		<div class="flex w-[500px] flex-col items-center gap-5 text-center sm:w-full">
			<Icon class="flex-shrink-0 text-6xl text-main" icon="ph:book-open-text-fill" />
			<div class="space-y-3">
				<h1 class="leading-snug text-30px text-balance">No Course Assigned</h1>
				<p class="text-base text-white/50">Course Assigned Check</p>
			</div>
		</div>
	</div>
{:else}
	{#each $courses as course (course.id)}
		<div
			id="{course.id}"
			class="{isOpen[course.id]
				? 'w-full rounded-md outline outline-[1.5px] dark:outline-white/20 outline-black/20 transition-all dark:hover:outline-white/20'
				: 'w-full rounded-md outline outline-[1.5px] dark:outline-white/10 outline-black/10 transition-all dark:hover:outline-white/20'}"
		>
			<div
				aria-hidden="true"
				on:click="{() => toggleCourse(course.id)}"
				class="{isOpen[course.id]
					? 'w-full cursor-pointer space-y-5 rounded-b-none rounded-t-md bg-white/5 dark:bg-white/5 p-5'
					: 'w-full cursor-pointer space-y-5 rounded-md bg-white/5 dark:bg-white/5 p-5'}"
			>
				{#each $progress as progressRecord (progressRecord.id)}
					{#if course.id === progressRecord.course}
						<div class="flex items-center justify-between w-full gap-5 sm:flex-col">
							<div class="flex items-center gap-3 xs:flex-col xs:items-start sm:w-full">
								<h3
									class="{progressRecord.status === 'Completed'
										? 'rounded-full bg-emerald-400/10 px-3 py-1 text-emerald-400/70'
										: progressRecord.status === 'In Progress'
											? 'rounded-full  bg-amber-400/10 px-3 py-1 text-amber-400 darK:text-amber-400/70'
											: 'rounded-full bg-black/10 dark:bg-white/10 px-3 py-1 dark:text-white/70'}"
								>
									{progressRecord.status === 'Completed'
										? 'Completed'
										: progressRecord.status === 'In Progress'
											? 'In Progress'
											: 'Start Course'}
								</h3>
								<h3 class="flex items-center gap-2 dark:text-white/50">
									<Icon class="flex-shrink-0 text-lg" icon="ph:book-open" />
									{$lessons.filter((lesson) => lesson.courseId === course.id).length}
									{$lessons.filter((lesson) => lesson.courseId === course.id).length <= 0
										? 'Lesson in this Course'
										: 'Lessons in this Course'}
								</h3>
							</div>
							<div class="flex items-center gap-3 sm:w-full">
								{#if progressRecord.status === 'Completed' || progressRecord.status === 'In Progress'}
									<button
										on:click|stopPropagation
										on:click="{() => resetProgress(course.id)}"
										class="{loading[course.id]
											? 'pointer-events-none line-clamp-1 flex items-center justify-center gap-2 truncate rounded-md px-4 py-2 text-red-400 opacity-50 outline outline-[1.5px] outline-red-400/20 transition hover:bg-red-400/20 sm:w-full sm:flex-1 sm:px-0'
											: 'line-clamp-1 flex items-center justify-center gap-2 truncate rounded-md px-4 py-2 text-red-400 outline outline-[1.5px] outline-red-400/20 transition hover:bg-red-400/20 sm:w-full sm:flex-1 sm:px-0'}"
									>
										{loading[course.id] ? 'Resetting Progress' : 'Reset Progress'}
										{#if loading[course.id]}
											<Icon
												class="flex-shrink-0 text-base animate-spin"
												icon="fluent:spinner-ios-16-regular"
											/>
										{/if}
									</button>
								{/if}
								<button
									on:click|stopPropagation
									on:click="{() => gotoCourse('/lesson')}"
									class="line-clamp-1 truncate rounded-md dark:bg-white/10 px-4 py-2 outline outline-[1.5px] dark:outline-white/20 outline-black/25 transition dark:hover:bg-white/20 sm:w-full sm:flex-1 sm:px-0"
								>
									{progressRecord.status === 'Completed'
										? 'Open Course'
										: progressRecord.status === 'In Progress'
											? 'Continue Course'
											: 'Start Course'}
								</button>
							</div>
						</div>
					{/if}
				{/each}
				<div class="w-full space-y-2">
					<h1 class="text-base leading-relaxed">{course.title}</h1>
					{#if course.description}
						<h3 class="leading-relaxed dark:text-white/50">{course.description}</h3>
					{/if}
				</div>
			</div>
			{#each $lessons as lesson (lesson.id)}
				{#if course.id === lesson.courseId}
					{#if isOpen[course.id]}
						<div
							class="flex w-full items-center justify-between gap-5 border-t-[1.5px] border-t-black/10 dark:border-t-white/10 p-5"
						>
							<div class="flex items-center gap-3">
								<Icon class="flex-shrink-0 text-3xl text-main" icon="ph:book-open" />
								<h3 class="text-base break-all truncate line-clamp-1 text-wrap">
									{lesson.title}
								</h3>
							</div>
							<button
								on:click="{() => console.log(`Navigate to lesson: ${lesson.title}`)}"
								class="flex items-center gap-2 p-2 transition dark:text-white/50 dark:hover:text-white"
							>
								<Icon class="flex-shrink-0 text-lg" icon="ph:eye" />
								View
							</button>
						</div>
					{/if}
				{/if}
			{/each}
		</div>
	{/each}
{/if}
