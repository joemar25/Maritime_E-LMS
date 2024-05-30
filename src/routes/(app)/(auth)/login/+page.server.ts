import { redirect } from '@sveltejs/kit';
import type { Actions } from './$types';

export const actions: Actions = {
	default: async ({ request, locals: { supabase } }) => {
		const { email, password } = Object.fromEntries(await request.formData()) as {
			email: string;
			password: string;
		};

		const { data, error } = await supabase.auth.signInWithPassword({
			email,
			password,
		});

		console.log(data, error);

		if (error) {
			return redirect(302, '/login');
		}

		return redirect(303, '/');
	},
};
