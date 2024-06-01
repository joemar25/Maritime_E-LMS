import { redirect } from '@sveltejs/kit';
import type { Actions } from './$types';

export const actions: Actions = {
	default: async ({ request, locals: { supabase } }) => {
		const { email, password, name, bio, contact_number, address, date_of_birth, gender } =
			Object.fromEntries(await request.formData()) as {
				email: string;
				password: string;
				name: string;
				bio: string;
				contact_number: string;
				address: string;
				date_of_birth: string;
				gender: string;
			};

		const { data: signUpData, error: signUpError } = await supabase.auth.signUp({
			email,
			password,
		});

		if (signUpError) {
			return redirect(303, '/signup');
		} else {
			const { error: updateError } = await supabase
				.from('users')
				.update({
					name,
					bio,
					contact_number,
					address,
					date_of_birth,
					gender,
				})
				.eq('email', signUpData.user?.email);

			if (updateError) {
				return redirect(303, '/signup');
			} else {
				return redirect(303, '/');
			}
		}
	},
};
