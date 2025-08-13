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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(16) NOT NULL,
    comet_diameter_km integer,
    comet_type text,
    crossed_solar_system boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(16) NOT NULL,
    galaxy_size_light_years integer,
    galaxy_age_billion_years numeric(4,2),
    galaxy_type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(16) NOT NULL,
    moon_diameter_km integer,
    moon_age_billion_years numeric(4,2),
    moon_distance_from_planet_km integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(16) NOT NULL,
    planet_diameter_km integer,
    planet_age_billion_years numeric(4,2),
    planet_type text,
    star_id integer,
    planet_is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(16) NOT NULL,
    star_diameter_km integer,
    star_age_billion_years numeric(4,2),
    star_type text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 11, 'short-period', true);
INSERT INTO public.comet VALUES (2, 'Encke', 5, 'short-period', true);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 60, 'long-period', true);
INSERT INTO public.comet VALUES (4, 'Hyakutake', 4, 'long-period', true);
INSERT INTO public.comet VALUES (5, 'Tempel 1', 6, 'short-period', true);
INSERT INTO public.comet VALUES (6, 'Wild 2', 4, 'short-period', true);
INSERT INTO public.comet VALUES (7, 'Borrelly', 8, 'short-period', true);
INSERT INTO public.comet VALUES (8, 'Lovejoy', 1, 'long-period', true);
INSERT INTO public.comet VALUES (9, 'SL9', 2, 'short-period', true);
INSERT INTO public.comet VALUES (10, 'Churyumov', 4, 'short-period', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700, 13.60, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 10.00, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 12.00, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 980000, 13.70, 'elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 76000, 0.40, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 49000, 13.00, 'lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 4.53, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 23, 4.50, 9377, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 4.50, 23460, 4);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 4.50, 421700, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 4.50, 671100, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 4.50, 1070400, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 4.50, 1882700, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 167, 4.50, 181400, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 170, 4.50, 11461000, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 86, 4.50, 11741000, 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 60, 4.50, 23623000, 5);
INSERT INTO public.moon VALUES (12, 'Sinope', 38, 4.50, 23939000, 5);
INSERT INTO public.moon VALUES (13, 'Lysithea', 36, 4.50, 11720000, 5);
INSERT INTO public.moon VALUES (14, 'Titan', 5149, 4.50, 1221870, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 1527, 4.50, 527040, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 1469, 4.50, 3561300, 6);
INSERT INTO public.moon VALUES (17, 'Dione', 1123, 4.50, 377400, 6);
INSERT INTO public.moon VALUES (18, 'Tethys', 1062, 4.50, 294660, 6);
INSERT INTO public.moon VALUES (19, 'Enceladus', 504, 4.50, 238040, 6);
INSERT INTO public.moon VALUES (20, 'Mimas', 396, 4.50, 185520, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 4.60, 'rocky', 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 4.60, 'rocky', 1, false);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 4.60, 'rocky', 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 4.60, 'rocky', 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 4.60, 'gas giant', 1, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 4.60, 'gas giant', 1, false);
INSERT INTO public.planet VALUES (7, 'Kepler-90b', 15300, 2.00, 'rocky (super-Earth)', 2, false);
INSERT INTO public.planet VALUES (8, 'Kepler-90c', 36800, 2.00, 'mini-Neptune', 2, false);
INSERT INTO public.planet VALUES (9, 'Kepler-90i', 16500, 2.00, 'rocky (super-Earth)', 2, false);
INSERT INTO public.planet VALUES (10, 'Kepler-90d', 35600, 2.00, 'mini-Neptune', 2, false);
INSERT INTO public.planet VALUES (11, 'Kepler-90e', 28000, 2.00, 'mini-Neptune', 2, false);
INSERT INTO public.planet VALUES (12, 'Kepler-90h', 144200, 2.00, 'gas giant', 2, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1392700, 4.60, 'G-type main-sequence', 1);
INSERT INTO public.star VALUES (2, 'Kepler-90', 1261600, 2.00, 'G-type main-sequence', 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 3120000, 0.06, 'B-type subgiant', 2);
INSERT INTO public.star VALUES (4, 'Mirach', 98000000, 3.00, 'red giant', 2);
INSERT INTO public.star VALUES (5, 'M33-Var83', 900000, 10.00, 'yellow supergiant', 3);
INSERT INTO public.star VALUES (7, 'NGC 4594-V1', 2600000, 4.00, 'blue supergiant', 6);
INSERT INTO public.star VALUES (6, 'M87-V120', 2200000, 10.00, 'blue supergiant', 4);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

