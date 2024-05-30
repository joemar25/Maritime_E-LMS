
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

CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

COMMENT ON SCHEMA "public" IS 'standard public schema';

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

CREATE OR REPLACE FUNCTION "public"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$;

ALTER FUNCTION "public"."update_updated_at_column"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."admin_settings" (
    "setting_id" integer NOT NULL,
    "setting_name" character varying(255) NOT NULL,
    "setting_value" "text",
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."admin_settings" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."admin_settings_setting_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."admin_settings_setting_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."admin_settings_setting_id_seq" OWNED BY "public"."admin_settings"."setting_id";

CREATE TABLE IF NOT EXISTS "public"."assignments" (
    "assignment_id" integer NOT NULL,
    "subject_id" integer,
    "title" character varying(255) NOT NULL,
    "description" "text",
    "due_date" timestamp without time zone,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."assignments" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."assignments_assignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."assignments_assignment_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."assignments_assignment_id_seq" OWNED BY "public"."assignments"."assignment_id";

CREATE TABLE IF NOT EXISTS "public"."attachments" (
    "attachment_id" bigint NOT NULL,
    "assignment_id" bigint,
    "file_name" character varying(255) NOT NULL,
    "file_path" character varying(255) NOT NULL,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."attachments" OWNER TO "postgres";

ALTER TABLE "public"."attachments" ALTER COLUMN "attachment_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."attachments_attachment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."backup_logs" (
    "backup_id" integer NOT NULL,
    "backup_date" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "backup_status" character varying(255),
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."backup_logs" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."backup_logs_backup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."backup_logs_backup_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."backup_logs_backup_id_seq" OWNED BY "public"."backup_logs"."backup_id";

CREATE TABLE IF NOT EXISTS "public"."branding" (
    "branding_id" integer NOT NULL,
    "logo_url" character varying(255),
    "primary_color" character varying(255),
    "secondary_color" character varying(255),
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."branding" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."branding_branding_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."branding_branding_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."branding_branding_id_seq" OWNED BY "public"."branding"."branding_id";

CREATE TABLE IF NOT EXISTS "public"."chats" (
    "chat_id" integer NOT NULL,
    "sender_id" integer,
    "receiver_id" integer,
    "message" "text",
    "sent_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."chats" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."chats_chat_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."chats_chat_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."chats_chat_id_seq" OWNED BY "public"."chats"."chat_id";

CREATE TABLE IF NOT EXISTS "public"."course_materials" (
    "material_id" integer NOT NULL,
    "course_id" integer,
    "title" character varying(255) NOT NULL,
    "description" "text",
    "file_path" character varying(255),
    "image_url" character varying(255),
    "uploaded_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."course_materials" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."course_materials_material_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."course_materials_material_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."course_materials_material_id_seq" OWNED BY "public"."course_materials"."material_id";

CREATE TABLE IF NOT EXISTS "public"."course_tags" (
    "tag_id" integer NOT NULL,
    "course_id" integer,
    "tag_name" character varying(255)
);

ALTER TABLE "public"."course_tags" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."course_tags_tag_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."course_tags_tag_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."course_tags_tag_id_seq" OWNED BY "public"."course_tags"."tag_id";

CREATE TABLE IF NOT EXISTS "public"."courses" (
    "course_id" integer NOT NULL,
    "title" character varying(255) NOT NULL,
    "description" "text",
    "instructor_id" integer,
    "profile_url" character varying(255),
    "bg_img_url" character varying(255),
    "source" character varying(255),
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."courses" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."courses_course_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."courses_course_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."courses_course_id_seq" OWNED BY "public"."courses"."course_id";

CREATE TABLE IF NOT EXISTS "public"."enrollments" (
    "enrollment_id" integer NOT NULL,
    "user_id" integer,
    "course_id" integer,
    "enrollment_date" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."enrollments" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."enrollments_enrollment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."enrollments_enrollment_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."enrollments_enrollment_id_seq" OWNED BY "public"."enrollments"."enrollment_id";

CREATE TABLE IF NOT EXISTS "public"."forums" (
    "forum_id" integer NOT NULL,
    "course_id" integer,
    "title" character varying(255) NOT NULL,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."forums" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."forums_forum_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."forums_forum_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."forums_forum_id_seq" OWNED BY "public"."forums"."forum_id";

CREATE TABLE IF NOT EXISTS "public"."glossary" (
    "term_id" integer NOT NULL,
    "term" character varying(255) NOT NULL,
    "definition" "text",
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."glossary" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."glossary_term_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."glossary_term_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."glossary_term_id_seq" OWNED BY "public"."glossary"."term_id";

CREATE TABLE IF NOT EXISTS "public"."grades" (
    "grade_id" integer NOT NULL,
    "submission_id" integer,
    "grade" numeric(5,2),
    "feedback" "text",
    "graded_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."grades" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."grades_grade_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."grades_grade_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."grades_grade_id_seq" OWNED BY "public"."grades"."grade_id";

CREATE TABLE IF NOT EXISTS "public"."imported_courses" (
    "imported_course_id" integer NOT NULL,
    "course_id" integer,
    "platform_name" character varying(255),
    "import_date" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."imported_courses" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."imported_courses_imported_course_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."imported_courses_imported_course_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."imported_courses_imported_course_id_seq" OWNED BY "public"."imported_courses"."imported_course_id";

CREATE TABLE IF NOT EXISTS "public"."lessons" (
    "lesson_id" integer NOT NULL,
    "subject_id" integer,
    "title" character varying(255) NOT NULL,
    "content" "text",
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."lessons" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."lessons_lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."lessons_lesson_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."lessons_lesson_id_seq" OWNED BY "public"."lessons"."lesson_id";

CREATE TABLE IF NOT EXISTS "public"."notifications" (
    "notification_id" integer NOT NULL,
    "user_id" integer,
    "message" "text",
    "read_status" boolean DEFAULT false,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."notifications" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."notifications_notification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."notifications_notification_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."notifications_notification_id_seq" OWNED BY "public"."notifications"."notification_id";

CREATE TABLE IF NOT EXISTS "public"."performance_evaluation" (
    "evaluation_id" integer NOT NULL,
    "user_id" integer,
    "course_id" integer,
    "evaluator_id" integer,
    "score" numeric(5,2),
    "feedback" "text",
    "evaluated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."performance_evaluation" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."performance_evaluation_evaluation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."performance_evaluation_evaluation_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."performance_evaluation_evaluation_id_seq" OWNED BY "public"."performance_evaluation"."evaluation_id";

CREATE TABLE IF NOT EXISTS "public"."posts" (
    "post_id" integer NOT NULL,
    "forum_id" integer,
    "user_id" integer,
    "content" "text",
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."posts" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."posts_post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."posts_post_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."posts_post_id_seq" OWNED BY "public"."posts"."post_id";

CREATE TABLE IF NOT EXISTS "public"."progress" (
    "progress_id" bigint NOT NULL,
    "user_id" bigint,
    "course_id" bigint,
    "completed_lessons" integer,
    "total_lessons" integer,
    "progress_percentage" numeric(5,2),
    "status" character varying(50) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "progress_status_check" CHECK ((("status")::"text" = ANY ((ARRAY['completed'::character varying, 'in progress'::character varying, 'not completed'::character varying])::"text"[])))
);

ALTER TABLE "public"."progress" OWNER TO "postgres";

ALTER TABLE "public"."progress" ALTER COLUMN "progress_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."progress_progress_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."subjects" (
    "subject_id" integer NOT NULL,
    "course_id" integer,
    "title" character varying(255) NOT NULL,
    "description" "text",
    "bg_img_url" character varying(255),
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."subjects" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."subjects_subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."subjects_subject_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."subjects_subject_id_seq" OWNED BY "public"."subjects"."subject_id";

CREATE TABLE IF NOT EXISTS "public"."submissions" (
    "submission_id" integer NOT NULL,
    "assignment_id" integer,
    "user_id" integer,
    "submitted_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "content" "text"
);

ALTER TABLE "public"."submissions" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."submissions_submission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."submissions_submission_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."submissions_submission_id_seq" OWNED BY "public"."submissions"."submission_id";

CREATE TABLE IF NOT EXISTS "public"."support_services" (
    "service_id" integer NOT NULL,
    "service_name" character varying(255) NOT NULL,
    "description" "text",
    "contact_info" "text",
    "image_url" character varying(255),
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."support_services" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."support_services_service_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."support_services_service_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."support_services_service_id_seq" OWNED BY "public"."support_services"."service_id";

CREATE TABLE IF NOT EXISTS "public"."survey_responses" (
    "response_id" integer NOT NULL,
    "survey_id" integer,
    "user_id" integer,
    "response" "text",
    "submitted_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."survey_responses" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."survey_responses_response_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."survey_responses_response_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."survey_responses_response_id_seq" OWNED BY "public"."survey_responses"."response_id";

CREATE TABLE IF NOT EXISTS "public"."surveys" (
    "survey_id" integer NOT NULL,
    "title" character varying(255) NOT NULL,
    "description" "text",
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."surveys" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."surveys_survey_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."surveys_survey_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."surveys_survey_id_seq" OWNED BY "public"."surveys"."survey_id";

CREATE TABLE IF NOT EXISTS "public"."system_logs" (
    "log_id" integer NOT NULL,
    "user_id" integer,
    "action" character varying(255),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."system_logs" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."system_logs_log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."system_logs_log_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."system_logs_log_id_seq" OWNED BY "public"."system_logs"."log_id";

CREATE TABLE IF NOT EXISTS "public"."ticket_responses" (
    "response_id" integer NOT NULL,
    "ticket_id" integer,
    "user_id" integer,
    "response" "text",
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."ticket_responses" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."ticket_responses_response_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."ticket_responses_response_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."ticket_responses_response_id_seq" OWNED BY "public"."ticket_responses"."response_id";

CREATE TABLE IF NOT EXISTS "public"."tickets" (
    "ticket_id" integer NOT NULL,
    "user_id" integer,
    "subject" character varying(255) NOT NULL,
    "description" "text",
    "status" character varying(50) NOT NULL,
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "tickets_status_check" CHECK ((("status")::"text" = ANY ((ARRAY['open'::character varying, 'closed'::character varying, 'pending'::character varying])::"text"[])))
);

ALTER TABLE "public"."tickets" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."tickets_ticket_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."tickets_ticket_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."tickets_ticket_id_seq" OWNED BY "public"."tickets"."ticket_id";

CREATE TABLE IF NOT EXISTS "public"."users" (
    "user_id" integer NOT NULL,
    "username" character varying(255) NOT NULL,
    "first_name" character varying(255) NOT NULL,
    "last_name" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "role" character varying(50) NOT NULL,
    "profile_url" character varying(255),
    "bg_img_url" character varying(255),
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "users_role_check" CHECK ((("role")::"text" = ANY ((ARRAY['admin'::character varying, 'instructor'::character varying, 'student'::character varying])::"text"[])))
);

ALTER TABLE "public"."users" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."users_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."users_user_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."users_user_id_seq" OWNED BY "public"."users"."user_id";

CREATE TABLE IF NOT EXISTS "public"."wikis" (
    "wiki_id" integer NOT NULL,
    "course_id" integer,
    "title" character varying(255) NOT NULL,
    "content" "text",
    "created_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "public"."wikis" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."wikis_wiki_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."wikis_wiki_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."wikis_wiki_id_seq" OWNED BY "public"."wikis"."wiki_id";

ALTER TABLE ONLY "public"."admin_settings" ALTER COLUMN "setting_id" SET DEFAULT "nextval"('"public"."admin_settings_setting_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."assignments" ALTER COLUMN "assignment_id" SET DEFAULT "nextval"('"public"."assignments_assignment_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."backup_logs" ALTER COLUMN "backup_id" SET DEFAULT "nextval"('"public"."backup_logs_backup_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."branding" ALTER COLUMN "branding_id" SET DEFAULT "nextval"('"public"."branding_branding_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."chats" ALTER COLUMN "chat_id" SET DEFAULT "nextval"('"public"."chats_chat_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."course_materials" ALTER COLUMN "material_id" SET DEFAULT "nextval"('"public"."course_materials_material_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."course_tags" ALTER COLUMN "tag_id" SET DEFAULT "nextval"('"public"."course_tags_tag_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."courses" ALTER COLUMN "course_id" SET DEFAULT "nextval"('"public"."courses_course_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."enrollments" ALTER COLUMN "enrollment_id" SET DEFAULT "nextval"('"public"."enrollments_enrollment_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."forums" ALTER COLUMN "forum_id" SET DEFAULT "nextval"('"public"."forums_forum_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."glossary" ALTER COLUMN "term_id" SET DEFAULT "nextval"('"public"."glossary_term_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."grades" ALTER COLUMN "grade_id" SET DEFAULT "nextval"('"public"."grades_grade_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."imported_courses" ALTER COLUMN "imported_course_id" SET DEFAULT "nextval"('"public"."imported_courses_imported_course_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."lessons" ALTER COLUMN "lesson_id" SET DEFAULT "nextval"('"public"."lessons_lesson_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."notifications" ALTER COLUMN "notification_id" SET DEFAULT "nextval"('"public"."notifications_notification_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."performance_evaluation" ALTER COLUMN "evaluation_id" SET DEFAULT "nextval"('"public"."performance_evaluation_evaluation_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."posts" ALTER COLUMN "post_id" SET DEFAULT "nextval"('"public"."posts_post_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."subjects" ALTER COLUMN "subject_id" SET DEFAULT "nextval"('"public"."subjects_subject_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."submissions" ALTER COLUMN "submission_id" SET DEFAULT "nextval"('"public"."submissions_submission_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."support_services" ALTER COLUMN "service_id" SET DEFAULT "nextval"('"public"."support_services_service_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."survey_responses" ALTER COLUMN "response_id" SET DEFAULT "nextval"('"public"."survey_responses_response_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."surveys" ALTER COLUMN "survey_id" SET DEFAULT "nextval"('"public"."surveys_survey_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."system_logs" ALTER COLUMN "log_id" SET DEFAULT "nextval"('"public"."system_logs_log_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."ticket_responses" ALTER COLUMN "response_id" SET DEFAULT "nextval"('"public"."ticket_responses_response_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."tickets" ALTER COLUMN "ticket_id" SET DEFAULT "nextval"('"public"."tickets_ticket_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."users" ALTER COLUMN "user_id" SET DEFAULT "nextval"('"public"."users_user_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."wikis" ALTER COLUMN "wiki_id" SET DEFAULT "nextval"('"public"."wikis_wiki_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."admin_settings"
    ADD CONSTRAINT "admin_settings_pkey" PRIMARY KEY ("setting_id");

ALTER TABLE ONLY "public"."assignments"
    ADD CONSTRAINT "assignments_pkey" PRIMARY KEY ("assignment_id");

ALTER TABLE ONLY "public"."attachments"
    ADD CONSTRAINT "attachments_pkey" PRIMARY KEY ("attachment_id");

ALTER TABLE ONLY "public"."backup_logs"
    ADD CONSTRAINT "backup_logs_pkey" PRIMARY KEY ("backup_id");

ALTER TABLE ONLY "public"."branding"
    ADD CONSTRAINT "branding_pkey" PRIMARY KEY ("branding_id");

ALTER TABLE ONLY "public"."chats"
    ADD CONSTRAINT "chats_pkey" PRIMARY KEY ("chat_id");

ALTER TABLE ONLY "public"."course_materials"
    ADD CONSTRAINT "course_materials_pkey" PRIMARY KEY ("material_id");

ALTER TABLE ONLY "public"."course_tags"
    ADD CONSTRAINT "course_tags_pkey" PRIMARY KEY ("tag_id");

ALTER TABLE ONLY "public"."courses"
    ADD CONSTRAINT "courses_pkey" PRIMARY KEY ("course_id");

ALTER TABLE ONLY "public"."enrollments"
    ADD CONSTRAINT "enrollments_pkey" PRIMARY KEY ("enrollment_id");

ALTER TABLE ONLY "public"."forums"
    ADD CONSTRAINT "forums_pkey" PRIMARY KEY ("forum_id");

ALTER TABLE ONLY "public"."glossary"
    ADD CONSTRAINT "glossary_pkey" PRIMARY KEY ("term_id");

ALTER TABLE ONLY "public"."grades"
    ADD CONSTRAINT "grades_pkey" PRIMARY KEY ("grade_id");

ALTER TABLE ONLY "public"."imported_courses"
    ADD CONSTRAINT "imported_courses_pkey" PRIMARY KEY ("imported_course_id");

ALTER TABLE ONLY "public"."lessons"
    ADD CONSTRAINT "lessons_pkey" PRIMARY KEY ("lesson_id");

ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("notification_id");

ALTER TABLE ONLY "public"."performance_evaluation"
    ADD CONSTRAINT "performance_evaluation_pkey" PRIMARY KEY ("evaluation_id");

ALTER TABLE ONLY "public"."posts"
    ADD CONSTRAINT "posts_pkey" PRIMARY KEY ("post_id");

ALTER TABLE ONLY "public"."progress"
    ADD CONSTRAINT "progress_pkey" PRIMARY KEY ("progress_id");

ALTER TABLE ONLY "public"."subjects"
    ADD CONSTRAINT "subjects_pkey" PRIMARY KEY ("subject_id");

ALTER TABLE ONLY "public"."submissions"
    ADD CONSTRAINT "submissions_pkey" PRIMARY KEY ("submission_id");

ALTER TABLE ONLY "public"."support_services"
    ADD CONSTRAINT "support_services_pkey" PRIMARY KEY ("service_id");

ALTER TABLE ONLY "public"."survey_responses"
    ADD CONSTRAINT "survey_responses_pkey" PRIMARY KEY ("response_id");

ALTER TABLE ONLY "public"."surveys"
    ADD CONSTRAINT "surveys_pkey" PRIMARY KEY ("survey_id");

ALTER TABLE ONLY "public"."system_logs"
    ADD CONSTRAINT "system_logs_pkey" PRIMARY KEY ("log_id");

ALTER TABLE ONLY "public"."ticket_responses"
    ADD CONSTRAINT "ticket_responses_pkey" PRIMARY KEY ("response_id");

ALTER TABLE ONLY "public"."tickets"
    ADD CONSTRAINT "tickets_pkey" PRIMARY KEY ("ticket_id");

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_email_key" UNIQUE ("email");

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("user_id");

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_username_key" UNIQUE ("username");

ALTER TABLE ONLY "public"."wikis"
    ADD CONSTRAINT "wikis_pkey" PRIMARY KEY ("wiki_id");

CREATE OR REPLACE TRIGGER "update_admin_settings_updated_at" BEFORE UPDATE ON "public"."admin_settings" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_assignments_updated_at" BEFORE UPDATE ON "public"."assignments" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_branding_updated_at" BEFORE UPDATE ON "public"."branding" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_courses_updated_at" BEFORE UPDATE ON "public"."courses" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_glossary_updated_at" BEFORE UPDATE ON "public"."glossary" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_lessons_updated_at" BEFORE UPDATE ON "public"."lessons" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_performance_evaluation_updated_at" BEFORE UPDATE ON "public"."performance_evaluation" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_posts_updated_at" BEFORE UPDATE ON "public"."posts" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_progress_updated_at" BEFORE UPDATE ON "public"."progress" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_subjects_updated_at" BEFORE UPDATE ON "public"."subjects" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_support_services_updated_at" BEFORE UPDATE ON "public"."support_services" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_surveys_updated_at" BEFORE UPDATE ON "public"."surveys" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_tickets_updated_at" BEFORE UPDATE ON "public"."tickets" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

CREATE OR REPLACE TRIGGER "update_wikis_updated_at" BEFORE UPDATE ON "public"."wikis" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();

ALTER TABLE ONLY "public"."assignments"
    ADD CONSTRAINT "assignments_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subjects"("subject_id");

ALTER TABLE ONLY "public"."attachments"
    ADD CONSTRAINT "attachments_assignment_id_fkey" FOREIGN KEY ("assignment_id") REFERENCES "public"."assignments"("assignment_id");

ALTER TABLE ONLY "public"."chats"
    ADD CONSTRAINT "chats_receiver_id_fkey" FOREIGN KEY ("receiver_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."chats"
    ADD CONSTRAINT "chats_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."course_materials"
    ADD CONSTRAINT "course_materials_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."course_tags"
    ADD CONSTRAINT "course_tags_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."courses"
    ADD CONSTRAINT "courses_instructor_id_fkey" FOREIGN KEY ("instructor_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."enrollments"
    ADD CONSTRAINT "enrollments_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."enrollments"
    ADD CONSTRAINT "enrollments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."forums"
    ADD CONSTRAINT "forums_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."grades"
    ADD CONSTRAINT "grades_submission_id_fkey" FOREIGN KEY ("submission_id") REFERENCES "public"."submissions"("submission_id");

ALTER TABLE ONLY "public"."imported_courses"
    ADD CONSTRAINT "imported_courses_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."lessons"
    ADD CONSTRAINT "lessons_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subjects"("subject_id");

ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."performance_evaluation"
    ADD CONSTRAINT "performance_evaluation_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."performance_evaluation"
    ADD CONSTRAINT "performance_evaluation_evaluator_id_fkey" FOREIGN KEY ("evaluator_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."performance_evaluation"
    ADD CONSTRAINT "performance_evaluation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."posts"
    ADD CONSTRAINT "posts_forum_id_fkey" FOREIGN KEY ("forum_id") REFERENCES "public"."forums"("forum_id");

ALTER TABLE ONLY "public"."posts"
    ADD CONSTRAINT "posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."progress"
    ADD CONSTRAINT "progress_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."progress"
    ADD CONSTRAINT "progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."subjects"
    ADD CONSTRAINT "subjects_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE ONLY "public"."submissions"
    ADD CONSTRAINT "submissions_assignment_id_fkey" FOREIGN KEY ("assignment_id") REFERENCES "public"."assignments"("assignment_id");

ALTER TABLE ONLY "public"."submissions"
    ADD CONSTRAINT "submissions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."survey_responses"
    ADD CONSTRAINT "survey_responses_survey_id_fkey" FOREIGN KEY ("survey_id") REFERENCES "public"."surveys"("survey_id");

ALTER TABLE ONLY "public"."survey_responses"
    ADD CONSTRAINT "survey_responses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."system_logs"
    ADD CONSTRAINT "system_logs_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."ticket_responses"
    ADD CONSTRAINT "ticket_responses_ticket_id_fkey" FOREIGN KEY ("ticket_id") REFERENCES "public"."tickets"("ticket_id");

ALTER TABLE ONLY "public"."ticket_responses"
    ADD CONSTRAINT "ticket_responses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."tickets"
    ADD CONSTRAINT "tickets_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");

ALTER TABLE ONLY "public"."wikis"
    ADD CONSTRAINT "wikis_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("course_id");

ALTER TABLE "public"."admin_settings" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "assignment_access_policy" ON "public"."assignments" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = ( SELECT "subjects"."course_id"
           FROM "public"."subjects"
          WHERE ("subjects"."subject_id" = "assignments"."subject_id")))))));

ALTER TABLE "public"."assignments" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."backup_logs" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."branding" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "chat_access_policy" ON "public"."chats" USING ((("sender_id" = ("current_setting"('app.current_user_id'::"text"))::integer) OR ("receiver_id" = ("current_setting"('app.current_user_id'::"text"))::integer)));

ALTER TABLE "public"."chats" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "course_instructor_policy" ON "public"."courses" USING (("instructor_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

ALTER TABLE "public"."course_materials" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "course_materials_access_policy" ON "public"."course_materials" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = "course_materials"."course_id")))));

ALTER TABLE "public"."course_tags" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."courses" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."enrollments" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "forum_access_policy" ON "public"."forums" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = "forums"."course_id")))));

ALTER TABLE "public"."forums" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."glossary" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "glossary_access_policy" ON "public"."glossary" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = "glossary"."term_id")))));

CREATE POLICY "grade_access_policy" ON "public"."grades" USING ((EXISTS ( SELECT 1
   FROM "public"."submissions"
  WHERE (("submissions"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("submissions"."submission_id" = "grades"."submission_id")))));

ALTER TABLE "public"."grades" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."imported_courses" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "imported_courses_access_policy" ON "public"."imported_courses" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = "imported_courses"."course_id")))));

CREATE POLICY "lesson_access_policy" ON "public"."lessons" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = ( SELECT "subjects"."course_id"
           FROM "public"."subjects"
          WHERE ("subjects"."subject_id" = "lessons"."subject_id")))))));

ALTER TABLE "public"."lessons" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "notification_access_policy" ON "public"."notifications" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

ALTER TABLE "public"."notifications" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."performance_evaluation" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "performance_evaluation_access_policy" ON "public"."performance_evaluation" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

CREATE POLICY "post_access_policy" ON "public"."posts" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

ALTER TABLE "public"."posts" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."progress" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "progress_access_policy" ON "public"."progress" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

CREATE POLICY "subject_access_policy" ON "public"."subjects" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = "subjects"."course_id")))));

ALTER TABLE "public"."subjects" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "submission_access_policy" ON "public"."submissions" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

ALTER TABLE "public"."submissions" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "support_service_access_policy" ON "public"."support_services" USING (true);

ALTER TABLE "public"."support_services" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "survey_access_policy" ON "public"."surveys" USING ((EXISTS ( SELECT 1
   FROM "public"."survey_responses"
  WHERE (("survey_responses"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("survey_responses"."survey_id" = "surveys"."survey_id")))));

CREATE POLICY "survey_response_access_policy" ON "public"."survey_responses" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

ALTER TABLE "public"."survey_responses" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."surveys" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."system_logs" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "ticket_access_policy" ON "public"."tickets" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

CREATE POLICY "ticket_response_access_policy" ON "public"."ticket_responses" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

ALTER TABLE "public"."ticket_responses" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."tickets" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "user_access_policy" ON "public"."enrollments" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer)) WITH CHECK (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

CREATE POLICY "user_isolation_policy" ON "public"."users" USING (("user_id" = ("current_setting"('app.current_user_id'::"text"))::integer));

ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "wiki_access_policy" ON "public"."wikis" USING ((EXISTS ( SELECT 1
   FROM "public"."enrollments"
  WHERE (("enrollments"."user_id" = ("current_setting"('app.current_user_id'::"text"))::integer) AND ("enrollments"."course_id" = "wikis"."course_id")))));

ALTER TABLE "public"."wikis" ENABLE ROW LEVEL SECURITY;

ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "anon";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "service_role";

GRANT ALL ON TABLE "public"."admin_settings" TO "anon";
GRANT ALL ON TABLE "public"."admin_settings" TO "authenticated";
GRANT ALL ON TABLE "public"."admin_settings" TO "service_role";

GRANT ALL ON SEQUENCE "public"."admin_settings_setting_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."admin_settings_setting_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."admin_settings_setting_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."assignments" TO "anon";
GRANT ALL ON TABLE "public"."assignments" TO "authenticated";
GRANT ALL ON TABLE "public"."assignments" TO "service_role";

GRANT ALL ON SEQUENCE "public"."assignments_assignment_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."assignments_assignment_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."assignments_assignment_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."attachments" TO "anon";
GRANT ALL ON TABLE "public"."attachments" TO "authenticated";
GRANT ALL ON TABLE "public"."attachments" TO "service_role";

GRANT ALL ON SEQUENCE "public"."attachments_attachment_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."attachments_attachment_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."attachments_attachment_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."backup_logs" TO "anon";
GRANT ALL ON TABLE "public"."backup_logs" TO "authenticated";
GRANT ALL ON TABLE "public"."backup_logs" TO "service_role";

GRANT ALL ON SEQUENCE "public"."backup_logs_backup_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."backup_logs_backup_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."backup_logs_backup_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."branding" TO "anon";
GRANT ALL ON TABLE "public"."branding" TO "authenticated";
GRANT ALL ON TABLE "public"."branding" TO "service_role";

GRANT ALL ON SEQUENCE "public"."branding_branding_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."branding_branding_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."branding_branding_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."chats" TO "anon";
GRANT ALL ON TABLE "public"."chats" TO "authenticated";
GRANT ALL ON TABLE "public"."chats" TO "service_role";

GRANT ALL ON SEQUENCE "public"."chats_chat_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."chats_chat_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."chats_chat_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."course_materials" TO "anon";
GRANT ALL ON TABLE "public"."course_materials" TO "authenticated";
GRANT ALL ON TABLE "public"."course_materials" TO "service_role";

GRANT ALL ON SEQUENCE "public"."course_materials_material_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."course_materials_material_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."course_materials_material_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."course_tags" TO "anon";
GRANT ALL ON TABLE "public"."course_tags" TO "authenticated";
GRANT ALL ON TABLE "public"."course_tags" TO "service_role";

GRANT ALL ON SEQUENCE "public"."course_tags_tag_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."course_tags_tag_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."course_tags_tag_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."courses" TO "anon";
GRANT ALL ON TABLE "public"."courses" TO "authenticated";
GRANT ALL ON TABLE "public"."courses" TO "service_role";

GRANT ALL ON SEQUENCE "public"."courses_course_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."courses_course_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."courses_course_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."enrollments" TO "anon";
GRANT ALL ON TABLE "public"."enrollments" TO "authenticated";
GRANT ALL ON TABLE "public"."enrollments" TO "service_role";

GRANT ALL ON SEQUENCE "public"."enrollments_enrollment_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."enrollments_enrollment_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."enrollments_enrollment_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."forums" TO "anon";
GRANT ALL ON TABLE "public"."forums" TO "authenticated";
GRANT ALL ON TABLE "public"."forums" TO "service_role";

GRANT ALL ON SEQUENCE "public"."forums_forum_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."forums_forum_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."forums_forum_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."glossary" TO "anon";
GRANT ALL ON TABLE "public"."glossary" TO "authenticated";
GRANT ALL ON TABLE "public"."glossary" TO "service_role";

GRANT ALL ON SEQUENCE "public"."glossary_term_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."glossary_term_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."glossary_term_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."grades" TO "anon";
GRANT ALL ON TABLE "public"."grades" TO "authenticated";
GRANT ALL ON TABLE "public"."grades" TO "service_role";

GRANT ALL ON SEQUENCE "public"."grades_grade_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."grades_grade_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."grades_grade_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."imported_courses" TO "anon";
GRANT ALL ON TABLE "public"."imported_courses" TO "authenticated";
GRANT ALL ON TABLE "public"."imported_courses" TO "service_role";

GRANT ALL ON SEQUENCE "public"."imported_courses_imported_course_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."imported_courses_imported_course_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."imported_courses_imported_course_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."lessons" TO "anon";
GRANT ALL ON TABLE "public"."lessons" TO "authenticated";
GRANT ALL ON TABLE "public"."lessons" TO "service_role";

GRANT ALL ON SEQUENCE "public"."lessons_lesson_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."lessons_lesson_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."lessons_lesson_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."notifications" TO "anon";
GRANT ALL ON TABLE "public"."notifications" TO "authenticated";
GRANT ALL ON TABLE "public"."notifications" TO "service_role";

GRANT ALL ON SEQUENCE "public"."notifications_notification_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."notifications_notification_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."notifications_notification_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."performance_evaluation" TO "anon";
GRANT ALL ON TABLE "public"."performance_evaluation" TO "authenticated";
GRANT ALL ON TABLE "public"."performance_evaluation" TO "service_role";

GRANT ALL ON SEQUENCE "public"."performance_evaluation_evaluation_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."performance_evaluation_evaluation_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."performance_evaluation_evaluation_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."posts" TO "anon";
GRANT ALL ON TABLE "public"."posts" TO "authenticated";
GRANT ALL ON TABLE "public"."posts" TO "service_role";

GRANT ALL ON SEQUENCE "public"."posts_post_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."posts_post_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."posts_post_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."progress" TO "anon";
GRANT ALL ON TABLE "public"."progress" TO "authenticated";
GRANT ALL ON TABLE "public"."progress" TO "service_role";

GRANT ALL ON SEQUENCE "public"."progress_progress_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."progress_progress_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."progress_progress_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."subjects" TO "anon";
GRANT ALL ON TABLE "public"."subjects" TO "authenticated";
GRANT ALL ON TABLE "public"."subjects" TO "service_role";

GRANT ALL ON SEQUENCE "public"."subjects_subject_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."subjects_subject_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."subjects_subject_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."submissions" TO "anon";
GRANT ALL ON TABLE "public"."submissions" TO "authenticated";
GRANT ALL ON TABLE "public"."submissions" TO "service_role";

GRANT ALL ON SEQUENCE "public"."submissions_submission_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."submissions_submission_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."submissions_submission_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."support_services" TO "anon";
GRANT ALL ON TABLE "public"."support_services" TO "authenticated";
GRANT ALL ON TABLE "public"."support_services" TO "service_role";

GRANT ALL ON SEQUENCE "public"."support_services_service_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."support_services_service_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."support_services_service_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."survey_responses" TO "anon";
GRANT ALL ON TABLE "public"."survey_responses" TO "authenticated";
GRANT ALL ON TABLE "public"."survey_responses" TO "service_role";

GRANT ALL ON SEQUENCE "public"."survey_responses_response_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."survey_responses_response_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."survey_responses_response_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."surveys" TO "anon";
GRANT ALL ON TABLE "public"."surveys" TO "authenticated";
GRANT ALL ON TABLE "public"."surveys" TO "service_role";

GRANT ALL ON SEQUENCE "public"."surveys_survey_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."surveys_survey_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."surveys_survey_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."system_logs" TO "anon";
GRANT ALL ON TABLE "public"."system_logs" TO "authenticated";
GRANT ALL ON TABLE "public"."system_logs" TO "service_role";

GRANT ALL ON SEQUENCE "public"."system_logs_log_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."system_logs_log_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."system_logs_log_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."ticket_responses" TO "anon";
GRANT ALL ON TABLE "public"."ticket_responses" TO "authenticated";
GRANT ALL ON TABLE "public"."ticket_responses" TO "service_role";

GRANT ALL ON SEQUENCE "public"."ticket_responses_response_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."ticket_responses_response_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."ticket_responses_response_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."tickets" TO "anon";
GRANT ALL ON TABLE "public"."tickets" TO "authenticated";
GRANT ALL ON TABLE "public"."tickets" TO "service_role";

GRANT ALL ON SEQUENCE "public"."tickets_ticket_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."tickets_ticket_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."tickets_ticket_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."users" TO "anon";
GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "service_role";

GRANT ALL ON SEQUENCE "public"."users_user_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."users_user_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."users_user_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."wikis" TO "anon";
GRANT ALL ON TABLE "public"."wikis" TO "authenticated";
GRANT ALL ON TABLE "public"."wikis" TO "service_role";

GRANT ALL ON SEQUENCE "public"."wikis_wiki_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."wikis_wiki_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."wikis_wiki_id_seq" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
