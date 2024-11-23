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
    age_in_millions_of_years integer NOT NULL,
    galaxy_type text,
    diameter_in_light_years numeric(10,2),
    has_black_hole boolean DEFAULT false,
    is_spiral boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    distance_from_planet_km integer,
    is_spherical boolean,
    has_atmosphere boolean DEFAULT false,
    orbital_period_days numeric(8,2)
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
    star_id integer NOT NULL,
    planet_type text,
    diameter_km integer,
    has_atmosphere boolean,
    has_life boolean DEFAULT false,
    orbital_period_days numeric(10,2),
    surface_temperature_celsius integer
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
-- Name: planetary_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_system (
    planetary_system_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    number_of_planets integer,
    has_asteroid_belt boolean,
    age_in_millions_of_years integer
);


ALTER TABLE public.planetary_system OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_system_planetary_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_system_planetary_system_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_system_planetary_system_id_seq OWNED BY public.planetary_system.planetary_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    mass_solar_masses numeric(8,2),
    is_binary boolean DEFAULT false,
    has_planetary_system boolean,
    color character varying(30)
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planetary_system planetary_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system ALTER COLUMN planetary_system_id SET DEFAULT nextval('public.planetary_system_planetary_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Spiral', 100000.00, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Spiral', 220000.00, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 'Spiral', 60000.00, false, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1101, 'Irregular', 14000.00, false, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 6500, 'Irregular', 7000.00, false, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 13250, 'Spiral', 50000.00, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3475, 384400, true, false, 27.32);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 9377, false, false, 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 23460, false, false, 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3642, 421700, true, false, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 671100, true, false, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5262, 1070400, true, false, 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882700, true, false, 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 1221870, true, true, 15.95);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 238040, true, false, 1.37);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 185540, true, false, 0.94);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 2707, 354760, true, true, 5.88);
INSERT INTO public.moon VALUES (12, 'Naiad', 8, 58, 48227, false, false, 0.29);
INSERT INTO public.moon VALUES (13, 'Thalassa', 8, 80, 50074, false, false, 0.31);
INSERT INTO public.moon VALUES (14, 'Despina', 8, 150, 52526, false, false, 0.33);
INSERT INTO public.moon VALUES (15, 'Galatea', 8, 174, 61953, false, false, 0.43);
INSERT INTO public.moon VALUES (16, 'Larissa', 8, 194, 73548, false, false, 0.55);
INSERT INTO public.moon VALUES (17, 'Proteus', 8, 420, 117647, false, false, 1.12);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 340, 5513818, false, false, 360.13);
INSERT INTO public.moon VALUES (19, 'Halimede', 8, 62, 15728000, false, false, 1879.08);
INSERT INTO public.moon VALUES (20, 'Sao', 8, 44, 22422000, false, false, 2914.07);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4879, false, false, 88.00, 167);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 12104, true, false, 224.70, 464);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 12742, true, true, 365.26, 15);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 6779, true, false, 687.00, -63);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 139820, true, false, 4333.00, -110);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 116460, true, false, 10759.22, -140);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 50724, true, false, 30687.15, -195);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 49244, true, false, 60190.03, -200);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Super Earth', 12742, true, false, 11.20, -39);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 6, 'Super Earth', 11184, true, false, 129.90, -64);
INSERT INTO public.planet VALUES (11, 'HD 40307g', 6, 'Super Earth', 16173, true, false, 197.80, -27);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 6, 'Super Earth', 15290, true, false, 36.60, -37);


--
-- Data for Name: planetary_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_system VALUES (1, 'Solar System', 1, 8, true, 4600);
INSERT INTO public.planetary_system VALUES (2, 'Proxima Centauri System', 2, 1, false, 4850);
INSERT INTO public.planetary_system VALUES (3, 'Alpha Centauri System', 3, 0, false, 5300);
INSERT INTO public.planetary_system VALUES (4, 'Vega System', 6, 2, true, 455);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.00, false, true, 'Yellow');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, 0.12, false, true, 'Red');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5790, 1.10, true, true, 'Yellow');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3600, 17.50, false, false, 'Red');
INSERT INTO public.star VALUES (5, 'Sirius', 1, 9940, 2.02, true, false, 'White');
INSERT INTO public.star VALUES (6, 'Vega', 1, 9602, 2.15, false, true, 'Blue-white');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_system_planetary_system_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planetary_system planetary_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_name_key UNIQUE (name);


--
-- Name: planetary_system planetary_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_pkey PRIMARY KEY (planetary_system_id);


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
-- Name: planetary_system planetary_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

