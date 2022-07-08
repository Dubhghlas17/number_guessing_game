--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: guess_counter; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess_counter (
    guess_id integer NOT NULL,
    game_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.guess_counter OWNER TO freecodecamp;

--
-- Name: guess_counter_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guess_counter_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guess_counter_guess_id_seq OWNER TO freecodecamp;

--
-- Name: guess_counter_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guess_counter_guess_id_seq OWNED BY public.guess_counter.guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(20) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: guess_counter guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_counter ALTER COLUMN guess_id SET DEFAULT nextval('public.guess_counter_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (436, 219, 747);
INSERT INTO public.games VALUES (437, 219, 862);
INSERT INTO public.games VALUES (438, 220, 452);
INSERT INTO public.games VALUES (439, 220, 670);
INSERT INTO public.games VALUES (440, 219, 517);
INSERT INTO public.games VALUES (441, 219, 249);
INSERT INTO public.games VALUES (442, 219, 902);
INSERT INTO public.games VALUES (443, 221, 893);
INSERT INTO public.games VALUES (444, 221, 361);
INSERT INTO public.games VALUES (445, 222, 470);
INSERT INTO public.games VALUES (446, 222, 768);
INSERT INTO public.games VALUES (447, 221, 163);
INSERT INTO public.games VALUES (448, 221, 638);
INSERT INTO public.games VALUES (449, 221, 134);
INSERT INTO public.games VALUES (450, 223, 638);
INSERT INTO public.games VALUES (451, 223, 446);
INSERT INTO public.games VALUES (452, 224, 978);
INSERT INTO public.games VALUES (453, 224, 655);
INSERT INTO public.games VALUES (454, 223, 258);
INSERT INTO public.games VALUES (455, 223, 55);
INSERT INTO public.games VALUES (456, 223, 580);
INSERT INTO public.games VALUES (457, 225, 809);
INSERT INTO public.games VALUES (458, 225, 998);
INSERT INTO public.games VALUES (459, 226, 873);
INSERT INTO public.games VALUES (460, 226, 126);
INSERT INTO public.games VALUES (461, 225, 912);
INSERT INTO public.games VALUES (462, 225, 85);
INSERT INTO public.games VALUES (463, 225, 132);
INSERT INTO public.games VALUES (464, 227, 143);
INSERT INTO public.games VALUES (465, 227, 408);
INSERT INTO public.games VALUES (466, 228, 80);
INSERT INTO public.games VALUES (467, 228, 807);
INSERT INTO public.games VALUES (468, 227, 533);
INSERT INTO public.games VALUES (469, 227, 877);
INSERT INTO public.games VALUES (470, 227, 517);


--
-- Data for Name: guess_counter; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (219, 'user_1657303236075');
INSERT INTO public.users VALUES (220, 'user_1657303236074');
INSERT INTO public.users VALUES (221, 'user_1657303281815');
INSERT INTO public.users VALUES (222, 'user_1657303281814');
INSERT INTO public.users VALUES (223, 'user_1657303351927');
INSERT INTO public.users VALUES (224, 'user_1657303351926');
INSERT INTO public.users VALUES (225, 'user_1657303381237');
INSERT INTO public.users VALUES (226, 'user_1657303381236');
INSERT INTO public.users VALUES (227, 'user_1657303391605');
INSERT INTO public.users VALUES (228, 'user_1657303391604');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 470, true);


--
-- Name: guess_counter_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guess_counter_guess_id_seq', 12, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 228, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: guess_counter guess_counter_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_counter
    ADD CONSTRAINT guess_counter_pkey PRIMARY KEY (guess_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

