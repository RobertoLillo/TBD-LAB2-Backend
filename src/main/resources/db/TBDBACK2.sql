--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 12.4

-- Started on 2020-09-15 06:02:51 UTC

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
-- TOC entry 197 (class 1259 OID 17608)
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    id uuid NOT NULL,
    description character varying(250)
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17603)
-- Name: volunteers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers (
    rut integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.volunteers OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17638)
-- Name: volunteers_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers_abilities (
    id uuid NOT NULL,
    rut integer NOT NULL,
    id_ability uuid NOT NULL
);


ALTER TABLE public.volunteers_abilities OWNER TO postgres;

--
-- TOC entry 2874 (class 0 OID 17608)
-- Dependencies: 197
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (id, description) FROM stdin;
ec09ff7a-9510-4239-946b-b73bd0e865df	Orden y limpieza en su lugar de trabajo
bae1de32-d6ac-44b9-9926-bc2bebdd9da1	No tener fobia a la sangre, heridas, cortes y las jeringas
6da32f7f-b6a2-441f-a3c0-b79b1237310d	Fuerza y resistencia
\.


--
-- TOC entry 2873 (class 0 OID 17603)
-- Dependencies: 196
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers (rut, name) FROM stdin;
6793405	celeste vera
8942032	mónica pascual
21147439	alan pastor
22898251	román martínez
24672223	andrés núñez
\.


--
-- TOC entry 2875 (class 0 OID 17638)
-- Dependencies: 198
-- Data for Name: volunteers_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers_abilities (id, rut, id_ability) FROM stdin;
160ce7cb-5c69-4faf-99ab-921b304e9a58	24672223	fb431012-524a-49ea-aca5-bf0c65d6d551
bc5e91e1-6ac3-41f9-a12d-843956a64786	8942032	224eafea-6170-427c-985a-7c9b9bcecfbf
424b6187-7668-412f-a98b-5ab843609ce2	22898251	833bb987-be94-43bf-93a9-ed1170bda02c
eac54ed9-6c6d-47c3-99d1-5ea87d674543	21147439	3165fb3e-4e32-4581-9b3e-431f48fb8189
77d2ca61-be9a-42df-97e2-caebef0a0d1d	6793405	28485bbe-8841-420b-9f42-eb97d4e4e80e
\.


--
-- TOC entry 2749 (class 2606 OID 17612)
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 17642)
-- Name: volunteers_abilities volunteers_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers_abilities
    ADD CONSTRAINT volunteers_abilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 17607)
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (rut);


-- Completed on 2020-09-15 06:03:02 UTC

--
-- PostgreSQL database dump complete
--