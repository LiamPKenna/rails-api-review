--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: lpk
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    text character varying,
    question_id integer,
    linked_card integer,
    is_finish boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.answers OWNER TO lpk;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: lpk
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO lpk;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lpk
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: lpk
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO lpk;

--
-- Name: finishes; Type: TABLE; Schema: public; Owner: lpk
--

CREATE TABLE public.finishes (
    id bigint NOT NULL,
    text character varying,
    sub_text character varying,
    img_src character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.finishes OWNER TO lpk;

--
-- Name: finishes_id_seq; Type: SEQUENCE; Schema: public; Owner: lpk
--

CREATE SEQUENCE public.finishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finishes_id_seq OWNER TO lpk;

--
-- Name: finishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lpk
--

ALTER SEQUENCE public.finishes_id_seq OWNED BY public.finishes.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: lpk
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    text character varying,
    quiz_id integer,
    is_binary boolean,
    y_link integer,
    n_link integer,
    y_is_final boolean,
    n_is_final boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.questions OWNER TO lpk;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: lpk
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO lpk;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lpk
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: lpk
--

CREATE TABLE public.quizzes (
    id bigint NOT NULL,
    title character varying,
    sub_title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quizzes OWNER TO lpk;

--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: lpk
--

CREATE SEQUENCE public.quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizzes_id_seq OWNER TO lpk;

--
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lpk
--

ALTER SEQUENCE public.quizzes_id_seq OWNED BY public.quizzes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: lpk
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO lpk;

--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: finishes id; Type: DEFAULT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.finishes ALTER COLUMN id SET DEFAULT nextval('public.finishes_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id SET DEFAULT nextval('public.quizzes_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.answers (id, text, question_id, linked_card, is_finish, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-01-31 17:46:48.234925	2020-01-31 17:46:48.234925
\.


--
-- Data for Name: finishes; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.finishes (id, text, sub_text, img_src, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.questions (id, text, quiz_id, is_binary, y_link, n_link, y_is_final, n_is_final, created_at, updated_at) FROM stdin;
3	What do you most want to be able to do?	1	f	\N	\N	f	f	2020-01-31 17:52:10.855112	2020-01-31 17:52:10.855112
12	What do you most want to be able to do?	1	f	\N	\N	f	f	2020-01-31 17:55:37.699105	2020-01-31 17:55:37.699105
1	Do you want work for a big company?	1	t	6	7	f	f	2020-01-31 17:48:16.66202	2020-01-31 17:58:03.931805
2	Do you want to learn a language with more rules (to prevent errors) rather than more flexibility?	1	t	4	10	f	f	2020-01-31 17:51:42.600145	2020-01-31 18:01:11.142914
4	Do you want to make smartphone apps?	1	t	9	5	f	f	2020-01-31 17:52:34.798858	2020-01-31 18:03:59.887737
5	Can you sell your soul to Microsoft?	1	t	\N	\N	t	t	2020-01-31 17:52:56.377779	2020-01-31 18:04:32.062394
6	Are you excited about using a language with strict structures and syntax?	1	t	4	8	f	f	2020-01-31 17:53:26.246059	2020-01-31 18:06:16.896143
8	Are you excited about working fast and flexible, even if it makes it harder to work for a big company?	1	t	10	4	f	f	2020-01-31 17:54:06.151207	2020-01-31 18:09:59.931306
7	Are you excited about working fast, even if it leads to more errors?	1	t	10	2	f	f	2020-01-31 17:53:47.496371	2020-01-31 18:10:48.272765
9	Are you mostly wanting to work on iOS apps?	1	t	\N	\N	t	t	2020-01-31 17:54:23.307385	2020-01-31 18:12:44.672643
10	Are you more excited about building web apps than other types of programming?	1	t	3	11	f	f	2020-01-31 17:54:40.090294	2020-01-31 18:15:00.836512
11	Do you dream of working in Big data?	1	t	\N	12	t	f	2020-01-31 17:55:04.079281	2020-01-31 18:16:13.499455
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.quizzes (id, title, sub_title, created_at, updated_at) FROM stdin;
1	Find Your Language	Programming Path Picker	2020-01-31 17:47:59.25901	2020-01-31 17:47:59.25901
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.schema_migrations (version) FROM stdin;
20200131161935
20200131162104
20200131162430
20200131163236
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lpk
--

SELECT pg_catalog.setval('public.answers_id_seq', 1, false);


--
-- Name: finishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lpk
--

SELECT pg_catalog.setval('public.finishes_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lpk
--

SELECT pg_catalog.setval('public.questions_id_seq', 12, true);


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lpk
--

SELECT pg_catalog.setval('public.quizzes_id_seq', 1, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: finishes finishes_pkey; Type: CONSTRAINT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.finishes
    ADD CONSTRAINT finishes_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

