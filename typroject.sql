--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admin (
    uid integer NOT NULL,
    uname character varying(30),
    upass character varying(50)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_uid_seq OWNER TO postgres;

--
-- Name: admin_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_uid_seq OWNED BY public.admin.uid;


--
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bill (
    bill_no integer primary key NOT NULL auto_increment,
    subtotal character varying(10),
    gst character varying(10),
    grandtotal character varying(10),
    billdate date,
    cuname character varying(30)
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- Name: bill_bill_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_bill_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_bill_no_seq OWNER TO postgres;

--
-- Name: bill_bill_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_bill_no_seq OWNED BY public.bill.bill_no;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer (
    cuname character varying(30) NOT NULL primary key,
    cpass character varying(50),
    cname character varying(50),
    cmob character varying(15),
    cadd character varying(100),
    pincode character varying(6),
    cemail character varying(50)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: employeedept; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.employeedept (
    eid integer,
    ename character varying(30),
    edept character varying(30),
    esal integer
);


ALTER TABLE public.employeedept OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product (
    pid integer primary key NOT NULL auto_increment ,
    pname character varying(100),
    pprice character varying(10),
    pdesc text,
    pqty integer,
    pimage character varying(200),
    pcat character varying(40),
    uid integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_pid_seq OWNER TO postgres;

--
-- Name: product_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_pid_seq OWNED BY public.product.pid;


--
-- Name: short_bill; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE short_bill (
    billno integer,
    pid integer
);


ALTER TABLE public.short_bill OWNER TO postgres;

--
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stock (
    sid integer  primary key  NOT NULL auto_increment,
    pid integer,
    pqty integer,
    sdate date
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- Name: stock_sid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_sid_seq OWNER TO postgres;

--
-- Name: stock_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_sid_seq OWNED BY public.stock.sid;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.student (
    sroll integer,
    sname character varying(30)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: temp_cart; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE temp_cart (
    cuname character varying(30),
    pid integer,
    ostatus character varying(20),
    cr_date date
);


ALTER TABLE public.temp_cart OWNER TO postgres;

--
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN uid SET DEFAULT nextval('public.admin_uid_seq'::regclass);


--
-- Name: bill_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill ALTER COLUMN bill_no SET DEFAULT nextval('public.bill_bill_no_seq'::regclass);


--
-- Name: pid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN pid SET DEFAULT nextval('public.product_pid_seq'::regclass);


--
-- Name: sid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN sid SET DEFAULT nextval('public.stock_sid_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (uid, uname, upass) FROM stdin;
1	admin	21232f297a57a5a743894a0e4a801fc3
2	abcd	abc
3	xyz	abcd
\.


--
-- Name: admin_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_uid_seq', 3, true);


--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill (bill_no, subtotal, gst, grandtotal, billdate, cuname) FROM stdin;
\.


--
-- Name: bill_bill_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_bill_no_seq', 1, false);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (cuname, cpass, cname, cmob, cadd, pincode, cemail) FROM stdin;
mohan123	e2fc714c4727ee9395f324cd2e7f331f	Mohan Pal	9874563215	Pune	411030	mohan@gmail.com
suresh	900150983cd24fb0d6963f7d28e17f72	suresh	9874585658	Pune	411030	suresh@gmail.com
\.


--
-- Data for Name: employeedept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employeedept (eid, ename, edept, esal) FROM stdin;
1	Ramesh	IT	100000
2	Ram	IT	200000
3	Gopi	HR	150000
4	Gopal	HR	180000
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (pid, pname, pprice, pdesc, pqty, pimage, pcat, uid) FROM stdin;
1	ParleG 1 Kg	100	Best to Eat	10	../uploads/1648815204parle.jpg	Food	1
2	Tiger Biscut	10	Tiger ki shakti	10	../uploads/1651922187abcd.png	Food	1
3	Dairy Milk 5 wali	5	milky	100	../uploads/1651923077Screenshot from 2019-11-25 12:10:19.png	Food	1
\.


--
-- Name: product_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_pid_seq', 3, true);


--
-- Data for Name: short_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.short_bill (billno, pid) FROM stdin;
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (sid, pid, pqty, sdate) FROM stdin;
\.


--
-- Name: stock_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_sid_seq', 1, false);


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (sroll, sname) FROM stdin;
1001	Mahesh
1002	Ram
1003	gopi
\.


--
-- Data for Name: temp_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_cart (cuname, pid, ostatus, cr_date) FROM stdin;
\.


--
-- Name: admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (uid);


--
-- Name: bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (bill_no);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cuname);


--
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (pid);


--
-- Name: stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (sid);


--
-- Name: bill_cuname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_cuname_fkey FOREIGN KEY (cuname) REFERENCES public.customer(cuname);


--
-- Name: product_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_uid_fkey FOREIGN KEY (uid) REFERENCES public.admin(uid);


--
-- Name: short_bill_billno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.short_bill
    ADD CONSTRAINT short_bill_billno_fkey FOREIGN KEY (billno) REFERENCES public.bill(bill_no);


--
-- Name: short_bill_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.short_bill
    ADD CONSTRAINT short_bill_pid_fkey FOREIGN KEY (pid) REFERENCES public.product(pid);


--
-- Name: stock_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pid_fkey FOREIGN KEY (pid) REFERENCES public.product(pid);


--
-- Name: temp_cart_cuname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_cart
    ADD CONSTRAINT temp_cart_cuname_fkey FOREIGN KEY (cuname) REFERENCES public.customer(cuname);


--
-- Name: temp_cart_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_cart
    ADD CONSTRAINT temp_cart_pid_fkey FOREIGN KEY (pid) REFERENCES public.product(pid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

