--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 12.4

-- Started on 2020-09-15 06:03:47 UTC

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

--
-- TOC entry 197 (class 1259 OID 17623)
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    id uuid NOT NULL,
    description character varying(250)
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17618)
-- Name: volunteers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers (
    rut integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.volunteers OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17643)
-- Name: volunteers_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers_abilities (
    id uuid NOT NULL,
    rut integer NOT NULL,
    id_ability uuid NOT NULL
);


ALTER TABLE public.volunteers_abilities OWNER TO postgres;

--
-- TOC entry 2874 (class 0 OID 17623)
-- Dependencies: 197
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (id, description) FROM stdin;
8ef590b5-58b1-417c-a816-7bf1ace43659	Hábil y delicado con los animales
854ebc07-0efe-4df6-b84f-4d1585724bd6	Empatia y paciencia
fb431012-524a-49ea-aca5-bf0c65d6d551	Capacidad de trabajar bajo presión
224eafea-6170-427c-985a-7c9b9bcecfbf	Conocimientos de Reanimación cardiopulmonar (RCP)
833bb987-be94-43bf-93a9-ed1170bda02c	Habilidades de comunicación con abuelos y niños
3165fb3e-4e32-4581-9b3e-431f48fb8189	Capacidad de organizar y liderar una gran cantidad de personas
28485bbe-8841-420b-9f42-eb97d4e4e80e	Buena orientación
\.


--
-- TOC entry 2873 (class 0 OID 17618)
-- Dependencies: 196
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers (rut, name) FROM stdin;
14558915	ximena gallardo
18466532	daniela santana
22052132	paola velasco
\.


--
-- TOC entry 2875 (class 0 OID 17643)
-- Dependencies: 198
-- Data for Name: volunteers_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers_abilities (id, rut, id_ability) FROM stdin;
e58a7321-3b03-4503-8677-c3c34ca2f8a4	14558915	fb431012-524a-49ea-aca5-bf0c65d6d551
ed5d9abd-980a-467c-919b-47b664f5ff43	22052132	bae1de32-d6ac-44b9-9926-bc2bebdd9da1
08c780c5-e774-4c22-aa57-736f51164493	18466532	1992c637-3b7a-4c02-9691-3bc9ea49a217
\.


--
-- TOC entry 2749 (class 2606 OID 17627)
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 17647)
-- Name: volunteers_abilities volunteers_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers_abilities
    ADD CONSTRAINT volunteers_abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 17622)
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (rut);


-- Completed on 2020-09-15 06:03:58 UTC

--
-- PostgreSQL database dump complete
--