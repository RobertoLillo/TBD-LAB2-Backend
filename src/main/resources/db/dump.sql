--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 12.2

-- Started on 2020-08-16 19:51:11 UTC

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

--
-- TOC entry 204 (class 1255 OID 16456)
-- Name: add_enrolled_volunteer(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.add_enrolled_volunteer() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.flag_participated = true THEN
        UPDATE tasks SET enrolled_volunteers = enrolled_volunteers + 1
        WHERE id = NEW.id_task;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.add_enrolled_volunteer() OWNER TO postgres;

--
-- TOC entry 203 (class 1255 OID 16454)
-- Name: emergency_start_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.emergency_start_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.start_date = CURRENT_DATE;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.emergency_start_date() OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 16855)
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    id uuid NOT NULL,
    description character varying(250)
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16880)
-- Name: emergencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emergencies (
    id uuid NOT NULL,
    id_institution uuid NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(250),
    start_date date NOT NULL,
    finish_date date
);


ALTER TABLE public.emergencies OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16875)
-- Name: institutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions (
    id uuid NOT NULL,
    name character varying(100)
);


ALTER TABLE public.institutions OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16900)
-- Name: rankings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rankings (
    id uuid NOT NULL,
    id_volunteer uuid NOT NULL,
    id_task uuid NOT NULL,
    score integer,
    flag_invited boolean NOT NULL,
    flag_participated boolean
);


ALTER TABLE public.rankings OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16890)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id uuid NOT NULL,
    id_emergency uuid NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(250),
    required_volunteers integer NOT NULL,
    enrolled_volunteers integer,
    start_date date NOT NULL,
    finish_date date
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16850)
-- Name: volunteers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers (
    id uuid NOT NULL,
    name character varying(100)
);


ALTER TABLE public.volunteers OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16860)
-- Name: volunteers_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers_abilities (
    id uuid NOT NULL,
    id_volunteer uuid NOT NULL,
    id_ability uuid NOT NULL
);


ALTER TABLE public.volunteers_abilities OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 16855)
-- Dependencies: 197
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (id, description) FROM stdin;
72a6f398-a3ac-11ea-bb37-0242ac130002	Fuerza y resistencia
72a6f5d2-a3ac-11ea-bb37-0242ac130002	Manejo de la matemática básica como álgebra y buena ortografía
72a6f6c2-a3ac-11ea-bb37-0242ac130002	Habilidades de comunicación con abuelos y niños
72a6f794-a3ac-11ea-bb37-0242ac130002	Empatia y paciencia
72a6f852-a3ac-11ea-bb37-0242ac130002	Hábil y delicado con los animales
72a70234-a3ac-11ea-bb37-0242ac130002	Orden y limpieza en su lugar de trabajo
72a70374-a3ac-11ea-bb37-0242ac130002	No tener fobia a la sangre, heridas, cortes y las jeringas
72a70446-a3ac-11ea-bb37-0242ac130002	Capacidad de trabajar bajo presión
72a70504-a3ac-11ea-bb37-0242ac130002	Capacidad de organizar y liderar una gran cantidad de personas
72a705c2-a3ac-11ea-bb37-0242ac130002	Conocimientos de Reanimación cardiopulmonar (RCP)
72a70680-a3ac-11ea-bb37-0242ac130002	Buena orientación
72a7073e-a3ac-11ea-bb37-0242ac130002	Experiencia de rescates en bosques
72a707f2-a3ac-11ea-bb37-0242ac130002	Posibilidad de movilización por sus propios medios (Traslado)
72a70a9a-a3ac-11ea-bb37-0242ac130002	Disposición para aprender
72a70b6c-a3ac-11ea-bb37-0242ac130002	Comunicación oral eficiente al trabajar en equipo
\.


--
-- TOC entry 2911 (class 0 OID 16880)
-- Dependencies: 200
-- Data for Name: emergencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emergencies (id, id_institution, name, description, start_date, finish_date) FROM stdin;
ae844504-d52b-11ea-87d0-0242ac130003	f6ff29aa-a3af-11ea-bb37-0242ac130002	Construccion de mediaguas por covid	Se necesita gente que desee ayudar a construir mediaguas para la gente en situacion de calle en medio de la pandemia	2020-06-12	2020-06-15
ae844734-d52b-11ea-87d0-0242ac130003	f6ff2bf8-a3af-11ea-bb37-0242ac130002	URGENTE ayuda para los perros de la USACH	Hubo una pelea entre los perros de la USACH, algunos resultaron muy heridos, se necesita ayuda para separarlos y atender sus heridas	2020-01-03	2020-01-10
ae84482e-d52b-11ea-87d0-0242ac130003	f6ff2cf2-a3af-11ea-bb37-0242ac130002	Se necesita ayuda para cuidar abuelos	Debido a una falta de personal se necesita gente para pasar tiempo con abuelos y desarrolar tareas basicas como ayudarlos a comer y hablar con ellos para entretenerlos	2020-03-14	2020-03-15
ae844a5e-d52b-11ea-87d0-0242ac130003	f6ff2dc4-a3af-11ea-bb37-0242ac130002	Incendio en Valparaiso	Se necesita gente para ayuda y contencion de afectados por incendio en Valparaiso	2019-12-20	2019-12-25
ae844b30-d52b-11ea-87d0-0242ac130003	f6ff2e8c-a3af-11ea-bb37-0242ac130002	Busqueda intensiva de persona perdida en bosque	Se perdio una persona en la Reserva Nacional Laguna Parrillar, Region de Magallanes. Se buscan personas con experiencia en este tipo de acontecimientos que puedan ser de ayuda	2019-08-31	2019-09-05
ae844bf8-d52b-11ea-87d0-0242ac130003	f6ff2bf8-a3af-11ea-bb37-0242ac130002	Se necesita gente que ayude a alimentar perros de la USACH	Se necesita gente que pueda acercarse a la USACH y alimentar a los perros a cargo de AEDA	2020-08-11	2020-08-25
\.


--
-- TOC entry 2910 (class 0 OID 16875)
-- Dependencies: 199
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutions (id, name) FROM stdin;
f6ff29aa-a3af-11ea-bb37-0242ac130002	Fundación un techo para Chile (TECHO)
f6ff2bf8-a3af-11ea-bb37-0242ac130002	Agrupación de Estudiantes por la Defensa Animal (AEDA)
f6ff2cf2-a3af-11ea-bb37-0242ac130002	Fundacion las Rosas
f6ff2dc4-a3af-11ea-bb37-0242ac130002	Corporación Nacional Forestal (CONAF)
f6ff2e8c-a3af-11ea-bb37-0242ac130002	Search & Rescue Chile (SARCHILE)
\.


--
-- TOC entry 2913 (class 0 OID 16900)
-- Dependencies: 202
-- Data for Name: rankings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rankings (id, id_volunteer, id_task, score, flag_invited, flag_participated) FROM stdin;
ea00894e-db61-11ea-87d0-0242ac130003	4a996fa4-a3a5-11ea-bb37-0242ac130002	a1c65d8c-d5af-11ea-87d0-0242ac130003	5	t	t
ea008c32-db61-11ea-87d0-0242ac130003	4a997062-a3a5-11ea-bb37-0242ac130002	a1c65d8c-d5af-11ea-87d0-0242ac130003	2	t	t
ea008dfe-db61-11ea-87d0-0242ac130003	4a997116-a3a5-11ea-bb37-0242ac130002	a1c65d8c-d5af-11ea-87d0-0242ac130003	1	t	t
ea008fe8-db61-11ea-87d0-0242ac130003	4a997490-a3a5-11ea-bb37-0242ac130002	a1c65d8c-d5af-11ea-87d0-0242ac130003	2	t	t
ea0090ce-db61-11ea-87d0-0242ac130003	4a995f8c-a3a5-11ea-bb37-0242ac130002	a1c65f9e-d5af-11ea-87d0-0242ac130003	3	t	t
ea0092c2-db61-11ea-87d0-0242ac130003	4a9961a8-a3a5-11ea-bb37-0242ac130002	a1c65f9e-d5af-11ea-87d0-0242ac130003	4	t	t
ea0093a8-db61-11ea-87d0-0242ac130003	4a99666c-a3a5-11ea-bb37-0242ac130002	a1c65f9e-d5af-11ea-87d0-0242ac130003	2	t	t
ea00947a-db61-11ea-87d0-0242ac130003	4a997300-a3a5-11ea-bb37-0242ac130002	a1c65f9e-d5af-11ea-87d0-0242ac130003	3	t	t
ea009650-db61-11ea-87d0-0242ac130003	4a997490-a3a5-11ea-bb37-0242ac130002	a1c65f9e-d5af-11ea-87d0-0242ac130003	5	t	t
ea00972c-db61-11ea-87d0-0242ac130003	4a99672a-a3a5-11ea-bb37-0242ac130002	a1c66098-d5af-11ea-87d0-0242ac130003	5	t	t
ea0098ee-db61-11ea-87d0-0242ac130003	4a996cac-a3a5-11ea-bb37-0242ac130002	a1c66098-d5af-11ea-87d0-0242ac130003	5	t	t
ea0099b6-db61-11ea-87d0-0242ac130003	4a996d6a-a3a5-11ea-bb37-0242ac130002	a1c66098-d5af-11ea-87d0-0242ac130003	3	t	t
ea009ba0-db61-11ea-87d0-0242ac130003	4a996ee6-a3a5-11ea-bb37-0242ac130002	a1c66098-d5af-11ea-87d0-0242ac130003	3	t	t
ea009c72-db61-11ea-87d0-0242ac130003	4a997062-a3a5-11ea-bb37-0242ac130002	a1c66098-d5af-11ea-87d0-0242ac130003	4	t	t
ea009ec0-db61-11ea-87d0-0242ac130003	4a99628e-a3a5-11ea-bb37-0242ac130002	a1c6628c-d5af-11ea-87d0-0242ac130003	2	t	t
ea00a03c-db61-11ea-87d0-0242ac130003	4a9964c8-a3a5-11ea-bb37-0242ac130002	a1c6628c-d5af-11ea-87d0-0242ac130003	4	t	t
ea00a1ea-db61-11ea-87d0-0242ac130003	4a9965ae-a3a5-11ea-bb37-0242ac130002	a1c6628c-d5af-11ea-87d0-0242ac130003	3	t	t
ea00a2b2-db61-11ea-87d0-0242ac130003	4a996cac-a3a5-11ea-bb37-0242ac130002	a1c6628c-d5af-11ea-87d0-0242ac130003	2	t	t
ea00a532-db61-11ea-87d0-0242ac130003	4a996d6a-a3a5-11ea-bb37-0242ac130002	a1c6628c-d5af-11ea-87d0-0242ac130003	1	t	t
ea00a604-db61-11ea-87d0-0242ac130003	4a9973d2-a3a5-11ea-bb37-0242ac130002	a1c6628c-d5af-11ea-87d0-0242ac130003	4	t	t
ea00a6c2-db61-11ea-87d0-0242ac130003	4a9961a8-a3a5-11ea-bb37-0242ac130002	a1c66368-d5af-11ea-87d0-0242ac130003	5	t	t
ea00a78a-db61-11ea-87d0-0242ac130003	4a996bb2-a3a5-11ea-bb37-0242ac130002	a1c66368-d5af-11ea-87d0-0242ac130003	5	t	t
ea00a9b0-db61-11ea-87d0-0242ac130003	4a996e28-a3a5-11ea-bb37-0242ac130002	a1c66368-d5af-11ea-87d0-0242ac130003	4	t	t
ea00aa78-db61-11ea-87d0-0242ac130003	4a996ee6-a3a5-11ea-bb37-0242ac130002	a1c66368-d5af-11ea-87d0-0242ac130003	3	t	t
ea00ab36-db61-11ea-87d0-0242ac130003	4a997490-a3a5-11ea-bb37-0242ac130002	a1c66368-d5af-11ea-87d0-0242ac130003	2	t	t
ea00ad48-db61-11ea-87d0-0242ac130003	4a99628e-a3a5-11ea-bb37-0242ac130002	a1c66430-d5af-11ea-87d0-0242ac130003	1	t	t
ea00af1e-db61-11ea-87d0-0242ac130003	4a99666c-a3a5-11ea-bb37-0242ac130002	a1c66430-d5af-11ea-87d0-0242ac130003	5	t	t
ea00b108-db61-11ea-87d0-0242ac130003	4a996bb2-a3a5-11ea-bb37-0242ac130002	a1c66430-d5af-11ea-87d0-0242ac130003	5	t	t
ea00b2a2-db61-11ea-87d0-0242ac130003	4a996e28-a3a5-11ea-bb37-0242ac130002	a1c66430-d5af-11ea-87d0-0242ac130003	2	t	t
ea00b3ce-db61-11ea-87d0-0242ac130003	4a997490-a3a5-11ea-bb37-0242ac130002	a1c66430-d5af-11ea-87d0-0242ac130003	4	t	t
ea00b9d2-db61-11ea-87d0-0242ac130003	4a995f8c-a3a5-11ea-bb37-0242ac130002	a1c664f8-d5af-11ea-87d0-0242ac130003	3	t	t
ea00baf4-db61-11ea-87d0-0242ac130003	4a99672a-a3a5-11ea-bb37-0242ac130002	a1c664f8-d5af-11ea-87d0-0242ac130003	3	t	t
ea00bbbc-db61-11ea-87d0-0242ac130003	4a9967e8-a3a5-11ea-bb37-0242ac130002	a1c664f8-d5af-11ea-87d0-0242ac130003	2	t	t
ea00bc84-db61-11ea-87d0-0242ac130003	4a996d6a-a3a5-11ea-bb37-0242ac130002	a1c664f8-d5af-11ea-87d0-0242ac130003	5	t	t
ea00bd4c-db61-11ea-87d0-0242ac130003	4a997116-a3a5-11ea-bb37-0242ac130002	a1c664f8-d5af-11ea-87d0-0242ac130003	4	t	t
ea00be78-db61-11ea-87d0-0242ac130003	4a9961a8-a3a5-11ea-bb37-0242ac130002	a1c665b6-d5af-11ea-87d0-0242ac130003	3	t	t
ea00c008-db61-11ea-87d0-0242ac130003	4a996cac-a3a5-11ea-bb37-0242ac130002	a1c665b6-d5af-11ea-87d0-0242ac130003	2	t	t
ea00c0d0-db61-11ea-87d0-0242ac130003	4a997062-a3a5-11ea-bb37-0242ac130002	a1c665b6-d5af-11ea-87d0-0242ac130003	2	t	t
ea00c31e-db61-11ea-87d0-0242ac130003	4a997490-a3a5-11ea-bb37-0242ac130002	a1c665b6-d5af-11ea-87d0-0242ac130003	1	t	t
ea00c3e6-db61-11ea-87d0-0242ac130003	4a9967e8-a3a5-11ea-bb37-0242ac130002	a1c66778-d5af-11ea-87d0-0242ac130003	3	t	t
ea00c4ae-db61-11ea-87d0-0242ac130003	4a99689c-a3a5-11ea-bb37-0242ac130002	a1c66778-d5af-11ea-87d0-0242ac130003	4	t	t
ea00c71a-db61-11ea-87d0-0242ac130003	4a996cac-a3a5-11ea-bb37-0242ac130002	a1c66778-d5af-11ea-87d0-0242ac130003	5	t	t
ea00c94a-db61-11ea-87d0-0242ac130003	4a996d6a-a3a5-11ea-bb37-0242ac130002	a1c66778-d5af-11ea-87d0-0242ac130003	4	t	t
ea00ca3a-db61-11ea-87d0-0242ac130003	4a99628e-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	5	t	t
ea00cbde-db61-11ea-87d0-0242ac130003	4a9965ae-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	3	t	t
ea00ccb0-db61-11ea-87d0-0242ac130003	4a9967e8-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	2	t	t
ea00cf30-db61-11ea-87d0-0242ac130003	4a99689c-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	5	t	t
ea00d002-db61-11ea-87d0-0242ac130003	4a996cac-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	4	t	t
ea00d0c0-db61-11ea-87d0-0242ac130003	4a996d6a-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	1	t	t
ea00d188-db61-11ea-87d0-0242ac130003	4a996fa4-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	3	t	t
ea00d2dc-db61-11ea-87d0-0242ac130003	4a997116-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	2	t	t
ea00d598-db61-11ea-87d0-0242ac130003	4a997490-a3a5-11ea-bb37-0242ac130002	a1c6684a-d5af-11ea-87d0-0242ac130003	5	t	t
ea00d67e-db61-11ea-87d0-0242ac130003	4a99672a-a3a5-11ea-bb37-0242ac130002	a1c668fe-d5af-11ea-87d0-0242ac130003	2	t	t
ea00d750-db61-11ea-87d0-0242ac130003	4a996bb2-a3a5-11ea-bb37-0242ac130002	a1c668fe-d5af-11ea-87d0-0242ac130003	4	t	t
ea00d80e-db61-11ea-87d0-0242ac130003	4a996e28-a3a5-11ea-bb37-0242ac130002	a1c668fe-d5af-11ea-87d0-0242ac130003	3	t	t
ea00d994-db61-11ea-87d0-0242ac130003	4a997490-a3a5-11ea-bb37-0242ac130002	a1c668fe-d5af-11ea-87d0-0242ac130003	2	t	t
ea00db88-db61-11ea-87d0-0242ac130003	4a9961a8-a3a5-11ea-bb37-0242ac130002	a1c669bc-d5af-11ea-87d0-0242ac130003	1	t	t
ea00dc5a-db61-11ea-87d0-0242ac130003	4a996cac-a3a5-11ea-bb37-0242ac130002	a1c669bc-d5af-11ea-87d0-0242ac130003	4	t	t
ea00de30-db61-11ea-87d0-0242ac130003	4a996d6a-a3a5-11ea-bb37-0242ac130002	a1c669bc-d5af-11ea-87d0-0242ac130003	5	t	t
ea00def8-db61-11ea-87d0-0242ac130003	4a996ee6-a3a5-11ea-bb37-0242ac130002	a1c669bc-d5af-11ea-87d0-0242ac130003	5	t	t
\.


--
-- TOC entry 2912 (class 0 OID 16890)
-- Dependencies: 201
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, id_emergency, name, description, required_volunteers, enrolled_volunteers, start_date, finish_date) FROM stdin;
a1c65d8c-d5af-11ea-87d0-0242ac130003	ae844504-d52b-11ea-87d0-0242ac130003	LLevar materiales	Se necesita ayuda para el traslado de los materiales a la zona de construccion	4	4	2020-06-12	2020-06-13
a1c65f9e-d5af-11ea-87d0-0242ac130003	ae844504-d52b-11ea-87d0-0242ac130003	Tomar medidas y cortar materiales	Se busca gente con conocimientos basicos de aritmetica para tomar medidas y cortar los materiales como madera para la construccion de mediaguas	55	2020-06-13	2020-06-15
a1c66098-d5af-11ea-87d0-0242ac130003	ae844504-d52b-11ea-87d0-0242ac130003	Construir mediaguas	Se necesita gente para armar la casa con las piezas ya cortadas	5	5	2020-06-13	2020-06-15
a1c6628c-d5af-11ea-87d0-0242ac130003	ae844734-d52b-11ea-87d0-0242ac130003	Separar perros	Se necesita gente que ayude a separar los perros	8	6	2020-01-03	2020-01-04
a1c66368-d5af-11ea-87d0-0242ac130003	ae844734-d52b-11ea-87d0-0242ac130003	Realizar curaciones a los perros	Una vez separados, se necesita revisar las heridas y realizar curaciones	5	5	2020-01-03	2020-01-10
a1c66430-d5af-11ea-87d0-0242ac130003	ae84482e-d52b-11ea-87d0-0242ac130003	Visitar abuelos	Se necesita gente para pasar tiempo con abuelos y desarrolar tareas basicas como ayudarlos a comer y hablar con ellos para entretenerlos	6	5	2020-03-14	2020-03-15
a1c664f8-d5af-11ea-87d0-0242ac130003	ae844a5e-d52b-11ea-87d0-0242ac130003	Ayudar a evacuar residentes en la zona	Se necesita ayuda de gente que pueda controlar a las personas y evacuarlas de la zona del incendio	5	5	2019-12-20	2019-12-21
a1c665b6-d5af-11ea-87d0-0242ac130003	ae844a5e-d52b-11ea-87d0-0242ac130003	Mojar casas aledañas para evitar la propagacion del incendio	Se necesita gente para humedecer las casas de los afectados y evitar que se propague tan rapido el calor en casas aledañas al incendio	5	4	2019-12-20	2019-12-25
a1c66778-d5af-11ea-87d0-0242ac130003	ae844b30-d52b-11ea-87d0-0242ac130003	Búsqueda de pistas en el bosque	Se necesita que llegue gente con experiencia y busque algun objeto e información del afectado	5	4	2019-08-31	2019-09-01
a1c6684a-d5af-11ea-87d0-0242ac130003	ae844b30-d52b-11ea-87d0-0242ac130003	Iniciar búsqueda en grupos	Se necesita gente para formar grupos de 3 personas para iniciar la busqueda del afectado en la madrugada	9	9	2019-08-01	2019-09-05
a1c668fe-d5af-11ea-87d0-0242ac130003	ae844bf8-d52b-11ea-87d0-0242ac130003	Alimentar perros	Se necesita gente que ayude a alimentar los perros de AEDA durante 2 semanas	5	4	2020-08-11	2020-08-25
a1c669bc-d5af-11ea-87d0-0242ac130003	ae844bf8-d52b-11ea-87d0-0242ac130003	Recoger heces de los perros	Se necesita gente que ayude a recoger las heces de los perros de AEDA durante 2 semanas	4	4	2020-08-11	2020-08-25
\.


--
-- TOC entry 2907 (class 0 OID 16850)
-- Dependencies: 196
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers (id, name) FROM stdin;
4a995f8c-a3a5-11ea-bb37-0242ac130002	Claudia Castillo
4a9961a8-a3a5-11ea-bb37-0242ac130002	Jorge Rosales
4a99628e-a3a5-11ea-bb37-0242ac130002	Mónica Pascual
4a9964c8-a3a5-11ea-bb37-0242ac130002	Román Martínez
4a9965ae-a3a5-11ea-bb37-0242ac130002	Guillermo Calvo
4a99666c-a3a5-11ea-bb37-0242ac130002	Iris Navarro
4a99672a-a3a5-11ea-bb37-0242ac130002	Laura Morales
4a9967e8-a3a5-11ea-bb37-0242ac130002	Andrés Núñez
4a99689c-a3a5-11ea-bb37-0242ac130002	Ernesto Castro
4a996bb2-a3a5-11ea-bb37-0242ac130002	Alan Pastor
4a996cac-a3a5-11ea-bb37-0242ac130002	Ximena Gallardo
4a996d6a-a3a5-11ea-bb37-0242ac130002	Alonzo Diaz
4a996e28-a3a5-11ea-bb37-0242ac130002	Paola Velasco
4a996ee6-a3a5-11ea-bb37-0242ac130002	Emanuel Santos
4a996fa4-a3a5-11ea-bb37-0242ac130002	Daniela Santana
4a997062-a3a5-11ea-bb37-0242ac130002	Amanda Herrera
4a997116-a3a5-11ea-bb37-0242ac130002	Pedro Molina
4a997300-a3a5-11ea-bb37-0242ac130002	Cecilia Arias
4a9973d2-a3a5-11ea-bb37-0242ac130002	Celeste Vera
4a997490-a3a5-11ea-bb37-0242ac130002	Javier Parra
\.


--
-- TOC entry 2909 (class 0 OID 16860)
-- Dependencies: 198
-- Data for Name: volunteers_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers_abilities (id, id_volunteer, id_ability) FROM stdin;
aeb2aa9a-a441-11ea-bb37-0242ac130002	4a995f8c-a3a5-11ea-bb37-0242ac130002	72a6f398-a3ac-11ea-bb37-0242ac130002
aeb2acb6-a441-11ea-bb37-0242ac130002	4a995f8c-a3a5-11ea-bb37-0242ac130002	72a6f5d2-a3ac-11ea-bb37-0242ac130002
aeb2ae50-a441-11ea-bb37-0242ac130002	4a995f8c-a3a5-11ea-bb37-0242ac130002	72a70b6c-a3ac-11ea-bb37-0242ac130002
aeb2af68-a441-11ea-bb37-0242ac130002	4a995f8c-a3a5-11ea-bb37-0242ac130002	72a70504-a3ac-11ea-bb37-0242ac130002
aeb2b0a8-a441-11ea-bb37-0242ac130002	4a9961a8-a3a5-11ea-bb37-0242ac130002	72a6f398-a3ac-11ea-bb37-0242ac130002
aeb2b17a-a441-11ea-bb37-0242ac130002	4a9961a8-a3a5-11ea-bb37-0242ac130002	72a70234-a3ac-11ea-bb37-0242ac130002
aeb2b27e-a441-11ea-bb37-0242ac130002	4a9961a8-a3a5-11ea-bb37-0242ac130002	72a70a9a-a3ac-11ea-bb37-0242ac130002
aeb2b3e6-a441-11ea-bb37-0242ac130002	4a99628e-a3a5-11ea-bb37-0242ac130002	72a6f794-a3ac-11ea-bb37-0242ac130002
aeb2b4ae-a441-11ea-bb37-0242ac130002	4a99628e-a3a5-11ea-bb37-0242ac130002	72a705c2-a3ac-11ea-bb37-0242ac130002
aeb2b5d0-a441-11ea-bb37-0242ac130002	4a99628e-a3a5-11ea-bb37-0242ac130002	72a70374-a3ac-11ea-bb37-0242ac130002
aeb2b6b6-a441-11ea-bb37-0242ac130002	4a9964c8-a3a5-11ea-bb37-0242ac130002	72a70446-a3ac-11ea-bb37-0242ac130002
aeb2b7d8-a441-11ea-bb37-0242ac130002	4a9964c8-a3a5-11ea-bb37-0242ac130002	72a70374-a3ac-11ea-bb37-0242ac130002
aeb2b8d2-a441-11ea-bb37-0242ac130002	4a9964c8-a3a5-11ea-bb37-0242ac130002	72a6f852-a3ac-11ea-bb37-0242ac130002
aeb2b9e0-a441-11ea-bb37-0242ac130002	4a9965ae-a3a5-11ea-bb37-0242ac130002	72a70680-a3ac-11ea-bb37-0242ac130002
aeb2bc56-a441-11ea-bb37-0242ac130002	4a9965ae-a3a5-11ea-bb37-0242ac130002	72a70446-a3ac-11ea-bb37-0242ac130002
aeb2bd14-a441-11ea-bb37-0242ac130002	4a9965ae-a3a5-11ea-bb37-0242ac130002	72a705c2-a3ac-11ea-bb37-0242ac130002
aeb2be72-a441-11ea-bb37-0242ac130002	4a99666c-a3a5-11ea-bb37-0242ac130002	72a6f794-a3ac-11ea-bb37-0242ac130002
aeb2bf30-a441-11ea-bb37-0242ac130002	4a99666c-a3a5-11ea-bb37-0242ac130002	72a6f6c2-a3ac-11ea-bb37-0242ac130002
aeb2c034-a441-11ea-bb37-0242ac130002	4a99666c-a3a5-11ea-bb37-0242ac130002	72a6f5d2-a3ac-11ea-bb37-0242ac130002
aeb2c11a-a441-11ea-bb37-0242ac130002	4a99672a-a3a5-11ea-bb37-0242ac130002	72a70446-a3ac-11ea-bb37-0242ac130002
aeb2c23c-a441-11ea-bb37-0242ac130002	4a99672a-a3a5-11ea-bb37-0242ac130002	72a70a9a-a3ac-11ea-bb37-0242ac130002
aeb2c3a4-a441-11ea-bb37-0242ac130002	4a99672a-a3a5-11ea-bb37-0242ac130002	72a70b6c-a3ac-11ea-bb37-0242ac130002
aeb2c50c-a441-11ea-bb37-0242ac130002	4a9967e8-a3a5-11ea-bb37-0242ac130002	72a705c2-a3ac-11ea-bb37-0242ac130002
aeb2c624-a441-11ea-bb37-0242ac130002	4a9967e8-a3a5-11ea-bb37-0242ac130002	72a7073e-a3ac-11ea-bb37-0242ac130002
aeb2c728-a441-11ea-bb37-0242ac130002	4a9967e8-a3a5-11ea-bb37-0242ac130002	72a70504-a3ac-11ea-bb37-0242ac130002
aeb2c7e6-a441-11ea-bb37-0242ac130002	4a99689c-a3a5-11ea-bb37-0242ac130002	72a70680-a3ac-11ea-bb37-0242ac130002
aeb2c944-a441-11ea-bb37-0242ac130002	4a99689c-a3a5-11ea-bb37-0242ac130002	72a705c2-a3ac-11ea-bb37-0242ac130002
aeb2ca3e-a441-11ea-bb37-0242ac130002	4a99689c-a3a5-11ea-bb37-0242ac130002	72a7073e-a3ac-11ea-bb37-0242ac130002
aeb2cb38-a441-11ea-bb37-0242ac130002	4a996bb2-a3a5-11ea-bb37-0242ac130002	72a6f794-a3ac-11ea-bb37-0242ac130002
aeb2cc64-a441-11ea-bb37-0242ac130002	4a996bb2-a3a5-11ea-bb37-0242ac130002	72a6f6c2-a3ac-11ea-bb37-0242ac130002
aeb2cdc2-a441-11ea-bb37-0242ac130002	4a996bb2-a3a5-11ea-bb37-0242ac130002	72a6f852-a3ac-11ea-bb37-0242ac130002
aeb2ceee-a441-11ea-bb37-0242ac130002	4a996cac-a3a5-11ea-bb37-0242ac130002	72a6f398-a3ac-11ea-bb37-0242ac130002
aeb2d006-a441-11ea-bb37-0242ac130002	4a996cac-a3a5-11ea-bb37-0242ac130002	72a7073e-a3ac-11ea-bb37-0242ac130002
aeb2d132-a441-11ea-bb37-0242ac130002	4a996cac-a3a5-11ea-bb37-0242ac130002	72a705c2-a3ac-11ea-bb37-0242ac130002
aeb2d1fa-a441-11ea-bb37-0242ac130002	4a996d6a-a3a5-11ea-bb37-0242ac130002	72a70446-a3ac-11ea-bb37-0242ac130002
aeb2d308-a441-11ea-bb37-0242ac130002	4a996d6a-a3a5-11ea-bb37-0242ac130002	72a70b6c-a3ac-11ea-bb37-0242ac130002
aeb2d416-a441-11ea-bb37-0242ac130002	4a996d6a-a3a5-11ea-bb37-0242ac130002	72a6f398-a3ac-11ea-bb37-0242ac130002
aeb2d524-a441-11ea-bb37-0242ac130002	4a996e28-a3a5-11ea-bb37-0242ac130002	72a6f852-a3ac-11ea-bb37-0242ac130002
aeb2d63c-a441-11ea-bb37-0242ac130002	4a996e28-a3a5-11ea-bb37-0242ac130002	72a70374-a3ac-11ea-bb37-0242ac130002
aeb2d754-a441-11ea-bb37-0242ac130002	4a996e28-a3a5-11ea-bb37-0242ac130002	72a6f794-a3ac-11ea-bb37-0242ac130002
aeb2d86c-a441-11ea-bb37-0242ac130002	4a996ee6-a3a5-11ea-bb37-0242ac130002	72a70a9a-a3ac-11ea-bb37-0242ac130002
aeb2d97a-a441-11ea-bb37-0242ac130002	4a996ee6-a3a5-11ea-bb37-0242ac130002	72a70234-a3ac-11ea-bb37-0242ac130002
aeb2da6a-a441-11ea-bb37-0242ac130002	4a996ee6-a3a5-11ea-bb37-0242ac130002	72a70446-a3ac-11ea-bb37-0242ac130002
aeb2db82-a441-11ea-bb37-0242ac130002	4a996fa4-a3a5-11ea-bb37-0242ac130002	72a7073e-a3ac-11ea-bb37-0242ac130002
aeb2dc9a-a441-11ea-bb37-0242ac130002	4a996fa4-a3a5-11ea-bb37-0242ac130002	72a707f2-a3ac-11ea-bb37-0242ac130002
aeb2dd76-a441-11ea-bb37-0242ac130002	4a996fa4-a3a5-11ea-bb37-0242ac130002	72a70680-a3ac-11ea-bb37-0242ac130002
aeb2de98-a441-11ea-bb37-0242ac130002	4a997062-a3a5-11ea-bb37-0242ac130002	72a6f794-a3ac-11ea-bb37-0242ac130002
aeb2dfce-a441-11ea-bb37-0242ac130002	4a997062-a3a5-11ea-bb37-0242ac130002	72a6f398-a3ac-11ea-bb37-0242ac130002
aeb2e0c8-a441-11ea-bb37-0242ac130002	4a997116-a3a5-11ea-bb37-0242ac130002	72a707f2-a3ac-11ea-bb37-0242ac130002
aeb2e294-a441-11ea-bb37-0242ac130002	4a997116-a3a5-11ea-bb37-0242ac130002	72a70b6c-a3ac-11ea-bb37-0242ac130002
aeb2e3ac-a441-11ea-bb37-0242ac130002	4a997300-a3a5-11ea-bb37-0242ac130002	72a70234-a3ac-11ea-bb37-0242ac130002
aeb2e4a6-a441-11ea-bb37-0242ac130002	4a997300-a3a5-11ea-bb37-0242ac130002	72a6f5d2-a3ac-11ea-bb37-0242ac130002
aeb2e604-a441-11ea-bb37-0242ac130002	4a9973d2-a3a5-11ea-bb37-0242ac130002	72a70374-a3ac-11ea-bb37-0242ac130002
aeb2e6cc-a441-11ea-bb37-0242ac130002	4a9973d2-a3a5-11ea-bb37-0242ac130002	72a70446-a3ac-11ea-bb37-0242ac130002
aeb2e79e-a441-11ea-bb37-0242ac130002	4a997490-a3a5-11ea-bb37-0242ac130002	72a7073e-a3ac-11ea-bb37-0242ac130002
aeb2e8d4-a441-11ea-bb37-0242ac130002	4a997490-a3a5-11ea-bb37-0242ac130002	72a70374-a3ac-11ea-bb37-0242ac130002
aeb2e992-a441-11ea-bb37-0242ac130002	4a997490-a3a5-11ea-bb37-0242ac130002	72a6f5d2-a3ac-11ea-bb37-0242ac130002
aeb2eae6-a441-11ea-bb37-0242ac130002	4a997490-a3a5-11ea-bb37-0242ac130002	72a6f398-a3ac-11ea-bb37-0242ac130002
aeb2ebf4-a441-11ea-bb37-0242ac130002	4a997490-a3a5-11ea-bb37-0242ac130002	72a6f6c2-a3ac-11ea-bb37-0242ac130002
aeb2ed16-a441-11ea-bb37-0242ac130002	4a997490-a3a5-11ea-bb37-0242ac130002	72a6f852-a3ac-11ea-bb37-0242ac130002
\.


--
-- TOC entry 2767 (class 2606 OID 16859)
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 16884)
-- Name: emergencies emergencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencies
    ADD CONSTRAINT emergencies_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 16879)
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 16904)
-- Name: rankings rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rankings
    ADD CONSTRAINT rankings_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 16894)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 16864)
-- Name: volunteers_abilities volunteers_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers_abilities
    ADD CONSTRAINT volunteers_abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 16854)
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2620 OID 16915)
-- Name: emergencies emergency_date_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER emergency_date_trigger BEFORE INSERT ON public.emergencies FOR EACH ROW EXECUTE PROCEDURE public.emergency_start_date();


--
-- TOC entry 2785 (class 2620 OID 16916)
-- Name: rankings new_enrolled_volunteer; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER new_enrolled_volunteer AFTER INSERT ON public.rankings FOR EACH ROW EXECUTE PROCEDURE public.add_enrolled_volunteer();


--
-- TOC entry 2780 (class 2606 OID 16885)
-- Name: emergencies emergencies_id_institution_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencies
    ADD CONSTRAINT emergencies_id_institution_fkey FOREIGN KEY (id_institution) REFERENCES public.institutions(id);


--
-- TOC entry 2783 (class 2606 OID 16910)
-- Name: rankings rankings_id_task_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rankings
    ADD CONSTRAINT rankings_id_task_fkey FOREIGN KEY (id_task) REFERENCES public.tasks(id);


--
-- TOC entry 2782 (class 2606 OID 16905)
-- Name: rankings rankings_id_volunteer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rankings
    ADD CONSTRAINT rankings_id_volunteer_fkey FOREIGN KEY (id_volunteer) REFERENCES public.volunteers(id);


--
-- TOC entry 2781 (class 2606 OID 16895)
-- Name: tasks tasks_id_emergency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_id_emergency_fkey FOREIGN KEY (id_emergency) REFERENCES public.emergencies(id);


--
-- TOC entry 2779 (class 2606 OID 16870)
-- Name: volunteers_abilities volunteers_abilities_id_ability_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers_abilities
    ADD CONSTRAINT volunteers_abilities_id_ability_fkey FOREIGN KEY (id_ability) REFERENCES public.abilities(id);


--
-- TOC entry 2778 (class 2606 OID 16865)
-- Name: volunteers_abilities volunteers_abilities_id_volunteer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers_abilities
    ADD CONSTRAINT volunteers_abilities_id_volunteer_fkey FOREIGN KEY (id_volunteer) REFERENCES public.volunteers(id);


-- Completed on 2020-08-16 19:51:28 UTC

--
-- PostgreSQL database dump complete
--
