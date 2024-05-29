<script lang="ts">
	import Icon from '@iconify/svelte';
</script>

<div class="flex items-center gap-3 sm:w-full sm:flex-col">
	<button
		class="line-clamp-1 flex items-center justify-center gap-2 truncate rounded-md bg-white/10 px-4 py-2 outline outline-[1.5px] outline-white/20 transition hover:bg-white/20 sm:order-last sm:w-full"
	>
		<Icon class="flex-shrink-0" icon="ph:arrow-left" />
		Previous Lesson
	</button>

	<button
		class="flex items-center justify-center gap-2 px-4 py-2 truncate transition rounded-md line-clamp-1 bg-main hover:bg-main/80 sm:order-first sm:w-full"
	>
		Next Lesson
		<Icon class="flex-shrink-0" icon="ph:arrow-right" />
	</button>
</div>
