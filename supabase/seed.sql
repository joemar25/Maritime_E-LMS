SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', 'd51359f0-277d-4f26-a7b8-6b2701410a9f', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"scottandrewpro@gmail.com","user_id":"a7b3e5d6-875b-44aa-949e-c36c2797643c","user_phone":""}}', '2024-05-30 05:28:35.787976+00', ''),
	('00000000-0000-0000-0000-000000000000', '0eec7a98-d5aa-46a4-8317-7d6fdf431ea6', '{"action":"user_repeated_signup","actor_id":"a7b3e5d6-875b-44aa-949e-c36c2797643c","actor_username":"scottandrewpro@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2024-05-30 05:42:16.840412+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bfc10fd5-b183-40d3-a767-3cf8d3a33ff5', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"scottandrewpro@gmail.com","user_id":"a7b3e5d6-875b-44aa-949e-c36c2797643c","user_phone":""}}', '2024-05-30 05:48:47.718892+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e810bd56-d10b-477a-9d8d-0aec8c22415e', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@gmail.com","user_id":"baa5ad77-c0d8-4953-809b-4029ac9ee02c"}}', '2024-05-30 05:48:57.356782+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a01fc0f4-1b0e-4526-8637-6bd6d270ed26', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@gmail.com","user_id":"baa5ad77-c0d8-4953-809b-4029ac9ee02c","user_phone":""}}', '2024-05-30 05:49:06.701909+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f48c21e1-1646-4725-b3e9-3c373bc31e88', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"tatadmin@email.com","user_id":"845daef6-a0bc-44c1-844a-66310dd398ff","user_phone":""}}', '2024-05-30 05:49:24.035236+00', ''),
	('00000000-0000-0000-0000-000000000000', '21b97f7a-5236-45a8-ba67-841e9315b3eb', '{"action":"login","actor_id":"845daef6-a0bc-44c1-844a-66310dd398ff","actor_username":"tatadmin@email.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-05-30 05:49:56.035159+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd843811a-260b-4a21-868c-6fba2ffea084', '{"action":"login","actor_id":"845daef6-a0bc-44c1-844a-66310dd398ff","actor_username":"tatadmin@email.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-05-30 05:52:10.302074+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c1b81a96-9f6f-4996-8866-f929517db720', '{"action":"login","actor_id":"845daef6-a0bc-44c1-844a-66310dd398ff","actor_username":"tatadmin@email.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-05-30 05:57:13.68452+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '845daef6-a0bc-44c1-844a-66310dd398ff', 'authenticated', 'authenticated', 'tatadmin@email.com', '$2a$10$gBzUHw89glJByBhXj.kuOu/rvD.0fYpYgNXOFbUUwvk.gzvlDLWO6', '2024-05-30 05:49:24.03623+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-05-30 05:57:13.685404+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-05-30 05:49:24.033594+00', '2024-05-30 05:57:13.688306+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('845daef6-a0bc-44c1-844a-66310dd398ff', '845daef6-a0bc-44c1-844a-66310dd398ff', '{"sub": "845daef6-a0bc-44c1-844a-66310dd398ff", "email": "tatadmin@email.com", "email_verified": false, "phone_verified": false}', 'email', '2024-05-30 05:49:24.034495+00', '2024-05-30 05:49:24.034545+00', '2024-05-30 05:49:24.034545+00', 'fad6e36f-913f-463f-a0f7-dc002f8ccdc2');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('2e8ab84f-5b42-4e0a-8eed-ff9af0e85f9b', '845daef6-a0bc-44c1-844a-66310dd398ff', '2024-05-30 05:49:56.035809+00', '2024-05-30 05:49:56.035809+00', NULL, 'aal1', NULL, NULL, 'node', '103.200.32.24', NULL),
	('02b5c077-4ded-4444-8c37-23baac372f41', '845daef6-a0bc-44c1-844a-66310dd398ff', '2024-05-30 05:52:10.30305+00', '2024-05-30 05:52:10.30305+00', NULL, 'aal1', NULL, NULL, 'node', '103.225.139.222', NULL),
	('42c9b484-85b6-4f12-9b41-35293d7153b2', '845daef6-a0bc-44c1-844a-66310dd398ff', '2024-05-30 05:57:13.685477+00', '2024-05-30 05:57:13.685477+00', NULL, 'aal1', NULL, NULL, 'node', '103.225.139.222', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('2e8ab84f-5b42-4e0a-8eed-ff9af0e85f9b', '2024-05-30 05:49:56.041729+00', '2024-05-30 05:49:56.041729+00', 'password', '31153f22-2aea-4087-a83a-4c1c216faa49'),
	('02b5c077-4ded-4444-8c37-23baac372f41', '2024-05-30 05:52:10.306698+00', '2024-05-30 05:52:10.306698+00', 'password', '11bc2c68-338e-45b3-991a-6166018956de'),
	('42c9b484-85b6-4f12-9b41-35293d7153b2', '2024-05-30 05:57:13.688948+00', '2024-05-30 05:57:13.688948+00', 'password', 'd59dc1d7-6436-4b14-9a57-be6c5b059cd0');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 1, 'xKecJTSiW0QBNdk9mcY1Qw', '845daef6-a0bc-44c1-844a-66310dd398ff', false, '2024-05-30 05:49:56.036929+00', '2024-05-30 05:49:56.036929+00', NULL, '2e8ab84f-5b42-4e0a-8eed-ff9af0e85f9b'),
	('00000000-0000-0000-0000-000000000000', 2, 'EVuGrNphCCl_ot1sW7_Zhg', '845daef6-a0bc-44c1-844a-66310dd398ff', false, '2024-05-30 05:52:10.304165+00', '2024-05-30 05:52:10.304165+00', NULL, '02b5c077-4ded-4444-8c37-23baac372f41'),
	('00000000-0000-0000-0000-000000000000', 3, '4EAiRGV-QVqa5Mqs5m7BeQ', '845daef6-a0bc-44c1-844a-66310dd398ff', false, '2024-05-30 05:57:13.686974+00', '2024-05-30 05:57:13.686974+00', NULL, '42c9b484-85b6-4f12-9b41-35293d7153b2');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: admin_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("user_id", "username", "first_name", "last_name", "email", "role", "profile_url", "bg_img_url", "created_at") VALUES
	(1, 'user1', 'John', 'Doe', 'john.doe@example.com', 'instructor', 'http://example.com/profile1', 'http://example.com/bg1', '2024-05-29 13:54:05.694408'),
	(2, 'user2', 'Jane', 'Smith', 'jane.smith@example.com', 'instructor', 'http://example.com/profile2', 'http://example.com/bg2', '2024-05-29 13:54:05.694408'),
	(3, 'user3', 'Alice', 'Johnson', 'alice.johnson@example.com', 'instructor', 'http://example.com/profile3', 'http://example.com/bg3', '2024-05-29 13:54:05.694408');


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."courses" ("course_id", "title", "description", "instructor_id", "profile_url", "bg_img_url", "source", "created_at", "updated_at") VALUES
	(1, 'Mathematics', 'Introduction to calculus', 1, 'http://example.com/profile1', 'http://example.com/bg1', 'Source1', '2024-05-29 13:54:05.694408', '2024-05-29 13:54:05.694408'),
	(2, 'History', 'World history overview', 2, 'http://example.com/profile2', 'http://example.com/bg2', 'Source2', '2024-05-29 13:54:05.694408', '2024-05-29 13:54:05.694408'),
	(3, 'Computer Science', 'Introduction to programming', 3, 'http://example.com/profile3', 'http://example.com/bg3', 'Source3', '2024-05-29 13:54:05.694408', '2024-05-29 13:54:05.694408');


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: backup_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: branding; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: course_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: course_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: forums; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: glossary; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: imported_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: performance_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: progress; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: support_services; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: surveys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: survey_responses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: system_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ticket_responses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") VALUES
	('storage', 'storage', NULL, '2024-05-27 12:55:01.051652+00', '2024-05-27 12:55:01.051652+00', false, false, NULL, NULL, NULL);


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 3, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: admin_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."admin_settings_setting_id_seq"', 1, false);


--
-- Name: assignments_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."assignments_assignment_id_seq"', 1, false);


--
-- Name: attachments_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."attachments_attachment_id_seq"', 1, false);


--
-- Name: backup_logs_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."backup_logs_backup_id_seq"', 1, false);


--
-- Name: branding_branding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."branding_branding_id_seq"', 1, false);


--
-- Name: chats_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."chats_chat_id_seq"', 1, false);


--
-- Name: course_materials_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."course_materials_material_id_seq"', 1, false);


--
-- Name: course_tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."course_tags_tag_id_seq"', 1, false);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."courses_course_id_seq"', 3, true);


--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."enrollments_enrollment_id_seq"', 1, false);


--
-- Name: forums_forum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."forums_forum_id_seq"', 1, false);


--
-- Name: glossary_term_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."glossary_term_id_seq"', 1, false);


--
-- Name: grades_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."grades_grade_id_seq"', 1, false);


--
-- Name: imported_courses_imported_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."imported_courses_imported_course_id_seq"', 1, false);


--
-- Name: lessons_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."lessons_lesson_id_seq"', 1, false);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."notifications_notification_id_seq"', 1, false);


--
-- Name: performance_evaluation_evaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."performance_evaluation_evaluation_id_seq"', 1, false);


--
-- Name: posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."posts_post_id_seq"', 1, false);


--
-- Name: progress_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."progress_progress_id_seq"', 1, false);


--
-- Name: subjects_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."subjects_subject_id_seq"', 1, false);


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."submissions_submission_id_seq"', 1, false);


--
-- Name: support_services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."support_services_service_id_seq"', 1, false);


--
-- Name: survey_responses_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."survey_responses_response_id_seq"', 1, false);


--
-- Name: surveys_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."surveys_survey_id_seq"', 1, false);


--
-- Name: system_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."system_logs_log_id_seq"', 1, false);


--
-- Name: ticket_responses_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."ticket_responses_response_id_seq"', 1, false);


--
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."tickets_ticket_id_seq"', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."users_user_id_seq"', 3, true);


--
-- Name: wikis_wiki_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."wikis_wiki_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
