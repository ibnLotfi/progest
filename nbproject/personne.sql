--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-03-01 10:19:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16397)
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personne (
    idpersonne integer NOT NULL,
    nom text NOT NULL,
    prenom text NOT NULL,
    adresse text NOT NULL,
    ville text NOT NULL,
    cp character(5) NOT NULL,
    tel text NOT NULL,
    portable text,
    email text,
    mdp text,
    etreprof boolean
);


ALTER TABLE public.personne OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16395)
-- Name: personne_idpersonne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personne_idpersonne_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personne_idpersonne_seq OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 196
-- Name: personne_idpersonne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personne_idpersonne_seq OWNED BY public.personne.idpersonne;


--
-- TOC entry 2709 (class 2604 OID 16400)
-- Name: personne idpersonne; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne ALTER COLUMN idpersonne SET DEFAULT nextval('public.personne_idpersonne_seq'::regclass);


--
-- TOC entry 2836 (class 0 OID 16397)
-- Dependencies: 197
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (1, 'Dupont', 'Julien', ' 2 rue Paul Vaillant Couturier', 'Cachan', '94230', '01874512', '06874512', 'jdupont@gmail.com', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (2, 'Fortin', 'Marc', ' 5 rue des Pommiers', 'Vitry', '94400', '01563212', '06454512', 'mfortin@gmail.com', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (3, 'Lerin', 'Julie', ' 21 rue des Fleurs', 'Vitry', '94400', '012178210', '06457513', 'jlerin@yahoo.fr', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (4, 'Gerat', 'Pierre', ' 45 avenue  Pasteur ', 'Alfortvile', '94140', '012478218', '06357517', 'pgerat@yahoo.fr', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (5, 'Detap', 'Gerard', ' 30 avenue Cesar ', 'Alfortville', '94140', '014478218', '06357519', 'gdetap@yahoo.fr', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (6, 'Moulin', 'Kevin', ' 25 rue des fées ', 'Orly', '94310', '013478278', '06352319', 'kmoulin@yahoo.fr', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (7, 'Suza', 'Marion', ' 10 rue Albert Einstein ', 'Paris', '75003', '013278778', '064352819', 'msuza@yahoo.fr', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (8, 'Vrit', 'Didier', ' 56 rue du pain perdu ', 'Paris', '75003', '013778778', '0643572819', 'dvrit@gmail.com', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (9, 'Famat', 'Vivian', ' 26 rue des perdraux ', 'draveil', '91210', '013478768', '0643572518', 'vfamat@gmail.com', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (10, 'Dortp', 'Jules', ' 30 avenue Henri Barbusse ', 'Draveil', '91210', '013478758', '0643772518', 'jdorpt@gmail.com', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (11, 'Darc', 'Bobi', ' 10 rue du president Wilson', 'Draveil', '91210', '013468758', '0643773518', 'bdarc@gmail.com', 'false', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (12, 'Durand', 'Bernard', ' 10 rue des canards', 'Paris', '7500 ', '013468768', '0643772518', 'bdurand@gmail.com', 'true', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (13, 'Satin', 'Paul', ' 10 rue des piverts', 'Paris', '7500 ', '013368768', '0643782518', 'psatin@gmail.com', 'true', NULL);
INSERT INTO public.personne (idpersonne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) VALUES (14, 'Vurap', 'Jean', ' 24 rue des moineaux', 'Paris', '75006', '013468764', '0613762518', 'jvurap@yahoo.fr', 'true', NULL);


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 196
-- Name: personne_idpersonne_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personne_idpersonne_seq', 1, false);


--
-- TOC entry 2711 (class 2606 OID 16407)
-- Name: personne personne_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT personne_email_key UNIQUE (email);


--
-- TOC entry 2713 (class 2606 OID 16405)
-- Name: personne pk_personne; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT pk_personne PRIMARY KEY (idpersonne);


-- Completed on 2019-03-01 10:19:55

--
-- PostgreSQL database dump complete
--

