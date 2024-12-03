--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17rc1

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
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    bookings_id integer NOT NULL,
    client_id integer NOT NULL,
    room_id integer NOT NULL,
    allinclusive boolean NOT NULL,
    halfpension boolean NOT NULL,
    extrabed boolean NOT NULL,
    totalprice integer NOT NULL,
    checkin timestamp without time zone NOT NULL,
    checkout timestamp without time zone NOT NULL,
    peopleamount character varying NOT NULL
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings ALTER COLUMN bookings_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bookings_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL,
    email character varying NOT NULL,
    phonenumber character varying NOT NULL,
    dateofbirth date NOT NULL
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
-- Name: clients_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.clients ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clients_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    hotels_id integer NOT NULL,
    hotel_name character varying NOT NULL,
    phonenumber character varying NOT NULL,
    email character varying NOT NULL,
    starsreview numeric NOT NULL,
    gym boolean NOT NULL,
    elevator boolean NOT NULL,
    distancetobeach double precision NOT NULL,
    distancetocentrum double precision NOT NULL,
    pool boolean NOT NULL,
    restaurant boolean NOT NULL,
    childrensclub boolean NOT NULL,
    eveningentertainment boolean NOT NULL,
    city character varying NOT NULL,
    country character varying NOT NULL,
    zipcode character varying NOT NULL,
    adress character varying NOT NULL
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- Name: hotels_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.hotels ALTER COLUMN hotels_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hotels_hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    rooms_id integer NOT NULL,
    roomnumber character varying NOT NULL,
    roomtype integer NOT NULL,
    capacity integer NOT NULL,
    pricepernight integer NOT NULL,
    isavailable boolean NOT NULL,
    balcony boolean NOT NULL,
    hotels_id integer NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rooms ALTER COLUMN rooms_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rooms_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roomtypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roomtypes (
    roomtypes_id integer NOT NULL,
    roomtypename character varying NOT NULL
);


ALTER TABLE public.roomtypes OWNER TO postgres;

--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (bookings_id, client_id, room_id, allinclusive, halfpension, extrabed, totalprice, checkin, checkout, peopleamount) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, firstname, lastname, email, phonenumber, dateofbirth) FROM stdin;
3	Jon	Olsson	asdabda@asdab	0705505979	2002-06-03
\.


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotels (hotels_id, hotel_name, phonenumber, email, starsreview, gym, elevator, distancetobeach, distancetocentrum, pool, restaurant, childrensclub, eveningentertainment, city, country, zipcode, adress) FROM stdin;
1	Satana	Sigma	a	9	t	t	35	234	t	t	t	t	234234	234234	234234	234234
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (rooms_id, roomnumber, roomtype, capacity, pricepernight, isavailable, balcony, hotels_id) FROM stdin;
18	323	3	3	5123	t	t	1
\.


--
-- Data for Name: roomtypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roomtypes (roomtypes_id, roomtypename) FROM stdin;
1	Single
2	Double
3	Deluxe
4	Suite
\.


--
-- Name: bookings_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_bookings_id_seq', 2, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, true);


--
-- Name: clients_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq1', 3, true);


--
-- Name: hotels_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotels_hotels_id_seq', 1, true);


--
-- Name: rooms_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_rooms_id_seq', 18, true);


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
-- Name: bookings bookings_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_fk FOREIGN KEY (client_id) REFERENCES public.clients(id);


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

