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
3	3	18	t	t	t	3444	2024-12-03 15:30:00	2024-12-04 15:30:00	4
4	44	114	t	f	t	19982	2024-12-24 05:51:40	2025-01-01 11:50:17	6
5	32	109	t	t	f	15217	2024-12-16 10:30:09	2025-01-12 10:50:30	4
6	51	78	f	t	f	6880	2024-12-30 05:10:26	2025-01-05 18:19:30	5
7	52	111	t	f	t	11672	2024-12-14 13:25:23	2024-12-21 21:15:25	1
8	50	115	f	f	f	7753	2025-01-03 00:48:51	2025-01-23 02:51:36	5
9	14	70	t	t	t	17602	2024-12-09 21:07:34	2025-01-03 16:13:25	2
10	45	113	t	t	f	12891	2024-12-02 09:42:54	2024-12-25 06:34:23	1
11	25	113	t	f	t	19651	2024-12-26 05:58:36	2024-12-19 22:42:22	1
12	31	93	f	f	t	19879	2025-01-02 18:06:01	2024-12-04 18:29:10	6
13	15	108	t	t	f	11372	2024-12-19 14:00:32	2025-01-28 16:03:23	5
14	10	117	t	t	t	7153	2024-12-29 21:55:00	2024-12-31 15:15:32	6
15	26	99	t	f	f	18360	2024-12-16 03:38:26	2025-01-07 13:11:56	2
16	28	105	t	f	f	7868	2025-01-12 13:32:23	2024-12-03 15:04:42	1
17	24	117	f	t	t	8932	2024-12-30 19:08:14	2025-01-02 01:19:00	4
18	39	88	t	t	t	11941	2024-12-08 07:09:48	2025-01-15 06:12:33	4
19	45	79	t	f	f	19156	2024-12-20 18:30:01	2024-12-06 15:36:00	2
20	19	80	t	t	f	16237	2025-01-26 01:12:07	2024-12-14 18:42:05	1
21	5	117	f	f	f	8599	2025-01-21 16:40:13	2025-01-20 01:34:15	4
22	43	80	t	t	f	16978	2024-12-16 02:16:12	2024-12-08 15:27:36	4
23	20	101	t	t	t	13407	2025-01-20 09:53:14	2025-01-24 01:52:25	1
24	21	119	f	f	t	4529	2024-12-15 02:32:43	2025-01-20 15:39:42	2
25	42	105	t	t	f	8667	2024-12-07 19:37:03	2024-12-29 06:35:40	1
26	14	83	f	f	f	14122	2024-12-18 15:00:53	2025-01-11 08:31:36	1
27	22	98	f	t	t	6952	2025-01-06 09:05:08	2024-12-27 15:15:37	3
28	37	76	t	f	t	7318	2024-12-16 09:45:33	2024-12-03 01:54:42	4
29	22	97	f	t	t	9993	2025-01-02 22:44:14	2024-12-24 01:00:42	6
30	24	79	t	f	t	19940	2024-12-11 02:55:40	2024-12-29 09:36:51	6
31	11	108	f	t	f	9439	2024-12-28 21:01:46	2024-12-23 08:29:40	5
32	21	115	f	t	t	19460	2024-12-24 13:58:15	2024-12-17 22:23:16	3
33	49	80	t	t	t	17122	2024-12-04 15:58:15	2024-12-23 20:20:38	6
34	42	74	f	f	f	11179	2025-01-04 09:50:57	2024-12-04 14:50:50	5
35	29	91	t	t	t	15161	2025-01-21 03:47:48	2024-12-30 13:38:43	4
36	54	84	t	f	f	18349	2025-01-28 18:17:40	2025-01-24 06:59:33	2
37	30	106	f	f	t	12771	2024-12-20 18:27:18	2024-12-06 00:19:21	1
38	40	99	t	f	f	16618	2025-01-07 19:58:09	2025-01-06 14:43:47	4
39	18	80	f	f	t	11073	2024-12-30 15:32:40	2024-12-19 04:28:43	5
40	22	77	f	t	t	15404	2024-12-25 23:42:53	2024-12-27 03:48:59	6
41	13	91	t	t	f	18769	2024-12-10 04:50:29	2025-01-05 14:35:10	4
42	34	99	f	t	f	6711	2024-12-05 21:56:07	2024-12-24 02:11:33	1
43	38	116	t	f	f	13474	2025-01-25 19:54:14	2024-12-31 17:34:08	1
44	38	80	f	t	f	10801	2025-01-17 04:22:09	2024-12-15 19:17:37	5
45	21	81	f	t	t	16568	2025-01-10 01:24:36	2024-12-26 19:58:57	3
46	48	71	t	t	f	7391	2024-12-17 02:23:46	2025-01-23 17:39:33	2
47	15	91	f	f	f	10531	2024-12-04 20:08:51	2025-01-20 21:47:11	3
48	51	106	t	t	t	5083	2025-01-12 02:39:18	2024-12-19 21:40:59	2
49	33	99	t	f	t	18464	2024-12-13 07:43:49	2025-01-08 21:41:40	3
50	5	74	t	f	f	5783	2025-01-12 06:19:48	2025-01-16 21:52:54	1
51	41	79	t	f	f	8613	2025-01-22 13:10:52	2024-12-13 18:12:04	3
52	27	118	t	t	f	15485	2024-12-13 03:17:51	2024-12-19 11:53:16	4
53	38	94	t	f	t	5164	2024-12-06 05:14:25	2024-12-21 00:27:35	5
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, firstname, lastname, email, phonenumber, dateofbirth) FROM stdin;
3	Jon	Olsson	asdabda@asdab	0705505979	2002-06-03
4	Skibidi	Sigma	jaja@gmail.com	0705505934	2004-03-04
5	asd	asdasd	asd	asd	2002-06-03
6	Hercules	Panswick	hpanswick1@auda.org.au	461-781-8516	2010-12-08
7	Bernelle	Stripling	bstripling2@toplist.cz	958-294-1960	1911-09-27
8	Tera	Barley	tbarley3@who.int	326-672-6393	1964-02-25
9	Zared	Raddin	zraddin4@unc.edu	192-802-2329	1904-01-12
10	Barbabra	Rainton	brainton5@cloudflare.com	608-584-7474	1945-02-26
11	Billi	Charman	bcharman6@tinypic.com	330-325-1202	1974-12-07
12	Alexandro	Fendt	afendt7@flavors.me	982-299-2561	1949-10-09
13	Skell	Van der Brugge	svanderbrugge8@i2i.jp	392-643-6238	1965-03-09
14	Hillard	Stormont	hstormont9@networkadvertising.org	498-185-9988	1933-07-17
15	Kristine	Esplin	kesplina@pcworld.com	861-391-6982	1919-07-31
16	Rae	Curnock	rcurnockb@sogou.com	279-147-0862	1940-05-09
17	Bing	Syplus	bsyplusc@barnesandnoble.com	449-605-7953	1908-08-22
18	Zackariah	Busson	zbussond@hc360.com	560-723-7070	1995-09-10
19	Benoit	Pucknell	bpucknelle@wordpress.org	870-944-2945	1990-04-02
20	Anthe	Sherrum	asherrumf@virginia.edu	773-929-2938	2014-12-02
21	Jenni	Andrzejowski	jandrzejowskig@cam.ac.uk	431-662-6066	1925-09-19
22	Jarret	Johannes	jjohannesh@homestead.com	357-962-3534	1953-01-11
23	Whitby	Fuge	wfugei@home.pl	410-505-5426	2016-06-12
24	Ellerey	Hambright	ehambrightj@skype.com	212-758-6087	2019-06-05
25	Rickard	Brimmicombe	rbrimmicombek@123-reg.co.uk	927-394-8498	1987-07-07
26	Lois	Sporrij	lsporrijl@sogou.com	412-958-7332	1925-08-30
27	Hollyanne	Mapstone	hmapstonem@reference.com	986-833-4533	2018-03-08
28	Audry	Greyes	agreyesn@japanpost.jp	643-733-3186	1984-09-03
29	Vinny	Braithwaite	vbraithwaiteo@si.edu	757-817-7536	1921-12-22
30	Paul	Barizeret	pbarizeretp@ebay.com	383-915-7412	1929-05-24
31	Grant	Physick	gphysickq@seattletimes.com	611-233-4989	2012-01-29
32	Phelia	Millott	pmillottr@hc360.com	750-411-0972	2000-09-02
33	Bertrando	Polle	bpolles@ucoz.ru	562-928-2831	1948-12-22
34	Nerta	McAloren	nmcalorent@netscape.com	820-364-6105	1978-05-06
35	Sari	Geddes	sgeddesu@netscape.com	156-617-3284	1939-05-09
36	Linc	Guthrie	lguthriev@amazonaws.com	179-576-6592	1920-08-31
37	Alister	Billyard	abillyardw@rambler.ru	433-691-2622	2019-07-20
38	Coletta	Iacobini	ciacobinix@baidu.com	874-416-4951	1950-02-27
39	Danika	Boylan	dboylany@cam.ac.uk	724-402-2631	1943-07-02
40	Audy	De Blasiis	adeblasiisz@sphinn.com	924-994-2792	1902-10-06
41	Lulu	Polfer	lpolfer10@e-recht24.de	200-993-2854	2021-08-19
42	Calv	Girardengo	cgirardengo11@hostgator.com	752-126-1442	1937-03-29
43	Lalo	Brocklehurst	lbrocklehurst12@pen.io	804-501-6859	1928-09-28
44	Albertine	Stoffer	astoffer13@facebook.com	214-357-3490	1997-09-10
45	Eustacia	Lamberto	elamberto14@simplemachines.org	939-716-0283	2019-05-25
46	Gerda	MacCaull	gmaccaull15@wix.com	754-214-2289	1900-12-10
47	Adair	Kempster	akempster16@topsy.com	649-307-6375	1957-08-27
48	Karna	Woodley	kwoodley17@yahoo.com	680-856-6011	2018-06-16
49	Shoshana	Duffield	sduffield18@cbsnews.com	466-659-5887	1917-05-12
50	Eustacia	Bakster	ebakster19@addthis.com	820-599-6182	1920-09-10
51	Donnie	Alwell	dalwell1a@wikipedia.org	198-885-9994	2011-12-29
52	Rogers	Pays	rpays1b@pcworld.com	979-715-7407	1976-03-28
53	Marijo	Feechum	mfeechum1c@nifty.com	924-685-0055	1956-05-31
54	Galvan	Ruppertz	gruppertz1d@un.org	635-209-1015	1910-07-11
\.


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotels (hotels_id, hotel_name, phonenumber, email, starsreview, gym, elevator, distancetobeach, distancetocentrum, pool, restaurant, childrensclub, eveningentertainment, city, country, zipcode, adress) FROM stdin;
1	Satana	Sigma	a	9	t	t	35	234	t	t	t	t	234234	234234	234234	234234
2	Olle Hotels	njksad	lolol@gmail.com\n	5	t	f	44	199	f	t	t	f	Geneva	Canada	66669	Sigma 92
3	Sigma Olle Hotels	53534939	infrontofthehuzz@gmail.com	6	t	t	99	299	t	t	t	t	Halmstad	Mexico	696969	Cartel 33
53	Divavu	9483560534	okattenhorn0@slashdot.org	1	t	t	995	421	f	t	f	f	Bayt Dajan	Palestinian Territory	5	2614 Ruskin Park
54	Ntags	1634854784	drobet1@tmall.com	1	f	t	1881	762	f	t	f	f	Valença do Piauí	Brazil	5	06 Boyd Way
55	Rhynoodle	8522392405	cpigeon2@usda.gov	1	f	t	1080	84	t	f	f	f	Gaimán	Argentina	5	395 Golf Alley
56	Abatz	1086381491	cdemeter3@photobucket.com	1	f	f	2878	1642	t	f	t	f	Osh	Kyrgyzstan	5	4 Harbort Plaza
57	Tagchat	4478577957	ldumberrill4@epa.gov	1	f	f	1678	1619	t	f	t	f	Basiao	Philippines	5	81603 Canary Avenue
58	Reallinks	9461161891	ggreenrde5@tinypic.com	1	t	t	2784	2255	t	f	f	t	Damaturu	Nigeria	5	35 Jay Pass
59	Youbridge	1346761239	apullman6@washingtonpost.com	1	f	f	208	753	t	t	t	t	Liulang	China	5	04213 Bay Junction
60	Gabvine	5043506891	jord7@youtu.be	1	t	t	2825	1327	f	f	t	t	Dhankutā	Nepal	5	040 Maywood Pass
61	Twitterworks	8909915127	dvaines8@prnewswire.com	1	f	f	1067	2532	f	f	t	f	Kryevidh	Albania	5	068 Sunnyside Point
62	Wordtune	3763826974	ychandler9@goo.ne.jp	1	f	f	1054	2546	f	t	t	t	Chaeryŏng-ŭp	North Korea	5	629 Eagan Trail
63	Eabox	7032111117	mpocklingtona@storify.com	1	t	t	773	2881	f	f	f	t	Soisy-sous-Montmorency	France	5	1 Alpine Avenue
64	Skynoodle	6086075103	mhearleb@simplemachines.org	1	t	f	2515	12	f	t	f	t	Pasirhuni	Indonesia	5	73062 Carpenter Junction
65	Oyoloo	4574629993	cglyssannec@tiny.cc	1	f	f	115	1776	f	f	t	f	Zhongshan	China	5	9859 Londonderry Drive
66	Buzzster	1467858188	hlouthed@xinhuanet.com	1	f	f	1120	1952	f	t	f	f	Yovon	Tajikistan	5	8 Golf View Road
67	Rhycero	2725152126	vmaysore@liveinternet.ru	1	f	f	1512	514	f	f	t	t	Ríohacha	Colombia	5	8 Golf Course Park
68	Dabvine	6292270668	ihallef@discuz.net	1	t	t	1487	998	f	t	t	t	Cheping	China	5	962 Forest Way
69	Skipfire	7871783194	mbathoeg@flavors.me	1	f	f	267	1835	f	t	t	f	Milove	Ukraine	5	1329 Troy Court
70	Innojam	6108023946	bhoodlessh@google.com	1	f	t	1035	2545	t	t	t	t	Bryukhovychi	Ukraine	5	0849 Steensland Alley
71	Twimm	9869117873	szanrei@hugedomains.com	1	t	f	837	2721	t	t	f	t	Metz	France	5	50 Goodland Park
72	Meevee	6627534870	wsnaryj@miitbeian.gov.cn	1	t	t	767	2153	t	t	f	t	Guadalupe	Mexico	5	5 Cottonwood Circle
73	Devify	5081438321	agunthorpek@eepurl.com	1	f	t	1495	409	t	t	f	t	Yaroslavskiy	Russia	5	034 Burning Wood Road
74	Buzzbean	6968271770	lgiloglyl@woothemes.com	1	t	f	2301	1656	t	f	t	f	Piracuruca	Brazil	5	76432 Becker Park
75	LiveZ	3817006739	mpettisallm@friendfeed.com	1	t	t	2469	14	t	f	t	t	Dulian	Philippines	5	665 Lawn Road
76	Edgetag	8647340664	apechn@ox.ac.uk	1	t	t	443	2101	f	t	t	t	Prinza	Philippines	5	692 Chinook Pass
77	Voomm	4856097780	salyukino@multiply.com	1	f	t	709	1491	t	t	t	f	Karsin	Poland	5	5369 Mosinee Crossing
78	Skibox	4246148209	aposvnerp@abc.net.au	1	f	f	2952	199	f	f	t	t	Néa Róda	Greece	5	51 Old Gate Road
79	Bubblemix	3533816548	mjiggenq@dailymotion.com	1	t	f	799	2956	f	t	t	f	Olhos de Água	Portugal	5	1 Talmadge Street
80	Wikido	4595056264	ppringleyr@dot.gov	1	t	f	1837	623	f	t	t	f	Silveiros	Portugal	5	91981 Laurel Lane
81	Brightbean	3444924061	lshafiers@nsw.gov.au	1	f	t	1128	2518	t	f	t	f	Woloara	Indonesia	5	46828 Center Hill
82	Ooba	3395018542	oduffieldt@washington.edu	1	t	t	2076	2385	f	t	f	f	Dongchong	China	5	5 Ronald Regan Drive
83	Flipbug	3779002626	gmccoyu@bloomberg.com	1	f	t	2613	169	f	t	f	f	Glyadyanskoye	Russia	5	87 Saint Paul Point
84	Yambee	6059831761	lwillcockv@bing.com	1	t	f	1769	1352	f	f	f	f	Tha Bo	Thailand	5	56476 Mccormick Avenue
85	Yodoo	3013230400	garchiboldw@plala.or.jp	1	f	t	1617	1269	t	f	t	t	Idi Rayeuk	Indonesia	5	3183 Fisk Court
86	Meemm	7441242700	gsieghartx@opensource.org	1	t	t	2807	2876	f	f	t	f	Pakisaji	Indonesia	5	63260 Holmberg Trail
87	Realbridge	5727976744	ygalloney@tuttocitta.it	1	t	f	2408	1304	f	f	t	t	Kolomanu	Indonesia	5	66723 Mayfield Place
88	Kazio	4684799060	okeyhoez@oracle.com	1	f	t	2133	2683	t	f	t	t	Al Manāqil	Sudan	5	32982 Muir Plaza
89	Mydo	1898014181	sheales10@booking.com	1	t	f	2322	2210	t	t	t	f	Kamień Pomorski	Poland	5	9986 Maple Trail
90	Vipe	9346446972	bbohlmann11@wikimedia.org	1	t	f	1603	2151	f	f	f	t	Karlovo	Bulgaria	5	1525 Weeping Birch Crossing
91	Fivespan	6153314902	skiloh12@va.gov	1	t	f	1184	223	f	t	f	t	Jiaoyuan	China	5	383 Jackson Trail
92	Rhynyx	2259721085	cdinzey13@github.com	1	f	t	1191	373	t	t	t	t	Khalopyenichy	Belarus	5	464 Corry Avenue
93	Jayo	9705233846	lmaclleese14@ted.com	1	f	f	2989	1039	t	t	f	t	Paris 18	France	5	83355 Thackeray Way
94	Einti	3371266413	jhuortic15@yahoo.co.jp	1	t	f	1503	1332	t	t	t	t	Portão	Brazil	5	9915 Debra Junction
95	Dynabox	4563827233	npizzey16@so-net.ne.jp	1	f	f	1811	1917	t	f	f	t	Ani-e	Philippines	5	0554 Oxford Street
96	Skimia	8307306937	gheckney17@home.pl	1	f	t	1148	752	f	f	t	f	Curitiba	Brazil	5	05764 Dorton Road
97	Quatz	6687911922	pgrovier18@themeforest.net	1	f	t	2310	366	t	f	f	t	Shouxihu	China	5	8503 Carey Park
98	Vipe	9367280300	etett19@angelfire.com	1	f	t	481	2543	t	f	t	f	Sigaozhuang	China	5	7 Mayfield Court
99	Bluejam	7769942458	jolivello1a@shutterfly.com	1	f	f	926	481	t	t	t	t	Dizhai	China	5	83479 Anthes Park
100	Dynava	8237935282	cleaning1b@unesco.org	1	f	t	2924	1833	f	t	t	t	Stupari	Bosnia and Herzegovina	5	53 Burning Wood Trail
101	Aimbo	4835893488	bcraigmyle1c@statcounter.com	1	f	f	2603	928	t	f	t	f	Brejieira	Portugal	5	124 Goodland Junction
102	Ooba	1851188292	mmourant1d@topsy.com	1	t	f	32	1554	t	f	f	f	Zhuping	China	5	0484 Leroy Crossing
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (rooms_id, roomnumber, roomtype, capacity, pricepernight, isavailable, balcony, hotels_id) FROM stdin;
18	323	3	3	5123	t	t	1
70	20	4	1	2207	f	t	98
71	78	3	1	2227	t	f	73
72	169	2	5	948	t	f	99
73	180	2	2	977	t	t	60
74	71	3	5	2724	t	t	84
75	291	1	4	1031	t	t	87
76	169	4	6	288	f	f	90
77	225	3	5	2125	t	f	55
78	232	4	4	2344	f	f	94
79	72	1	4	967	f	t	96
80	214	3	5	2461	f	f	55
81	182	1	5	1632	f	t	101
82	244	2	5	1299	f	t	66
83	260	2	2	1020	f	t	82
84	80	2	2	2384	f	t	67
85	166	2	1	91	t	f	70
86	5	3	2	361	t	f	101
87	231	1	6	830	t	f	99
88	38	2	2	337	f	t	60
89	294	4	4	544	f	t	55
90	65	1	6	2303	t	f	73
91	92	1	4	2227	t	t	98
92	218	2	3	1603	f	t	68
93	196	3	6	2003	f	f	54
94	35	1	6	2572	f	t	98
95	168	3	1	1797	t	f	92
96	72	4	3	2149	t	t	71
97	25	2	3	934	t	f	96
98	168	3	2	2279	t	f	58
99	292	4	6	1621	t	f	88
100	61	4	2	2023	f	t	85
101	121	1	1	1799	t	f	94
102	273	2	5	820	f	f	79
103	101	2	2	2739	t	t	86
104	233	1	6	1635	f	t	68
105	262	2	6	2277	f	t	96
106	24	2	3	1265	t	f	62
107	270	4	4	981	t	t	65
108	189	2	5	1510	f	f	57
109	98	3	6	1018	t	f	75
110	223	2	6	1884	f	t	55
111	235	4	1	2765	f	t	81
112	249	4	1	218	f	t	85
113	278	1	6	1768	f	t	95
114	297	2	5	1625	t	t	64
115	238	4	4	1945	t	f	73
116	213	4	3	2228	t	t	73
117	160	1	2	2768	t	f	99
118	104	3	3	628	f	f	88
119	139	2	5	1972	f	t	63
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

SELECT pg_catalog.setval('public.bookings_bookings_id_seq', 53, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, true);


--
-- Name: clients_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq1', 54, true);


--
-- Name: hotels_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotels_hotels_id_seq', 102, true);


--
-- Name: rooms_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_rooms_id_seq', 119, true);


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

