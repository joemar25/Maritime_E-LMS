<script>
	import { goto } from '$app/navigation';
	import Icon from '@iconify/svelte';
	import { onMount } from 'svelte';

	import { quintOut } from 'svelte/easing';
	import { scale, slide } from 'svelte/transition';

	let isMounted = false;
	let username = '';
	let password = '';

	let isLoading = false;
	let isUsernameValid = false;
	let isPasswordValid = false;

	let isFormSubmitted = false;
	let loginError = false;

	$: isUsernameValid = username.length >= 3 && !/\s/.test(username);
	$: isPasswordValid = password.length >= 8;

	onMount(() => {
		isMounted = true;
	});

	function submitForm() {
		isFormSubmitted = true;
	}
</script>

<main
	class="flex flex-col items-center justify-between px-5 py-10 h-dvh dark:bg-dark dark:text-white"
>
	<img
		aria-hidden="true"
		style="width: 110px;"
		class="transition cursor-pointer hover:opacity-80"
		src="/assets/logo.svg"
		alt="Logo"
	/>
	{#if isMounted}
		<div
			transition:scale={{ duration: 500, opacity: 0.001, start: 0.98 }}
			class="flex w-[500px] flex-col gap-5 sm:w-full"
		>
			<div class="w-full space-y-1">
				<h2 class="text-xl text-balance">Welcome to Maritime_E-LMS</h2>
				<h3 class="text-base text-black text-balance dark:text-white/50">
					Please login to your account.
				</h3>
			</div>

			{#if loginError}
				<h3 in:slide={{ duration: 300, easing: quintOut }} class="text-red-400 text-balance">
					Login failed. Please check your credentials and try again.
				</h3>
			{/if}

			<form class="flex flex-col gap-4" on:submit|preventDefault>
				<input
					bind:value={username}
					class={!isUsernameValid && isFormSubmitted
						? 'rounded-md dark:bg-red-400/5 p-2 text-red-400 outline outline-[1.5px] outline-red-400/10 transition-all placeholder:text-red-400/50 focus:outline-red-400/20'
						: 'rounded-md dark:bg-white/5 bg-black/5 p-2 outline outline-[1.5px] dark:outline-white/10 outline-black/10 transition-all dark:placeholder:text-white/50 placeholder:text-black/50 dark:focus:outline-white/20 focus:outline-black/20'}
					placeholder="username"
					type="text"
				/>
				{#if !isUsernameValid && isFormSubmitted}
					<h3 in:slide={{ duration: 300, easing: quintOut }} class="text-red-400 text-balance">
						Username must be 3+ characters and cannot contain spaces
					</h3>
				{/if}

				<input
					bind:value={password}
					class={!isPasswordValid && isFormSubmitted
						? 'rounded-md bg-red-400/5 p-2 text-red-400 outline outline-[1.5px] outline-red-400/10 transition-all placeholder:text-red-400/50 focus:outline-red-400/20'
						: 'rounded-md dark:bg-white/5 bg-black/5 p-2 outline outline-[1.5px] dark:outline-white/10 outline-black/10 transition-all dark:placeholder:text-white/50 placeholder:text-black/50 dark:focus:outline-white/20 focus:outline-black/20'}
					placeholder="password"
					type="password"
				/>
				{#if !isPasswordValid && isFormSubmitted}
					<h3 in:slide={{ duration: 300, easing: quintOut }} class="text-red-400 text-balance">
						Password must be 8+ characters
					</h3>
				{/if}
				<button
					on:click={() => (isLoading = true)}
					class={isLoading
						? 'bg-main text-white pointer-events-none flex items-center justify-center gap-2 rounded-md p-2 opacity-50'
						: 'bg-main text-white hover:bg-main/80 flex items-center justify-center gap-2 rounded-md p-2 transition'}
				>
					{#if isLoading}
						Logging in
						<Icon
							class="flex-shrink-0 text-base animate-spin"
							icon="fluent:spinner-ios-16-regular"
						/>
					{:else}
						Login
						<Icon class="flex-shrink-0 text-base" icon="ph:arrow-right" />
					{/if}
				</button>
			</form>
			<button on:click={() => goto('/')} class="mx-auto w-fit dark:text-white/50">
				Logged in already?
				<span class="text-black underline transition dark:text-white dark:hover:text-white/80"
					>My Courses</span
				>
			</button>
		</div>
	{/if}
	<p class="text-center text-balance dark:text-white/50">
		Copyright © {new Date().getFullYear()}
		Maritime_E-LMS
	</p>
</main>
