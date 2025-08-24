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

DROP DATABASE guessing_game;
--
-- Name: guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guessing_game OWNER TO freecodecamp;

\connect guessing_game

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (2, 'user_1756063399585', 2, 231);
INSERT INTO public.players VALUES (1, 'user_1756063399586', 5, 460);
INSERT INTO public.players VALUES (19, 'user_1756064273232', 2, 231);
INSERT INTO public.players VALUES (18, 'user_1756064273233', 5, 72);
INSERT INTO public.players VALUES (5, 'user_1756063615514', 2, 364);
INSERT INTO public.players VALUES (37, 'user_1756064824835', 2, 85);
INSERT INTO public.players VALUES (4, 'user_1756063615515', 5, 54);
INSERT INTO public.players VALUES (7, 'user_1756063638745', 2, 465);
INSERT INTO public.players VALUES (21, 'user_1756064395469', 2, 17);
INSERT INTO public.players VALUES (36, 'user_1756064824836', 5, 139);
INSERT INTO public.players VALUES (20, 'user_1756064395470', 5, 357);
INSERT INTO public.players VALUES (9, 'user_1756063724006', 2, 486);
INSERT INTO public.players VALUES (8, 'user_1756063724007', 5, 115);
INSERT INTO public.players VALUES (6, 'user_1756063638746', 6, 11);
INSERT INTO public.players VALUES (23, 'user_1756064460917', 2, 246);
INSERT INTO public.players VALUES (11, 'user_1756063881581', 2, 303);
INSERT INTO public.players VALUES (39, 'user_1756064850694', 2, 627);
INSERT INTO public.players VALUES (22, 'user_1756064460918', 5, 265);
INSERT INTO public.players VALUES (10, 'user_1756063881582', 5, 302);
INSERT INTO public.players VALUES (13, 'user_1756064122251', 2, 107);
INSERT INTO public.players VALUES (38, 'user_1756064850695', 5, 106);
INSERT INTO public.players VALUES (12, 'user_1756064122252', 5, 368);
INSERT INTO public.players VALUES (25, 'user_1756064536452', 2, 420);
INSERT INTO public.players VALUES (15, 'user_1756064140051', 2, 82);
INSERT INTO public.players VALUES (24, 'user_1756064536453', 5, 41);
INSERT INTO public.players VALUES (14, 'user_1756064140052', 5, 33);
INSERT INTO public.players VALUES (17, 'user_1756064176341', 2, 224);
INSERT INTO public.players VALUES (27, 'user_1756064613495', 2, 272);
INSERT INTO public.players VALUES (16, 'user_1756064176342', 5, 98);
INSERT INTO public.players VALUES (41, 'user_1756064894286', 2, 224);
INSERT INTO public.players VALUES (26, 'user_1756064613496', 5, 62);
INSERT INTO public.players VALUES (40, 'user_1756064894287', 5, 299);
INSERT INTO public.players VALUES (29, 'user_1756064676005', 2, 840);
INSERT INTO public.players VALUES (28, 'user_1756064676006', 5, 442);
INSERT INTO public.players VALUES (43, 'user_1756064980930', 2, 664);
INSERT INTO public.players VALUES (31, 'user_1756064723009', 2, 168);
INSERT INTO public.players VALUES (30, 'user_1756064723010', 5, 8);
INSERT INTO public.players VALUES (42, 'user_1756064980931', 5, 152);
INSERT INTO public.players VALUES (33, 'user_1756064763888', 2, 81);
INSERT INTO public.players VALUES (32, 'user_1756064763889', 5, 280);
INSERT INTO public.players VALUES (45, 'user_1756065079494', 2, 33);
INSERT INTO public.players VALUES (35, 'user_1756064777467', 2, 506);
INSERT INTO public.players VALUES (34, 'user_1756064777468', 5, 17);
INSERT INTO public.players VALUES (44, 'user_1756065079495', 5, 43);
INSERT INTO public.players VALUES (47, 'user_1756065896410', 2, 706);
INSERT INTO public.players VALUES (46, 'user_1756065896411', 5, 81);
INSERT INTO public.players VALUES (3, 'Kamil', 4, 2);
INSERT INTO public.players VALUES (49, 'user_1756066084840', 2, 230);
INSERT INTO public.players VALUES (48, 'user_1756066084841', 5, 409);
INSERT INTO public.players VALUES (51, 'user_1756066115245', 2, 385);
INSERT INTO public.players VALUES (50, 'user_1756066115246', 5, 18);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 51, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

