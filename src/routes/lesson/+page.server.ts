import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: users } = await supabase.from('users').select('id');

	console.log(users);

	return {};
};
