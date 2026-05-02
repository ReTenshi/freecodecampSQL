--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 28, 29, 4, 2);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 30, 31, 2, 0);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 29, 31, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 28, 30, 1, 0);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 29, 32, 3, 2);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 31, 33, 2, 0);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 30, 34, 2, 1);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 28, 35, 2, 0);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 31, 36, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 33, 37, 1, 0);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 30, 38, 3, 2);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 34, 39, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 29, 40, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 32, 41, 2, 1);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 35, 42, 2, 1);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 28, 43, 4, 3);
INSERT INTO public.games VALUES (49, 2014, 'Final', 44, 43, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 45, 34, 3, 0);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 43, 45, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 44, 34, 7, 1);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 45, 46, 1, 0);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 43, 30, 1, 0);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 34, 36, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 44, 28, 1, 0);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 34, 47, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 36, 35, 2, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 28, 48, 2, 0);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 44, 49, 2, 1);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 45, 39, 2, 1);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 46, 50, 2, 1);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 43, 37, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 30, 51, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (28, 'France');
INSERT INTO public.teams VALUES (29, 'Croatia');
INSERT INTO public.teams VALUES (30, 'Belgium');
INSERT INTO public.teams VALUES (31, 'England');
INSERT INTO public.teams VALUES (32, 'Russia');
INSERT INTO public.teams VALUES (33, 'Sweden');
INSERT INTO public.teams VALUES (34, 'Brazil');
INSERT INTO public.teams VALUES (35, 'Uruguay');
INSERT INTO public.teams VALUES (36, 'Colombia');
INSERT INTO public.teams VALUES (37, 'Switzerland');
INSERT INTO public.teams VALUES (38, 'Japan');
INSERT INTO public.teams VALUES (39, 'Mexico');
INSERT INTO public.teams VALUES (40, 'Denmark');
INSERT INTO public.teams VALUES (41, 'Spain');
INSERT INTO public.teams VALUES (42, 'Portugal');
INSERT INTO public.teams VALUES (43, 'Argentina');
INSERT INTO public.teams VALUES (44, 'Germany');
INSERT INTO public.teams VALUES (45, 'Netherlands');
INSERT INTO public.teams VALUES (46, 'Costa Rica');
INSERT INTO public.teams VALUES (47, 'Chile');
INSERT INTO public.teams VALUES (48, 'Nigeria');
INSERT INTO public.teams VALUES (49, 'Algeria');
INSERT INTO public.teams VALUES (50, 'Greece');
INSERT INTO public.teams VALUES (51, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 51, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

