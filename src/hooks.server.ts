// file: src/hooks.server.ts
import { PUBLIC_SUPABASE_ANON_KEY, PUBLIC_SUPABASE_URL } from '$env/static/public';
import { createServerClient } from '@supabase/ssr';
import { type Handle, redirect } from '@sveltejs/kit';
import { sequence } from '@sveltejs/kit/hooks';

export const supabase: Handle = async ({ event, resolve }) => {
	event.locals.supabase = createServerClient(PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY, {
		cookies: {
			get: (key) => event.cookies.get(key),
			set: (key, value, options) => {
				event.cookies.set(key, value, { ...options, path: '/' });
			},
			remove: (key, options) => {
				event.cookies.delete(key, { ...options, path: '/' });
			},
		},
	});

	event.locals.safeGetSession = async () => {
		const {
			data: { session },
		} = await event.locals.supabase.auth.getSession();
		if (!session) {
			return { session: null, user: null };
		}

		const {
			data: { user },
			error,
		} = await event.locals.supabase.auth.getUser();
		if (error) {
			return { session: null, user: null };
		}

		return { session, user };
	};

	const response = await resolve(event, {
		filterSerializedResponseHeaders(name) {
			return name === 'content-range' || name === 'x-supabase-api-version';
		},
	});

	return response;
};

const authGuard: Handle = async ({ event, resolve }) => {
	const { session } = await event.locals.safeGetSession();
	event.locals.session = session;
	// event.locals.user = user;

	if (!session && event.url.pathname === '/') {
		// Store the originally requested path in a cookie
		event.cookies.set('redirectAfterLogin', event.url.pathname, { path: '/' });
		throw redirect(303, '/login');
	}

	// Allow access to /signup and /login without redirection
	if (event.url.pathname === '/signup' || event.url.pathname === '/login') {
		return resolve(event);
	}

	// Redirect authenticated users away from /login to the originally requested path or home if none
	if (session && event.url.pathname === '/login') {
		const redirectPath = event.cookies.get('redirectAfterLogin') || '/';
		event.cookies.delete('redirectAfterLogin', { path: '/' });
		throw redirect(303, redirectPath);
	}
	return resolve(event);
};

export const handle: Handle = sequence(supabase, authGuard);
