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
    quiz_id integer,
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
4	Create full stack apps with a single language	12	4	t	2020-01-31 22:07:40.865021	2020-01-31 22:28:31.651011
5	Use a clear and general purpose language	12	5	t	2020-01-31 22:07:58.975951	2020-01-31 22:29:01.154023
6	Create websites like AirBNB or Twitter	12	6	t	2020-01-31 22:08:25.594295	2020-01-31 22:29:22.952056
1	Work with scripts like Wordpress	3	3	t	2020-01-31 22:05:38.875585	2020-01-31 22:30:12.631946
2	Create code that runs in the browser	3	4	t	2020-01-31 22:05:58.862796	2020-01-31 22:30:44.819631
3	Create websites like AirBNB or Twitter	3	6	t	2020-01-31 22:06:13.555176	2020-01-31 22:31:15.506125
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-01-31 19:03:14.853486	2020-01-31 19:03:14.853486
\.


--
-- Data for Name: finishes; Type: TABLE DATA; Schema: public; Owner: lpk
--

COPY public.finishes (id, text, sub_text, img_src, quiz_id, created_at, updated_at) FROM stdin;
1	should learn Java	It's a language that can be run 'anywhere' and is the language of Android.	img/java.png	1	2020-01-31 22:11:27.027135	2020-01-31 22:11:27.027135
2	should learn C#	It's a language with many similarities to Java plus even more features.	img/c-sharp.png	1	2020-01-31 22:12:14.801283	2020-01-31 22:12:14.801283
3	should learn PHP	It was all the rage in the 90's and still has many popular scripts.	img/php.png	1	2020-01-31 22:12:52.899496	2020-01-31 22:12:52.899496
4	should learn JavaScript	It's run all over the place and is the native language of the web.	img/javascript.png	1	2020-01-31 22:13:43.191037	2020-01-31 22:13:43.191037
5	should learn Python	It's a popular option for big data and science with an emphasis on readability.	img/python.png	1	2020-01-31 22:14:16.49856	2020-01-31 22:14:16.49856
6	should learn Ruby	It is clean, readable and a powerful tool for building webpages and more.	img/ruby.png	1	2020-01-31 22:15:05.612194	2020-01-31 22:15:05.612194
7	should learn Swift	It is Apple's newest language and the perfect tool for developing iOS apps.	img/swift.png	1	2020-01-31 22:15:42.618601	2020-01-31 22:15:42.618601
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
6	Are you excited about using a language with strict structures and syntax?	1	t	4	8	f	f	2020-01-31 17:53:26.246059	2020-01-31 18:06:16.896143
8	Are you excited about working fast and flexible, even if it makes it harder to work for a big company?	1	t	10	4	f	f	2020-01-31 17:54:06.151207	2020-01-31 18:09:59.931306
7	Are you excited about working fast, even if it leads to more errors?	1	t	10	2	f	f	2020-01-31 17:53:47.496371	2020-01-31 18:10:48.272765
10	Are you more excited about building web apps than other types of programming?	1	t	3	11	f	f	2020-01-31 17:54:40.090294	2020-01-31 18:15:00.836512
11	Do you dream of working in Big data?	1	t	5	12	t	f	2020-01-31 17:55:04.079281	2020-01-31 22:18:16.897757
5	Can you sell your soul to Microsoft?	1	t	2	1	t	t	2020-01-31 17:52:56.377779	2020-01-31 22:20:24.768635
9	Are you mostly wanting to work on iOS apps?	1	t	7	1	t	t	2020-01-31 17:54:23.307385	2020-01-31 22:21:45.643069
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
20200131185829
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lpk
--

SELECT pg_catalog.setval('public.answers_id_seq', 6, true);


--
-- Name: finishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lpk
--

SELECT pg_catalog.setval('public.finishes_id_seq', 7, true);


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
-- Name: finishes fk_rails_6e31958eaf; Type: FK CONSTRAINT; Schema: public; Owner: lpk
--

ALTER TABLE ONLY public.finishes
    ADD CONSTRAINT fk_rails_6e31958eaf FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id);


--
-- PostgreSQL database dump complete
--

