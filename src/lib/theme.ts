import { browser } from '$app/environment';
import { derived, readable, writable } from 'svelte/store';

export const Themes = ['light', 'dark', 'Default'] as const;
export const BrowserThemes = ['light', 'dark'] as const;

export const CurrentThemeStore = writable<(typeof Themes)[number]>('Default', (set) => {
	if (!browser) {
		return;
	}

	const cachedTheme = localStorage.getItem('theme');

	if (!cachedTheme) {
		return;
	}

	if (cachedTheme === 'light' || cachedTheme === 'dark' || cachedTheme === 'Default') {
		set(cachedTheme);

		return;
	}

	localStorage.setItem('theme', 'Default');
});

export function setCurrentTheme(theme: (typeof Themes)[number]) {
	CurrentThemeStore.set(theme);
	localStorage.setItem('theme', theme);
}

export const ThemeQueryStore = readable(false, (set) => {
	if (!browser) {
		return;
	}

	const darkModeMediaQuery = window.matchMedia('(prefers-color-scheme: dark)');

	set(darkModeMediaQuery.matches);

	darkModeMediaQuery.addEventListener('change', (event) => {
		set(event.matches);
	});
});

export const BrowserThemeStore = derived<
	[typeof CurrentThemeStore, typeof ThemeQueryStore],
	(typeof BrowserThemes)[number]
>([CurrentThemeStore, ThemeQueryStore], ([currentTheme, themeQuery], set) => {
	if (!browser) {
		set('light');

		return;
	}

	console.log(themeQuery, currentTheme);

	const mediaTheme: (typeof BrowserThemes)[number] = themeQuery ? 'dark' : 'light';

	set(currentTheme === 'Default' ? mediaTheme : currentTheme);
});
