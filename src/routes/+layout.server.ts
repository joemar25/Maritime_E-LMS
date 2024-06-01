import type { LayoutServerLoad } from './$types';

export const load: LayoutServerLoad = async ({ locals: { session /*, supabase */ } }) => {
	// const { data: kamote } = await supabase.from('users').select('*');
	return {
		session /*, kamote */,
	};
};
