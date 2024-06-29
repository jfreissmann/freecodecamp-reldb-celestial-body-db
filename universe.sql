--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    hubble_type character varying(32),
    year_discovered date,
    age_in_millions_of_years numeric
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
    name character varying(40) NOT NULL,
    planet_id integer,
    mass integer,
    used_by_ns boolean
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
    name character varying(40) NOT NULL,
    star_id integer,
    nr_moons integer,
    mass numeric,
    description text,
    is_habitable boolean
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    nr_planets integer,
    mass numeric,
    is_binary_system boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet_relate; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet_relate (
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    star_planet_relate_id integer NOT NULL,
    name character varying(16)
);


ALTER TABLE public.star_planet_relate OWNER TO freecodecamp;

--
-- Name: star_planet_relate_star_planet_relate_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_relate_star_planet_relate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_relate_star_planet_relate_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_relate_star_planet_relate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_relate_star_planet_relate_id_seq OWNED BY public.star_planet_relate.star_planet_relate_id;


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
-- Name: star_planet_relate star_planet_relate_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_relate ALTER COLUMN star_planet_relate_id SET DEFAULT nextval('public.star_planet_relate_star_planet_relate_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral (barred)', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral (regular)', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'NGC 1300', 'spiral (barred)', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'M102', 'lenticular', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 4486', 'elliptical', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'ESO 383-76', 'elliptical', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Mon', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Eye of Skye', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Smirnum', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Vasiris', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Plaboos', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Vrumius', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Spurgus', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Shmyrzle', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Floopus', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Nunjy', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Largus', 13, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Grandius', 13, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Hugemis', 13, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Grossus', 13, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Xylel', 13, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Rolf', 13, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Jens Joachim', 13, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Smus', 13, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Pricesspuss', 13, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Florm', 13, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Spercum', 13, NULL, NULL);
INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 0.055, 'closest planet to the sun', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 0.9499, 'densest atmosphere terrestrial planet', false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 1.0, 'my boy!', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 0.107, 'Life on mars aint just a song', true);
INSERT INTO public.planet VALUES (5, 'Treffaldarium', 3, 4, 1.3, 'dont visit ever', true);
INSERT INTO public.planet VALUES (6, 'Sigmunium', 5, NULL, 1.00132, NULL, false);
INSERT INTO public.planet VALUES (7, 'Pralerium', 5, 2, 1.027, 'mysteriuos', false);
INSERT INTO public.planet VALUES (8, 'Semierde', 3, 1, 0.5, 'interesting', false);
INSERT INTO public.planet VALUES (9, 'Middleearth', 2, 2, 0.95, 'Skip Mordor when vistin', true);
INSERT INTO public.planet VALUES (10, 'Cryptobroium', 2, 0, 0.333, 'hellish', false);
INSERT INTO public.planet VALUES (12, 'Elvenius', 5, 4, 0.89, NULL, false);
INSERT INTO public.planet VALUES (13, 'Gigantus', 4, 34, 20.5, 'of average size', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 2, 0.125, false);
INSERT INTO public.star VALUES (1, 'Sun', 1, 8, 1.0, false);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, NULL, 2.0, true);
INSERT INTO public.star VALUES (4, 'Eta Cassiopeiae', 1, NULL, 0.97, true);
INSERT INTO public.star VALUES (5, 'Illuminati', 6, 23, 1.05, false);
INSERT INTO public.star VALUES (6, 'Parasun', 2, 9, 0.99, false);


--
-- Data for Name: star_planet_relate; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet_relate VALUES (1, 1, 1, NULL);
INSERT INTO public.star_planet_relate VALUES (1, 2, 2, NULL);
INSERT INTO public.star_planet_relate VALUES (3, 5, 3, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_planet_relate_star_planet_relate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_relate_star_planet_relate_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star_planet_relate star_planet_relate_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_relate
    ADD CONSTRAINT star_planet_relate_pkey PRIMARY KEY (star_planet_relate_id);


--
-- Name: star_planet_relate star_planet_relate_star_planet_relate_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_relate
    ADD CONSTRAINT star_planet_relate_star_planet_relate_id_key UNIQUE (star_planet_relate_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: star_planet_relate star_planet_relate_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_relate
    ADD CONSTRAINT star_planet_relate_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planet_relate star_planet_relate_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_relate
    ADD CONSTRAINT star_planet_relate_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

