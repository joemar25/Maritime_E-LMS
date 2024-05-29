<script>
	import { BrowserThemeStore } from '$lib/theme';
	import '../../../app.css';
</script>

<div
	class="mx-auto h-screen max-w-[2560px] font-circular text-sm antialiased overflow-hidden {$BrowserThemeStore}"
>
	<slot />
</div>
