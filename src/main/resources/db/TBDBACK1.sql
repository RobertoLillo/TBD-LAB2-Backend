--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 12.4

-- Started on 2020-09-15 05:56:54 UTC

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
-- TOC entry 197 (class 1259 OID 17593)
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    id uuid NOT NULL,
    description character varying(250)
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17588)
-- Name: volunteers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers (
    rut integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.volunteers OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17633)
-- Name: volunteers_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers_abilities (
    id uuid NOT NULL,
    rut integer NOT NULL,
    id_ability uuid NOT NULL
);


ALTER TABLE public.volunteers_abilities OWNER TO postgres;

--
-- TOC entry 2874 (class 0 OID 17593)
-- Dependencies: 197
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (id, description) FROM stdin;
1992c637-3b7a-4c02-9691-3bc9ea49a217	Experiencia de rescates en bosques
5e9240b6-8c34-49c4-884e-b9eff6b93fa9	Posibilidad de movilización por sus propios medios (Traslado)
98db8dc3-9bb2-419c-86df-996eaf78f18d	Disposición para aprender
67f23c8c-5c7d-4be7-926a-540453f75947	Comunicación oral eficiente al trabajar en equipo
86e06a93-d46b-4300-8550-926df224dd90	Manejo de la matemática básica como álgebra y buena ortografía
\.


--
-- TOC entry 2873 (class 0 OID 17588)
-- Dependencies: 196
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers (rut, name) FROM stdin;
5999796	emanuel santos
7888641	claudia castillo
10912578	jorge rosales
13597524	amanda herrera
15088098	cecilia arias
15295833	javier parra
19519986	guillermo calvo
22380438	laura morales
24444426	pedro molina
24846354	alonzo diaz
\.


--
-- TOC entry 2875 (class 0 OID 17633)
-- Dependencies: 198
-- Data for Name: volunteers_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers_abilities (id, rut, id_ability) FROM stdin;
32442457-b927-4783-a504-caf3691d30c4	7888641	1992c637-3b7a-4c02-9691-3bc9ea49a217
38f66241-8d95-44ce-9a9e-1945e09f93aa	10912578	5e9240b6-8c34-49c4-884e-b9eff6b93fa9
137ac3b9-c21b-4b52-94e2-2382fde3cb9a	19519986	98db8dc3-9bb2-419c-86df-996eaf78f18d
bd82302d-cf5d-47fc-a26c-81b13274099d	22380438	67f23c8c-5c7d-4be7-926a-540453f75947
f7d958f8-0917-4253-9a58-0332cdcbd410	24846354	86e06a93-d46b-4300-8550-926df224dd90
dfaae96d-441f-4e92-b383-9b767d9f8d4d	5999796	ec09ff7a-9510-4239-946b-b73bd0e865df
359178f7-cfaa-41ce-976a-80b219bb40e0	13597524	bae1de32-d6ac-44b9-9926-bc2bebdd9da1
b871c88b-3d1c-4b29-ad78-77c9583de1a0	24444426	6da32f7f-b6a2-441f-a3c0-b79b1237310d
50d5a830-adb9-4a6d-9f7b-8564db7f5617	15088098	8ef590b5-58b1-417c-a816-7bf1ace43659
7ec8b756-fa29-4242-95f9-dbddde5fb5a1	15295833	854ebc07-0efe-4df6-b84f-4d1585724bd6
0a7017d6-d2e6-4c00-9843-1c373316225b	7888641	86e06a93-d46b-4300-8550-926df224dd90
\.


--
-- TOC entry 2749 (class 2606 OID 17597)
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 17637)
-- Name: volunteers_abilities volunteers_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers_abilities
    ADD CONSTRAINT volunteers_abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 17592)
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (rut);


-- Completed on 2020-09-15 05:57:05 UTC

--
-- PostgreSQL database dump complete
--