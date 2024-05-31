// import type { PageServerLoad } from './$types';

// export const load: PageServerLoad = async ({ depends, locals: { supabase } }) => {
// 	depends('supabase:db:lessons');
// 	const { data: lessons } = await supabase.from('lessons').select('*').order('id');
// 	return { lessons: lessons ?? [] };
// };
