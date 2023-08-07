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
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    galaxy_age_in_millon_years numeric(10,2) NOT NULL,
    galaxy_size_in_light_years numeric(10,2) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    moon_has_life boolean NOT NULL,
    moon_surface_km2 numeric NOT NULL,
    moon_desc character varying(255),
    planet_id integer NOT NULL,
    moon_col_int1 integer,
    moon_col_int2 integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_temp_in_celsius integer NOT NULL,
    planet_has_life boolean NOT NULL,
    name character varying(50) NOT NULL,
    planet_type text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: race; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.race (
    race_id integer NOT NULL,
    name character varying(50) NOT NULL,
    race_colour character varying(30),
    race_antiquity integer,
    race_life_expectancy integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.race OWNER TO freecodecamp;

--
-- Name: race_race_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.race_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_race_id_seq OWNER TO freecodecamp;

--
-- Name: race_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.race_race_id_seq OWNED BY public.race.race_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_desc character varying(255) NOT NULL,
    star_most_abundant_element character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: race race_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race ALTER COLUMN race_id SET DEFAULT nextval('public.race_race_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy (Barred spiral)', 10500.00, 220000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy (Barred spiral)', 10500.00, 220000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral galaxy', 6500.00, 60000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral galaxy', 400.00, 60000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Gallaxy', 'Spiral galaxy (Unbarred lenticular galaxy)', 9550.00, 50000.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Spiral galaxy', 3500.00, 170000.00);
INSERT INTO public.galaxy VALUES (7, 'Large Mallenalic Cloud', 'Irregular', 1750.00, 14000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', true, 1700, 'Earths natural satellite, The Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', false, 5260, 'Largest moon in the solar system', 10, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', true, 41900000, 'Volcanically active moon', 10, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Deimos', true, 49900000, 'Shortest moon in Mars', 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Sabrosa', true, 65000, 'La luna mas sabrosa del planetoide achanai', 11, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Forma de polla', false, 1250000, 'Esta luna tiene pene', 8, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Ariel', true, 9200000, 'Uranus brightest moon', 13, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Titania', false, 7800000, 'Uranus largest moon', 13, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Oberon', false, 7200000, 'Dark, heavily created moon', 13, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Miranda', false, 700000, 'Has diverse geological features', 13, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', false, 23100000, 'Saturns seconds largest moon', 14, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Dione', true, 7100000, 'Known for its ice cliffs', 14, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', false, 4000000, 'Active moon with water jets', 14, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Mimas', true, 4300000, 'Notable for its large impact crater', 14, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Europa', false, 30900000, 'Ice-covered moon with a subsurface ocean', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Callisto', true, 76900000, 'Heavily created moon', 9, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Gnorme', true, 99900000, 'Largest moon knowed', 12, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Por Dios', false, 69, 'Me canse de meter lunas', 12, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Chiquitita pero traviesa', false, -20, 'La lunita mas chiquilina del universe', 11, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'End', true, 20000000, 'Termine de meter lunas al fin', 1, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 15, true, 'Earth', NULL, 7);
INSERT INTO public.planet VALUES (2, 130, false, 'Mercury', NULL, 7);
INSERT INTO public.planet VALUES (3, 10, true, 'Proxima Centauri B', 'Potentially Rocky Exoplanet', 8);
INSERT INTO public.planet VALUES (4, -63, true, 'Mars', 'Rocky planet(Terrestrial)', 7);
INSERT INTO public.planet VALUES (5, 30, false, 'Canchalfa', 'Rocky planet', 3);
INSERT INTO public.planet VALUES (6, 1400, false, 'Cuchurrumin', 'Gas Giant', 1);
INSERT INTO public.planet VALUES (7, -200, false, 'Chiki Chiki', 'Ice Giant', 4);
INSERT INTO public.planet VALUES (8, 5, false, 'Kepler -8=D', 'Potentially Rocky Exoplanet', 2);
INSERT INTO public.planet VALUES (9, -145, false, 'Jupyter', 'Gas Giant', 7);
INSERT INTO public.planet VALUES (10, -225, false, 'Pluton', 'Dwarf Planet', 7);
INSERT INTO public.planet VALUES (11, -400, true, 'Chiquilin', 'Dwarf Planet', 2);
INSERT INTO public.planet VALUES (12, 15, true, 'Pim Pum Pam', 'Rocky Planet', 2);
INSERT INTO public.planet VALUES (13, -50, false, 'Uranus', 'Rocky Planet', 7);
INSERT INTO public.planet VALUES (14, 400, false, 'Saturn', 'Gas Giant', 7);


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.race VALUES (1, 'Humans', 'Grey', 120000, 120, 1);
INSERT INTO public.race VALUES (2, 'Elfs', 'Pink', 500000, 1940, 4);
INSERT INTO public.race VALUES (3, 'Floran', 'Green', 230000, 30, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Pollux', 'The brightest star in Gemini constellation, part of the Castor-Pollux binary system, ', 'Carbon', 1);
INSERT INTO public.star VALUES (2, 'R Doradus', 'Red giant star in the Dorado constellation', 'Carbon', 7);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'Bright binary star and one of the corners of the Great Square of Pegasus', 'Hydrogen', 2);
INSERT INTO public.star VALUES (4, 'Mirach', 'Red giant star in the Andromeda constellation, visible to the naked eye', 'Hydrogen', 2);
INSERT INTO public.star VALUES (5, 'Alpumninence', 'Bright star marking the northern crowns brightest point', 'Hydrogen', 5);
INSERT INTO public.star VALUES (6, 'Anser', 'Binary star system located in the constellation Vulpecula', 'Hydrogen', 3);
INSERT INTO public.star VALUES (7, 'The Sun', 'Our solar system s star', 'Hydrogen', 1);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 'Closest known star to the sun', 'Hydrogen', 1);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 7, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 21, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 14, true);


--
-- Name: race_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.race_race_id_seq', 3, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 8, true);


--
-- Name: galaxy galaxies_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: race race_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_pkey PRIMARY KEY (race_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: star stars_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_star_name_key UNIQUE (name);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: race unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


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
-- Name: race race_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


