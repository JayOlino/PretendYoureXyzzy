-- Pretend You're Xyzzy cards by Andy Janata is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
-- Based on a work at www.cardsagainsthumanity.com.
-- For more information, see http://creativecommons.org/licenses/by-nc-sa/3.0/

-- This file contains the Black Cards and White Cards for Cards Against Humanity, as a script for importing into PostgreSQL. There should be a user named cah.
-- Includes the First and Second Expansions, as well as the Canadian version cards.

--
-- PostgreSQL database dump
--

-- Dumped from database version 8.4.11
-- Dumped by pg_dump version 9.1.3
-- Started on 2012-09-25 18:35:29

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 140 (class 1259 OID 16399)
-- Dependencies: 1795 1796 1798 1799 6
-- Name: black_cards; Type: TABLE; Schema: public; Owner: cah; Tablespace: 
--

CREATE TABLE black_cards (
    id integer NOT NULL,
    text character varying(255) NOT NULL,
    draw smallint DEFAULT 0,
    pick smallint DEFAULT 1,
    creator integer,
    in_v1 boolean DEFAULT false NOT NULL,
    in_v2 boolean DEFAULT false NOT NULL,
    watermark character varying(5)
);


ALTER TABLE public.black_cards OWNER TO cah;

--
-- TOC entry 1828 (class 0 OID 0)
-- Dependencies: 140
-- Name: COLUMN black_cards.creator; Type: COMMENT; Schema: public; Owner: cah
--

COMMENT ON COLUMN black_cards.creator IS 'NULL for default card, non-NULL for user id';


--
-- TOC entry 141 (class 1259 OID 16404)
-- Dependencies: 6 140
-- Name: black_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: cah
--

CREATE SEQUENCE black_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_cards_id_seq OWNER TO cah;

--
-- TOC entry 1829 (class 0 OID 0)
-- Dependencies: 141
-- Name: black_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cah
--

ALTER SEQUENCE black_cards_id_seq OWNED BY black_cards.id;


--
-- TOC entry 1830 (class 0 OID 0)
-- Dependencies: 141
-- Name: black_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cah
--

SELECT pg_catalog.setval('black_cards_id_seq', 98, true);


--
-- TOC entry 148 (class 1259 OID 16497)
-- Dependencies: 6
-- Name: card_set; Type: TABLE; Schema: public; Owner: cah; Tablespace: 
--

CREATE TABLE card_set (
    id integer NOT NULL,
    active boolean NOT NULL,
    name character varying(255),
    base_deck boolean NOT NULL
);


ALTER TABLE public.card_set OWNER TO cah;

--
-- TOC entry 149 (class 1259 OID 16502)
-- Dependencies: 6
-- Name: card_set_black_card; Type: TABLE; Schema: public; Owner: cah; Tablespace: 
--

CREATE TABLE card_set_black_card (
    card_set_id integer NOT NULL,
    black_card_id integer NOT NULL
);


ALTER TABLE public.card_set_black_card OWNER TO cah;

--
-- TOC entry 150 (class 1259 OID 16507)
-- Dependencies: 6
-- Name: card_set_white_card; Type: TABLE; Schema: public; Owner: cah; Tablespace: 
--

CREATE TABLE card_set_white_card (
    card_set_id integer NOT NULL,
    white_card_id integer NOT NULL
);


ALTER TABLE public.card_set_white_card OWNER TO cah;

--
-- TOC entry 146 (class 1259 OID 16417)
-- Dependencies: 1801 1802 6
-- Name: white_cards; Type: TABLE; Schema: public; Owner: cah; Tablespace: 
--

CREATE TABLE white_cards (
    id integer NOT NULL,
    text character varying(255) NOT NULL,
    creator integer,
    in_v1 boolean DEFAULT false NOT NULL,
    in_v2 boolean DEFAULT false NOT NULL,
    watermark character varying(5)
);


ALTER TABLE public.white_cards OWNER TO cah;

--
-- TOC entry 1831 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN white_cards.creator; Type: COMMENT; Schema: public; Owner: cah
--

COMMENT ON COLUMN white_cards.creator IS 'NULL for default, non-NULL for user id';


--
-- TOC entry 147 (class 1259 OID 16420)
-- Dependencies: 146 6
-- Name: white_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: cah
--

CREATE SEQUENCE white_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.white_cards_id_seq OWNER TO cah;

--
-- TOC entry 1832 (class 0 OID 0)
-- Dependencies: 147
-- Name: white_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cah
--

ALTER SEQUENCE white_cards_id_seq OWNED BY white_cards.id;


--
-- TOC entry 1833 (class 0 OID 0)
-- Dependencies: 147
-- Name: white_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cah
--

SELECT pg_catalog.setval('white_cards_id_seq', 508, true);


--
-- TOC entry 1797 (class 2604 OID 16422)
-- Dependencies: 141 140
-- Name: id; Type: DEFAULT; Schema: public; Owner: cah
--

ALTER TABLE ONLY black_cards ALTER COLUMN id SET DEFAULT nextval('black_cards_id_seq'::regclass);


--
-- TOC entry 1800 (class 2604 OID 16423)
-- Dependencies: 147 146
-- Name: id; Type: DEFAULT; Schema: public; Owner: cah
--

ALTER TABLE ONLY white_cards ALTER COLUMN id SET DEFAULT nextval('white_cards_id_seq'::regclass);


--
-- TOC entry 1821 (class 0 OID 16399)
-- Dependencies: 140
-- Data for Name: black_cards; Type: TABLE DATA; Schema: public; Owner: cah
--

INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (16, 'Who stole the cookies from the cookie jar?', 0, 1, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (23, 'I wish I hadn''t lost the instruction manual for _____.', 0, 1, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (27, 'What''s the next superhero?', 0, 1, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (37, 'When I''m in prison, I''ll have _____ smuggled in.', 0, 1, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (54, 'After Hurricane Katrina, Sean Penn brought _____ to all the people of New Orleans.', 0, 1, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (55, 'Due to a PR fiasco, Walmart no longer offers _____.', 0, 1, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (69, 'Life was difficult for cavemen before _____.', 0, 1, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1, 'Why can''t I sleep at night?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (4, 'What''s that smell?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (17, 'What''s the next Happy Meal� toy?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (18, 'Anthropologists have recently discovered a primitive tribe that worships _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (19, 'It''s a pity that kids these days are all getting involved with _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (14, 'Alternative medicine is now embracing the curative powers of _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (78, 'And the Academy Award for _____ goes to _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (15, 'What''s that sound?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (9, 'What ended my last relationship?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (11, 'I drink to forget _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (12, 'I''m sorry, Professor, but I couldn''t complete my homework because of _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (7, 'What is Batman''s guilty pleasure?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (6, 'This is the way the world ends / This is the way the world ends / This is the way the world ends / Not with a bang but with _____', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (3, 'What''s a girl''s best friend?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (8, 'TSA guidelines now prohibit _____ on airplanes.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (20, '_____. That''s how I want to die.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (79, 'For my next trick, I will pull _____ out of _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (21, 'In the new Disney Channel Original Movie, Hannah Montana struggles with _____ for the first time.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (80, '_____ is a slippery slope that leads to _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (22, 'What does Dick Cheney prefer?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (24, 'Instead of coal, Santa now gives the bad children _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (25, 'What''s the most emo?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (26, 'In 1,000 years, when paper money is but a distant memory, _____ will be our currency.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (81, 'In M. Night Shyamalan''s new movie, Bruce Willis discovers that _____ had really been _____ all along.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (28, 'A romantic, candlelit dinner would be incomplete without _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (30, '_____. Betcha can''t have just one!', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (82, 'In a world ravaged by _____, our only solace is _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (34, 'War! What is it good for?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (33, 'During sex, I like to think about _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (39, 'What are my parents hiding from me?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (36, 'What will always get you laid?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (38, 'What did I bring back from Mexico?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (48, 'What don''t you want to find in your Chinese food?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (49, 'What will I bring back in time to convince people that I am a powerful wizard?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (50, 'How am I maintaining my relationship status?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (51, '_____. It''s a trap!', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (52, 'Coming to Broadway this season, _____: The Musical.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (84, 'Rumor has it that Vladimir Putin''s favorite dish is _____ stuffed with _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (57, 'But before I kill you, Mr. Bond, I must show you _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (58, 'What gives me uncontrollable gas?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (62, 'What do old people smell like? ', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (61, 'The class field trip was completely ruined by _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (60, 'When Pharaoh remained unmoved, Moses called down a plague of _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (59, 'What''s my secret power?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (41, 'What''s there a ton of in heaven?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (42, 'What would grandma find disturbing, yet oddly charming?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (85, 'I never truly understood _____ until I encountered _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (43, 'What did the U.S. airdrop to the children of Afghanistan?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (40, 'What helps Obama unwind?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (73, 'What did Vin Diesel eat for dinner?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (72, '_____: Good to the last drop.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (76, 'Why am I sticky?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (75, 'What gets better with age?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (74, '_____: kid-tested, mother-approved.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (71, 'What''s the crustiest?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (70, 'What''s Teach for America using to inspire inner city students to succeed?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (67, 'Studies show that lab rats navigate mazes 50% faster after being exposed to _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (86, 'Make a haiku.', 2, 3, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (68, 'I do not know with which weapons World War III will be fought, but World War IV will be fought with _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (66, 'Why do I hurt all over?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (63, 'What am I giving up for Lent?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (64, 'In Michael Jackson''s final moments, he thought about _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (65, 'In an attempt to reach a wider audience, the Smithsonian Museum of Natural History has opened an interactive exhibit on _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (45, 'When I am the President of the United States, I will create the Department of _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (87, 'Lifetime� presents _____, the story of _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (47, 'When I am a billionare, I shall erect a 50-foot statue to commemorate _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (88, 'When I was tripping on acid, _____ turned into _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (89, 'That''s right, I killed _____. How, you ask? _____.', 0, 2, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (77, 'What''s my anti-drug?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (90, '_____ + _____ = _____.', 2, 3, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (56, 'What never fails to liven up the party?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (44, 'What''s the new fad diet?', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (46, 'Major League Baseball has banned _____ for giving players an unfair advantage.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (31, 'White people like _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (32, '_____. High five, bro.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (29, 'Next from J.K. Rowling: Harry Potter and the Chamber of _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (35, 'BILLY MAYS HERE FOR _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (10, 'MTV''s new reality show features eight washed-up celebrities living with _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (83, 'In his new summer comedy, Rob Schneider is _____ trapped in the body of _____.', 0, 2, NULL, true, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (13, 'During Picasso''s often-overlooked Brown Period, he produced hundreds of paintings of _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (2, 'I got 99 problems but _____ ain''t one.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (53, 'While the United States raced the Soviet Union to the moon, the Mexican government funneled millions of pesos into research on _____.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1001, 'test', 0, 1, NULL, false, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1003, 'Starting Canadian Black Cards', 0, 1, NULL, false, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1009, 'End Canadian Black Cards', 0, 1, NULL, false, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1033, 'end bonus misprint bonus card', 0, 1, NULL, false, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1044, 'begin First Expansion', 0, 1, NULL, false, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1065, 'end first expansion', 0, 1, NULL, false, false, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1004, 'O Canada, we stand on guard for ____.', 0, 1, NULL, false, false, 'CAN');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1005, 'Air Canada guidelines now prohibit ____ on airplanes.', 0, 1, NULL, false, false, 'CAN');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1006, 'In an attempt to reach a wider audience, the Royal Ontario Museum has opened an interactive exhibit on ____.', 0, 1, NULL, false, false, 'CAN');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1007, 'CTV presents ____, the story of ____.', 0, 2, NULL, false, false, 'CAN');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1008, 'What''s the Canadian government using to inspire rural students to succeed?', 0, 1, NULL, false, false, 'CAN');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1045, 'He who controls ____ controls the world.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1046, 'The CIA now interrogates enemy agents by repeatedly subjecting them to ____.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1047, 'Dear Sir or Madam, We regret to inform you that the Office of ____ has denied your request for ____.', 0, 2, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1048, 'In Rome, there are whisperings that the Vatican has a secret room devoted to ____.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1049, 'Science will never explain the origin of ____.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1050, 'When all else fails, I can always masturbate to ____.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1051, 'I learned the hard way that you can''t cheer up a grieving friend with ____.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1052, 'In its new tourism campaign, Detroit proudly proclaims that it has finally eliminated ____.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1053, 'An international tribunal has found ____ guilty of ____.', 0, 2, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1054, 'The socialist governments of Scandinavia have declared that access to ____ is a basic human right.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1055, 'In his new self-produced album, Kanye West raps over the sounds of ____.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1056, 'What''s the gift that keeps on giving?', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1057, 'This season on Man vs. Wild, Bear Grylls must survive in the depths of the Amazon with only ____ and his wits.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1058, 'When I pooped, what came out of my butt?', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1059, 'In the distant future, historians will agree that ____ marked the beginning of America''s decline.', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1060, 'In a pinch, ____ can be a suitable substitute for ____.', 0, 2, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1061, 'What has been making life difficult at the nudist colony?', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1062, 'Michael Bay''s new three-hour action epic pits ____ against ____.', 0, 2, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (91, 'Maybe she''s born with it. Maybe it''s _____.', 0, 1, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (92, 'Dear Abby, I''m having some trouble with _____ and would like your advice.', 0, 1, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (93, 'What''s the next superhero/sidekick duo?', 0, 2, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (94, 'In L.A. County Jail, word is you can trade 200 cigarettes for _____.', 0, 1, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (95, 'After the earthquake, Sean Penn brought _____ to the people of Haiti.', 0, 1, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (96, 'Next on ESPN2, the World Series of _____.', 0, 1, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (97, 'Step 1: _____. Step 2: _____. Step 3: Profit.', 0, 2, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (98, 'Life for American Indians was forever changed when the White Man introduced them to _____.', 0, 1, NULL, false, true, '1.2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1032, 'Daddy, why is Mommy crying?', 0, 1, NULL, false, false, 'B');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (5, '_____? There''s an app for that.', 0, 1, NULL, true, true, NULL);
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1063, 'And I would have gotten away with it, too, if it hadn''t been for ____!', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1064, 'What brought the orgy to a grinding halt?', 0, 1, NULL, false, false, 'X1');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1156, 'During his midlife crisis, my dad got really into ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1157, '____ would be woefully incomplete without ____.', 0, 2, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1158, 'My new favorite porn star is Joey "____" McGee.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1159, 'Before I run for president, I must destroy all evidence of my involvement with ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1160, 'This is your captain speaking. Fasten your seatbelts and prepare for ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1161, 'In his newest and most difficult stunt, David Blaine must escape from ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1162, 'The Five Stages of Grief: denial, anger, bargaining, ____, acceptance.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1163, 'My mom freaked out when she looked at my browser history and found ____.com/____.', 0, 2, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1164, 'I went from ____ to ____, all thanks to ____.', 2, 3, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1165, 'Members of New York''s social elite are paying thousands of dollars just to experience ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1166, 'This month''s Cosmo: "Spice up your sex life by bringing ____ into the bedroom."', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1167, 'Little Miss Muffet Sat on a tuffet, Eating her curds and ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1168, 'If God didn''t want us to enjoy ____, he wouldn''t have given us ____.', 0, 2, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1169, 'My country, ''tis of thee, sweet land of ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1170, 'After months of debate, the Occupy Wall Street General Assembly could only agree on "More ____!"', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1171, 'I spent my whole life working toward ____, only to have it ruined by ____.', 0, 2, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1172, 'Next time on Dr. Phil: How to talk to your child about ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1173, 'Only two things in life are certain: death and ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1174, 'Everyone down on the ground! We don''t want to hurt anyone. We''re just here for ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1175, 'The healing process began when I joined a support group for victims of ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1176, 'The votes are in, and the new high school mascot is ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1177, 'Charades was ruined for me forever when my mom had to act out ____.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1178, 'Before ____, all we had was ____.', 0, 2, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1179, 'Tonight on 20/20: What you don''t know about ____ could kill you.', 0, 1, NULL, false, false, 'X2');
INSERT INTO black_cards (id, text, draw, pick, creator, in_v1, in_v2, watermark) VALUES (1180, 'You haven''t truly lived until you''ve experienced ____ and ____ at the same time.', 0, 2, NULL, false, false, 'X2');


--
-- TOC entry 1823 (class 0 OID 16497)
-- Dependencies: 148
-- Data for Name: card_set; Type: TABLE DATA; Schema: public; Owner: cah
--

INSERT INTO card_set (id, active, name, base_deck) VALUES (1153, true, 'Canadian', false);
INSERT INTO card_set (id, active, name, base_deck) VALUES (1154, true, 'Misprint Replacement Bonus Cards', false);
INSERT INTO card_set (id, active, name, base_deck) VALUES (1155, true, 'The First Expansion', false);
INSERT INTO card_set (id, active, name, base_deck) VALUES (1151, true, 'First Version', true);
INSERT INTO card_set (id, active, name, base_deck) VALUES (1152, true, 'Second Version', true);
INSERT INTO card_set (id, active, name, base_deck) VALUES (1256, true, 'The Second Expansion', false);


--
-- TOC entry 1824 (class 0 OID 16502)
-- Dependencies: 149
-- Data for Name: card_set_black_card; Type: TABLE DATA; Schema: public; Owner: cah
--

INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 1);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 2);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 3);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 4);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 5);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 6);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 7);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 8);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 9);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 10);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 11);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 12);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 13);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 14);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 15);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 17);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 16);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 19);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 18);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 21);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 20);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 23);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 22);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 25);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 24);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 27);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 26);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 29);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 28);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 31);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 30);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 34);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 35);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 32);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 33);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 38);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 39);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 36);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 37);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 42);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 43);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 40);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 41);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 46);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 47);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 44);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 45);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 51);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 50);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 49);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 48);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 55);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 54);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 53);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 52);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 59);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 58);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 57);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 56);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 63);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 62);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 61);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 60);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 68);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 69);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 70);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 71);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 64);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 65);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 66);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 67);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 76);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 77);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 78);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 79);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 72);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 73);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 74);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 75);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 85);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 84);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 87);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 86);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 81);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 80);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 83);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 82);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 89);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 88);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1151, 90);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 1);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 2);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 3);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 4);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 5);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 6);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 7);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 8);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 9);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 10);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 11);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 12);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 13);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 14);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 15);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 17);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 19);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 18);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 21);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 20);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 22);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 25);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 24);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 26);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 29);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 28);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 31);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 30);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 34);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 35);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 32);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 33);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 38);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 39);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 36);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 42);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 43);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 40);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 41);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 46);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 47);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 44);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 45);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 51);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 50);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 49);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 48);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 53);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 52);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 59);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 58);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 57);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 56);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 63);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 62);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 61);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 60);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 68);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 70);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 71);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 64);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 65);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 66);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 67);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 76);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 77);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 78);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 79);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 72);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 73);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 74);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 75);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 85);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 84);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 87);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 86);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 81);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 80);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 82);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 93);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 92);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 95);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 94);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 89);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 88);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 91);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 90);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 98);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 96);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1152, 97);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1153, 1005);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1153, 1004);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1153, 1007);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1153, 1006);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1153, 1008);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1154, 1032);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1064);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1058);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1059);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1056);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1057);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1062);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1063);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1060);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1061);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1049);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1048);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1051);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1050);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1053);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1052);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1055);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1054);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1045);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1047);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1155, 1046);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1157);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1156);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1159);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1158);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1161);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1160);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1163);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1162);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1165);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1164);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1167);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1166);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1168);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1169);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1170);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1171);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1172);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1173);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1174);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1175);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1176);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1177);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1178);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1179);
INSERT INTO card_set_black_card (card_set_id, black_card_id) VALUES (1256, 1180);


--
-- TOC entry 1825 (class 0 OID 16507)
-- Dependencies: 150
-- Data for Name: card_set_white_card; Type: TABLE DATA; Schema: public; Owner: cah
--

INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 1);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 2);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 3);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 4);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 5);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 6);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 7);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 8);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 9);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 10);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 11);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 12);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 13);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 14);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 15);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 17);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 16);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 19);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 18);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 21);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 20);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 23);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 22);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 25);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 24);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 27);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 26);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 29);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 28);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 31);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 30);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 34);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 35);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 32);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 33);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 38);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 39);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 36);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 37);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 42);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 43);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 40);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 41);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 46);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 47);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 44);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 45);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 51);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 50);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 49);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 48);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 55);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 54);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 53);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 52);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 59);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 58);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 57);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 56);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 63);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 62);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 61);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 60);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 68);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 69);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 70);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 71);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 64);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 65);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 66);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 67);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 76);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 77);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 78);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 79);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 72);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 73);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 74);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 75);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 85);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 84);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 87);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 86);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 81);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 80);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 83);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 82);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 93);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 92);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 95);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 94);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 89);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 88);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 91);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 90);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 102);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 103);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 100);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 101);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 98);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 99);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 96);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 97);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 110);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 111);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 108);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 109);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 106);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 107);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 104);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 105);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 119);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 118);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 117);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 116);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 115);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 114);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 113);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 112);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 127);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 126);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 125);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 124);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 123);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 122);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 121);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 120);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 137);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 136);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 139);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 138);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 141);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 140);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 143);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 142);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 129);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 128);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 131);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 130);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 133);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 132);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 135);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 134);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 152);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 153);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 154);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 155);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 156);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 157);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 158);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 159);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 144);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 145);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 146);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 147);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 148);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 149);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 150);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 151);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 171);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 170);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 169);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 168);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 175);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 174);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 173);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 172);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 163);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 162);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 161);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 160);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 167);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 166);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 165);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 164);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 186);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 187);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 184);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 185);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 190);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 191);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 188);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 189);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 178);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 179);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 176);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 177);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 182);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 183);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 180);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 181);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 205);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 204);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 207);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 206);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 201);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 200);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 203);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 202);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 197);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 196);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 199);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 198);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 193);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 192);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 195);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 194);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 220);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 221);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 222);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 223);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 216);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 217);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 218);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 219);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 212);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 213);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 214);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 215);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 208);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 209);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 210);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 211);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 239);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 238);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 237);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 236);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 235);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 234);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 233);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 232);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 231);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 230);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 229);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 228);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 227);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 226);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 225);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 224);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 254);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 255);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 252);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 253);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 250);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 251);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 248);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 249);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 246);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 247);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 244);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 245);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 242);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 243);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 240);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 241);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 275);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 274);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 273);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 272);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 279);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 278);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 277);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 276);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 283);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 282);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 281);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 280);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 287);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 286);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 285);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 284);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 258);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 259);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 256);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 257);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 262);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 263);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 260);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 261);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 266);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 267);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 264);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 265);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 270);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 271);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 268);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 269);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 305);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 304);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 307);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 306);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 309);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 308);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 311);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 310);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 313);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 312);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 315);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 314);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 317);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 316);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 319);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 318);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 288);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 289);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 290);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 291);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 292);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 293);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 294);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 295);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 296);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 297);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 298);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 299);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 300);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 301);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 302);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 303);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 343);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 342);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 341);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 340);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 339);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 338);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 337);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 336);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 351);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 350);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 349);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 348);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 347);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 346);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 345);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 344);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 326);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 327);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 324);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 325);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 322);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 323);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 320);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 321);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 334);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 335);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 332);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 333);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 330);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 331);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 328);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 329);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 373);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 372);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 375);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 374);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 369);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 368);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 371);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 370);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 381);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 380);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 383);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 382);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 377);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 376);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 379);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 378);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 356);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 357);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 358);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 359);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 352);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 353);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 354);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 355);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 364);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 365);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 366);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 367);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 360);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 361);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 362);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 363);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 410);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 411);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 408);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 409);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 414);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 415);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 412);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 413);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 402);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 403);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 400);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 401);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 406);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 407);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 404);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 405);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 395);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 394);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 393);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 392);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 399);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 398);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 397);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 396);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 387);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 386);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 385);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 384);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 391);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 390);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 389);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 388);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 440);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 441);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 442);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 443);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 444);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 445);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 446);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 447);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 432);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 433);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 434);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 435);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 436);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 437);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 438);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 439);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 425);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 424);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 427);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 426);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 429);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 428);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 431);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 430);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 417);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 416);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 419);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 418);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 421);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 420);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 423);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 422);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 460);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 459);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 458);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 457);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 456);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 455);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 454);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 453);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 452);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 451);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 450);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 449);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1151, 448);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 1);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 2);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 3);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 4);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 5);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 6);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 7);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 10);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 11);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 12);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 13);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 14);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 16);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 19);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 18);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 20);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 23);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 22);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 25);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 24);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 27);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 26);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 29);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 28);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 31);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 30);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 34);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 35);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 32);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 33);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 38);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 39);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 36);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 37);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 42);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 40);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 41);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 46);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 47);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 44);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 45);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 51);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 50);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 49);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 48);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 55);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 54);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 53);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 52);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 59);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 58);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 57);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 56);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 63);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 62);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 61);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 60);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 68);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 70);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 71);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 65);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 66);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 67);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 76);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 77);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 78);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 79);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 72);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 73);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 74);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 75);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 85);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 84);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 87);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 86);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 81);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 80);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 83);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 82);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 93);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 92);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 95);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 94);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 89);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 88);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 91);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 90);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 102);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 103);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 101);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 98);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 99);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 96);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 97);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 111);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 108);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 109);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 106);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 107);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 104);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 105);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 119);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 118);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 117);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 116);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 115);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 114);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 113);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 112);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 127);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 126);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 125);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 124);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 122);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 121);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 137);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 136);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 139);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 138);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 141);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 140);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 142);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 129);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 128);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 132);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 135);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 134);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 152);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 153);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 154);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 155);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 157);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 159);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 144);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 145);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 146);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 147);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 148);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 149);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 150);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 151);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 171);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 170);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 169);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 168);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 175);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 174);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 173);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 172);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 163);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 162);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 161);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 160);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 167);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 166);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 165);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 186);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 187);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 184);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 185);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 191);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 189);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 178);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 179);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 176);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 182);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 183);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 180);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 181);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 205);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 204);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 207);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 206);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 201);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 200);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 203);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 202);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 197);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 196);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 199);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 198);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 193);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 192);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 195);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 194);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 220);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 221);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 222);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 223);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 217);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 218);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 219);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 212);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 213);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 214);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 215);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 208);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 209);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 210);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 211);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 239);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 238);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 237);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 236);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 235);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 234);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 233);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 232);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 231);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 230);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 229);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 228);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 227);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 226);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 225);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 224);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 254);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 255);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 252);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 253);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 250);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 251);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 249);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 246);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 244);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 245);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 242);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 243);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 240);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 241);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 275);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 274);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 272);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 279);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 278);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 277);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 276);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 283);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 282);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 280);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 287);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 286);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 284);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 258);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 259);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 256);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 257);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 262);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 263);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 260);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 261);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 266);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 267);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 265);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 270);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 271);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 268);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 269);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 305);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 304);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 306);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 309);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 308);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 311);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 312);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 315);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 314);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 317);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 316);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 319);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 318);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 289);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 290);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 291);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 292);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 293);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 294);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 295);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 296);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 297);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 298);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 299);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 300);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 302);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 303);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 343);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 340);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 339);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 337);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 336);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 351);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 349);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 348);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 347);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 346);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 345);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 344);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 326);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 327);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 324);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 325);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 322);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 323);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 320);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 321);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 334);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 335);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 332);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 330);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 329);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 373);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 372);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 375);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 374);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 369);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 368);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 370);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 381);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 380);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 382);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 377);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 376);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 379);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 378);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 356);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 357);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 358);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 359);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 352);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 354);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 355);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 364);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 365);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 366);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 367);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 360);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 361);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 362);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 410);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 411);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 408);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 409);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 414);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 415);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 412);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 413);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 402);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 400);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 401);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 406);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 407);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 404);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 405);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 395);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 394);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 393);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 392);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 399);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 398);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 397);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 396);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 387);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 386);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 385);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 384);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 391);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 390);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 389);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 388);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 440);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 441);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 442);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 443);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 444);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 445);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 446);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 447);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 432);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 433);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 434);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 435);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 436);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 437);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 438);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 439);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 425);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 427);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 426);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 429);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 431);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 430);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 417);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 416);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 419);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 418);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 421);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 420);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 423);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 422);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 478);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 479);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 476);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 477);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 474);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 475);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 472);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 473);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 470);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 471);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 468);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 469);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 466);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 467);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 464);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 465);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 463);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 462);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 461);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 460);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 459);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 458);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 457);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 456);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 455);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 453);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 452);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 451);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 450);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 449);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 448);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 508);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 504);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 505);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 506);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 507);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 500);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 501);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 502);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 503);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 496);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 497);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 498);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 499);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 493);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 492);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 495);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 494);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 489);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 488);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 491);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 490);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 485);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 484);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 487);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 486);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 481);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 480);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 483);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1152, 482);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1016);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1017);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1018);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1019);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1020);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1021);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1022);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1023);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1024);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1025);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1026);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1010);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1027);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1011);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1028);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1012);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1029);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1013);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1030);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1014);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1153, 1015);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1034);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1035);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1036);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1037);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1038);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1039);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1041);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1040);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1154, 1042);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1100);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1101);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1102);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1103);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1096);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1097);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1098);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1099);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1092);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1093);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1094);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1095);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1088);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1089);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1090);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1091);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1117);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1116);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1119);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1118);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1113);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1112);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1115);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1114);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1109);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1108);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1111);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1110);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1105);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1104);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1107);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1106);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1134);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1135);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1132);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1133);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1130);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1131);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1128);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1129);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1126);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1127);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1124);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1125);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1122);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1123);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1120);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1121);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1145);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1144);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1143);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1142);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1141);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1140);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1139);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1138);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1137);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1136);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1066);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1067);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1070);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1071);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1068);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1069);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1083);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1082);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1081);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1080);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1087);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1086);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1085);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1084);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1075);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1074);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1073);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1072);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1079);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1078);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1077);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1155, 1076);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1221);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1220);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1223);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1222);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1217);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1216);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1219);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1218);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1229);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1228);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1231);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1230);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1225);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1224);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1227);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1226);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1236);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1237);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1238);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1239);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1232);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1233);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1234);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1235);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1244);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1245);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1246);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1247);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1240);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1241);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1242);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1243);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1255);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1254);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1253);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1252);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1251);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1250);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1249);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1248);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1181);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1182);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1183);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1187);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1186);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1185);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1184);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1191);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1190);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1189);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1188);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1195);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1194);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1193);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1192);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1199);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1198);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1197);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1196);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1202);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1203);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1200);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1201);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1206);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1207);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1204);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1205);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1210);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1211);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1208);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1209);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1214);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1215);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1212);
INSERT INTO card_set_white_card (card_set_id, white_card_id) VALUES (1256, 1213);


--
-- TOC entry 1822 (class 0 OID 16417)
-- Dependencies: 146
-- Data for Name: white_cards; Type: TABLE DATA; Schema: public; Owner: cah
--

INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (282, 'Michelle Obama''s arms.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (124, 'White people.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (393, 'An erection that lasts longer than four hours.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (141, 'Panda sex.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (121, 'Stifling a giggle at the mention of Hutus and Tutsis.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (269, 'A middle-aged man on roller skates.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1, 'Coat hanger abortions.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (138, 'Scrubbing under the folds.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (275, 'Wearing underwear inside-out to avoid doing laundry.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (167, 'The Tempur-Pedic� Swedish Sleep System�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1146, 'end First Expansion', NULL, false, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (461, 'Flying sex snakes', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (462, 'MechaHitler.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (463, 'Getting naked and watching Nickelodeon.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (464, 'Charisma.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (465, 'Morgan Freeman''s voice.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (466, 'Breaking out into song and dance.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (467, 'Soup that is too hot.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (468, 'Chutzpah.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (469, 'Unfathomable stupidity.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (470, 'Horrifying laser hair removal accidents.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (471, 'Boogers.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (472, 'A Bop It�.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (473, 'Expecting a burp and vomiting on the floor.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (474, 'A defective condom.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (475, 'Teenage pregnancy.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (476, 'Hot cheese.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (477, 'A mopey zoo lion.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (478, 'Shapeshifters.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (479, 'The Care Bear Stare.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (480, 'Erectile dysfunction.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (481, 'The chronic.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (483, '"Tweeting."', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (484, 'Firing a rifle into the air while balls deep in a squealing hog.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (485, 'Nicolas Cage.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (482, 'Home video of Oprah sobbing into a Lean Cuisine�.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1110, 'Leveling up.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1111, 'Literally eating shit.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1112, 'Making the penises kiss.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1113, 'Media coverage.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1114, 'Medieval Times� Dinner & Tournament.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1115, 'Moral ambiguity.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1116, 'My machete.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1117, 'One thousand Slim Jims.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1118, 'Ominous background music.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1119, 'Overpowering your father.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1120, 'Pistol-whipping a hostage.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1121, 'Quiche.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1122, 'Quivering jowls.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1123, 'Revenge fucking.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1124, 'Ripping into a man''s chest and pulling out his still-beating heart.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1125, 'Ryan Gosling riding in on a white horse.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1126, 'Santa Claus.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1127, 'Scrotum tickling.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1128, 'Sexual humiliation.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1129, 'Sexy Siamese twins.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1130, 'Slow motion.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1131, 'Space muffins.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1132, 'Statistically validated stereotypes.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1133, 'Sudden Poop Explosion Disease.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1134, 'The boners of the elderly.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1135, 'The economy.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (225, 'Dropping a chandelier on your enemies and riding the rope up.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (297, 'Public ridicule.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (265, 'A snapping turtle biting the tip of your penis.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (218, 'Vehicular manslaughter.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (267, 'Domino''s� Oreo� Dessert Pizza.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (160, 'The token minority.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (486, 'Euphoria� by Calvin Klein.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (487, 'Switching to Geico�.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (488, 'A gentle caress of the inner thigh.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (489, 'Poor life choices.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (490, 'Embryonic stem cells.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (491, 'Customer service representatives.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (492, 'The Little Engine That Could.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (493, 'Lady Gaga.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (494, 'A death ray.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (495, 'Vigilante justice.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (496, 'Exactly what you''d expect.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (497, 'Natural male enhancement.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (498, 'Passive-aggressive Post-it notes.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (499, 'Inappropriate yodeling.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (500, 'A homoerotic volleyball montage.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (501, 'Actually taking candy from a baby.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (502, 'Jibber-jabber.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (503, 'Crystal meth.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (504, 'My inner demons.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (505, 'Pac-Man uncontrollably guzzling cum.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (506, 'My vagina.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (507, 'The Donald Trump Seal of Approval�.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (508, 'The true meaning of Christmas.', NULL, false, true, '1.2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1136, 'The Fanta� girls.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1137, 'The Gulags.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1138, 'The harsh light of day.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1139, 'The hiccups.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1140, 'The shambling corpse of Larry King.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1141, 'The four arms of Vishnu.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1142, 'Being a busy adult with many important things to do.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1143, 'Tripping balls.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1144, 'Words, words, words.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1145, 'Zeus''s sexual appetites.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1066, 'A big black dick.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1067, 'A beached whale.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1068, 'A bloody pacifier.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1069, 'A crappy little hand.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1070, 'A low standard of living.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1071, 'A nuanced critique.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1072, 'Panty raids.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1073, 'A passionate Latino lover.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1074, 'A rival dojo.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1075, 'A web of lies.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1076, 'A woman scorned.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1077, 'Clams', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1078, 'Apologizing.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1079, 'Appreciative snapping.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1080, 'Neil Patrick Harris.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1081, 'Beating your wives.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1082, 'Being a dinosaur.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1083, 'Shaft.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1217, 'A soulful rendition of "Ol'' Man River."', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1218, 'Intimacy problems.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1219, 'A sweaty, panting leather daddy.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1220, 'Spring break!', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1221, 'Being awesome at sex.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1222, 'Dining with cardboard cutouts of the cast of "Friends."', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1223, 'Another shot of morphine.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1226, 'Bullshit.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1227, 'The Google.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1228, 'Pretty Pretty Princess Dress-Up Board Game�.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1229, 'The new Radiohead album.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1230, 'An army of skeletons.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1231, 'A man in yoga pants with a ponytail and feather earrings.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1232, 'Mild autism.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1233, 'Nunchuck moves.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1234, 'Whipping a disobedient slave.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1235, 'An ether-soaked rag.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1236, 'A sweet spaceship.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1237, 'A 55-gallon drum of lube.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1238, 'Special musical guest, Cher.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1239, 'The human body.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1240, 'Boris the Soviet Love Hammer.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1241, 'The grey nutrient broth that sustains Mitt Romney.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1242, 'Tiny nipples.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1243, 'Power.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1244, 'Oncoming traffic.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1245, 'A dollop of sour cream.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1246, 'A slightly shittier parallel universe.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1247, 'My first kill.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1248, 'Graphic violence, adult language, and some sexual content.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1249, 'Fetal alcohol syndrome.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1250, 'The day the birds attacked.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1251, 'One Ring to rule them all.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1252, 'Grandpa''s ashes.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1253, 'Basic human decency.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1254, 'A Burmese tiger pit.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1255, 'Death by Steven Seagal.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1002, 'testtest', NULL, false, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1031, 'End Canadian White Cards', NULL, false, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1010, 'Mr. Dressup.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1011, 'Being Canadian.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1012, 'The Famous Five.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1013, 'Stephen Harper.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1014, 'The Royal Canadian Mounted Police.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1015, 'An icy handjob from an Edmonton hooker.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1016, 'Poutine.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1017, 'Newfies.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1018, 'The Official Languages Act. La Loi sur les langues officielles.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1019, 'Terry Fox''s prosthetic leg.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1020, 'The FLQ.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1021, 'Canada: America''s Hat.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1022, 'Don Cherry''s wardrobe.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1023, 'Burning down the White House.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1024, 'Heritage minutes.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1025, 'Homo milk.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1026, 'Naked News.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1027, 'Syrupy sex with a maple tree.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1028, 'Snotsicles.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1029, 'Schmirler the Curler.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1030, 'A Molson muscle.', NULL, false, false, 'CAN');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1181, 'A bigger, blacker dick.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1182, 'The mere concept of Applebee''s�.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1183, 'A sad fat dragon with no friends.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1184, 'Catastrophic urethral trauma.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1185, 'Hillary Clinton''s death stare.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1186, 'Existing.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1187, 'A pi�ata full of scorpions.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1188, 'Mooing.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1189, 'Swiftly achieving orgasm.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1190, 'Daddy''s belt.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1191, 'Double penetration.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1192, 'Weapons-grade plutonium.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1193, 'Some really fucked-up shit.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1194, 'Subduing a grizzly bear and making her your wife.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1195, 'Rising from the grave.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1196, 'The mixing of the races.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1197, 'Taking a man''s eyes and balls out and putting his eyes where his balls go and then his balls in the eye holes.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1198, 'Scrotal frostbite.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1199, 'All of this blood.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1200, 'Loki, the trickster god.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1201, 'Whining like a little bitch.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1202, 'Pumping out a baby every nine months.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1203, 'Tongue.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1204, 'Finding Waldo.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1205, 'Upgrading homeless people to mobile hotspots.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1206, 'Wearing an octopus for a hat.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1207, 'An unhinged ferris wheel rolling toward the sea.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1208, 'Living in a trashcan.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1209, 'The corporations.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1210, 'A magic hippie love cloud.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1211, 'Fuck Mountain.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1212, 'Survivor''s guilt.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1213, 'Me.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1214, 'Getting hilariously gang-banged by the Blue Man Group.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1215, 'Jeff Goldblum.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1216, 'Making a friend.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (44, 'German dungeon porn.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (40, 'Praying the gay away.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (63, 'Dying.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (41, 'Same-sex ice dancing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (70, 'Dying of dysentery.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (19, 'Roofies.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (22, 'The Big Bang.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (23, 'Amputees.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (74, 'Men.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (18, 'Concealing a boner.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (87, 'Agriculture.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (51, 'Making a pouty face.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (98, 'YOU MUST CONSTRUCT ADDITIONAL PYLONS.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (60, 'Hormone injections.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (55, 'Tom Cruise.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (56, 'Object permanence.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (92, 'Consultants.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (26, 'Being marginalized.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (54, 'The profoundly handicapped.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (96, 'Party poopers.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (48, 'Nickelback.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (7, 'Doing the right thing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (65, 'The invisible hand.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (49, 'Heteronormativity.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (29, 'Cuddling.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (84, 'Raptor attacks.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (38, 'Fear itself.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (91, 'Sniffing glue.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (58, 'An icepick lobotomy.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (109, 'Being rich.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (79, 'The clitoris.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (71, 'Sexy pillow fights.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (105, 'Michael Jackson.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (101, 'Sexting.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (33, 'Horse meat.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (8, 'Hunting accidents.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (9, 'A cartoon camel enjoying the smooth, refreshing taste of a cigarette.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (15, 'Abstinence.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (17, 'Mountain Dew Code Red.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (21, 'Tweeting.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (43, 'Making sex at her.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (64, 'Stunt doubles.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (69, 'Flavored condoms.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (100, 'Heath Ledger.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (110, 'Muzzy.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (97, 'Sunshine and rainbows.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (68, 'Flash flooding.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (57, 'Goblins.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (13, 'Spectacular abs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (72, 'The Three-Fifths compromise.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (4, 'Vigorous jazz hands.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (106, 'Skeletor.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (80, 'Vikings.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (34, 'Genital piercings.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (11, 'Viagra�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (67, 'A really cool hat.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (102, 'An Oedipus complex.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (82, 'The Underground Railroad.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (77, 'Heartwarming orphans.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (47, 'Cheating in the Special Olympics.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (108, 'Sharing needles.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (46, 'Ethnic cleansing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (103, 'Eating all of the cookies before the AIDS bake-sale.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (93, 'My humps.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (10, 'The violation of our most basic human rights.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (35, 'Fingering.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (53, 'The placenta.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (5, 'Flightless birds.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (37, 'Stranger danger.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (107, 'Chivalry.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (76, 'Sean Penn.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (73, 'A sad handjob.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (66, 'Jew-fros.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (12, 'Self-loathing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (61, 'A falcon with a cap on its head.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (75, 'Historically black colleges.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (30, 'Aaron Burr.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (25, 'Former President George W. Bush.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (94, 'Geese.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (99, 'Mutually-assured destruction.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (88, 'Bling.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (27, 'Smegma.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (90, 'The South.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (83, 'Pretending to care.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (59, 'Arnold Schwarzenegger.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (20, 'Glenn Beck convulsively vomiting as a brood of crab spiders hatches in his brain and erupts from his tear ducts.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (104, 'A sausage festival.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (62, 'Foreskin.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (95, 'Being a dick to children.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (52, 'Chainsaws for hands.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (86, 'A Gypsy curse.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (31, 'The Pope.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (16, 'A balanced breakfast.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (36, 'Elderly Japanese men.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (6, 'Pictures of boobs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (39, 'Science.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (32, 'A bleached asshole.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (3, 'Autocannibalism.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (50, 'William Shatner.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (85, 'A micropenis.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (78, 'Waterboarding.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (45, 'Bingeing and purging.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (89, 'A clandestine butt scratch.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (2, 'Man meat.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (28, 'Laying an egg.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (14, 'An honest cop with nothing left to lose.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (42, 'The terrorists.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (81, 'Friends who eat all the snacks.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1043, 'end misprint bonus card', NULL, false, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1034, 'A bitch slap.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1035, 'One trillion dollars.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1036, 'Chunks of dead prostitute.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1037, 'The entire Mormon Tabernacle Choir.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1038, 'The female orgasm.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1039, 'Extremely tight pants.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1040, 'Stormtroopers.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1041, 'The Boy Scouts of America.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1042, 'Throwing a virgin into a volcano.', NULL, false, false, 'B');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (120, 'Cookie Monster devouring the Eucharist wafers.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (123, 'Letting yourself go.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (130, 'Twinkies�.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (131, 'A LAN party.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (133, 'A grande sugar-free iced soy caramel macchiato.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (143, 'Will Smith.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (156, 'Marky Mark and the Funky Bunch.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (158, 'Dave Matthews Band.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (164, 'Substitute teachers.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (177, 'Garth Brooks.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (188, 'Keeping Christ in Christmas.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (190, 'That one gay Teletubby.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (216, 'Passive-agression.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (247, 'A neglected Tamagotchi�.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (248, 'The People''s Elbow.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (230, 'Guys who don''t call.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (152, 'AIDS.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (187, 'The Rapture.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (244, 'Eugenics.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (181, 'Taking off your shirt.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (139, 'A drive-by shooting.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (217, 'Ronald Reagan.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (195, 'Jewish fraternities.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (198, 'All-you-can-eat shrimp for $4.99.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (233, 'Scalping.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (196, 'Edible underpants.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (154, 'Figgy pudding.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (240, 'Intelligent design.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (207, 'Nocturnal emissions.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (119, 'Uppercuts.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (180, 'The American Dream.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (226, 'Testicular torsion.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (201, 'The folly of man.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (153, 'The KKK.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (241, 'The taint; the grundle; the fleshy fun-bridge.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (237, 'Saxophone solos.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (200, 'That thing that electrocutes your abs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (176, 'Oversized lollipops.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (161, 'Friends with benefits.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (137, 'Teaching a robot to love.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (205, 'Me time.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (250, 'The heart of a child.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (252, 'Smallpox blankets.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (127, 'Yeast.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (214, 'Full frontal nudity.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (175, 'Authentic Mexican cuisine.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (253, 'Licking things to claim them as your own.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (174, 'Genghis Khan.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (209, 'The hardworking Mexican.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (189, 'RoboCop.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (112, 'Spontaneous human combustion.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (128, 'Natural selection.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (245, 'A good sniff.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (212, 'Nipple blades.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (126, 'Leaving an awkward voicemail.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (213, 'Assless chaps.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (191, 'Sweet, sweet vengeance.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (243, 'Keg stands.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (232, 'Darth Vader.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (114, 'Necrophilia.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (144, 'Toni Morrison''s vagina.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (159, 'Preteens.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (185, 'A cooler full of organs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (178, 'Keanu Reeves.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (166, 'A thermonuclear detonation.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (186, 'A moment of silence.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (142, 'Catapults.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (118, 'Emotions.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (151, 'Balls.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (234, 'Homeless people.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (173, 'Old-people smell.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (117, 'Farting and walking away.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (206, 'The inevitable heat death of the universe.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (24, 'The Rev. Dr. Martin Luther King, Jr.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (136, 'Sperm whales.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (204, 'A murder most foul.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (208, 'Daddy issues.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (199, 'Britney Spears at 55.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (210, 'Natalie Portman.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (223, 'The Holy Bible.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (229, 'Hot Pockets�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (220, 'Pulling out.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (163, 'Pixelated bukkake.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (168, 'Waiting ''til marriage.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (235, 'The World of Warcraft.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (116, 'Global warming.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (224, 'World peace.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (170, 'A can of whoop-ass.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (148, 'A zesty breakfast burrito.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (221, 'Picking up girls at the abortion clinic.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (146, 'Land mines.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (113, 'College.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (228, 'A time travel paradox.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (155, 'Seppuku.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (211, 'Waking up half-naked in a Denny''s parking lot.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (149, 'Christopher Walken.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (236, 'Gloryholes.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (169, 'A tiny horse.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (184, 'Child abuse.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (219, 'Menstruation.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (135, 'A sassy black woman.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (162, 'Re-gifting.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (122, 'Penis envy.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (179, 'Drinking alone.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (215, 'Hulk Hogan.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (145, 'Five-Dollar Footlongs�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (140, 'Whipping it out.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (171, 'Dental dams.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (157, 'Gandhi.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (239, 'God.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (150, 'Friction.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (147, 'A sea of troubles.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (197, 'Poor people.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (183, 'Flesh-eating bacteria.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (125, 'Dick Cheney.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (246, 'Lockjaw.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (165, 'Take-backsies.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (132, 'Opposable thumbs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (222, 'The homosexual agenda.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (202, 'Fiery poops.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (203, 'Cards Against Humanity.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (192, 'Fancy Feast�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (238, 'Sean Connery.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (227, 'The milk man.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (115, 'The Chinese gymnastics team.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (231, 'Eating the last known bison.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (134, 'Soiling oneself.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (182, 'Giving 110%.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (242, 'Friendly fire.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (111, 'Count Chocula.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (172, 'Feeding Rosie O''Donnell.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (251, 'Seduction.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (194, 'Being a motherfucking sorcerer.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (264, 'Eastern European Turbo-Folk music.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (273, 'Douchebags on their iPhones.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (281, 'The deformed.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (285, 'Donald Trump.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (288, 'This answer is postmodern.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (301, 'African children.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (307, 'Have some more kugel.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (310, 'Crippling debt.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (313, 'Shorties and blunts.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (328, '(I am doing Kegels right now.)', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (331, 'Bestiality.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (333, 'Drum circles.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (338, 'Inappropriate yelling.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (341, 'The Thong Song.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (342, 'A vajazzled vagina.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (350, 'Sobbing into a Hungry-Man� Frozen Dinner.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (353, 'Ring Pops�.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (363, 'Tiger Woods.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (371, 'PCP.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (383, 'Mr. Snuffleupagus.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (394, 'A disappointing birthday party.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (319, 'Puppies!', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (308, 'A windmill full of corpses.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (340, 'Being on fire.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (372, 'A lifetime of sadness.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (258, 'Pterodactyl eggs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (289, 'Crumpets with the Queen.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (344, 'Exchanging pleasantries.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (276, 'Republicans.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (321, 'Kim Jong-il.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (366, 'Glenn Beck being harried by a swarm of buzzards.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (254, 'A salty surprise.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (330, 'The Jews.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (324, 'Incest.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (284, 'The �bermensch.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (391, 'Nazis.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (292, 'Repression.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (287, 'Attitude.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (361, 'Passable transvestites.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (395, 'Puberty.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (374, 'Swooping.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (311, 'Adderall�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (379, 'A look-see.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (348, 'Lactation.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (266, 'Pabst Blue Ribbon.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (357, 'The gays.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (278, 'A foul mouth.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (377, 'A hot mess.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (268, 'My collection of high-tech sex toys.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (318, 'Bees?', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (388, 'Getting drunk on mouthwash.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (277, 'The glass ceiling.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (286, 'Sarah Palin.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (291, 'Team-building exercises.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (290, 'Frolicking.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (380, 'Not giving a shit about the Third World.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (345, 'My relationship status.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (384, 'Barack Obama.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (302, 'Mouth herpes.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (386, 'Wiping her butt.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (263, 'Pedophiles.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (373, 'Doin'' it in the butt.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (347, 'Being fabulous.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (389, 'An M. Night Shyamalan plot twist.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (294, 'A bag of magic beans.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (296, 'Dead parents.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (257, 'My sex life.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (343, 'Riding off into the sunset.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (364, 'Dick fingers.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (362, 'The Virginia Tech Massacre.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (387, 'Queefing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (339, 'Tangled Slinkys.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (337, 'Civilian casualties.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (316, 'Leprosy.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (325, 'Grave robbing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (376, 'Tentacle porn.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (304, 'Bill Nye the Science Guy.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (370, 'New Age music.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (261, '72 virgins.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (322, 'Hope.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (314, 'Passing a kidney stone.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (299, 'A mime having a stroke.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (368, 'Classist undertones.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (298, 'A mating display.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (382, 'The Kool-Aid Man.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (349, 'Not reciprocating oral sex.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (352, 'Date rape.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (306, 'Italians.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (256, 'My soul.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (354, 'GoGurt�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (312, 'A stray pube.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (279, 'Jerking off into a pool of children''s tears.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (280, 'Getting really high.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (378, 'Too much hair gel.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (303, 'Overcompensation.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (272, 'Free samples.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (346, 'Shaquille O''Neal''s acting career.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (271, 'Half-assed foreplay.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (283, 'Explosions.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (392, 'White privilege.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (293, 'Road head.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (255, 'Poorly-timed Holocaust jokes.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (323, '8 oz. of sweet Mexican black-tar heroin.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (355, 'Judge Judy.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (259, 'Altar boys.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (358, 'Scientology.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (329, 'Justin Bieber.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (327, 'Alcoholism.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (351, 'My genitals.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (332, 'Winking at old people.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (385, 'Golden showers.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (365, 'Racism.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (336, 'Auschwitz.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (262, 'Raping and pillaging.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (334, 'Kids with ass cancer.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (274, 'Hurricane Katrina.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (356, 'Lumberjack fantasies.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (381, 'American Gladiators.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (295, 'An asymmetric boob job.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (326, 'Asians who aren''t good at math.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (335, 'Loose lips.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (270, 'The Blood of Christ.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (317, 'A brain tumor.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (315, 'Prancing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (375, 'The Hamburglar.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (360, 'Police brutality.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (260, 'Forgetting the Alamo.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (369, 'Booby-trapping the house to foil burglars.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (359, 'Estrogen.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (390, 'A robust mongoloid.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (309, 'Her Royal Highness, Queen Elizabeth II.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (193, 'Pooping back and forth. Forever.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (320, 'Cockfights.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (305, 'Bitches.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (300, 'Stephen Hawking talking dirty.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (403, 'Those times when you get sand in your vagina.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (424, 'Faith healing.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (428, 'Impotence.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (454, 'Bananas in Pajamas.', NULL, true, false, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (399, 'Getting so angry that you pop a boner.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (414, 'Tasteful sideboob.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (396, 'Two midgets shitting into a bucket.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (406, 'Racially-biased SAT questions.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (449, 'Glenn Beck catching his scrotum on a curtain hook.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (398, 'The forbidden fruit.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (459, 'Anal beads.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (367, 'Surprise sex!', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (426, 'Dead babies.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (129, 'Masturbation.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (452, 'The Hustle.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (404, 'A Super Soaker� full of cat pee.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (409, 'Obesity.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (429, 'Child beauty pageants.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (422, 'Goats eating coins.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (457, 'Kamikaze pilots.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (443, 'Powerful thighs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (450, 'A big hoopla about nothing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (433, 'Women''s suffrage.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (442, 'John Wilkes Booth.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (425, 'Parting the Red Sea.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (435, 'Harry Potter erotica.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (416, 'Grandma.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (407, 'Porn stars.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (423, 'A monkey smoking a cigar.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (439, 'Mathletes.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (437, 'Lance Armstrong''s missing testicle.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (434, 'Children on leashes.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (445, 'Multiple stab wounds.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (411, 'Oompa-Loompas.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (451, 'Peeing a little bit.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (421, 'The miracle of childbirth.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (448, 'Another goddamn vampire movie.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (460, 'The Make-A-Wish� Foundation.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (455, 'Active listening.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (402, 'A gassy antelope.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (412, 'BATMAN!!!', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (413, 'Black people.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (447, 'Serfdom.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (440, 'Lunchables�.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (418, 'The Trail of Tears.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (453, 'Ghosts.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (436, 'The Dance of the Sugar Plum Fairy.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (420, 'Finger painting.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (249, 'Robert Downey, Jr.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (405, 'Muhammed (Praise Be Unto Him).', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (419, 'Famine.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (431, 'AXE Body Spray.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (458, 'The Force.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (446, 'Cybernetic enhancements.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (444, 'Mr. Clean, right behind you.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (401, 'Third base.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (438, 'Dwarf tossing.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (408, 'A fetus.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (441, 'Women in yogurt commercials.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (417, 'Copping a feel.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (400, 'Sexual tension.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (456, 'Dry heaving.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (430, 'Centaurs.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (397, 'Wifely duties.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (415, 'Hot people.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (432, 'Kanye West.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (427, 'The Amish.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (410, 'When you fart and a little bit comes out.', NULL, true, true, NULL);
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1084, 'Bosnian chicken farmers.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1085, 'Nubile slave boys.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1086, 'Carnies.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1087, 'Coughing into a vagina.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1088, 'Suicidal thoughts.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1089, 'Dancing with a broom.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1090, 'Deflowering the princess.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1091, 'Dorito breath.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1092, 'Eating an albino.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1093, 'Enormous Scandinavian women.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1094, 'Fabricating statistics.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1095, 'Finding a skeleton.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1096, 'Gandalf.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1097, 'Genetically engineered super-soldiers.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1098, 'George Clooney''s musk.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1099, 'Getting abducted by Peter Pan.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1100, 'Getting in her pants, politely.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1101, 'Gladiatorial combat.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1102, 'Good grammar.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1103, 'Hipsters.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1104, 'Historical revisionism.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1105, 'Insatiable bloodlust.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1106, 'Jafar.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1107, 'Jean-Claude Van Damme.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1108, 'Just the tip.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1109, 'Mad hacky-sack skills.', NULL, false, false, 'X1');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1224, 'Beefin'' over turf.', NULL, false, false, 'X2');
INSERT INTO white_cards (id, text, creator, in_v1, in_v2, watermark) VALUES (1225, 'A squadron of moles wearing aviator goggles.', NULL, false, false, 'X2');


--
-- TOC entry 1804 (class 2606 OID 16425)
-- Dependencies: 140 140
-- Name: black_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: cah; Tablespace: 
--

ALTER TABLE ONLY black_cards
    ADD CONSTRAINT black_cards_pkey PRIMARY KEY (id);


--
-- TOC entry 1806 (class 2606 OID 16427)
-- Dependencies: 140 140
-- Name: black_cards_text_key; Type: CONSTRAINT; Schema: public; Owner: cah; Tablespace: 
--

ALTER TABLE ONLY black_cards
    ADD CONSTRAINT black_cards_text_key UNIQUE (text);


--
-- TOC entry 1814 (class 2606 OID 16506)
-- Dependencies: 149 149 149
-- Name: card_set_black_card_pkey; Type: CONSTRAINT; Schema: public; Owner: cah; Tablespace: 
--

ALTER TABLE ONLY card_set_black_card
    ADD CONSTRAINT card_set_black_card_pkey PRIMARY KEY (card_set_id, black_card_id);


--
-- TOC entry 1812 (class 2606 OID 16501)
-- Dependencies: 148 148
-- Name: card_set_pkey; Type: CONSTRAINT; Schema: public; Owner: cah; Tablespace: 
--

ALTER TABLE ONLY card_set
    ADD CONSTRAINT card_set_pkey PRIMARY KEY (id);


--
-- TOC entry 1816 (class 2606 OID 16511)
-- Dependencies: 150 150 150
-- Name: card_set_white_card_pkey; Type: CONSTRAINT; Schema: public; Owner: cah; Tablespace: 
--

ALTER TABLE ONLY card_set_white_card
    ADD CONSTRAINT card_set_white_card_pkey PRIMARY KEY (card_set_id, white_card_id);


--
-- TOC entry 1808 (class 2606 OID 16431)
-- Dependencies: 146 146
-- Name: white_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: cah; Tablespace: 
--

ALTER TABLE ONLY white_cards
    ADD CONSTRAINT white_cards_pkey PRIMARY KEY (id);


--
-- TOC entry 1810 (class 2606 OID 16433)
-- Dependencies: 146 146
-- Name: white_cards_text_key; Type: CONSTRAINT; Schema: public; Owner: cah; Tablespace: 
--

ALTER TABLE ONLY white_cards
    ADD CONSTRAINT white_cards_text_key UNIQUE (text);


--
-- TOC entry 1818 (class 2606 OID 16517)
-- Dependencies: 1803 149 140
-- Name: fk513da45c997611f9; Type: FK CONSTRAINT; Schema: public; Owner: cah
--

ALTER TABLE ONLY card_set_black_card
    ADD CONSTRAINT fk513da45c997611f9 FOREIGN KEY (black_card_id) REFERENCES black_cards(id);


--
-- TOC entry 1817 (class 2606 OID 16512)
-- Dependencies: 148 149 1811
-- Name: fk513da45cb2505f39; Type: FK CONSTRAINT; Schema: public; Owner: cah
--

ALTER TABLE ONLY card_set_black_card
    ADD CONSTRAINT fk513da45cb2505f39 FOREIGN KEY (card_set_id) REFERENCES card_set(id);


--
-- TOC entry 1819 (class 2606 OID 16522)
-- Dependencies: 148 1811 150
-- Name: fkc2487272b2505f39; Type: FK CONSTRAINT; Schema: public; Owner: cah
--

ALTER TABLE ONLY card_set_white_card
    ADD CONSTRAINT fkc2487272b2505f39 FOREIGN KEY (card_set_id) REFERENCES card_set(id);


--
-- TOC entry 1820 (class 2606 OID 16527)
-- Dependencies: 150 1807 146
-- Name: fkc2487272bfd29b4d; Type: FK CONSTRAINT; Schema: public; Owner: cah
--

ALTER TABLE ONLY card_set_white_card
    ADD CONSTRAINT fkc2487272bfd29b4d FOREIGN KEY (white_card_id) REFERENCES white_cards(id);


-- Completed on 2012-09-25 18:35:35

--
-- PostgreSQL database dump complete
--

