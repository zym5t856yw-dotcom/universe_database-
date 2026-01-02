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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    description text,
    star_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
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
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, 13600, 'Our home galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, true, 10000, 'Nearest major galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, true, 12000, 'Small spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, true, 8000, 'Interacting spiral galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, true, 9000, 'Galaxy with a bright nucleus', NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 500000000, false, 500, 'Ring galaxy formed by collision', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Oberon', 0, true, 4500, 'Large outer moon of Uranus', 7);
INSERT INTO public.moon VALUES (1, 'Moon', 0, true, 4500, 'Earth''s natural satellite', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, false, 4500, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0, false, 4500, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (4, 'Io', 0, true, 4500, 'Volcanically active moon of Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 0, true, 4500, 'Icy moon of Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0, true, 4500, 'Largest moon in the solar system', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 0, true, 4500, 'Cratered moon of Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 0, true, 4500, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 0, true, 4500, 'Icy moon of Saturn with geysers', 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 0, true, 4500, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 0, true, 4500, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 0, true, 4500, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (13, 'Titan', 0, true, 4500, 'Largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 0, true, 4500, 'Two-toned moon of Saturn', 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 0, true, 4500, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 0, true, 4500, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 0, true, 4500, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Triton', 0, true, 4500, 'Moon of Neptune', 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 0, false, 4500, 'Moon of Neptune', 8);
INSERT INTO public.moon VALUES (20, 'Oberon', 0, true, 4500, 'Large outer moon of Uranus', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, true, 4500, 'Closest planet to the Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, true, 4500, 'Second planet from the Sun', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0, true, 4500, 'Our home planet', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0, true, 4500, 'The red planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 0, true, 4500, 'Gas giant, largest planet', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 0, true, 4500, 'Gas giant with rings', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 0, true, 4500, 'Ice giant with tilted axis', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 0, true, 4500, 'Distant ice giant', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4.24, true, 4500, 'Exoplanet orbiting Proxima Centauri', 2);
INSERT INTO public.planet VALUES (10, 'Sirius b Planet 1', 8.6, true, 2000, 'Imaginary planet around Sirius', 3);
INSERT INTO public.planet VALUES (11, 'Rigel Planet 1', 860, true, 100, 'Imaginary planet around Rigel', 4);
INSERT INTO public.planet VALUES (12, 'Andromeda Planet 1', 2537000, true, 3000, 'Imaginary planet in Andromeda', 5);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Mercury', 'Smallest planet; rocky terrestrial world closest to the Sun');
INSERT INTO public.planet_types VALUES (2, 'Venus', 'Terrestrial planet with dense CO₂ atmosphere and extreme surface temperatures');
INSERT INTO public.planet_types VALUES (3, 'Earth', 'Terrestrial planet with liquid water and life');
INSERT INTO public.planet_types VALUES (4, 'Mars', 'Terrestrial planet known as the Red Planet with evidence of past water');
INSERT INTO public.planet_types VALUES (5, 'Jupiter', 'Largest planet; gas giant with prominent bands and the Great Red Spot');
INSERT INTO public.planet_types VALUES (6, 'Saturn', 'Gas giant famous for its extensive ring system');
INSERT INTO public.planet_types VALUES (7, 'Uranus', 'Ice giant with extreme axial tilt and methane-rich atmosphere');
INSERT INTO public.planet_types VALUES (8, 'Neptune', 'Ice giant with strong winds and deep blue coloration');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 4600, 'Star at the center of our solar system', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.24, 4500, 'Closest known star to the Sun', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 8.6, 242, 'Brightest star in the night sky', 1);
INSERT INTO public.star VALUES (4, 'Rigel', 860, 8, 'Blue supergiant in Orion', 1);
INSERT INTO public.star VALUES (5, 'Andromeda Star A', 2537000, 5000, 'Example star in Andromeda', 2);
INSERT INTO public.star VALUES (6, 'Sombrero Star A', 29000000, 6000, 'Example star in Sombrero galaxy', 5);


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
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_planet_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_types_id_key UNIQUE (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

