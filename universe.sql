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
    name character varying(50) NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    has_quasars boolean NOT NULL,
    age_in_billion integer,
    star_formation boolean NOT NULL,
    total_stars_in_billion integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_family; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_family (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer,
    moon_id integer,
    galaxy_family_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.galaxy_family OWNER TO freecodecamp;

--
-- Name: galaxy_family_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_family_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_family_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_family_id_seq OWNED BY public.galaxy_family.galaxy_family_id;


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
    name character varying(50) NOT NULL,
    radius integer,
    has_air boolean,
    mass integer,
    distance_from_planet integer,
    has_surface boolean,
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
    name character varying(50) NOT NULL,
    habitable boolean,
    has_life boolean,
    age_in_billion integer,
    mass integer,
    gravitation numeric(4,2),
    description text,
    star_id integer
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
    name character varying(50) NOT NULL,
    temp_in_kelvin integer NOT NULL,
    solar_mass integer,
    gravitation numeric(4,2),
    type character varying(50),
    solar_radius integer NOT NULL,
    is_pulsar boolean,
    dyson_sphere boolean,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_family galaxy_family_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_family ALTER COLUMN galaxy_family_id SET DEFAULT nextval('public.galaxy_family_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Pisces', 'Spiral', true, 1, true, 50);
INSERT INTO public.galaxy VALUES (2, 'Bosons Halo', 'Irregular', true, 4, true, 90);
INSERT INTO public.galaxy VALUES (4, 'Einstein-5', 'Irregular', true, 4, true, 90);
INSERT INTO public.galaxy VALUES (5, 'Tinycosm', 'Disc', false, 12, true, 80);
INSERT INTO public.galaxy VALUES (6, 'Foundation Alpha', 'Elliptical', true, 4, true, 90);
INSERT INTO public.galaxy VALUES (7, 'Tachiyostorm', 'Disc', false, 14, false, 10);
INSERT INTO public.galaxy VALUES (3, 'Beta Centaury', 'Elliptical', true, 30, true, 90);


--
-- Data for Name: galaxy_family; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_family VALUES (1, 1, 1, 1, 1, 'Laniyakeya');
INSERT INTO public.galaxy_family VALUES (2, 3, 3, 2, 2, 'Aura');
INSERT INTO public.galaxy_family VALUES (3, 2, 4, 4, 3, 'Lola');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 12, true, 3, 33, true, 2);
INSERT INTO public.moon VALUES (2, 'Titan', 12, true, 3, 33, true, 2);
INSERT INTO public.moon VALUES (3, 'Ganymede', 23, false, 2, 23, true, 1);
INSERT INTO public.moon VALUES (4, 'Europa', 23, false, 2, 24, true, 1);
INSERT INTO public.moon VALUES (5, 'Io', 12, true, 3, 33, true, 2);
INSERT INTO public.moon VALUES (6, 'Enceladus', 23, false, 2, 23, true, 1);
INSERT INTO public.moon VALUES (7, 'Triton', 23, false, 2, 24, true, 1);
INSERT INTO public.moon VALUES (8, 'Callisto', 23, false, 2, 24, true, 3);
INSERT INTO public.moon VALUES (9, 'Phobos', 12, true, 3, 33, true, 2);
INSERT INTO public.moon VALUES (10, 'Deimos', 23, false, 2, 23, true, 1);
INSERT INTO public.moon VALUES (11, 'Charon', 23, false, 2, 24, true, 1);
INSERT INTO public.moon VALUES (12, 'Oberon', 23, false, 2, 24, true, 3);
INSERT INTO public.moon VALUES (13, 'Rhea', 12, true, 3, 33, true, 2);
INSERT INTO public.moon VALUES (14, 'Dione', 23, false, 2, 23, true, 1);
INSERT INTO public.moon VALUES (15, 'Tethys', 23, false, 2, 24, true, 1);
INSERT INTO public.moon VALUES (16, 'Mimas', 23, false, 2, 24, true, 3);
INSERT INTO public.moon VALUES (17, 'Miranda', 12, true, 3, 33, true, 2);
INSERT INTO public.moon VALUES (18, 'Ariel', 23, false, 2, 23, true, 1);
INSERT INTO public.moon VALUES (19, 'Umbriel', 23, false, 2, 24, true, 1);
INSERT INTO public.moon VALUES (20, 'Hyperion', 23, false, 2, 24, true, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Romulus', true, true, 12, 3, 12.90, 'A cool planet which is habited by a species names Romulans', 1);
INSERT INTO public.planet VALUES (2, 'Valrkrie', true, true, 13, 23, 2.90, 'A surfaceless planet which is habited by a species names Valkerine', 1);
INSERT INTO public.planet VALUES (3, 'Valeria', true, true, 13, 23, 2.90, 'A rocky planet which is habited by a species names valerians', 2);
INSERT INTO public.planet VALUES (4, 'Mandaloria', true, true, 13, 23, 2.90, 'A rocky planet which is habited by a species names Mandalorain', 2);
INSERT INTO public.planet VALUES (5, 'Torinia', true, true, 13, 23, 2.90, 'A rocky planet which is habited by a species names Torinians', 3);
INSERT INTO public.planet VALUES (6, 'Andalusia', true, false, 13, 23, 2.90, 'A barren, desolate planet', 5);
INSERT INTO public.planet VALUES (7, 'Andora', true, true, 13, 23, 2.90, 'A barren, desolate planet with only desert and rocky mountains', 7);
INSERT INTO public.planet VALUES (8, 'Arrakis', true, true, 14, 22, 9.80, 'This planet is once a ocean planet now a desert planet', 8);
INSERT INTO public.planet VALUES (9, 'Dothraki', true, true, 15, 25, 8.20, 'This planet is habited by a type of species named dothrakins', 9);
INSERT INTO public.planet VALUES (10, 'Anunaki', true, true, 15, 25, 8.20, 'This planet is habited by a type of species named anunakins', 9);
INSERT INTO public.planet VALUES (11, 'Tobyland', true, true, 17, 35, 5.40, 'This planet is habited by a type of species named Tobians', 6);
INSERT INTO public.planet VALUES (12, 'Turkland', true, true, 27, 35, 4.40, 'This planet is habited by a type of species named Turkies', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Terminus', 32000, 3, 20.20, 'm', 200, true, false, 2);
INSERT INTO public.star VALUES (2, 'Tonikawa', 4000, 3, 10.30, 'b', 200, true, false, 2);
INSERT INTO public.star VALUES (3, 'Tyson', 5000, 3, 13.80, 'c', 500, false, true, 1);
INSERT INTO public.star VALUES (5, 'Rhobus', 9000, 3, 13.80, 'a', 500, false, true, 3);
INSERT INTO public.star VALUES (6, 'Plubas', 7000, 23, 15.80, 'k', 500, false, true, 3);
INSERT INTO public.star VALUES (7, 'Tyrus', 67000, 223, 15.80, 'k', 500, false, true, 4);
INSERT INTO public.star VALUES (8, 'Murcharus', 8000, 223, 14.30, 'k', 600, false, true, 5);
INSERT INTO public.star VALUES (9, 'Valeiya', 300, 244, 14.30, 'b', 6600, false, true, 5);
INSERT INTO public.star VALUES (10, 'Fountain Sphere', 30, 244, 14.30, 'b', 6600, false, true, 6);
INSERT INTO public.star VALUES (11, 'Budh', 30, 244, 14.30, 'b', 6600, true, true, 6);
INSERT INTO public.star VALUES (12, 'Shoni', 20, 234, 13.30, 'b', 6600, true, true, 6);


--
-- Name: galaxy_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_family_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy_family galaxy_family_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_family
    ADD CONSTRAINT galaxy_family_pkey PRIMARY KEY (galaxy_family_id);


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
-- Name: galaxy_family name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_family
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: galaxy_family galaxy_family_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_family
    ADD CONSTRAINT galaxy_family_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_family galaxy_family_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_family
    ADD CONSTRAINT galaxy_family_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_family galaxy_family_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_family
    ADD CONSTRAINT galaxy_family_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_family galaxy_family_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_family
    ADD CONSTRAINT galaxy_family_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

