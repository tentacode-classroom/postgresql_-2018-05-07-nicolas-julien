--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Debian 11.3-1.pgdg90+1)
-- Dumped by pg_dump version 11.3 (Debian 11.3-1.pgdg90+1)

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

SET default_with_oids = false;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    id integer NOT NULL,
    login character varying(45),
    display_login character varying(45),
    gravatar_id integer,
    url character varying(255),
    avatar_url character varying(255)
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_id_seq OWNER TO postgres;

--
-- Name: actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_id_seq OWNED BY public.actor.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    type character varying(255),
    actor_id integer,
    repo_id integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: issue_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_events (
    issue_title character varying(80),
    comment_count integer,
    action character varying(255)
)
INHERITS (public.events);


ALTER TABLE public.issue_events OWNER TO postgres;

--
-- Name: push_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_events (
    branch_name character varying(80),
    commit_count integer
)
INHERITS (public.events);


ALTER TABLE public.push_events OWNER TO postgres;

--
-- Name: repo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo (
    id integer NOT NULL,
    name character varying(255),
    url character varying(255)
);


ALTER TABLE public.repo OWNER TO postgres;

--
-- Name: repo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_id_seq OWNER TO postgres;

--
-- Name: repo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_id_seq OWNED BY public.repo.id;


--
-- Name: actor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor ALTER COLUMN id SET DEFAULT nextval('public.actor_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: issue_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: push_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: repo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo ALTER COLUMN id SET DEFAULT nextval('public.repo_id_seq'::regclass);


--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (id, login, display_login, gravatar_id, url, avatar_url) FROM stdin;
1	Neerfix	Neerfix	\N	https://www.github.com/Neerfix/	https://avatars1.githubusercontent.com/u/13368283?s=88&v=4
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, type, actor_id, repo_id) FROM stdin;
1	push	1	1
\.


--
-- Data for Name: issue_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_events (id, type, actor_id, repo_id, issue_title, comment_count, action) FROM stdin;
2	issue	1	1	Remarques étape 4	1	open
\.


--
-- Data for Name: push_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_events (id, type, actor_id, repo_id, branch_name, commit_count) FROM stdin;
3	push	1	1	Update repo	4
\.


--
-- Data for Name: repo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo (id, name, url) FROM stdin;
1	Portfolio	https://www.github.com/Neerfix/Portfolio
\.


--
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_id_seq', 1, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 3, true);


--
-- Name: repo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_id_seq', 1, true);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: repo repo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo
    ADD CONSTRAINT repo_pkey PRIMARY KEY (id);


--
-- Name: events events_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actor(id);


--
-- Name: events events_repo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_repo_id_fkey FOREIGN KEY (repo_id) REFERENCES public.repo(id);


--
-- PostgreSQL database dump complete
--

