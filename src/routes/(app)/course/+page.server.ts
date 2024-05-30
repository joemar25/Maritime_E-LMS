// import type { PageServerLoad } from './$types';

// import type { Actions } from './$types';

// export const load: PageServerLoad = async ({ locals: { supabase } }) => {
// 	const data = await supabase.from('courses').select('*').limit(5).order('title');

//     console.log(data);
// 	return {};
// };

// export const actions: Actions = {
// 	default: async ({ request, locals: { supabase } }) => {
// 		const { email, password } = Object.fromEntries(await request.formData()) as {
// 			email: string;
// 			password: string;
// 		};

// 		const { data, error } = await supabase.auth.signInWithPassword({
// 			email,
// 			password,
// 		});

// 		console.log(data, error);

// 		return {
// 			status: 200,
// 		};
// 	},
// };
