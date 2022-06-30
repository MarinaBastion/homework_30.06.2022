--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.3

-- Started on 2022-06-30 20:46:33 MSK

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
-- TOC entry 4 (class 2615 OID 16392)
-- Name: dbo; Type: SCHEMA; Schema: -; Owner: postgres
--

 CREATE ROLE db_user WITH LOGIN PASSWORD 'pass';
 CREATE ROLE db_creator WITH LOGIN PASSWORD 'pass1';
 ALTER ROLE db_creator CREATEROLE CREATEDB;
 CREATE ROLE db_super WITH LOGIN SUPERUSER PASSWORD 'pass2';
CREATE TABLESPACE space1  OWNER db_super  LOCATION '/var/lib/postgresql/data';

CREATE SCHEMA dbo;


ALTER SCHEMA dbo OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 16405)
-- Name: Categories; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Categories" (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE dbo."Categories" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16404)
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Categories_id_seq" OWNER TO postgres;

--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 212
-- Name: Categories_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Categories_id_seq" OWNED BY dbo."Categories".id;


--
-- TOC entry 227 (class 1259 OID 16483)
-- Name: Customers; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Customers" (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE dbo."Customers" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16482)
-- Name: Customers_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Customers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Customers_id_seq" OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 226
-- Name: Customers_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Customers_id_seq" OWNED BY dbo."Customers".id;


--
-- TOC entry 222 (class 1259 OID 16454)
-- Name: Delivers; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Delivers" (
    id integer NOT NULL,
    diler_id integer NOT NULL,
    store_id integer NOT NULL,
    product_id integer NOT NULL,
    deliver_date timestamp without time zone NOT NULL
)
PARTITION BY RANGE (deliver_date);


ALTER TABLE dbo."Delivers" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16453)
-- Name: Delivers_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Delivers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Delivers_id_seq" OWNER TO postgres;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 221
-- Name: Delivers_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Delivers_id_seq" OWNED BY dbo."Delivers".id;


--
-- TOC entry 223 (class 1259 OID 16460)
-- Name: Delivers_1; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Delivers_1" (
    id integer DEFAULT nextval('dbo."Delivers_id_seq"'::regclass) NOT NULL,
    diler_id integer NOT NULL,
    store_id integer NOT NULL,
    product_id integer NOT NULL,
    deliver_date timestamp without time zone NOT NULL
);


ALTER TABLE dbo."Delivers_1" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16466)
-- Name: Delivers_2; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Delivers_2" (
    id integer DEFAULT nextval('dbo."Delivers_id_seq"'::regclass) NOT NULL,
    diler_id integer NOT NULL,
    store_id integer NOT NULL,
    product_id integer NOT NULL,
    deliver_date timestamp without time zone NOT NULL
);


ALTER TABLE dbo."Delivers_2" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16476)
-- Name: Delivers_3; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Delivers_3" (
    id integer DEFAULT nextval('dbo."Delivers_id_seq"'::regclass) NOT NULL,
    diler_id integer NOT NULL,
    store_id integer NOT NULL,
    product_id integer NOT NULL,
    deliver_date timestamp without time zone NOT NULL
);


ALTER TABLE dbo."Delivers_3" OWNER TO postgres;

SET default_tablespace = space1;

--
-- TOC entry 219 (class 1259 OID 16428)
-- Name: Dilers; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: space1
--

CREATE TABLE dbo."Dilers" (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    adress character varying(1000) NOT NULL
);


ALTER TABLE dbo."Dilers" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16427)
-- Name: Dilers_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Dilers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Dilers_id_seq" OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 218
-- Name: Dilers_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Dilers_id_seq" OWNED BY dbo."Dilers".id;


SET default_tablespace = '';

--
-- TOC entry 217 (class 1259 OID 16421)
-- Name: Manufacture; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Manufacture" (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE dbo."Manufacture" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16420)
-- Name: Manufacture_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Manufacture_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Manufacture_id_seq" OWNER TO postgres;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 216
-- Name: Manufacture_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Manufacture_id_seq" OWNED BY dbo."Manufacture".id;


--
-- TOC entry 215 (class 1259 OID 16412)
-- Name: Prices; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Prices" (
    id integer NOT NULL,
    product_id integer NOT NULL,
    change_date timestamp without time zone,
    price numeric
);


ALTER TABLE dbo."Prices" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16411)
-- Name: Prices_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Prices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Prices_id_seq" OWNER TO postgres;

--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 214
-- Name: Prices_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Prices_id_seq" OWNED BY dbo."Prices".id;


--
-- TOC entry 211 (class 1259 OID 16394)
-- Name: Products; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Products" (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    categories_id integer NOT NULL,
    manufacture_id integer NOT NULL
);


ALTER TABLE dbo."Products" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16393)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Products_id_seq" OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 210
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Products_id_seq" OWNED BY dbo."Products".id;


--
-- TOC entry 229 (class 1259 OID 16490)
-- Name: Purchases; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Purchases" (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    purchase_dt timestamp without time zone NOT NULL
);


ALTER TABLE dbo."Purchases" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16489)
-- Name: Purchases_id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."Purchases_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."Purchases_id_seq" OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 228
-- Name: Purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."Purchases_id_seq" OWNED BY dbo."Purchases".id;


SET default_tablespace = space1;

--
-- TOC entry 220 (class 1259 OID 16436)
-- Name: Stores; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: space1
--

CREATE TABLE dbo."Stores" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    adress character varying(1000) NOT NULL
);


ALTER TABLE dbo."Stores" OWNER TO postgres;

--
-- TOC entry 3219 (class 0 OID 0)
-- Name: Delivers_1; Type: TABLE ATTACH; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers" ATTACH PARTITION dbo."Delivers_1" FOR VALUES FROM ('2022-02-01 00:00:00') TO ('2022-03-01 00:00:00');


--
-- TOC entry 3220 (class 0 OID 0)
-- Name: Delivers_2; Type: TABLE ATTACH; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers" ATTACH PARTITION dbo."Delivers_2" FOR VALUES FROM ('2022-03-01 00:00:00') TO ('2022-04-01 00:00:00');


--
-- TOC entry 3221 (class 0 OID 0)
-- Name: Delivers_3; Type: TABLE ATTACH; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers" ATTACH PARTITION dbo."Delivers_3" FOR VALUES FROM ('2022-04-01 00:00:00') TO ('2022-05-01 00:00:00');


--
-- TOC entry 3223 (class 2604 OID 16408)
-- Name: Categories id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Categories" ALTER COLUMN id SET DEFAULT nextval('dbo."Categories_id_seq"'::regclass);


--
-- TOC entry 3231 (class 2604 OID 16486)
-- Name: Customers id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Customers" ALTER COLUMN id SET DEFAULT nextval('dbo."Customers_id_seq"'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16457)
-- Name: Delivers id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers" ALTER COLUMN id SET DEFAULT nextval('dbo."Delivers_id_seq"'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16431)
-- Name: Dilers id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Dilers" ALTER COLUMN id SET DEFAULT nextval('dbo."Dilers_id_seq"'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16424)
-- Name: Manufacture id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Manufacture" ALTER COLUMN id SET DEFAULT nextval('dbo."Manufacture_id_seq"'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16415)
-- Name: Prices id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Prices" ALTER COLUMN id SET DEFAULT nextval('dbo."Prices_id_seq"'::regclass);


--
-- TOC entry 3222 (class 2604 OID 16397)
-- Name: Products id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Products" ALTER COLUMN id SET DEFAULT nextval('dbo."Products_id_seq"'::regclass);


--
-- TOC entry 3232 (class 2604 OID 16493)
-- Name: Purchases id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Purchases" ALTER COLUMN id SET DEFAULT nextval('dbo."Purchases_id_seq"'::regclass);


--
-- TOC entry 3409 (class 0 OID 16405)
-- Dependencies: 213
-- Data for Name: Categories; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Categories" (id, name) FROM stdin;
\.


--
-- TOC entry 3422 (class 0 OID 16483)
-- Dependencies: 227
-- Data for Name: Customers; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Customers" (id, name) FROM stdin;
\.


--
-- TOC entry 3418 (class 0 OID 16460)
-- Dependencies: 223
-- Data for Name: Delivers_1; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Delivers_1" (id, diler_id, store_id, product_id, deliver_date) FROM stdin;
\.


--
-- TOC entry 3419 (class 0 OID 16466)
-- Dependencies: 224
-- Data for Name: Delivers_2; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Delivers_2" (id, diler_id, store_id, product_id, deliver_date) FROM stdin;
\.


--
-- TOC entry 3420 (class 0 OID 16476)
-- Dependencies: 225
-- Data for Name: Delivers_3; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Delivers_3" (id, diler_id, store_id, product_id, deliver_date) FROM stdin;
\.


--
-- TOC entry 3415 (class 0 OID 16428)
-- Dependencies: 219
-- Data for Name: Dilers; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Dilers" (id, name, adress) FROM stdin;
\.


--
-- TOC entry 3413 (class 0 OID 16421)
-- Dependencies: 217
-- Data for Name: Manufacture; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Manufacture" (id, name) FROM stdin;
\.


--
-- TOC entry 3411 (class 0 OID 16412)
-- Dependencies: 215
-- Data for Name: Prices; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Prices" (id, product_id, change_date, price) FROM stdin;
\.


--
-- TOC entry 3407 (class 0 OID 16394)
-- Dependencies: 211
-- Data for Name: Products; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Products" (id, name, categories_id, manufacture_id) FROM stdin;
\.


--
-- TOC entry 3424 (class 0 OID 16490)
-- Dependencies: 229
-- Data for Name: Purchases; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Purchases" (id, customer_id, product_id, purchase_dt) FROM stdin;
\.


--
-- TOC entry 3416 (class 0 OID 16436)
-- Dependencies: 220
-- Data for Name: Stores; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Stores" (id, name, adress) FROM stdin;
\.


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 212
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Categories_id_seq"', 1, false);


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 226
-- Name: Customers_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Customers_id_seq"', 1, false);


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 221
-- Name: Delivers_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Delivers_id_seq"', 1, false);


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 218
-- Name: Dilers_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Dilers_id_seq"', 1, false);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 216
-- Name: Manufacture_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Manufacture_id_seq"', 1, false);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 214
-- Name: Prices_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Prices_id_seq"', 1, false);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 210
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Products_id_seq"', 1, false);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 228
-- Name: Purchases_id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo."Purchases_id_seq"', 1, false);


SET default_tablespace = '';

--
-- TOC entry 3236 (class 2606 OID 16410)
-- Name: Categories Categories_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Categories"
    ADD CONSTRAINT "Categories_pk" PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16488)
-- Name: Customers Customers_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Customers"
    ADD CONSTRAINT "Customers_pk" PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 16459)
-- Name: Delivers Delivers_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers"
    ADD CONSTRAINT "Delivers_pk" PRIMARY KEY (id, deliver_date);


--
-- TOC entry 3248 (class 2606 OID 16465)
-- Name: Delivers_1 Delivers_1_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers_1"
    ADD CONSTRAINT "Delivers_1_pkey" PRIMARY KEY (id, deliver_date);


--
-- TOC entry 3250 (class 2606 OID 16471)
-- Name: Delivers_2 Delivers_2_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers_2"
    ADD CONSTRAINT "Delivers_2_pkey" PRIMARY KEY (id, deliver_date);


--
-- TOC entry 3252 (class 2606 OID 16481)
-- Name: Delivers_3 Delivers_3_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Delivers_3"
    ADD CONSTRAINT "Delivers_3_pkey" PRIMARY KEY (id, deliver_date);


--
-- TOC entry 3242 (class 2606 OID 16435)
-- Name: Dilers Dilers_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Dilers"
    ADD CONSTRAINT "Dilers_pk" PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 16426)
-- Name: Manufacture Manufacture_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Manufacture"
    ADD CONSTRAINT "Manufacture_pk" PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 16419)
-- Name: Prices Prices_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Prices"
    ADD CONSTRAINT "Prices_pk" PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 16401)
-- Name: Products Products_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Products"
    ADD CONSTRAINT "Products_pk" PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16495)
-- Name: Purchases Purchases_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Purchases"
    ADD CONSTRAINT "Purchases_pk" PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 16442)
-- Name: Stores Stores_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Stores"
    ADD CONSTRAINT "Stores_pk" PRIMARY KEY (id);


--
-- TOC entry 3257 (class 0 OID 0)
-- Name: Delivers_1_pkey; Type: INDEX ATTACH; Schema: dbo; Owner: postgres
--

ALTER INDEX dbo."Delivers_pk" ATTACH PARTITION dbo."Delivers_1_pkey";


--
-- TOC entry 3258 (class 0 OID 0)
-- Name: Delivers_2_pkey; Type: INDEX ATTACH; Schema: dbo; Owner: postgres
--

ALTER INDEX dbo."Delivers_pk" ATTACH PARTITION dbo."Delivers_2_pkey";


--
-- TOC entry 3259 (class 0 OID 0)
-- Name: Delivers_3_pkey; Type: INDEX ATTACH; Schema: dbo; Owner: postgres
--

ALTER INDEX dbo."Delivers_pk" ATTACH PARTITION dbo."Delivers_3_pkey";


--
-- TOC entry 3262 (class 2606 OID 16506)
-- Name: Delivers Delivers_fk0; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE dbo."Delivers"
    ADD CONSTRAINT "Delivers_fk0" FOREIGN KEY (diler_id) REFERENCES dbo."Dilers"(id);


--
-- TOC entry 3263 (class 2606 OID 16518)
-- Name: Delivers Delivers_fk1; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE dbo."Delivers"
    ADD CONSTRAINT "Delivers_fk1" FOREIGN KEY (store_id) REFERENCES dbo."Stores"(id);


--
-- TOC entry 3264 (class 2606 OID 16530)
-- Name: Delivers Delivers_fk2; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE dbo."Delivers"
    ADD CONSTRAINT "Delivers_fk2" FOREIGN KEY (product_id) REFERENCES dbo."Products"(id);


--
-- TOC entry 3261 (class 2606 OID 16501)
-- Name: Prices Prices_fk0; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Prices"
    ADD CONSTRAINT "Prices_fk0" FOREIGN KEY (product_id) REFERENCES dbo."Products"(id);


--
-- TOC entry 3260 (class 2606 OID 16496)
-- Name: Products Products_fk0; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Products"
    ADD CONSTRAINT "Products_fk0" FOREIGN KEY (categories_id) REFERENCES dbo."Categories"(id);


--
-- TOC entry 3265 (class 2606 OID 16542)
-- Name: Purchases Purchases_fk0; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Purchases"
    ADD CONSTRAINT "Purchases_fk0" FOREIGN KEY (customer_id) REFERENCES dbo."Customers"(id);


--
-- TOC entry 3266 (class 2606 OID 16547)
-- Name: Purchases Purchases_fk1; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Purchases"
    ADD CONSTRAINT "Purchases_fk1" FOREIGN KEY (product_id) REFERENCES dbo."Products"(id);


-- Completed on 2022-06-30 20:46:33 MSK

--
-- PostgreSQL database dump complete
--

