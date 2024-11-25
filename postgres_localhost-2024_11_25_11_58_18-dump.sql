--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: allinclusive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.allinclusive (
    allinclusive_id integer NOT NULL,
    price integer
);


ALTER TABLE public.allinclusive OWNER TO postgres;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    bookings_id integer NOT NULL,
    client_id integer,
    room_id integer,
    allinclusive integer,
    halfpension integer,
    extrabed integer,
    totalprice integer,
    checkin timestamp without time zone,
    checkout timestamp without time zone,
    peopleamount character varying
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL,
    email character varying,
    phonenumber character varying,
    dateofbirth date
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: extrabed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extrabed (
    extrabed_id integer NOT NULL,
    price integer
);


ALTER TABLE public.extrabed OWNER TO postgres;

--
-- Name: halfpension; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.halfpension (
    halfpension_id integer NOT NULL,
    price integer
);


ALTER TABLE public.halfpension OWNER TO postgres;

--
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    hotels_id integer NOT NULL,
    hotel_name character varying,
    phonenumber character varying,
    email character varying,
    starsreview numeric,
    gym boolean,
    elevator boolean,
    distancetobeach double precision,
    distancetocentrum double precision,
    pool boolean,
    restaurant boolean,
    childrensclub boolean,
    eveningentertainment boolean,
    city character varying,
    country character varying,
    zipcode character varying,
    adress character varying
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    rooms_id integer NOT NULL,
    roomnumber character varying,
    roomtype integer,
    capacity integer,
    pricepernight integer,
    isavailable boolean,
    balcony boolean,
    hotels_id integer
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: roomtypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roomtypes (
    roomtypes_id integer NOT NULL,
    roomtypename character varying
);


ALTER TABLE public.roomtypes OWNER TO postgres;

--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Data for Name: allinclusive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.allinclusive (allinclusive_id, price) FROM stdin;
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (bookings_id, client_id, room_id, allinclusive, halfpension, extrabed, totalprice, checkin, checkout, peopleamount) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, firstname, lastname, email, phonenumber, dateofbirth) FROM stdin;
\.


--
-- Data for Name: extrabed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extrabed (extrabed_id, price) FROM stdin;
\.


--
-- Data for Name: halfpension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.halfpension (halfpension_id, price) FROM stdin;
\.


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotels (hotels_id, hotel_name, phonenumber, email, starsreview, gym, elevator, distancetobeach, distancetocentrum, pool, restaurant, childrensclub, eveningentertainment, city, country, zipcode, adress) FROM stdin;
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (rooms_id, roomnumber, roomtype, capacity, pricepernight, isavailable, balcony, hotels_id) FROM stdin;
\.


--
-- Data for Name: roomtypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roomtypes (roomtypes_id, roomtypename) FROM stdin;
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- Name: allinclusive allinclusive_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allinclusive
    ADD CONSTRAINT allinclusive_pk PRIMARY KEY (allinclusive_id);


--
-- Name: bookings bookings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pk PRIMARY KEY (bookings_id);


--
-- Name: clients clients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pk PRIMARY KEY (id);


--
-- Name: extrabed extrabed_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extrabed
    ADD CONSTRAINT extrabed_pk PRIMARY KEY (extrabed_id);


--
-- Name: halfpension halfpension_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.halfpension
    ADD CONSTRAINT halfpension_pk PRIMARY KEY (halfpension_id);


--
-- Name: hotels hotels_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pk PRIMARY KEY (hotels_id);


--
-- Name: rooms rooms_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pk PRIMARY KEY (rooms_id);


--
-- Name: roomtypes roomtypes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomtypes
    ADD CONSTRAINT roomtypes_pk PRIMARY KEY (roomtypes_id);


--
-- Name: bookings bookings_allinclusive_allinclusive_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_allinclusive_allinclusive_id_fk FOREIGN KEY (allinclusive) REFERENCES public.allinclusive(allinclusive_id);


--
-- Name: bookings bookings_extrabed_extrabed_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_extrabed_extrabed_id_fk FOREIGN KEY (extrabed) REFERENCES public.extrabed(extrabed_id);


--
-- Name: bookings bookings_halfpension_halfpension_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_halfpension_halfpension_id_fk FOREIGN KEY (halfpension) REFERENCES public.halfpension(halfpension_id);


--
-- Name: bookings bookings_rooms_rooms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_rooms_rooms_id_fk FOREIGN KEY (room_id) REFERENCES public.rooms(rooms_id);


--
-- Name: rooms rooms_hotels_hotels_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_hotels_hotels_id_fk FOREIGN KEY (hotels_id) REFERENCES public.hotels(hotels_id);


--
-- Name: rooms rooms_roomtypes_roomtypes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_roomtypes_roomtypes_id_fk FOREIGN KEY (roomtype) REFERENCES public.roomtypes(roomtypes_id);


--
-- PostgreSQL database dump complete
--

