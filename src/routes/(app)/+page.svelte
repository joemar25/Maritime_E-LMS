<script lang="ts">
	import { courses, isLoading, isSidebarVisible, lessons } from '$lib/store';
	import Icon from '@iconify/svelte';
	import { tick } from 'svelte';

	let isOpen: { [key: string]: boolean } = {};
	let loading: { [key: string]: boolean } = {};
	let openCourseId = '';
	let enableReactivity = true;

	// only courses that match a progress record with "In Progress" status are set to open
	// $: if (enableReactivity) {
	// 	$progress.forEach((progressRecord) => {
	// 		if (progressRecord.status === 'In Progress') {
	// 			isOpen[progressRecord.course] = true;
	// 		}
	// 	});
	// }

	// scroll into view of open courses
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

	// function to toggle opening & closing a course
	const toggleCourse = (courseId: string) => {
		isOpen[courseId] = !isOpen[courseId];
		openCourseId = courseId;
	};

	// function to navigate to the first lesson of a course and update the status to "In Progress"
	// async function goToFirstLessonOfCourse(courseId: string) {
	// 	const progressRecord = $progress.find((progressRecord) => progressRecord.course === courseId);

	// 	if (progressRecord.status === 'Not Started') {
	// 		const updatedProgressRecord = await updateProgressStatus(progressRecord.id, 'In Progress');
	// 		if (updatedProgressRecord) {
	// 			await tick();
	// 			$progress = $progress.map((progressRecord) => {
	// 				if (progressRecord.course === courseId) {
	// 					return { ...progressRecord, status: 'In Progress' };
	// 				}
	// 				return progressRecord;
	// 			});
	// 		}
	// 	}

	// 	const lessonsByCourse = getStoredLessons();
	// 	const currentLesson = lessonsByCourse[courseId];

	// 	if (currentLesson) {
	// 		navigate(`/${slugify(currentLesson.title, { lower: true, strict: true })}`);
	// 	} else {
	// 		const firstLesson = $lessons.find((lesson) => lesson.course === courseId);
	// 		if (firstLesson) {
	// 			navigate(`/${slugify(firstLesson.title, { lower: true, strict: true })}`);

	// 			lessonsByCourse[courseId] = firstLesson;
	// 			storeLessons(lessonsByCourse);
	// 		}
	// 	}
	// }

	// function to reset the status of a course back to "Not Started"
	// async function resetProgress(courseId: string) {
	// 	const progressRecord = $progress.find((progressRecord) => progressRecord.course === courseId);

	// 	if (progressRecord.status === 'Completed' || progressRecord.status === 'In Progress') {
	// 		loading[courseId] = true;
	// 		const updatedProgressRecord = await updateProgressStatus(progressRecord.id, 'Not Started');

	// 		if (!updatedProgressRecord) {
	// 			loading[courseId] = false;
	// 		}

	// 		if (updatedProgressRecord) {
	// 			await tick();

	// 			$progress = $progress.map((progressRecord) => {
	// 				if (progressRecord.course === courseId) {
	// 					return { ...progressRecord, status: 'Not Started' };
	// 				}
	// 				return progressRecord;
	// 			});

	// 			openCourseId = '';
	// 			enableReactivity = false;
	// 			loading[courseId] = false;
	// 			isOpen[courseId] = false;

	// 			const lessonsByCourse = getStoredLessons();
	// 			delete lessonsByCourse[courseId];
	// 			storeLessons(lessonsByCourse);
	// 		}
	// 	}
	// }
</script>

<section class="flex flex-col flex-1 gap-5 p-5 overflow-y-scroll dark:bg-dark">
	<div class="flex items-center justify-between w-full gap-5 sm:flex-col sm:items-start">
		<div class="flex items-center gap-3">
			<button
				on:click={() => isSidebarVisible.update((value) => !value)}
				class="flex items-center justify-center p-2 text-xl transition bg-transparent rounded-full group hover:bg-white/10"
			>
				<Icon
					class="flex-shrink-0 transition dark:text-white/50 dark:group-hover:text-white"
					icon="ph:list"
				/>
			</button>
			<h1 class="flex items-center gap-2 text-base">
				<Icon class="flex-shrink-0" icon="ph:graduation-cap" />
				My Courses
			</h1>
		</div>
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
	</div>

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
				id={course.id}
				class={isOpen[course.id]
					? 'w-full rounded-md outline outline-[1.5px] dark:outline-white/20 outline-black/20 transition-all dark:hover:outline-white/20'
					: 'w-full rounded-md outline outline-[1.5px] dark:outline-white/10 outline-black/10 transition-all dark:hover:outline-white/20'}
			>
				<div
					aria-hidden="true"
					on:click={() => toggleCourse(course.id)}
					class={isOpen[course.id]
						? 'w-full cursor-pointer space-y-5 rounded-b-none rounded-t-md bg-white/5 dark:bg-white/5 p-5'
						: 'w-full cursor-pointer space-y-5 rounded-md bg-white/5 dark:bg-white/5 p-5'}
				>
					<div class="w-full space-y-2">
						<h1 class="text-base leading-relaxed">{course.title}</h1>
						{#if course.description}
							<h3 class="leading-relaxed dark:text-white/50">
								{course.description}
							</h3>
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
									on:click={() => console.log(`Navigate to lesson: ${lesson.title}`)}
									class="flex items-center gap-2 p-2 transition dark:text-white/50 dark:hover:text-white"
								>
									<Icon class="flex-shrink-0 text-lg" icon="ph:eye" />
									{'view'}
								</button>
							</div>
						{/if}
					{/if}
				{/each}
			</div>
		{/each}
	{/if}
</section>
