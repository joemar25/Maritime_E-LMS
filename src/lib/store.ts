import { writable } from 'svelte/store';

// Define the type for a course
interface Course {
	id: string;
	title: string;
	description: string;
}

// Define the type for a resource
interface Resource {
	id: string;
	name: string;
	link: string;
}

// Define the type for a lesson
interface Lesson {
	id: string;
	courseId: string;
	title: string;
	content: string;
}

// loading placeholders
export const isLoading = writable(false);
export const isSidebarVisible = writable(true);

// search component visibility
export const isSearchVisible = writable(false);

// notifications alert UI
interface Alert {
	show: boolean;
	message: string;
	type: string;
}
export const alert = writable<Alert>({ show: false, message: '', type: '' });

// courses store with real-world courses and descriptions
export const courses = writable<Course[]>([
	{
		id: '1',
		title: 'Introduction to Programming',
		description: 'Learn the basics of programming using Python. Perfect for beginners.'
	},
	{
		id: '2',
		title: 'Web Development Bootcamp',
		description:
			'A comprehensive course on full-stack web development with HTML, CSS, and JavaScript.'
	},
	{
		id: '3',
		title: 'Data Science with Python',
		description:
			'Dive into data analysis and machine learning with Python. Ideal for aspiring data scientists.'
	},
	{
		id: '4',
		title: 'UX/UI Design Principles',
		description: 'Understand the fundamentals of user experience and user interface design.'
	},
	{
		id: '5',
		title: 'Digital Marketing 101',
		description: 'Learn the strategies and tools of digital marketing to promote businesses online.'
	},
	{
		id: '6',
		title: 'Cybersecurity Basics',
		description:
			'Get introduced to the essentials of cybersecurity and how to protect systems and data.'
	},
	{
		id: '7',
		title: 'Mobile App Development',
		description: 'Create mobile applications for Android and iOS using modern frameworks.'
	},
	{
		id: '8',
		title: 'Cloud Computing with AWS',
		description:
			'Explore cloud computing concepts and AWS services for building scalable applications.'
	},
	{
		id: '9',
		title: 'Blockchain and Cryptocurrency',
		description:
			'Understand the technology behind blockchain and its applications in cryptocurrency.'
	},
	{
		id: '10',
		title: 'Artificial Intelligence',
		description:
			'An introductory course on AI, covering key concepts and practical implementations.'
	}
]);

// resources store with dummy data
export const resources = writable<Resource[]>([
	{ id: '1', name: 'Resource 1', link: 'https://example.com/resource1' },
	{ id: '2', name: 'Resource 2', link: 'https://example.com/resource2' },
	{ id: '3', name: 'Resource 3', link: 'https://example.com/resource3' },
	{ id: '4', name: 'Resource 4', link: 'https://example.com/resource4' },
	{ id: '5', name: 'Resource 5', link: 'https://example.com/resource5' },
	{ id: '6', name: 'Resource 6', link: 'https://example.com/resource6' },
	{ id: '7', name: 'Resource 7', link: 'https://example.com/resource7' },
	{ id: '8', name: 'Resource 8', link: 'https://example.com/resource8' },
	{ id: '9', name: 'Resource 9', link: 'https://example.com/resource9' },
	{ id: '10', name: 'Resource 10', link: 'https://example.com/resource10' }
]);

// lessons store with dummy data
export const lessons = writable<Lesson[]>([
	{
		id: '1',
		courseId: '1',
		title: 'Lesson 1: Getting Started with Python',
		content: 'Introduction to Python programming language.'
	},
	{
		id: '2',
		courseId: '1',
		title: 'Lesson 2: Variables and Data Types',
		content: 'Understanding variables and data types in Python.'
	},
	{
		id: '3',
		courseId: '2',
		title: 'Lesson 1: Introduction to HTML',
		content: 'Basics of HTML and its structure.'
	},
	{
		id: '4',
		courseId: '2',
		title: 'Lesson 2: CSS Fundamentals',
		content: 'Styling web pages using CSS.'
	},
	{
		id: '5',
		courseId: '3',
		title: 'Lesson 1: Data Analysis with Pandas',
		content: 'Using Pandas library for data analysis.'
	},
	{
		id: '6',
		courseId: '3',
		title: 'Lesson 2: Data Visualization with Matplotlib',
		content: 'Creating visualizations using Matplotlib.'
	},
	{
		id: '7',
		courseId: '4',
		title: 'Lesson 1: UX Design Basics',
		content: 'Fundamentals of user experience design.'
	},
	{
		id: '8',
		courseId: '4',
		title: 'Lesson 2: UI Design Principles',
		content: 'Principles of designing user interfaces.'
	},
	{
		id: '9',
		courseId: '5',
		title: 'Lesson 1: Introduction to Digital Marketing',
		content: 'Overview of digital marketing strategies.'
	},
	{
		id: '10',
		courseId: '5',
		title: 'Lesson 2: Social Media Marketing',
		content: 'Promoting businesses on social media platforms.'
	}
]);

// let timeout = null;
// let timeoutEnabled = true;

// export function showAlert(message, type) {
// 	alert.set({ show: true, message, type });

// 	if (timeoutEnabled) {
// 		timeoutEnabled = false;
// 		timeout = setTimeout(() => {
// 			alert.set({ show: false, message: '', type: '' });
// 			timeoutEnabled = true;
// 		}, 5000);
// 	}
// }

// export function closeAlert() {
// 	alert.set({ show: false, message: '', type: '' });
// 	clearTimeout(timeout);
// 	timeoutEnabled = true;
// }

// get the stored lesson pages from localStorage
// export function getStoredLessons() {
// 	const storedLessons = localStorage.getItem('lessonsByCourse');
// 	return storedLessons ? JSON.parse(storedLessons) : {};
// }

// store the lesson pages into localStorage
// export function storeLessons(lessonsByCourse) {
// 	localStorage.setItem('lessonsByCourse', JSON.stringify(lessonsByCourse));
// }

// // sidebar component visibility
// const sidebarValue = localStorage.getItem('isSidebarVisible');
// export const isSidebarVisible = writable(sidebarValue === null ? true : JSON.parse(sidebarValue));

// isSidebarVisible.subscribe((value) => {
// 	localStorage.setItem('isSidebarVisible', JSON.stringify(value));
// });

// close sidebar when window resizes to 1024px
// window.addEventListener('resize', () => {
// 	if (window.innerWidth <= 1024) {
// 		isSidebarVisible.set(false);
// 	} else {
// 		isSidebarVisible.set(true);
// 	}
// });
