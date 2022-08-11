--
-- PostgreSQL database dump
--

-- Dumped from database version 10.21 (Ubuntu 10.21-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.21 (Ubuntu 10.21-0ubuntu0.18.04.1)

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO jenkins;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO jenkins;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO jenkins;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO jenkins;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO jenkins;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO jenkins;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO jenkins;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO jenkins;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO jenkins;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    content text,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    commentable_type character varying NOT NULL,
    commentable_id bigint NOT NULL,
    parent_id integer,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    depth integer DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.comments OWNER TO jenkins;

--
-- Name: TABLE comments; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON TABLE public.comments IS 'Комментарии пользователей к делам';


--
-- Name: COLUMN comments.content; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.comments.content IS 'Содержимое комментария';


--
-- Name: COLUMN comments.parent_id; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.comments.parent_id IS 'ссылка на родительский комментарий';


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO jenkins;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying,
    content text,
    done boolean DEFAULT false,
    finished_at timestamp without time zone,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO jenkins;

--
-- Name: TABLE events; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON TABLE public.events IS 'Список дел';


--
-- Name: COLUMN events.name; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.events.name IS 'Заголовок';


--
-- Name: COLUMN events.content; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.events.content IS 'Детальное описание';


--
-- Name: COLUMN events.done; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.events.done IS 'Статус: завершено (true), или нет (false)';


--
-- Name: COLUMN events.finished_at; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.events.finished_at IS 'Дата и время завершения дела';


--
-- Name: COLUMN events.user_id; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.events.user_id IS 'Внешний ключ для связи с таблицей users';


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO jenkins;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    name character varying,
    done boolean DEFAULT false,
    finished_at timestamp without time zone,
    event_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.items OWNER TO jenkins;

--
-- Name: TABLE items; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON TABLE public.items IS 'Подпункты дела';


--
-- Name: COLUMN items.name; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.items.name IS 'Заголовок';


--
-- Name: COLUMN items.done; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.items.done IS 'Статус: завершено (true), или нет (false)';


--
-- Name: COLUMN items.finished_at; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.items.finished_at IS 'Дата и время завершения подпункта';


--
-- Name: COLUMN items.event_id; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.items.event_id IS 'Внешний ключ для связи с таблицей events';


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO jenkins;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO jenkins;

--
-- Name: TABLE roles; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON TABLE public.roles IS 'Роли пользователя';


--
-- Name: COLUMN roles.name; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.roles.name IS 'Заголовок';


--
-- Name: COLUMN roles.code; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.roles.code IS 'Псевдоним';


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO jenkins;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO jenkins;

--
-- Name: traffic_lights; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.traffic_lights (
    id bigint NOT NULL,
    address character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    state integer,
    active boolean DEFAULT true
);


ALTER TABLE public.traffic_lights OWNER TO jenkins;

--
-- Name: TABLE traffic_lights; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON TABLE public.traffic_lights IS 'Светофоры города';


--
-- Name: COLUMN traffic_lights.address; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.traffic_lights.address IS 'Адрес';


--
-- Name: COLUMN traffic_lights.state; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.traffic_lights.state IS 'Состояния AASM: красный 0, желтый 10, зеленый 20';


--
-- Name: COLUMN traffic_lights.active; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.traffic_lights.active IS 'true - включен, false - выключен';


--
-- Name: traffic_lights_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.traffic_lights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.traffic_lights_id_seq OWNER TO jenkins;

--
-- Name: traffic_lights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.traffic_lights_id_seq OWNED BY public.traffic_lights.id;


--
-- Name: tree_comments; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.tree_comments (
    id bigint NOT NULL,
    parent_id integer,
    child_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tree_comments OWNER TO jenkins;

--
-- Name: TABLE tree_comments; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON TABLE public.tree_comments IS 'Таблица замыканиий для комментариев';


--
-- Name: tree_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.tree_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tree_comments_id_seq OWNER TO jenkins;

--
-- Name: tree_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.tree_comments_id_seq OWNED BY public.tree_comments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jenkins
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    role_id integer,
    events_count integer DEFAULT 0,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying
);


ALTER TABLE public.users OWNER TO jenkins;

--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON TABLE public.users IS 'Пользователи системы';


--
-- Name: COLUMN users.name; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.users.name IS 'Имя пользователя';


--
-- Name: COLUMN users.email; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.users.email IS 'Электронный адрес пользователя';


--
-- Name: COLUMN users.active; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.users.active IS 'пользователь активен (true) или забанен (false)';


--
-- Name: COLUMN users.role_id; Type: COMMENT; Schema: public; Owner: jenkins
--

COMMENT ON COLUMN public.users.role_id IS 'Роль пользователя';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jenkins
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jenkins;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jenkins
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: traffic_lights id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.traffic_lights ALTER COLUMN id SET DEFAULT nextval('public.traffic_lights_id_seq'::regclass);


--
-- Name: tree_comments id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.tree_comments ALTER COLUMN id SET DEFAULT nextval('public.tree_comments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	test	2022-08-04 18:33:09.748244	2022-08-04 18:33:09.748244
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.comments (id, content, user_id, created_at, updated_at, commentable_type, commentable_id, parent_id, lft, rgt, depth, children_count) FROM stdin;
10	Neque facilis magni doloribus deleniti praesentium placeat consequatur. Fuga doloribus nihil voluptatum doloremque earum tempora a. Eos earum repellendus eum at asperiores.	5	2022-08-04 18:33:20.081344	2022-08-04 18:33:20.085552	Event	2	6	18	19	1	0
2	Possimus inventore ab ut voluptatum molestias. Culpa placeat quos porro ducimus tempore. Enim harum minima ab dolore. Officiis facilis nam numquam mollitia dolorum voluptate.	9	2022-08-04 18:33:19.964726	2022-08-04 18:33:19.969517	Event	1	1	2	3	1	0
7	Necessitatibus ut laborum sint consequuntur quis odio. Laudantium reprehenderit officia dolorum iste. Soluta ratione quis maxime atque sed sint.	3	2022-08-04 18:33:20.034883	2022-08-04 18:33:20.040554	Event	2	6	12	13	1	0
11	Tempore occaecati optio ipsa laborum eaque doloremque deleniti non. Temporibus officiis quasi consequatur at similique minima quod unde. Occaecati eaque fugit dicta totam. Assumenda quam commodi sint excepturi rem alias a sed. Labore laudantium provident animi necessitatibus.	3	2022-08-04 18:33:20.113414	2022-08-04 18:33:20.28295	Event	3	\N	21	30	0	0
3	Doloremque sequi ipsum culpa adipisci maxime perspiciatis ut. Illum doloribus culpa facere eum molestiae. Accusantium veniam cum ipsa quos. Molestiae aliquam sunt facilis illum.	6	2022-08-04 18:33:19.979731	2022-08-04 18:33:19.99827	Event	1	1	4	7	1	0
4	Vero fugiat distinctio iste consequatur fugit earum illo. Tempore rem quam veniam ab quidem autem architecto. Labore sint fugit a officiis numquam mollitia dolore.	8	2022-08-04 18:33:19.993808	2022-08-04 18:33:19.99827	Event	1	3	5	6	2	0
1	Corporis rem consectetur odio animi id. Quaerat facere consectetur quia tenetur reprehenderit laboriosam soluta. Nemo quasi laboriosam quam ex. Expedita possimus mollitia eligendi praesentium facere corrupti distinctio ipsam.	4	2022-08-04 18:33:19.952238	2022-08-04 18:33:20.012262	Event	1	\N	1	10	0	0
13	Harum corrupti dolorum in amet. Commodi quasi esse doloremque fugit distinctio. Dolor voluptatem maxime modi saepe atque veniam. Nam excepturi quod debitis consequatur numquam perspiciatis sit a.	7	2022-08-04 18:33:20.213062	2022-08-04 18:33:20.265294	Event	3	11	24	27	1	0
8	Neque aliquam possimus aperiam sed iste in. Vero quae qui illum incidunt mollitia cum rerum aliquid. Quam unde pariatur officia quas ab culpa illum odio. Totam eum distinctio accusantium non officia.	10	2022-08-04 18:33:20.053225	2022-08-04 18:33:20.072355	Event	2	6	14	17	1	0
5	Recusandae ad dolorem alias aliquam. Consectetur esse accusamus ipsum consequuntur reiciendis alias id asperiores. Natus deserunt consequatur modi dolorum.	9	2022-08-04 18:33:20.007612	2022-08-04 18:33:20.012262	Event	1	1	8	9	1	0
17	Aut laboriosam ipsa sequi soluta ex quidem inventore. Ipsam esse illum ut recusandae deleniti praesentium. Reprehenderit magnam totam ullam architecto officiis sunt voluptatibus. Eos eum cupiditate alias at explicabo modi.	6	2022-08-04 18:33:20.302381	2022-08-04 18:33:20.306884	Event	4	16	32	33	1	0
12	Odio beatae animi sapiente optio pariatur ipsum numquam expedita. Ipsum dignissimos aspernatur inventore sint. Tempora exercitationem numquam vitae reprehenderit. Amet molestiae facilis incidunt rerum voluptas iste eaque architecto.	2	2022-08-04 18:33:20.15109	2022-08-04 18:33:20.172575	Event	3	11	22	23	1	0
9	Quo illum sed minus velit ducimus accusamus illo. Culpa dolorem modi ea ipsum neque. Voluptatem illo odit tempora nihil cum.	6	2022-08-04 18:33:20.068312	2022-08-04 18:33:20.072355	Event	2	8	15	16	2	0
6	Veniam modi sint voluptatum autem corrupti eaque consequatur neque. Perferendis veritatis amet ab enim consequatur. Voluptas minus sed totam modi eum. Id laboriosam ipsa itaque qui voluptates velit maiores eveniet. Ipsa sapiente fugit quidem officia.	3	2022-08-04 18:33:20.024216	2022-08-04 18:33:20.085552	Event	2	\N	11	20	0	0
15	Temporibus et minus est distinctio modi ea esse. Excepturi pariatur voluptate error tempore unde molestias nostrum doloribus. Reprehenderit ratione quibusdam quo eaque quia id.	10	2022-08-04 18:33:20.277093	2022-08-04 18:33:20.28295	Event	3	11	28	29	1	0
16	Delectus sapiente laboriosam odio architecto velit. Soluta ipsam occaecati fugit neque eum. Perspiciatis totam adipisci sapiente in a eos. Culpa ullam officiis quisquam quia sit magnam.	6	2022-08-04 18:33:20.295452	2022-08-04 18:33:20.348468	Event	4	\N	31	40	0	0
14	Minima ex facilis ipsam asperiores deleniti blanditiis. Voluptates hic magni facilis veniam molestias nemo blanditiis natus. Provident iste eaque facilis tenetur ab expedita enim. Necessitatibus aliquam velit cupiditate dicta. Quia culpa quisquam ipsa vero vitae quam.	8	2022-08-04 18:33:20.261147	2022-08-04 18:33:20.265294	Event	3	13	25	26	2	0
19	In quas ducimus aliquam temporibus ullam earum. Necessitatibus quae sed officia molestiae numquam reprehenderit corporis. Aperiam occaecati consequatur maiores nam dolor error incidunt.	8	2022-08-04 18:33:20.330032	2022-08-04 18:33:20.334567	Event	4	18	35	36	2	0
18	Eligendi veritatis facilis in placeat. Excepturi sint magnam itaque dicta. Pariatur voluptatum dolor alias placeat ducimus quo tenetur.	8	2022-08-04 18:33:20.316247	2022-08-04 18:33:20.334567	Event	4	16	34	37	1	0
20	Iure pariatur maiores nam eos labore veritatis harum dicta. Praesentium perferendis perspiciatis possimus sapiente unde accusamus consectetur qui. Exercitationem fuga numquam eos animi voluptates molestias dolorum blanditiis. Eaque ratione nesciunt aut a voluptatum voluptas dolor.	6	2022-08-04 18:33:20.343873	2022-08-04 18:33:20.348468	Event	4	16	38	39	1	0
21	Debitis harum dolorem iusto error nulla omnis. Dolore saepe nostrum placeat magni laboriosam maiores voluptate debitis. Consectetur porro a exercitationem dolorum quia ducimus culpa.	8	2022-08-04 18:33:20.356314	2022-08-04 18:33:20.406014	Event	5	\N	41	50	0	0
22	Ipsam voluptatibus perferendis fugit iusto ratione quo. Error recusandae dolorem aspernatur molestiae quia ratione. Earum tenetur iste delectus nobis expedita eius.	3	2022-08-04 18:33:20.362411	2022-08-04 18:33:20.366048	Event	5	21	42	43	1	0
23	Modi vitae exercitationem ducimus laudantium in harum culpa. Voluptatem quod fugit optio similique dolore consequatur. Possimus corporis accusantium vero unde ratione deserunt doloremque. Nobis doloremque eum quas ratione.	2	2022-08-04 18:33:20.374832	2022-08-04 18:33:20.392301	Event	5	21	44	47	1	0
29	Aliquam tempora autem magni voluptatum officia quidem. Ab ducimus a occaecati modi quam. Iusto occaecati sint fuga id. Qui sed tempore consequatur deleniti deserunt rerum ipsam distinctio.	7	2022-08-04 18:33:20.451593	2022-08-04 18:33:20.455612	Event	6	28	55	56	2	0
24	Nesciunt architecto nulla incidunt ipsa quis quisquam voluptatem sapiente. Distinctio libero minima consequatur quod. Architecto maiores ullam et eveniet fuga earum.	2	2022-08-04 18:33:20.388416	2022-08-04 18:33:20.392301	Event	5	23	45	46	2	0
99	Eligendi molestiae velit dolorum consequatur porro ex nulla. Veniam accusamus inventore cumque mollitia tempore. Autem placeat voluptate earum voluptatem. Sint libero perspiciatis vel saepe labore repudiandae ut. Quod adipisci facilis aperiam odit odio commodi doloremque.	7	2022-08-04 18:33:21.231091	2022-08-04 18:33:21.23447	Event	20	98	195	196	2	0
25	Dolor debitis voluptas amet cum error. Consequuntur officiis optio quam officia expedita earum ipsa. Numquam animi illo nostrum inventore sapiente. Iure a laborum magni reprehenderit culpa vero dolorem ea. Dicta enim sequi eos delectus in atque illo.	2	2022-08-04 18:33:20.401645	2022-08-04 18:33:20.406014	Event	5	21	48	49	1	0
26	Similique quisquam ipsa nam occaecati consequuntur. Ex doloremque incidunt minus dolorum vero cum. Accusamus cumque fugit similique delectus dolorem illo exercitationem.	10	2022-08-04 18:33:20.414832	2022-08-04 18:33:20.469697	Event	6	\N	51	60	0	0
35	Quo corporis velit id est rerum eos itaque. Culpa quia pariatur dolores est. Totam dolorem culpa odit magni laudantium dignissimos reprehenderit autem. Aliquid architecto culpa nisi vero rem veritatis. Consequatur assumenda placeat voluptatem expedita maiores exercitationem ipsum.	6	2022-08-04 18:33:20.525525	2022-08-04 18:33:20.529286	Event	7	31	68	69	1	0
30	Repellendus culpa totam eum facilis iusto necessitatibus. Ipsum sunt quos vel nesciunt facilis eos molestiae ea. Quam quas placeat iste cum. Sapiente omnis eos soluta aspernatur.	7	2022-08-04 18:33:20.464783	2022-08-04 18:33:20.469697	Event	6	26	58	59	1	0
27	Dolore consectetur corrupti ea fuga itaque pariatur iste sit. Corporis laboriosam fugiat voluptatum est exercitationem. Assumenda expedita esse molestias debitis.	10	2022-08-04 18:33:20.420996	2022-08-04 18:33:20.425037	Event	6	26	52	53	1	0
37	Quidem harum eaque provident rerum architecto neque. Repudiandae amet laborum enim ducimus non. Adipisci porro ratione molestiae nulla vel. Corporis nemo recusandae ad vero praesentium ab.	11	2022-08-04 18:33:20.544818	2022-08-04 18:33:20.549535	Event	8	36	72	73	1	0
28	Nulla qui minima inventore nam. Voluptas modi laboriosam cum consectetur nobis. Laborum alias numquam animi voluptates exercitationem accusantium fugiat. Quibusdam error vitae quod voluptates dolorum qui cupiditate iste.	8	2022-08-04 18:33:20.438556	2022-08-04 18:33:20.455612	Event	6	26	54	57	1	0
33	Ratione ab dolor nesciunt libero eos. Animi dignissimos quasi maxime quisquam iure. Explicabo ea quas placeat accusamus aperiam eveniet. Voluptate at tenetur dolor veritatis animi expedita laborum minima.	2	2022-08-04 18:33:20.499325	2022-08-04 18:33:20.517668	Event	7	31	64	67	1	0
38	Reprehenderit tempore corrupti dolores velit neque. Eveniet dolores corrupti magni velit accusamus hic corporis quam. A fugit nam sed incidunt libero. Ad similique libero omnis autem quas harum pariatur consectetur. Tempore aperiam eligendi nobis omnis eveniet.	2	2022-08-04 18:33:20.558161	2022-08-04 18:33:20.573679	Event	8	36	74	77	1	0
32	Consequatur atque eligendi impedit incidunt numquam saepe odio. Mollitia accusantium recusandae amet ea sapiente. Beatae rem odio quasi quo eveniet. Occaecati cupiditate veniam sit illo deserunt.	11	2022-08-04 18:33:20.486594	2022-08-04 18:33:20.490788	Event	7	31	62	63	1	0
34	Molestiae vel natus necessitatibus debitis architecto nobis. Fugit tempore earum non nemo. Assumenda fugit tempora quo fuga corporis ex reprehenderit quidem.	11	2022-08-04 18:33:20.513268	2022-08-04 18:33:20.517668	Event	7	33	65	66	2	0
31	Dolores odit voluptatibus quaerat facere saepe consequuntur sit. Occaecati maiores blanditiis consequuntur magni similique nesciunt. Architecto natus explicabo quos eius neque ullam est ad. Qui quisquam consequuntur eos sed fuga. Officia quidem corporis excepturi at molestias.	4	2022-08-04 18:33:20.479123	2022-08-04 18:33:20.529286	Event	7	\N	61	70	0	0
39	Ea itaque distinctio sunt minima. Expedita similique atque eligendi natus possimus voluptate ullam nam. Dolorum aliquid ut reprehenderit quod odit aspernatur voluptas. Amet autem quaerat iusto distinctio reprehenderit quae quos ratione.	11	2022-08-04 18:33:20.570139	2022-08-04 18:33:20.573679	Event	8	38	75	76	2	0
98	Incidunt vitae provident officia velit sequi corporis modi. Illo facere ipsum consequatur perspiciatis. Omnis quisquam beatae enim id cum voluptatem fugit ipsa.	5	2022-08-04 18:33:21.219812	2022-08-04 18:33:21.23447	Event	20	96	194	197	1	0
100	Ad quasi nihil rerum illum quia qui at exercitationem. Minus perspiciatis labore aspernatur reprehenderit ullam. Dolores expedita nulla nam eum distinctio nihil neque. Eaque autem vel quibusdam qui minima veniam atque. Ab excepturi corrupti iste quisquam.	11	2022-08-04 18:33:21.243337	2022-08-04 18:33:21.247259	Event	20	96	198	199	1	0
36	Exercitationem praesentium beatae ad sapiente eveniet veritatis dolorum dignissimos. Minus perferendis saepe harum blanditiis. Similique tenetur quibusdam esse aperiam nisi. Nihil laborum perferendis officiis velit illum. Voluptate quidem eveniet animi reiciendis.	6	2022-08-04 18:33:20.537466	2022-08-04 18:33:20.586047	Event	8	\N	71	80	0	0
44	Sequi inventore quis expedita vero distinctio. Totam quae aspernatur dolor est. Esse eum officia deserunt incidunt deleniti maiores.	11	2022-08-04 18:33:20.625308	2022-08-04 18:33:20.628874	Event	9	43	85	86	2	0
40	Amet eum eligendi maiores itaque. Reprehenderit odio rem laborum porro incidunt veniam officia dicta. Reprehenderit illum totam fuga provident. Iste quisquam tempora ipsa officia fugit.	4	2022-08-04 18:33:20.58166	2022-08-04 18:33:20.586047	Event	8	36	78	79	1	0
50	Nesciunt optio illum doloribus accusantium atque. Voluptates impedit sequi excepturi dolore iure. Quod fuga sed quisquam autem occaecati et. Similique ut id beatae blanditiis nostrum exercitationem mollitia dolorem. Harum nobis fugiat tenetur at vitae repudiandae.	11	2022-08-04 18:33:20.695183	2022-08-04 18:33:20.698903	Event	10	46	98	99	1	0
41	Sit minima hic quae repellendus saepe non. Odit earum blanditiis sint incidunt distinctio doloremque quas. Officia beatae qui nesciunt ut tenetur exercitationem non. Perferendis deleniti dicta ratione ab soluta voluptatibus reiciendis. Doloribus culpa illum aliquid dolores ipsam labore.	7	2022-08-04 18:33:20.594645	2022-08-04 18:33:20.640968	Event	9	\N	81	90	0	0
45	Provident earum quasi dolorum quae natus perferendis perspiciatis. Omnis ut pariatur debitis nobis unde cumque nisi placeat. Id ipsum laborum nulla nesciunt. Nemo perferendis officiis culpa ratione expedita fuga.	10	2022-08-04 18:33:20.637238	2022-08-04 18:33:20.640968	Event	9	41	88	89	1	0
42	Nihil doloribus aperiam suscipit quia. Perferendis debitis aspernatur porro minima. Inventore itaque modi magnam quos veritatis asperiores odio.	8	2022-08-04 18:33:20.601422	2022-08-04 18:33:20.605115	Event	9	41	82	83	1	0
43	Eveniet libero deleniti error quibusdam corrupti. Soluta tempora expedita autem fuga maxime dolorum cupiditate. Voluptatem ut ab dolorem optio facilis dolore. Voluptatum amet ex repellat vitae ea numquam id ratione.	3	2022-08-04 18:33:20.613321	2022-08-04 18:33:20.628874	Event	9	41	84	87	1	0
48	Adipisci maxime voluptatum architecto rem voluptas velit. Doloribus cum accusantium deleniti dolor. Quidem nemo maiores voluptatibus alias consequuntur exercitationem placeat.	11	2022-08-04 18:33:20.671818	2022-08-04 18:33:20.687433	Event	10	46	94	97	1	0
54	Odio ipsum ipsam adipisci possimus. Hic enim voluptate quia id pariatur ipsa blanditiis voluptatum. Corrupti iure id non quasi rerum magni fugit.	3	2022-08-04 18:33:20.739004	2022-08-04 18:33:20.74273	Event	11	53	105	106	2	0
55	Neque recusandae iusto facilis tempore esse. Unde officiis odio delectus voluptates enim illo possimus voluptate. Illo mollitia culpa tenetur deleniti commodi accusantium. Praesentium aliquam minima recusandae adipisci porro ratione.	9	2022-08-04 18:33:20.750355	2022-08-04 18:33:20.753632	Event	11	51	108	109	1	0
49	Dicta a rem tempora temporibus debitis earum fuga. Laborum deleniti dolores architecto quam quae. Doloremque dolor ducimus alias possimus corporis saepe ratione. Quia commodi sunt exercitationem dignissimos. Reiciendis porro temporibus occaecati tempora nobis veniam.	11	2022-08-04 18:33:20.684009	2022-08-04 18:33:20.687433	Event	10	48	95	96	2	0
47	Quidem nulla quisquam rem dolor sint saepe nihil. Autem blanditiis consequatur alias eveniet nemo neque repudiandae doloremque. Eum labore exercitationem voluptatibus laudantium ipsa id.	5	2022-08-04 18:33:20.658511	2022-08-04 18:33:20.662626	Event	10	46	92	93	1	0
46	Harum aliquid amet reiciendis deleniti est eveniet minima magni. Accusamus odio blanditiis nisi eligendi iure. Quibusdam excepturi molestias unde est.	2	2022-08-04 18:33:20.650788	2022-08-04 18:33:20.698903	Event	10	\N	91	100	0	0
52	Perferendis aliquam optio iure aut laborum. Eos harum architecto sapiente aliquid nobis omnis nostrum. Magni molestiae recusandae excepturi illo totam doloribus unde veritatis.	8	2022-08-04 18:33:20.713877	2022-08-04 18:33:20.717662	Event	11	51	102	103	1	0
53	Aspernatur laudantium ut quos expedita enim alias corporis. Aut officia sit nisi cupiditate quis vitae. Explicabo suscipit possimus molestias mollitia corporis aliquid aperiam. Repudiandae modi error tempore harum. Excepturi sapiente rem soluta magni architecto quibusdam laborum.	11	2022-08-04 18:33:20.725984	2022-08-04 18:33:20.74273	Event	11	51	104	107	1	0
56	Culpa ipsum est mollitia doloremque. Esse illum debitis molestias nesciunt asperiores veniam facere dignissimos. Ratione ab omnis nesciunt ullam temporibus atque error minus. Doloremque laborum in pariatur iure inventore a. Voluptatem quisquam laudantium voluptas ab deleniti repellat mollitia dolorem.	9	2022-08-04 18:33:20.761227	2022-08-04 18:33:20.808459	Event	12	\N	111	120	0	0
51	Fuga recusandae odit eligendi dolores. Reprehenderit ipsam magni corrupti sed incidunt veniam. Occaecati optio omnis natus eligendi praesentium odit itaque officia. Ut deserunt quasi praesentium tempora maxime officia dicta tempore. Ullam sunt dolores nostrum odio velit est.	3	2022-08-04 18:33:20.708226	2022-08-04 18:33:20.753632	Event	11	\N	101	110	0	0
57	Ab eum a ratione odit perferendis aliquid. Nesciunt itaque officiis necessitatibus quae. Non ut delectus quia fuga distinctio. Distinctio placeat ipsa tempore sunt nulla minima id.	4	2022-08-04 18:33:20.766324	2022-08-04 18:33:20.76972	Event	12	56	112	113	1	0
58	Quam impedit tempore culpa harum. Culpa sunt repudiandae aut sint neque fuga. Adipisci iste nam molestiae architecto. Et esse error eos sit voluptas veniam quo.	10	2022-08-04 18:33:20.777201	2022-08-04 18:33:20.796933	Event	12	56	114	117	1	0
59	Exercitationem nostrum dignissimos vitae impedit sapiente consequatur. Animi voluptatem maxime ab dignissimos minus eos. Tenetur atque veniam veritatis ab provident nihil laboriosam recusandae.	4	2022-08-04 18:33:20.792179	2022-08-04 18:33:20.796933	Event	12	58	115	116	2	0
64	Id debitis et sint corporis. Consectetur corrupti vel quidem dolorum adipisci quae maiores fugiat. Deleniti temporibus natus dolor doloremque id. Dolor possimus cumque aliquid aperiam modi laboriosam.	9	2022-08-04 18:33:20.846767	2022-08-04 18:33:20.850948	Event	13	63	125	126	2	0
60	Placeat adipisci culpa illum maxime nisi alias. Commodi blanditiis esse a consequatur at unde laboriosam. Commodi blanditiis et possimus quibusdam voluptatibus numquam magni. Voluptatem illum dicta nemo eum in commodi. Dolorum tempora quibusdam magnam aliquid mollitia quasi distinctio.	4	2022-08-04 18:33:20.804661	2022-08-04 18:33:20.808459	Event	12	56	118	119	1	0
70	Tenetur veniam iusto fugit dolores occaecati optio assumenda. Voluptate architecto id nulla illo non aut quidem. Dolor cupiditate consequuntur tenetur nam dolorem commodi.	10	2022-08-04 18:33:20.922487	2022-08-04 18:33:20.92636	Event	14	66	138	139	1	0
61	Error esse atque voluptatum provident dignissimos nobis. Ipsum quo vitae veritatis odio voluptatem repudiandae numquam eius. Dolorum illo hic aliquam excepturi ipsa ratione quod.	2	2022-08-04 18:33:20.816738	2022-08-04 18:33:20.863416	Event	13	\N	121	130	0	0
62	Aut perferendis labore pariatur vitae fuga nostrum voluptates. Fugit iure dicta ducimus cumque error doloribus. Quasi et ducimus eaque esse sed. Alias dicta porro quasi quas perferendis placeat mollitia iure.	3	2022-08-04 18:33:20.822791	2022-08-04 18:33:20.826513	Event	13	61	122	123	1	0
65	Doloribus ratione et ipsam voluptates facilis laborum cum. Eligendi similique deleniti modi tenetur enim. Inventore pariatur veritatis dolor officiis debitis illo architecto ipsum. Recusandae animi vitae alias autem voluptate. Repudiandae aperiam accusamus consequatur vitae nostrum necessitatibus suscipit.	10	2022-08-04 18:33:20.859405	2022-08-04 18:33:20.863416	Event	13	61	128	129	1	0
63	Quo fuga deserunt repellendus sed. Minus autem quo pariatur perferendis provident fugiat. Quidem qui dignissimos explicabo a non. Neque deleniti esse vitae occaecati molestiae dicta dignissimos. Error rem nemo cupiditate aspernatur aliquam sequi quis ex.	7	2022-08-04 18:33:20.834617	2022-08-04 18:33:20.850948	Event	13	61	124	127	1	0
71	Voluptate repudiandae nobis pariatur delectus. Incidunt culpa sequi laudantium consectetur est. Voluptate occaecati pariatur magni non repellendus saepe doloremque itaque. Beatae fuga illo totam qui officiis nemo deleniti.	5	2022-08-04 18:33:20.934272	2022-08-04 18:33:20.978096	Event	15	\N	141	150	0	0
68	Id delectus quam laudantium voluptates. Illo asperiores id a debitis perspiciatis. Nostrum vel excepturi laboriosam nobis. Inventore temporibus minus nihil fugiat corporis totam illum.	10	2022-08-04 18:33:20.89186	2022-08-04 18:33:20.913216	Event	14	66	134	137	1	0
74	Quaerat similique dicta beatae dignissimos ipsa accusantium tenetur voluptatem. Recusandae quisquam incidunt accusantium numquam. Incidunt doloremque ut a deleniti eum sit iure distinctio. Eius ut earum aliquid illo nesciunt quae. Exercitationem incidunt veniam alias accusamus mollitia explicabo recusandae.	3	2022-08-04 18:33:20.962199	2022-08-04 18:33:20.965616	Event	15	73	145	146	2	0
67	Iusto officiis veniam labore fugiat et at vel quidem. Eveniet qui doloremque facilis et laudantium amet nulla quidem. Molestias enim sunt quibusdam asperiores maxime. Soluta quo totam distinctio occaecati deleniti dolores.	4	2022-08-04 18:33:20.877394	2022-08-04 18:33:20.881608	Event	14	66	132	133	1	0
69	Rem culpa autem ab dolore. Omnis ipsam esse deleniti inventore quod quis tempora. Sint quibusdam pariatur illo nihil ratione asperiores. Reprehenderit eligendi illo aut vero aperiam provident voluptatem neque. Nulla odio voluptate vel asperiores alias.	2	2022-08-04 18:33:20.906933	2022-08-04 18:33:20.913216	Event	14	68	135	136	2	0
66	Laudantium facere corrupti velit fuga. Aliquid omnis aut facere fugiat corporis sit. Dolorem molestias magni ullam enim voluptas.	4	2022-08-04 18:33:20.871503	2022-08-04 18:33:20.92636	Event	14	\N	131	140	0	0
72	Culpa perspiciatis sed dolorum excepturi quo nulla. Quae molestias occaecati temporibus corrupti. Blanditiis illo aliquid praesentium ratione commodi laudantium.	10	2022-08-04 18:33:20.93998	2022-08-04 18:33:20.943305	Event	15	71	142	143	1	0
73	Iste ullam nesciunt laborum cum quis odio. Maxime sed molestiae laborum voluptatibus ipsum rem non. Et aliquid consequatur est ex numquam. Reprehenderit ipsam fugit numquam quibusdam natus minima. Maiores distinctio sit ex odio.	8	2022-08-04 18:33:20.95084	2022-08-04 18:33:20.965616	Event	15	71	144	147	1	0
75	Iure maiores soluta impedit harum aut. Ratione soluta modi adipisci commodi repudiandae impedit repellendus ipsam. Illo at natus vitae voluptatem. Quisquam reprehenderit cupiditate fuga ipsam deleniti est.	2	2022-08-04 18:33:20.974583	2022-08-04 18:33:20.978096	Event	15	71	148	149	1	0
76	Eveniet inventore nulla sequi delectus adipisci. Excepturi officiis enim necessitatibus nisi culpa sapiente nam aspernatur. Facere incidunt earum doloremque et expedita maiores.	7	2022-08-04 18:33:20.985524	2022-08-04 18:33:21.031481	Event	16	\N	151	160	0	0
77	Ipsam temporibus illum quae impedit. Impedit veniam amet magnam perferendis sapiente suscipit. Laboriosam consectetur dignissimos consequuntur aliquid. Porro maiores minus reiciendis voluptatum fugiat molestias. Molestiae quo voluptate asperiores accusantium eaque quam.	3	2022-08-04 18:33:20.991021	2022-08-04 18:33:20.994717	Event	16	76	152	153	1	0
78	Quibusdam quidem amet incidunt esse at eum facere. Ab iste veritatis dolores rerum quia sapiente fuga ea. Quod laborum porro mollitia tempora explicabo nobis. Alias perferendis recusandae sapiente repellat architecto voluptas dolore.	4	2022-08-04 18:33:21.002299	2022-08-04 18:33:21.017146	Event	16	76	154	157	1	0
79	Officia porro minus itaque reiciendis vero hic. Placeat voluptatibus nisi autem tempora itaque ea quo totam. Omnis illum hic rerum corrupti ipsa accusamus amet. Esse numquam alias ipsum voluptatibus officiis facere. Eveniet delectus ullam soluta optio libero.	7	2022-08-04 18:33:21.013432	2022-08-04 18:33:21.017146	Event	16	78	155	156	2	0
86	Laboriosam voluptatibus eaque eius rerum. Placeat vel fugit ut quia minima. Perferendis blanditiis facere id accusamus consequatur nemo. Sint porro neque rerum fugit consequatur dolor earum. Unde maxime rerum dolorem quas.	7	2022-08-04 18:33:21.092118	2022-08-04 18:33:21.143044	Event	18	\N	171	180	0	0
80	Quam accusantium quod est reprehenderit. Omnis dolorem praesentium soluta quaerat. Consectetur nisi quaerat enim id omnis adipisci corporis. Illum nobis atque earum voluptatem quisquam perspiciatis provident assumenda.	4	2022-08-04 18:33:21.02769	2022-08-04 18:33:21.031481	Event	16	76	158	159	1	0
81	Impedit exercitationem nihil quam eius. Perferendis adipisci explicabo consequuntur et inventore. Dignissimos eligendi facilis iusto tempore deleniti quod sunt. Error ipsam minus laboriosam doloremque velit.	10	2022-08-04 18:33:21.039319	2022-08-04 18:33:21.083649	Event	17	\N	161	170	0	0
93	Nobis repellendus suscipit amet corrupti illum voluptates mollitia officia. Neque commodi reiciendis voluptas nisi explicabo ullam inventore iste. Fuga ducimus et nostrum temporibus neque repudiandae adipisci iusto. Facere minima eaque debitis id optio ducimus ea. Eaque omnis quaerat pariatur consequatur.	3	2022-08-04 18:33:21.166573	2022-08-04 18:33:21.182453	Event	19	91	184	187	1	0
85	Minus est incidunt dolor expedita magni. Voluptatem occaecati quos placeat quam ducimus in necessitatibus nobis. Velit minima voluptates porro repellendus suscipit vitae numquam voluptatibus. Ratione quibusdam enim quo occaecati eligendi. Repudiandae eligendi veritatis ipsa aperiam.	2	2022-08-04 18:33:21.07949	2022-08-04 18:33:21.083649	Event	17	81	168	169	1	0
82	Odio veniam at numquam quidem animi incidunt id voluptate. Voluptas magni explicabo facilis omnis fugit veritatis. Rerum odio voluptate iste asperiores.	4	2022-08-04 18:33:21.0452	2022-08-04 18:33:21.048633	Event	17	81	162	163	1	0
92	Quo sunt nostrum eaque rem odio quaerat quidem. Vel ab asperiores facere iusto error. Aperiam eos tempora blanditiis totam tempore provident. Fugiat nobis natus repellat enim quia minima cupiditate. Adipisci eius veritatis doloribus asperiores optio minus repellat earum.	2	2022-08-04 18:33:21.155844	2022-08-04 18:33:21.159431	Event	19	91	182	183	1	0
88	Nemo dicta hic sunt dolorem aliquid eligendi soluta. Molestias dolore cupiditate aut accusantium architecto quibusdam neque. Ducimus dolore harum expedita nobis dolorem doloremque est mollitia. Possimus recusandae ipsum earum dolor laboriosam. Ad pariatur at deleniti distinctio atque.	3	2022-08-04 18:33:21.110371	2022-08-04 18:33:21.130249	Event	18	86	174	177	1	0
90	Ea nobis eius quibusdam fugiat veniam consectetur consequatur. Voluptatibus quia deserunt esse rem. Voluptate dolores deserunt fugiat earum neque. Aliquam error quisquam architecto debitis porro et natus illum.	4	2022-08-04 18:33:21.139583	2022-08-04 18:33:21.143044	Event	18	86	178	179	1	0
83	Iusto ipsum esse excepturi ut corrupti. Consequuntur facilis quos ratione ex aliquam. Mollitia temporibus nulla similique quasi dolor labore. Veritatis deleniti neque quae itaque animi aliquid repellat accusantium.	3	2022-08-04 18:33:21.056146	2022-08-04 18:33:21.071753	Event	17	81	164	167	1	0
87	Expedita beatae voluptate laborum est. Quidem iusto facere iste consequuntur porro harum nihil mollitia. Consequatur maxime modi dolores recusandae. Itaque adipisci odio labore maxime omnis tenetur est. Dolorum architecto nemo consectetur quaerat sapiente minus.	4	2022-08-04 18:33:21.098437	2022-08-04 18:33:21.102664	Event	18	86	172	173	1	0
84	Vero velit provident ratione quis. Quos ipsum at voluptatibus illo. Saepe repudiandae sit animi repellat nostrum quae harum. Corporis perferendis excepturi architecto reprehenderit ea animi.	4	2022-08-04 18:33:21.067914	2022-08-04 18:33:21.071753	Event	17	83	165	166	2	0
89	Porro soluta assumenda necessitatibus reprehenderit veritatis illo doloremque ad. Dolorum optio id non officiis earum mollitia sit. Dignissimos perferendis a amet pariatur. Voluptatum neque iure tempore sunt. Non illo nostrum fuga quam tempore incidunt neque.	9	2022-08-04 18:33:21.125248	2022-08-04 18:33:21.130249	Event	18	88	175	176	2	0
91	Delectus sunt necessitatibus omnis sapiente explicabo laudantium corrupti. Architecto delectus impedit sit doloribus qui optio dolorum. Quia occaecati vel numquam ipsa ea modi. Alias quos libero aliquam illum laboriosam assumenda ex. Magnam repellat blanditiis accusamus molestiae ut pariatur amet neque.	4	2022-08-04 18:33:21.150429	2022-08-04 18:33:21.194748	Event	19	\N	181	190	0	0
94	Ratione temporibus quis adipisci sapiente hic nam placeat error. Illo nesciunt velit consectetur fuga nobis repudiandae asperiores. Odit sunt libero nobis labore delectus illum ut cumque. Voluptatum consequuntur eum libero qui facere praesentium soluta.	7	2022-08-04 18:33:21.178695	2022-08-04 18:33:21.182453	Event	19	93	185	186	2	0
95	Sint illo veniam vero eos repellendus. Ut necessitatibus optio assumenda laudantium quisquam id nam. Perferendis totam ea iusto minima. Neque laborum quibusdam voluptas occaecati nisi.	5	2022-08-04 18:33:21.190661	2022-08-04 18:33:21.194748	Event	19	91	188	189	1	0
96	Vero nemo totam sequi officiis asperiores animi. Temporibus repellat facilis est dignissimos earum. Illum neque optio est in architecto quo eius modi. Qui corrupti a iste inventore fugiat.	5	2022-08-04 18:33:21.202641	2022-08-04 18:33:21.247259	Event	20	\N	191	200	0	0
97	Eveniet unde repudiandae tempora nihil. Perferendis perspiciatis eveniet quasi quidem. Nesciunt consequatur reiciendis quos iusto repellendus. Laudantium quibusdam necessitatibus quis ipsam qui odio.	6	2022-08-04 18:33:21.207908	2022-08-04 18:33:21.211915	Event	20	96	192	193	1	0
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.events (id, name, content, done, finished_at, user_id, created_at, updated_at) FROM stdin;
4	Ipsum consequuntur earum totam iste suscipit nemo adipisci.	Cum amet quod necessitatibus corrupti. Placeat ullam repudiandae recusandae libero illum. Optio blanditiis dolore iusto ipsum odio incidunt neque veniam. Voluptate sint cum quas perspiciatis quibusdam inventore.	f	\N	2	2022-08-04 18:33:19.155422	2022-08-04 18:33:19.848129
9	Atque molestiae nulla nostrum expedita tempora rem amet.	Rerum voluptatibus nesciunt reprehenderit minima minus accusamus quas. Velit aperiam earum magni qui magnam recusandae perferendis. Molestias accusamus eius omnis quas corrupti.	f	\N	10	2022-08-04 18:33:19.174154	2022-08-04 18:33:19.899229
5	Repudiandae aspernatur possimus pariatur nihil aliquam accusantium.	Sit minus possimus soluta atque id reprehenderit quo. Saepe maiores deleniti iusto dignissimos nam ad. Commodi sapiente animi ducimus ab pariatur eius. Eligendi sed mollitia asperiores eius corporis ipsam numquam. Soluta nostrum illum ipsam aliquid.	f	\N	5	2022-08-04 18:33:19.159606	2022-08-04 18:33:19.823151
6	Commodi facilis quia iusto ab.	Vitae praesentium pariatur maiores magnam sit modi dolorum asperiores. Sunt incidunt veniam quis vero nostrum odio. Voluptate consequuntur explicabo omnis ad aliquam quas.	f	\N	7	2022-08-04 18:33:19.163475	2022-08-04 18:33:19.890496
8	Quam quaerat similique nesciunt consequuntur enim sequi fugit.	Placeat explicabo quisquam veritatis numquam deleniti et. Omnis deserunt soluta eum ex nemo facilis blanditiis. Ut cum illum explicabo inventore ratione.	f	\N	6	2022-08-04 18:33:19.171011	2022-08-04 18:33:19.859797
18	Expedita dicta dolore ad laboriosam culpa molestias nobis.	Numquam odio quas libero eius. Delectus ratione dignissimos iusto inventore optio neque. Reiciendis asperiores hic dicta maiores. Dolor tempore et eius similique aperiam cupiditate. Sit qui sint atque labore.	f	\N	6	2022-08-04 18:33:19.235116	2022-08-04 18:33:19.842788
12	Omnis corporis dolores tempora exercitationem.	Quod molestiae totam doloremque est praesentium suscipit aliquam. Fugit blanditiis nobis quia itaque. Perspiciatis beatae quos iste quis suscipit architecto.	f	\N	8	2022-08-04 18:33:19.190739	2022-08-04 18:33:19.920909
10	Sint est pariatur exercitationem rem molestiae consequuntur repudiandae.	Id alias assumenda deleniti vel dicta iusto. Sint expedita similique architecto distinctio fugiat provident non molestias. Quo reprehenderit amet nemo fuga harum eos officiis. Veniam laborum labore est doloribus. Ipsam expedita itaque quod libero inventore quae.	f	\N	10	2022-08-04 18:33:19.180535	2022-08-04 18:33:19.926121
7	Ad quos consequuntur sed cumque enim quasi.	Ab neque quisquam reprehenderit dolorum quasi architecto nulla quis. Fuga rem placeat nisi id maiores nihil. Saepe aliquid cum voluptatibus deleniti tempore. Doloremque eius quae cupiditate ex laboriosam accusamus perferendis.	f	\N	9	2022-08-04 18:33:19.167576	2022-08-04 18:33:19.918245
16	Quas architecto labore atque sed sit veniam.	Veritatis asperiores velit dignissimos et odit maiores. Nostrum sunt odit incidunt sit voluptatibus. Quidem sint facilis quos deserunt ut dolor aut. Accusantium ipsum occaecati quo nemo recusandae ab at. Asperiores repellat dicta facilis repellendus accusantium maxime enim magnam.	f	\N	6	2022-08-04 18:33:19.227829	2022-08-04 18:33:19.885469
3	Sunt culpa officiis provident atque.	Velit reprehenderit ratione pariatur atque enim. Doloribus sunt nam saepe iusto. Distinctio est quas totam dolorem fugiat minima.	f	\N	3	2022-08-04 18:33:19.15195	2022-08-04 18:33:19.895942
17	Sequi sit iste soluta pariatur asperiores repudiandae at.	Nobis consequatur soluta voluptas pariatur mollitia molestiae voluptatum. Dolorum illum inventore iste iure enim non fugiat qui. Aliquam distinctio eaque explicabo praesentium labore. Aspernatur ea quae quam atque delectus veritatis est. Sed dignissimos aspernatur fuga mollitia iure.	f	\N	11	2022-08-04 18:33:19.231679	2022-08-04 18:33:19.800964
11	Dicta ipsum nam iure nesciunt expedita dolore assumenda enim.	Quo quibusdam ea sed totam omnis. Temporibus dignissimos nostrum sunt animi excepturi quaerat illo. Officiis nobis tempore libero maxime laudantium corporis. Rem corporis eum nesciunt fugiat modi. Explicabo nam sapiente quia eius.	f	\N	8	2022-08-04 18:33:19.183884	2022-08-04 18:33:19.928665
13	Maiores nisi occaecati possimus dolorum optio cumque mollitia voluptates.	Voluptates velit ad occaecati excepturi. Animi quaerat aperiam ratione similique. Sequi pariatur suscipit in debitis. Provident officiis accusantium nostrum a libero voluptas quibusdam at.	f	\N	6	2022-08-04 18:33:19.195244	2022-08-04 18:33:19.874177
20	Totam saepe ducimus aperiam maiores.	At voluptatem quasi recusandae repellendus optio nulla. Laudantium fuga quas possimus harum iure incidunt. Perspiciatis et dolorem incidunt facere ad modi.	f	\N	11	2022-08-04 18:33:19.241487	2022-08-04 18:33:19.910311
1	Nisi quidem eaque non dolores ad.	Quisquam voluptas itaque natus maxime. Distinctio sit suscipit nulla delectus minus. Enim dignissimos ipsum veritatis laudantium. Commodi explicabo dicta vero eaque exercitationem. Ab corrupti porro iusto eum sequi cum.	f	\N	10	2022-08-04 18:33:19.143644	2022-08-04 18:33:19.923644
19	Nam soluta rem iure doloribus aspernatur sapiente.	Maiores alias accusamus praesentium doloribus neque laborum tempora. Ad omnis recusandae reprehenderit laboriosam commodi. Sed neque perspiciatis earum blanditiis consequatur. Tenetur corporis ut corrupti ratione magni dolorum quia. Temporibus accusantium dolore est iure optio repudiandae quasi asperiores.	f	\N	9	2022-08-04 18:33:19.238307	2022-08-04 18:33:19.839951
2	Sapiente eius necessitatibus ipsam neque earum harum dolore.	Eum eveniet eaque nobis similique quo reprehenderit maiores. Dolorum quas culpa dolore quaerat inventore harum labore. Voluptatibus non sunt sed eveniet numquam dolorum. Magnam ipsum tempore quis similique ratione officiis eos dignissimos. Possimus dolores sapiente eos pariatur provident magni quod.	f	\N	3	2022-08-04 18:33:19.148418	2022-08-04 18:33:19.901895
14	Minima consequatur repellat repellendus porro minus.	Consequatur quibusdam earum quia eveniet accusamus dignissimos. Ut expedita dignissimos iste dolor. Fugit ullam beatae ipsa cupiditate occaecati eius repellat tempora. Fugiat architecto voluptates adipisci enim iste ipsum quia harum.	f	\N	2	2022-08-04 18:33:19.219086	2022-08-04 18:33:19.907666
15	Tempore asperiores minus temporibus enim.	Sint corrupti cum nesciunt at rerum vitae. Ducimus repellat error earum voluptatum molestiae nam doloribus. Quo voluptatum sunt similique nostrum quos ullam perferendis. Necessitatibus ea odit quisquam ullam corrupti.	f	\N	10	2022-08-04 18:33:19.224159	2022-08-04 18:33:19.912926
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.items (id, name, done, finished_at, event_id, created_at, updated_at) FROM stdin;
1	Retro photo booth tumblr 8-bit keytar Cosby Sweater next level master cleanse. Mustache Shoreditch artisan farm-to-table synth messenger bag VHS seitan Austin. Carles DIY PBR master cleanse art mlkshk messenger bag American Apparel. Dreamcatcher thundercats DIY fanny pack sustainable American Apparel organic 8-bit PBR.	f	\N	19	2022-08-04 18:33:19.277968	2022-08-04 18:33:19.277968
2	Scenester tumblr ethical viral etsy vegan +1 Brooklyn. Wes anderson organic VHS squid craft beer biodiesel party McSweeney's. Squid quinoa high life lo-fi echo park.	f	\N	19	2022-08-04 18:33:19.283921	2022-08-04 18:33:19.283921
3	Butcher moon vice master cleanse etsy Rerry Richardson gluten-free chambray. Pitchfork keytar lo-fi organic 8-bit. Tumblr blog banh mi skateboard Wes Anderson Carles Wayfarers. Moon before they sold out trust fund organic Rerry Richardson fap.	f	\N	13	2022-08-04 18:33:19.287658	2022-08-04 18:33:19.287658
4	Put a bird on it artisan organic brunch stumptown. Photo booth fanny pack Rerry Richardson squid wolf. Locavore Carles mixtape stumptown vice beard. Aesthetic ethical Four Loko twee DIY Rerry Richardson fixie Portland.	f	\N	1	2022-08-04 18:33:19.295919	2022-08-04 18:33:19.295919
5	Whatever trust fund hoodie twee Marfa before they sold out. Whatever Shoreditch irony tattooed raw denim helvetica beard Rerry Richardson. Chambray VHS retro ethical seitan. Brunch mixtape Pitchfork moon Four Loko keytar.	f	\N	18	2022-08-04 18:33:19.299152	2022-08-04 18:33:19.299152
6	Put a bird on it single-origin coffee salvia bicycle rights Williamsburg. Locavore chambray before they sold out helvetica gentrify. Vegan cred cliche thundercats dreamcatcher.	f	\N	4	2022-08-04 18:33:19.302314	2022-08-04 18:33:19.302314
7	Keffiyeh you probably haven't heard of them trust fund 8-bit beard. Whatever sartorial Williamsburg +1 Wayfarers Rerry Richardson. Locavore 8-bit Portland vice Wes Anderson. Fap ethical put a bird on it vinyl cliche bicycle rights gentrify.	f	\N	19	2022-08-04 18:33:19.305095	2022-08-04 18:33:19.305095
8	Fap leggings lomo +1 sartorial salvia moon. Farm-to-table keffiyeh moon +1 biodiesel Portland skateboard. Ethical raw denim Banksy Rerry Richardson echo park. Aesthetic Rerry Richardson twee cred Carles bicycle rights mustache quinoa lo-fi. Fanny pack locavore mixtape tattooed organic squid.	f	\N	1	2022-08-04 18:33:19.308465	2022-08-04 18:33:19.308465
9	Dreamcatcher viral before they sold out wolf cred stumptown lo-fi jean shorts hoodie. Cosby sweater +1 vice leggings fixie Carles. Skateboard scenester etsy blog before they sold out viral freegan Wayfarers fap. Etsy farm-to-table Four Loko before they sold out hoodie retro VHS Wayfarers freegan.	f	\N	8	2022-08-04 18:33:19.312124	2022-08-04 18:33:19.312124
10	Vegan tofu 8-bit mustache salvia tattooed art artisan Williamsburg. Wayfarers Four Loko tofu quinoa skateboard single-origin coffee. Yr beard freegan put a bird on it biodiesel. Brunch American Apparel Wes Anderson put a bird on it craft beer. Bicycle rights Rerry Richardson quinoa seitan single-origin coffee VHS vegan.	f	\N	9	2022-08-04 18:33:19.31612	2022-08-04 18:33:19.31612
11	Beard photo booth Rerry Richardson ethical mustache. Bicycle rights trust fund messenger bag wolf letterpress. You probably haven't heard of them craft beer cred gentrify blog quinoa viral jean shorts. Four loko mixtape Cosby Sweater sustainable twee. Dreamcatcher gentrify whatever Portland iPhone seitan mlkshk.	f	\N	11	2022-08-04 18:33:19.319365	2022-08-04 18:33:19.319365
12	Banh mi lomo locavore salvia tumblr DIY. Tumblr etsy master cleanse tattooed yr beard fanny pack iPhone. Helvetica bicycle rights Cosby Sweater sustainable next level. Tattooed butcher Marfa jean shorts irony.	f	\N	13	2022-08-04 18:33:19.322267	2022-08-04 18:33:19.322267
13	Wes anderson photo booth viral scenester trust fund biodiesel master cleanse vinyl thundercats. Synth brunch salvia Brooklyn cred Shoreditch iPhone stumptown. Organic moon freegan lomo 8-bit twee.	f	\N	1	2022-08-04 18:33:19.325824	2022-08-04 18:33:19.325824
14	Banksy Wes Anderson Carles locavore retro. Wolf gentrify food truck Williamsburg Banksy. Echo park vice Portland jean shorts ethical artisan PBR chambray Carles. Shoreditch aesthetic organic thundercats sartorial freegan.	f	\N	17	2022-08-04 18:33:19.329029	2022-08-04 18:33:19.329029
15	Banksy irony Portland +1 retro Williamsburg. Irony Portland before they sold out squid PBR craft beer McSweeney's next level. Brunch Portland mixtape vegan chambray readymade.	f	\N	11	2022-08-04 18:33:19.331839	2022-08-04 18:33:19.331839
16	Twee salvia cliche hoodie moon vice. Wayfarers thundercats synth tofu food truck hoodie vegan high life. Echo park single-origin coffee American Apparel hoodie PBR Marfa high life ethical locavore.	f	\N	14	2022-08-04 18:33:19.334659	2022-08-04 18:33:19.334659
17	Echo park artisan mustache Wayfarers vegan farm-to-table gluten-free. Mlkshk jean shorts gentrify squid Banksy Wes Anderson. Craft beer Cosby Sweater put a bird on it tofu scenester Rerry Richardson McSweeney's biodiesel Pitchfork. Lomo brunch scenester food truck banh mi party chambray farm-to-table whatever. Put a bird on it biodiesel cred squid chambray.	f	\N	15	2022-08-04 18:33:19.338044	2022-08-04 18:33:19.338044
18	Next level brunch master cleanse Austin farm-to-table etsy butcher mlkshk. Cliche aesthetic salvia cred fixie organic art Portland. Beard mixtape high life butcher craft beer moon Shoreditch bicycle rights Brooklyn. Raw denim McSweeney's irony high life Wes Anderson lomo etsy fanny pack. Ethical yr Austin wolf Wes Anderson Cosby Sweater bicycle rights VHS.	f	\N	3	2022-08-04 18:33:19.341102	2022-08-04 18:33:19.341102
19	+1 Williamsburg mlkshk farm-to-table freegan messenger bag moon 8-bit. Trust fund raw denim mlkshk photo booth next level. Lomo wolf McSweeney's lo-fi iPhone sartorial keytar twee.	f	\N	10	2022-08-04 18:33:19.344289	2022-08-04 18:33:19.344289
20	Four loko echo park iPhone lomo DIY keytar blog leggings. Whatever PBR fixie American Apparel sartorial. Thundercats American Apparel Shoreditch Wayfarers Brooklyn raw denim VHS. Letterpress irony freegan fixie iPhone whatever.	f	\N	7	2022-08-04 18:33:19.34778	2022-08-04 18:33:19.34778
21	American apparel food truck farm-to-table twee vice Brooklyn hoodie. Put a bird on it wolf chambray helvetica iPhone. Yr master cleanse Austin food truck viral gentrify Pitchfork biodiesel.	f	\N	9	2022-08-04 18:33:19.351538	2022-08-04 18:33:19.351538
22	Vegan quinoa trust fund sustainable McSweeney's. Cred Wes Anderson echo park letterpress Marfa yr whatever locavore high life. Twee scenester brunch gluten-free Wes Anderson yr vegan gentrify McSweeney's. Photo booth single-origin coffee scenester iPhone whatever DIY sustainable. 8-bit jean shorts you probably haven't heard of them PBR next level Cosby Sweater aesthetic.	f	\N	2	2022-08-04 18:33:19.356301	2022-08-04 18:33:19.356301
23	Vhs cliche blog ethical tofu viral craft beer Wayfarers Williamsburg. Readymade blog gentrify artisan brunch before they sold out butcher. Letterpress Marfa Cosby Sweater food truck moon Wes Anderson next level artisan.	f	\N	20	2022-08-04 18:33:19.360993	2022-08-04 18:33:19.360993
24	Moon sartorial aesthetic Shoreditch fap yr. Vice moon Portland American Apparel Banksy raw denim. Skateboard cardigan fixie echo park letterpress quinoa. Keytar retro wolf yr seitan irony Carles cardigan etsy.	f	\N	16	2022-08-04 18:33:19.36515	2022-08-04 18:33:19.36515
25	Tumblr sustainable sartorial tattooed lomo keffiyeh iPhone party. 8-bit brunch ethical art artisan messenger bag high life. Single-origin coffee tattooed scenester DIY leggings.	f	\N	19	2022-08-04 18:33:19.369533	2022-08-04 18:33:19.369533
51	Sartorial aesthetic lomo cliche vice. Tofu party gluten-free cred yr twee mlkshk Marfa retro. Ethical food truck wolf irony organic mustache. Mlkshk VHS Shoreditch biodiesel irony bicycle rights iPhone.	f	\N	12	2022-08-04 18:33:19.454078	2022-08-04 18:33:19.454078
26	Ethical keytar stumptown art synth thundercats sartorial. Biodiesel cardigan lomo squid freegan Austin. Thundercats cliche vinyl +1 irony Wayfarers 8-bit trust fund. Pbr iPhone etsy keffiyeh party. You probably haven't heard of them bicycle rights single-origin coffee Wayfarers mlkshk messenger bag helvetica yr.	f	\N	13	2022-08-04 18:33:19.373405	2022-08-04 18:33:19.373405
27	Mixtape echo park art lomo biodiesel. Locavore quinoa master cleanse brunch raw denim iPhone art. Put a bird on it mustache +1 butcher raw denim fixie. Leggings craft beer photo booth tofu tumblr freegan. Moon put a bird on it viral synth hoodie mixtape gentrify.	f	\N	2	2022-08-04 18:33:19.376844	2022-08-04 18:33:19.376844
28	Photo booth quinoa freegan tattooed ethical cred. Lomo tattooed aesthetic leggings Rerry Richardson mixtape. Blog twee tattooed irony Williamsburg. Wayfarers blog locavore leggings sartorial skateboard aesthetic yr Brooklyn.	f	\N	10	2022-08-04 18:33:19.379909	2022-08-04 18:33:19.379909
29	Stumptown fap banh mi aesthetic chambray locavore jean shorts readymade. Aesthetic sartorial Marfa mlkshk cardigan. Hoodie Brooklyn cliche raw denim Austin. Fanny pack locavore thundercats helvetica gluten-free. Freegan mustache mlkshk farm-to-table dreamcatcher Four Loko artisan organic Shoreditch.	f	\N	6	2022-08-04 18:33:19.382851	2022-08-04 18:33:19.382851
30	Portland sustainable blog tumblr fap locavore. Portland jean shorts trust fund American Apparel Williamsburg art moon Carles quinoa. Viral American Apparel cliche moon high life trust fund vice Banksy.	f	\N	14	2022-08-04 18:33:19.385653	2022-08-04 18:33:19.385653
31	Fixie ethical seitan skateboard vinyl gentrify jean shorts Williamsburg. Twee Four Loko Portland skateboard blog. Fap next level DIY you probably haven't heard of them high life chambray vegan thundercats. Pitchfork Marfa trust fund craft beer Wes Anderson keffiyeh salvia 8-bit letterpress. Wes anderson +1 ethical seitan Cosby Sweater DIY letterpress vice tattooed.	f	\N	17	2022-08-04 18:33:19.388719	2022-08-04 18:33:19.388719
32	Diy vegan leggings sartorial lomo Pitchfork. Banksy fixie yr butcher twee mixtape raw denim gluten-free you probably haven't heard of them. Sustainable leggings art synth cred. Mustache salvia brunch sustainable viral iPhone thundercats dreamcatcher. Aesthetic tofu artisan banh mi Wes Anderson master cleanse gentrify vegan.	f	\N	9	2022-08-04 18:33:19.391774	2022-08-04 18:33:19.391774
33	Master cleanse iPhone cliche Cosby Sweater etsy leggings craft beer. Wayfarers helvetica beard cred 8-bit squid. Pbr +1 banh mi American Apparel dreamcatcher aesthetic.	f	\N	18	2022-08-04 18:33:19.394858	2022-08-04 18:33:19.394858
34	Viral banh mi trust fund lo-fi gluten-free biodiesel. Squid bicycle rights seitan etsy blog vegan organic. Brunch American Apparel mustache letterpress butcher. Rerry richardson Portland synth DIY cardigan farm-to-table.	f	\N	7	2022-08-04 18:33:19.397996	2022-08-04 18:33:19.397996
35	Farm-to-table hoodie salvia Four Loko Portland +1 keytar vinyl. Fanny pack bicycle rights organic lomo tofu vegan put a bird on it thundercats. Brooklyn art seitan salvia whatever. Photo booth fanny pack tattooed cliche lo-fi. Diy fixie you probably haven't heard of them gluten-free aesthetic iPhone Four Loko dreamcatcher.	f	\N	13	2022-08-04 18:33:19.400759	2022-08-04 18:33:19.400759
36	Fanny pack Austin stumptown whatever Rerry Richardson helvetica before they sold out echo park PBR. Jean shorts Wayfarers scenester PBR bicycle rights whatever before they sold out aesthetic. Thundercats etsy retro biodiesel organic vice.	f	\N	7	2022-08-04 18:33:19.403765	2022-08-04 18:33:19.403765
37	Viral tattooed Cosby Sweater trust fund jean shorts vegan chambray butcher Wayfarers. Trust fund Banksy fanny pack organic messenger bag keytar. You probably haven't heard of them Portland put a bird on it before they sold out cliche. Cardigan put a bird on it banh mi messenger bag Wes Anderson beard.	f	\N	3	2022-08-04 18:33:19.407608	2022-08-04 18:33:19.407608
38	Vice tattooed stumptown aesthetic thundercats jean shorts party irony. You probably haven't heard of them tattooed locavore vinyl readymade keytar bicycle rights butcher. Banksy moon Austin brunch whatever Wes Anderson cardigan.	f	\N	1	2022-08-04 18:33:19.410629	2022-08-04 18:33:19.410629
39	8-bit dreamcatcher PBR trust fund fixie messenger bag beard. Pbr scenester Williamsburg high life farm-to-table etsy Shoreditch. Salvia Cosby Sweater single-origin coffee locavore DIY Rerry Richardson letterpress.	f	\N	11	2022-08-04 18:33:19.413494	2022-08-04 18:33:19.413494
40	Brooklyn freegan Wes Anderson biodiesel +1. Skateboard VHS brunch organic butcher tumblr. Moon artisan organic freegan ethical tofu keytar mixtape. Cosby sweater 8-bit fixie squid whatever.	f	\N	5	2022-08-04 18:33:19.416888	2022-08-04 18:33:19.416888
41	High life dreamcatcher Portland you probably haven't heard of them fanny pack etsy vegan. Keytar DIY sartorial moon brunch next level lomo iPhone. Cosby sweater vinyl yr PBR put a bird on it jean shorts biodiesel Brooklyn wolf. Tattooed lomo sartorial blog Williamsburg put a bird on it Carles vegan wolf.	f	\N	4	2022-08-04 18:33:19.420604	2022-08-04 18:33:19.420604
42	Brooklyn PBR put a bird on it you probably haven't heard of them biodiesel McSweeney's. Banksy butcher master cleanse Portland ethical echo park hoodie. Mlkshk yr synth Shoreditch helvetica. Fixie synth retro you probably haven't heard of them mlkshk wolf party Banksy skateboard.	f	\N	12	2022-08-04 18:33:19.424673	2022-08-04 18:33:19.424673
43	Cardigan fap Wes Anderson keffiyeh butcher. Leggings Austin freegan lomo Wayfarers Brooklyn fixie. Mixtape chambray skateboard sustainable Wes Anderson Pitchfork keffiyeh. Chambray banh mi party lomo bicycle rights locavore vegan lo-fi next level.	f	\N	4	2022-08-04 18:33:19.428052	2022-08-04 18:33:19.428052
44	High life lo-fi yr keffiyeh messenger bag Pitchfork raw denim. Carles iPhone hoodie artisan Williamsburg mixtape trust fund lo-fi. Yr Wayfarers keytar dreamcatcher put a bird on it photo booth. Moon lomo yr whatever VHS blog aesthetic. Cred Pitchfork high life moon gluten-free salvia sustainable.	f	\N	1	2022-08-04 18:33:19.431435	2022-08-04 18:33:19.431435
45	Jean shorts food truck retro iPhone art synth mlkshk. American apparel organic thundercats synth Four Loko vice tattooed quinoa PBR. Raw denim Carles American Apparel party yr Austin gluten-free.	f	\N	2	2022-08-04 18:33:19.434626	2022-08-04 18:33:19.434626
46	Rerry richardson jean shorts whatever freegan Wes Anderson leggings Marfa iPhone. Four loko moon vinyl 8-bit cliche before they sold out. Lomo freegan tofu helvetica readymade Marfa sustainable skateboard moon. Pbr lomo iPhone sustainable next level scenester dreamcatcher.	f	\N	8	2022-08-04 18:33:19.437755	2022-08-04 18:33:19.437755
47	Brunch organic twee mlkshk yr. Trust fund master cleanse vinyl mustache irony. Hoodie Austin artisan echo park party wolf messenger bag.	f	\N	13	2022-08-04 18:33:19.440748	2022-08-04 18:33:19.440748
48	Master cleanse VHS next level lo-fi farm-to-table helvetica gentrify sustainable. Lo-fi viral Rerry Richardson fixie put a bird on it freegan. Raw denim whatever put a bird on it brunch fixie retro. Scenester Cosby Sweater viral beard single-origin coffee master cleanse next level.	f	\N	16	2022-08-04 18:33:19.443854	2022-08-04 18:33:19.443854
49	Aesthetic viral put a bird on it VHS ethical. Chambray sustainable helvetica cred Wayfarers vinyl. Stumptown readymade Four Loko thundercats tumblr art retro whatever. Trust fund keytar raw denim mustache VHS. Ethical irony Austin stumptown cardigan Shoreditch whatever.	f	\N	14	2022-08-04 18:33:19.447714	2022-08-04 18:33:19.447714
50	Freegan echo park Pitchfork ethical next level organic raw denim skateboard 8-bit. Freegan farm-to-table craft beer wolf keffiyeh aesthetic echo park tattooed. Farm-to-table brunch Cosby Sweater Carles Brooklyn tattooed lomo.	f	\N	2	2022-08-04 18:33:19.450969	2022-08-04 18:33:19.450969
52	Biodiesel tofu freegan stumptown tumblr. Locavore raw denim tofu fixie twee. Etsy mlkshk fixie keytar art mustache tofu lo-fi brunch. Fanny pack Portland you probably haven't heard of them Pitchfork biodiesel lomo brunch next level. Wes anderson brunch 8-bit chambray +1 artisan.	f	\N	10	2022-08-04 18:33:19.457889	2022-08-04 18:33:19.457889
53	Trust fund vinyl readymade quinoa scenester. Sartorial fanny pack squid butcher Marfa farm-to-table salvia. American apparel helvetica echo park dreamcatcher gentrify Williamsburg PBR. Yr ethical Banksy quinoa art readymade lomo viral DIY.	f	\N	5	2022-08-04 18:33:19.461149	2022-08-04 18:33:19.461149
54	Shoreditch raw denim high life gluten-free butcher keffiyeh quinoa cliche iPhone. Wolf party Pitchfork gluten-free keytar Carles blog chambray. Mlkshk keytar craft beer put a bird on it 8-bit gluten-free blog ethical. Shoreditch Rerry Richardson cliche salvia twee mustache farm-to-table retro. Brooklyn cred twee brunch iPhone wolf Marfa.	f	\N	18	2022-08-04 18:33:19.464707	2022-08-04 18:33:19.464707
55	Cardigan stumptown irony jean shorts cred skateboard lomo. Brooklyn locavore cardigan sartorial dreamcatcher PBR. Yr etsy vice dreamcatcher mixtape. Williamsburg Pitchfork master cleanse food truck ethical.	f	\N	6	2022-08-04 18:33:19.467806	2022-08-04 18:33:19.467806
56	Seitan freegan synth moon Shoreditch Brooklyn Wes Anderson. Dreamcatcher sustainable viral leggings cred yr you probably haven't heard of them lomo PBR. Rerry richardson single-origin coffee Banksy VHS moon keytar McSweeney's. Cardigan seitan fanny pack helvetica Austin McSweeney's whatever yr.	f	\N	20	2022-08-04 18:33:19.471435	2022-08-04 18:33:19.471435
57	Brooklyn skateboard locavore keffiyeh Pitchfork banh mi organic fixie stumptown. Readymade jean shorts Wayfarers photo booth Carles sustainable master cleanse fanny pack vegan. You probably haven't heard of them cardigan retro lo-fi master cleanse VHS McSweeney's Rerry Richardson. Tattooed cardigan Portland fanny pack art messenger bag +1. Beard helvetica wolf Portland bicycle rights echo park PBR.	f	\N	16	2022-08-04 18:33:19.475464	2022-08-04 18:33:19.475464
58	Synth chambray art thundercats Portland PBR. Helvetica Banksy party seitan keffiyeh. Salvia trust fund aesthetic thundercats mlkshk PBR 8-bit readymade. Etsy artisan American Apparel chambray letterpress fap raw denim vice. American apparel thundercats cardigan Portland Brooklyn quinoa jean shorts twee farm-to-table.	f	\N	17	2022-08-04 18:33:19.479037	2022-08-04 18:33:19.479037
59	Wes anderson banh mi fixie freegan organic sartorial stumptown you probably haven't heard of them. Vice next level lomo locavore artisan. Gluten-free etsy farm-to-table thundercats sartorial. Pbr gentrify tofu food truck mixtape squid. Gluten-free iPhone next level party stumptown tumblr +1 Shoreditch.	f	\N	19	2022-08-04 18:33:19.485384	2022-08-04 18:33:19.485384
60	Vegan scenester tattooed retro mustache put a bird on it echo park. Wolf keffiyeh trust fund DIY Marfa Cosby Sweater. Tumblr sartorial chambray vegan whatever cred VHS seitan.	f	\N	19	2022-08-04 18:33:19.488506	2022-08-04 18:33:19.488506
61	Scenester freegan farm-to-table organic cred moon stumptown Wayfarers. Fap mixtape lomo whatever squid. Gluten-free skateboard American Apparel irony butcher gentrify mustache. Whatever cliche single-origin coffee Brooklyn leggings Banksy jean shorts raw denim master cleanse. Moon cardigan mustache echo park keffiyeh biodiesel vegan.	f	\N	17	2022-08-04 18:33:19.492038	2022-08-04 18:33:19.492038
62	Mcsweeney's helvetica vegan party master cleanse. Farm-to-table skateboard blog lomo tofu PBR. Diy craft beer photo booth biodiesel echo park keffiyeh Wes Anderson banh mi ethical. Locavore iPhone scenester seitan you probably haven't heard of them raw denim yr craft beer. Party synth Cosby Sweater fixie tumblr Austin.	f	\N	16	2022-08-04 18:33:19.495598	2022-08-04 18:33:19.495598
63	Lo-fi aesthetic helvetica letterpress mustache Pitchfork. Bicycle rights craft beer retro Banksy Shoreditch seitan you probably haven't heard of them. Trust fund lomo DIY sustainable Wes Anderson organic 8-bit readymade lo-fi. Diy art gluten-free tumblr Banksy. Helvetica freegan tattooed put a bird on it +1 thundercats irony.	f	\N	13	2022-08-04 18:33:19.498931	2022-08-04 18:33:19.498931
64	Artisan tofu photo booth squid you probably haven't heard of them Four Loko. Before they sold out yr beard viral leggings artisan fixie retro. Portland Brooklyn biodiesel hoodie trust fund Carles PBR brunch tofu.	f	\N	8	2022-08-04 18:33:19.501886	2022-08-04 18:33:19.501886
65	Cred locavore tumblr lo-fi trust fund. Yr organic lo-fi beard craft beer fixie. Four loko Cosby Sweater vegan leggings single-origin coffee put a bird on it cliche. Food truck twee mlkshk artisan jean shorts fap keffiyeh farm-to-table blog.	f	\N	7	2022-08-04 18:33:19.504562	2022-08-04 18:33:19.504562
66	Lo-fi Williamsburg keytar readymade keffiyeh. Locavore freegan banh mi Pitchfork stumptown. Scenester gentrify hoodie Austin master cleanse Marfa. Gluten-free jean shorts moon bicycle rights fixie you probably haven't heard of them. Trust fund party gentrify messenger bag moon hoodie keffiyeh blog.	f	\N	8	2022-08-04 18:33:19.508406	2022-08-04 18:33:19.508406
67	Twee art messenger bag VHS leggings put a bird on it. Butcher cliche gluten-free tattooed sustainable cardigan craft beer. Yr PBR McSweeney's Four Loko DIY gluten-free trust fund. High life Banksy Shoreditch cliche squid.	f	\N	6	2022-08-04 18:33:19.511339	2022-08-04 18:33:19.511339
68	Rerry richardson party stumptown squid aesthetic put a bird on it Brooklyn. Skateboard vegan mustache etsy next level thundercats. Four loko single-origin coffee Brooklyn Pitchfork freegan. Brooklyn irony Rerry Richardson yr art squid vice Carles.	f	\N	6	2022-08-04 18:33:19.514284	2022-08-04 18:33:19.514284
69	Carles retro high life letterpress twee chambray synth mustache. Brunch jean shorts mixtape craft beer sustainable twee. Williamsburg biodiesel Brooklyn raw denim banh mi PBR yr tofu Four Loko. Raw denim put a bird on it aesthetic party cred gluten-free locavore.	f	\N	6	2022-08-04 18:33:19.51707	2022-08-04 18:33:19.51707
70	Keffiyeh high life PBR tofu chambray salvia gentrify beard viral. Keytar biodiesel vegan fanny pack salvia party banh mi mustache. Salvia you probably haven't heard of them PBR lo-fi mixtape high life ethical.	f	\N	5	2022-08-04 18:33:19.520613	2022-08-04 18:33:19.520613
71	Etsy mlkshk synth beard Wayfarers. Viral before they sold out sartorial Shoreditch you probably haven't heard of them master cleanse party seitan scenester. Farm-to-table keffiyeh Brooklyn Williamsburg single-origin coffee Four Loko Portland. Cardigan squid PBR +1 yr craft beer next level high life. Retro keytar lomo stumptown high life lo-fi Marfa Brooklyn.	f	\N	13	2022-08-04 18:33:19.52379	2022-08-04 18:33:19.52379
72	Pitchfork wolf Brooklyn vice organic VHS. Tattooed gentrify messenger bag Carles sustainable hoodie. Quinoa Four Loko raw denim cardigan iPhone.	f	\N	19	2022-08-04 18:33:19.526804	2022-08-04 18:33:19.526804
73	Raw denim next level tumblr thundercats farm-to-table vegan scenester trust fund mixtape. Before they sold out Austin artisan leggings American Apparel. 8-bit mlkshk yr Banksy whatever stumptown Shoreditch gluten-free dreamcatcher. Art bicycle rights squid cred lomo retro yr butcher.	f	\N	2	2022-08-04 18:33:19.530273	2022-08-04 18:33:19.530273
74	Williamsburg DIY letterpress chambray next level leggings. Biodiesel butcher vinyl twee VHS craft beer. American apparel iPhone tattooed mustache gluten-free. Vegan tattooed banh mi stumptown trust fund.	f	\N	17	2022-08-04 18:33:19.533336	2022-08-04 18:33:19.533336
75	Cardigan skateboard ethical salvia echo park Brooklyn DIY lomo seitan. Mcsweeney's cliche 8-bit twee blog squid moon. Hoodie photo booth put a bird on it echo park retro +1 irony sustainable tumblr.	f	\N	14	2022-08-04 18:33:19.53635	2022-08-04 18:33:19.53635
76	Single-origin coffee Portland yr mlkshk keffiyeh 8-bit farm-to-table. Whatever tofu single-origin coffee iPhone Portland readymade freegan salvia. +1 Four Loko fap iPhone brunch you probably haven't heard of them raw denim. Brunch jean shorts locavore you probably haven't heard of them single-origin coffee Rerry Richardson Brooklyn tumblr. Wes anderson tumblr banh mi dreamcatcher DIY lo-fi.	f	\N	14	2022-08-04 18:33:19.539747	2022-08-04 18:33:19.539747
77	Cardigan you probably haven't heard of them ethical skateboard mixtape fanny pack. Party seitan butcher Austin locavore letterpress dreamcatcher leggings. Tofu squid Carles thundercats biodiesel. Keffiyeh whatever leggings fanny pack cred photo booth DIY high life fap.	f	\N	9	2022-08-04 18:33:19.542846	2022-08-04 18:33:19.542846
78	Dreamcatcher artisan moon wolf beard. Gluten-free art Wayfarers you probably haven't heard of them banh mi sartorial farm-to-table. Vegan art irony McSweeney's seitan quinoa sartorial aesthetic. Dreamcatcher Cosby Sweater banh mi tofu trust fund Austin.	f	\N	9	2022-08-04 18:33:19.545888	2022-08-04 18:33:19.545888
79	Whatever fap organic Banksy keffiyeh letterpress. Lomo Banksy hoodie food truck McSweeney's. You probably haven't heard of them sartorial Cosby Sweater Pitchfork master cleanse yr Marfa jean shorts seitan. Master cleanse vinyl Portland cliche ethical twee party put a bird on it.	f	\N	16	2022-08-04 18:33:19.549152	2022-08-04 18:33:19.549152
80	Wolf before they sold out Four Loko skateboard sustainable Wayfarers. Photo booth vegan you probably haven't heard of them fixie keffiyeh art skateboard. Single-origin coffee tofu etsy twee lomo farm-to-table aesthetic you probably haven't heard of them American Apparel.	f	\N	19	2022-08-04 18:33:19.551971	2022-08-04 18:33:19.551971
81	Jean shorts iPhone lomo high life chambray scenester before they sold out VHS wolf. +1 wolf yr art blog lo-fi. Lomo moon cliche art hoodie vinyl quinoa next level locavore. Food truck irony Four Loko PBR whatever. Skateboard yr blog jean shorts fap bicycle rights dreamcatcher viral beard.	f	\N	3	2022-08-04 18:33:19.555227	2022-08-04 18:33:19.555227
82	Aesthetic beard keffiyeh single-origin coffee tattooed fanny pack. Four loko wolf stumptown Banksy party DIY quinoa butcher art. Sustainable sartorial jean shorts craft beer Pitchfork readymade. Wolf fixie scenester viral fap. Tumblr beard thundercats retro etsy gentrify put a bird on it Williamsburg.	f	\N	3	2022-08-04 18:33:19.559548	2022-08-04 18:33:19.559548
83	Cliche aesthetic yr iPhone 8-bit. Organic tumblr etsy Rerry Richardson food truck Austin. 8-bit brunch synth Austin sustainable yr mlkshk master cleanse art. Stumptown Banksy helvetica PBR vice quinoa tumblr iPhone dreamcatcher.	f	\N	6	2022-08-04 18:33:19.562566	2022-08-04 18:33:19.562566
84	Sartorial organic tofu synth cardigan gentrify vegan Rerry Richardson. Chambray lomo fap iPhone Williamsburg dreamcatcher tumblr Shoreditch food truck. Rerry richardson Brooklyn tattooed beard moon hoodie Wes Anderson.	f	\N	3	2022-08-04 18:33:19.566144	2022-08-04 18:33:19.566144
85	Next level tattooed biodiesel synth brunch. Yr synth bicycle rights Marfa helvetica hoodie cred party. Mlkshk irony Portland chambray before they sold out Rerry Richardson butcher.	f	\N	15	2022-08-04 18:33:19.569208	2022-08-04 18:33:19.569208
86	Vinyl Carles Brooklyn leggings photo booth squid. Iphone next level Pitchfork party Austin aesthetic. Pbr 8-bit tattooed letterpress +1 photo booth Pitchfork DIY.	f	\N	16	2022-08-04 18:33:19.572377	2022-08-04 18:33:19.572377
87	Dreamcatcher lomo lo-fi whatever irony sartorial. Gentrify gluten-free 8-bit Portland viral. Single-origin coffee Four Loko scenester moon high life lomo whatever. Leggings wolf Banksy chambray Brooklyn Pitchfork Portland.	f	\N	1	2022-08-04 18:33:19.575495	2022-08-04 18:33:19.575495
88	Carles squid moon Wayfarers Four Loko quinoa readymade etsy. Banh mi Shoreditch raw denim wolf helvetica. Wayfarers high life etsy aesthetic retro. Tattooed PBR mlkshk brunch artisan vice. +1 fap high life organic ethical raw denim Pitchfork Williamsburg.	f	\N	3	2022-08-04 18:33:19.578408	2022-08-04 18:33:19.578408
89	Fap helvetica artisan sustainable Banksy letterpress vegan. Cosby sweater high life scenester party synth vegan retro seitan vice. Put a bird on it butcher yr vice +1 helvetica hoodie McSweeney's dreamcatcher. Craft beer irony Pitchfork farm-to-table echo park hoodie cliche.	f	\N	2	2022-08-04 18:33:19.581465	2022-08-04 18:33:19.581465
90	Mcsweeney's art keffiyeh seitan quinoa moon. Aesthetic Four Loko mlkshk quinoa brunch. Mlkshk salvia synth Rerry Richardson keffiyeh biodiesel. Party butcher vice you probably haven't heard of them master cleanse 8-bit put a bird on it. Twee single-origin coffee mustache artisan lomo.	f	\N	2	2022-08-04 18:33:19.584925	2022-08-04 18:33:19.584925
91	Next level etsy letterpress organic Cosby Sweater moon American Apparel wolf you probably haven't heard of them. Cred readymade iPhone thundercats next level quinoa viral vinyl Brooklyn. Whatever thundercats ethical banh mi farm-to-table PBR organic. Pitchfork raw denim mixtape butcher etsy. Farm-to-table gentrify readymade Four Loko 8-bit photo booth keytar.	f	\N	2	2022-08-04 18:33:19.587943	2022-08-04 18:33:19.587943
92	Squid helvetica sustainable wolf bicycle rights salvia keffiyeh quinoa. High life keytar ethical viral leggings butcher Pitchfork Austin. Artisan keffiyeh ethical salvia scenester. Artisan vinyl art party 8-bit irony sartorial VHS. Pbr keytar keffiyeh viral raw denim.	f	\N	15	2022-08-04 18:33:19.590918	2022-08-04 18:33:19.590918
93	Mlkshk aesthetic banh mi Williamsburg retro quinoa. Leggings tofu tumblr stumptown tattooed organic Pitchfork Austin. Organic art quinoa synth cred stumptown Portland salvia ethical. Tofu twee fixie Rerry Richardson PBR echo park butcher. Trust fund wolf iPhone high life skateboard salvia artisan Banksy craft beer.	f	\N	12	2022-08-04 18:33:19.594314	2022-08-04 18:33:19.594314
94	Photo booth vinyl keytar PBR dreamcatcher you probably haven't heard of them squid. Salvia sustainable viral cliche Shoreditch irony. Brunch food truck thundercats Banksy Marfa. Fanny pack Austin salvia quinoa tattooed lo-fi messenger bag.	f	\N	9	2022-08-04 18:33:19.597536	2022-08-04 18:33:19.597536
95	Craft beer leggings put a bird on it Brooklyn biodiesel fanny pack Wes Anderson trust fund. Tumblr +1 photo booth skateboard craft beer Carles Austin tofu. Banksy Carles blog synth Four Loko raw denim jean shorts. Gentrify skateboard salvia master cleanse readymade synth photo booth helvetica.	f	\N	17	2022-08-04 18:33:19.600915	2022-08-04 18:33:19.600915
96	Diy lo-fi gentrify irony squid single-origin coffee fanny pack thundercats. +1 cliche readymade brunch biodiesel. Etsy butcher Williamsburg skateboard artisan Rerry Richardson Carles.	f	\N	9	2022-08-04 18:33:19.604683	2022-08-04 18:33:19.604683
97	Cliche lomo synth DIY iPhone Williamsburg. Fanny pack brunch Portland VHS freegan butcher retro keytar. Cred blog fap Williamsburg moon Austin yr wolf farm-to-table. Mcsweeney's you probably haven't heard of them skateboard sustainable Williamsburg raw denim. Vice lo-fi yr fixie high life dreamcatcher Shoreditch fap.	f	\N	5	2022-08-04 18:33:19.608846	2022-08-04 18:33:19.608846
98	Helvetica gluten-free iPhone twee Shoreditch seitan. Brunch Rerry Richardson sartorial readymade skateboard squid etsy. Retro sartorial farm-to-table sustainable squid PBR echo park.	f	\N	12	2022-08-04 18:33:19.611702	2022-08-04 18:33:19.611702
99	Butcher fap locavore iPhone fixie echo park. Helvetica biodiesel squid party cliche. Pbr mlkshk Four Loko vinyl bicycle rights Austin blog salvia. Rerry richardson retro scenester before they sold out skateboard twee iPhone jean shorts hoodie.	f	\N	7	2022-08-04 18:33:19.614691	2022-08-04 18:33:19.614691
100	Wayfarers thundercats retro raw denim cred squid. Ethical Austin tumblr thundercats quinoa organic tattooed party wolf. Messenger bag party Banksy PBR beard sustainable.	f	\N	3	2022-08-04 18:33:19.617597	2022-08-04 18:33:19.617597
101	Raw denim Shoreditch keffiyeh hoodie Austin gluten-free. Cosby sweater banh mi whatever trust fund Carles. Wolf scenester keytar leggings locavore cliche etsy fanny pack.	f	\N	3	2022-08-04 18:33:19.620954	2022-08-04 18:33:19.620954
102	Letterpress butcher dreamcatcher irony American Apparel. Freegan whatever PBR synth Cosby Sweater butcher. Keffiyeh mustache hoodie art cred moon Pitchfork Brooklyn next level. Etsy Brooklyn seitan freegan letterpress gluten-free you probably haven't heard of them. Lo-fi tumblr artisan locavore vegan PBR jean shorts.	f	\N	3	2022-08-04 18:33:19.624824	2022-08-04 18:33:19.624824
103	Party tattooed quinoa sartorial mustache yr tumblr blog. Cred raw denim iPhone aesthetic cardigan tumblr skateboard. Next level biodiesel tattooed aesthetic dreamcatcher vinyl Shoreditch. High life yr Cosby Sweater readymade Rerry Richardson VHS fap Carles stumptown.	f	\N	18	2022-08-04 18:33:19.628819	2022-08-04 18:33:19.628819
104	Ethical art thundercats cliche McSweeney's freegan bicycle rights retro vinyl. Helvetica aesthetic banh mi Brooklyn viral VHS mlkshk. Freegan lo-fi hoodie farm-to-table DIY trust fund art vinyl Banksy.	f	\N	5	2022-08-04 18:33:19.631696	2022-08-04 18:33:19.631696
105	Pbr Wayfarers cliche mlkshk chambray squid high life. Diy fixie Banksy synth thundercats readymade moon freegan farm-to-table. Locavore whatever mlkshk skateboard brunch VHS thundercats. Butcher trust fund biodiesel farm-to-table Shoreditch you probably haven't heard of them fap viral moon. Photo booth echo park American Apparel jean shorts stumptown.	f	\N	18	2022-08-04 18:33:19.635054	2022-08-04 18:33:19.635054
106	Mixtape echo park tofu banh mi vegan Cosby Sweater Banksy cred. Before they sold out gentrify gluten-free vice DIY photo booth Pitchfork butcher. Wes anderson ethical single-origin coffee readymade high life vice blog scenester. Aesthetic thundercats master cleanse locavore stumptown Marfa Shoreditch.	f	\N	19	2022-08-04 18:33:19.638397	2022-08-04 18:33:19.638397
107	Helvetica Four Loko organic sustainable art brunch gluten-free bicycle rights. Aesthetic dreamcatcher gluten-free McSweeney's art. Etsy beard twee freegan iPhone. Tumblr fap VHS salvia iPhone Marfa freegan Wes Anderson. Leggings skateboard trust fund cred wolf vegan whatever synth.	f	\N	7	2022-08-04 18:33:19.641517	2022-08-04 18:33:19.641517
108	Blog Shoreditch Carles mustache vegan Marfa fanny pack readymade party. Vinyl fixie sartorial locavore seitan blog freegan bicycle rights helvetica. Wes anderson stumptown letterpress helvetica organic keytar Wayfarers art. Cosby sweater organic letterpress biodiesel whatever thundercats DIY raw denim Four Loko. Irony thundercats freegan mixtape lo-fi retro seitan yr.	f	\N	17	2022-08-04 18:33:19.644652	2022-08-04 18:33:19.644652
109	Next level retro moon wolf scenester keffiyeh cliche cred beard. Cliche lo-fi leggings squid Pitchfork Cosby Sweater. Leggings jean shorts banh mi synth wolf VHS bicycle rights lo-fi.	f	\N	20	2022-08-04 18:33:19.647779	2022-08-04 18:33:19.647779
110	Before they sold out butcher Austin art Wayfarers hoodie messenger bag. Party squid aesthetic bicycle rights Wes Anderson 8-bit single-origin coffee American Apparel brunch. Austin DIY vinyl tofu gentrify scenester thundercats lo-fi.	f	\N	2	2022-08-04 18:33:19.650809	2022-08-04 18:33:19.650809
111	Dreamcatcher master cleanse trust fund PBR yr Marfa. Before they sold out raw denim Portland freegan +1. Dreamcatcher Shoreditch cardigan blog DIY readymade craft beer.	f	\N	20	2022-08-04 18:33:19.655637	2022-08-04 18:33:19.655637
112	Thundercats banh mi vinyl brunch scenester etsy locavore Cosby Sweater cliche. Wolf beard tofu Cosby Sweater Wes Anderson hoodie vegan organic. Fanny pack jean shorts iPhone organic readymade farm-to-table vegan.	f	\N	20	2022-08-04 18:33:19.658712	2022-08-04 18:33:19.658712
113	Vice fixie artisan cliche art. Cliche gentrify scenester squid tumblr retro salvia lomo. Beard retro put a bird on it Wayfarers dreamcatcher thundercats. Keffiyeh tumblr Rerry Richardson fixie tofu dreamcatcher organic helvetica. Moon Pitchfork iPhone artisan art readymade synth.	f	\N	1	2022-08-04 18:33:19.661789	2022-08-04 18:33:19.661789
114	Master cleanse stumptown salvia put a bird on it sartorial party messenger bag butcher Brooklyn. Scenester Austin vegan ethical messenger bag freegan. Salvia you probably haven't heard of them farm-to-table locavore Shoreditch freegan mlkshk.	f	\N	8	2022-08-04 18:33:19.665061	2022-08-04 18:33:19.665061
115	Salvia gentrify hoodie Austin vinyl fanny pack. Synth gentrify single-origin coffee whatever 8-bit Shoreditch raw denim next level freegan. Tofu before they sold out wolf helvetica artisan.	f	\N	17	2022-08-04 18:33:19.66902	2022-08-04 18:33:19.66902
116	Biodiesel Rerry Richardson organic Williamsburg tofu cred before they sold out fixie. Austin helvetica high life cliche Wes Anderson biodiesel McSweeney's. American apparel next level chambray lo-fi Four Loko brunch skateboard gentrify. Bicycle rights Cosby Sweater vice fanny pack leggings.	f	\N	8	2022-08-04 18:33:19.671918	2022-08-04 18:33:19.671918
117	Quinoa PBR thundercats Four Loko party trust fund. Yr trust fund dreamcatcher bicycle rights single-origin coffee aesthetic 8-bit synth. Raw denim Williamsburg moon vinyl McSweeney's. Banksy keffiyeh American Apparel you probably haven't heard of them sartorial 8-bit whatever tattooed.	f	\N	8	2022-08-04 18:33:19.675027	2022-08-04 18:33:19.675027
118	Hoodie Austin artisan single-origin coffee yr banh mi sustainable aesthetic. Helvetica cardigan Wayfarers art locavore American Apparel skateboard. Keffiyeh whatever thundercats Banksy before they sold out party tattooed.	f	\N	17	2022-08-04 18:33:19.67802	2022-08-04 18:33:19.67802
119	Carles next level ethical photo booth Four Loko sustainable lo-fi. Wolf vegan skateboard single-origin coffee Austin. Mustache echo park readymade helvetica wolf McSweeney's blog you probably haven't heard of them next level.	f	\N	1	2022-08-04 18:33:19.680825	2022-08-04 18:33:19.680825
120	Readymade echo park Austin banh mi letterpress twee hoodie chambray salvia. Austin Rerry Richardson Banksy freegan cred single-origin coffee. Organic irony craft beer 8-bit DIY sartorial. Sustainable squid Pitchfork synth banh mi dreamcatcher ethical. Photo booth readymade echo park biodiesel Portland.	f	\N	9	2022-08-04 18:33:19.683883	2022-08-04 18:33:19.683883
121	High life fanny pack helvetica yr mlkshk brunch. Photo booth dreamcatcher Cosby Sweater thundercats etsy Banksy. Butcher synth viral cliche before they sold out leggings readymade. Locavore craft beer hoodie etsy photo booth.	f	\N	14	2022-08-04 18:33:19.686615	2022-08-04 18:33:19.686615
122	Wayfarers hoodie tumblr before they sold out art. Seitan whatever Shoreditch you probably haven't heard of them McSweeney's. Shoreditch sartorial bicycle rights you probably haven't heard of them McSweeney's tofu.	f	\N	16	2022-08-04 18:33:19.689211	2022-08-04 18:33:19.689211
123	8-bit VHS McSweeney's Williamsburg vinyl. Twee Cosby Sweater 8-bit scenester readymade. Sartorial cliche gentrify wolf salvia. Fap gentrify craft beer whatever Rerry Richardson wolf. Art Brooklyn banh mi Williamsburg aesthetic before they sold out messenger bag Banksy.	f	\N	10	2022-08-04 18:33:19.692106	2022-08-04 18:33:19.692106
124	Chambray brunch helvetica lomo Marfa. Banh mi Banksy salvia messenger bag tumblr. +1 retro gentrify Williamsburg bicycle rights Rerry Richardson mlkshk DIY. Chambray before they sold out vegan Austin gluten-free aesthetic cardigan iPhone.	f	\N	12	2022-08-04 18:33:19.695162	2022-08-04 18:33:19.695162
125	Mcsweeney's mixtape beard chambray scenester Brooklyn before they sold out helvetica craft beer. Messenger bag vegan Williamsburg cred bicycle rights vinyl keffiyeh wolf. Wolf blog put a bird on it artisan jean shorts. You probably haven't heard of them Carles farm-to-table banh mi Portland readymade synth. Cardigan Portland scenester cred messenger bag synth food truck Austin.	f	\N	6	2022-08-04 18:33:19.698169	2022-08-04 18:33:19.698169
126	You probably haven't heard of them squid letterpress locavore fixie ethical Rerry Richardson. Keytar beard banh mi tofu moon. Scenester tattooed squid Wayfarers vegan bicycle rights.	f	\N	8	2022-08-04 18:33:19.700974	2022-08-04 18:33:19.700974
127	Put a bird on it scenester Austin etsy messenger bag. Aesthetic banh mi American Apparel Cosby Sweater mustache salvia gentrify Wayfarers. Artisan Carles single-origin coffee irony leggings.	f	\N	1	2022-08-04 18:33:19.703798	2022-08-04 18:33:19.703798
128	Marfa fanny pack freegan thundercats before they sold out mixtape. Letterpress beard yr fanny pack Banksy raw denim irony DIY seitan. You probably haven't heard of them leggings gentrify put a bird on it aesthetic synth banh mi.	f	\N	8	2022-08-04 18:33:19.708981	2022-08-04 18:33:19.708981
129	Wes anderson dreamcatcher Banksy cardigan hoodie blog Marfa. Keytar yr next level photo booth ethical mlkshk. Before they sold out cred blog artisan freegan you probably haven't heard of them mixtape Brooklyn put a bird on it. Art Banksy tumblr locavore moon.	f	\N	20	2022-08-04 18:33:19.711956	2022-08-04 18:33:19.711956
130	Seitan freegan biodiesel twee party hoodie. Helvetica cardigan thundercats synth whatever biodiesel Shoreditch. Etsy moon master cleanse +1 keytar Four Loko twee Brooklyn. Twee photo booth Cosby Sweater 8-bit trust fund.	f	\N	17	2022-08-04 18:33:19.714644	2022-08-04 18:33:19.714644
131	Blog wolf high life salvia cliche McSweeney's mlkshk bicycle rights Rerry Richardson. Brooklyn scenester mustache keffiyeh vinyl single-origin coffee lo-fi twee. Vhs whatever lo-fi put a bird on it Brooklyn vinyl viral. Beard single-origin coffee moon Rerry Richardson messenger bag cliche thundercats scenester +1. Gentrify viral Brooklyn aesthetic yr readymade.	f	\N	11	2022-08-04 18:33:19.717364	2022-08-04 18:33:19.717364
132	Thundercats wolf high life lomo whatever DIY vegan. Irony cardigan Austin beard hoodie DIY. Vinyl single-origin coffee moon sustainable fanny pack hoodie. Mcsweeney's lo-fi mlkshk messenger bag vice. Marfa organic Cosby Sweater party Portland.	f	\N	3	2022-08-04 18:33:19.720428	2022-08-04 18:33:19.720428
133	Food truck aesthetic photo booth letterpress party master cleanse VHS sartorial. Sartorial high life sustainable food truck irony biodiesel Carles Williamsburg. Vhs Pitchfork McSweeney's PBR Austin chambray moon vinyl +1.	f	\N	11	2022-08-04 18:33:19.723265	2022-08-04 18:33:19.723265
134	Organic trust fund helvetica wolf McSweeney's cardigan lo-fi. Vhs artisan next level tattooed keffiyeh food truck bicycle rights keytar. Party cardigan fanny pack Shoreditch blog Carles.	f	\N	14	2022-08-04 18:33:19.726467	2022-08-04 18:33:19.726467
135	Mustache bicycle rights fixie Wayfarers brunch. Seitan organic artisan Carles salvia skateboard. Pitchfork farm-to-table biodiesel quinoa echo park thundercats stumptown 8-bit. Single-origin coffee Rerry Richardson squid salvia chambray cardigan VHS wolf.	f	\N	13	2022-08-04 18:33:19.72915	2022-08-04 18:33:19.72915
136	Cred Williamsburg bicycle rights gentrify cliche Portland. Butcher thundercats Pitchfork PBR dreamcatcher art skateboard readymade keffiyeh. Gluten-free 8-bit keytar Banksy salvia.	f	\N	6	2022-08-04 18:33:19.740758	2022-08-04 18:33:19.740758
137	Twee yr freegan synth echo park art mustache. Dreamcatcher blog Shoreditch skateboard banh mi bicycle rights vice gluten-free letterpress. Letterpress readymade Wes Anderson banh mi Marfa Cosby Sweater keffiyeh Pitchfork. Sustainable fixie Marfa PBR mustache put a bird on it next level.	f	\N	10	2022-08-04 18:33:19.743876	2022-08-04 18:33:19.743876
138	Trust fund Banksy scenester etsy keytar mustache Williamsburg echo park Cosby Sweater. Keytar Four Loko mustache chambray irony letterpress gentrify wolf lomo. Synth party vice Marfa next level craft beer master cleanse chambray Williamsburg.	f	\N	5	2022-08-04 18:33:19.747069	2022-08-04 18:33:19.747069
139	Next level cred ethical Wes Anderson Shoreditch Cosby Sweater organic aesthetic freegan. Iphone aesthetic letterpress Rerry Richardson messenger bag. Ethical vice American Apparel organic Carles irony echo park. Lo-fi Carles aesthetic echo park Pitchfork mlkshk vice.	f	\N	11	2022-08-04 18:33:19.750201	2022-08-04 18:33:19.750201
140	Brooklyn keffiyeh squid vice gentrify. Portland keffiyeh hoodie stumptown DIY sustainable Pitchfork fap Williamsburg. Next level McSweeney's 8-bit Austin +1 farm-to-table. Aesthetic echo park dreamcatcher etsy fanny pack food truck vegan synth artisan. Wayfarers Cosby Sweater cliche food truck iPhone VHS sustainable yr.	f	\N	16	2022-08-04 18:33:19.753027	2022-08-04 18:33:19.753027
141	Wolf ethical lo-fi letterpress trust fund cred Shoreditch. Rerry richardson skateboard scenester mlkshk messenger bag. Squid tofu readymade seitan thundercats hoodie fixie beard Banksy. Four loko iPhone Wayfarers locavore helvetica PBR Pitchfork leggings Portland. Blog bicycle rights vegan hoodie Wes Anderson retro lo-fi salvia helvetica.	f	\N	13	2022-08-04 18:33:19.756088	2022-08-04 18:33:19.756088
142	Cosby sweater hoodie vinyl Wayfarers photo booth tofu mustache. Mlkshk tumblr trust fund fanny pack American Apparel. Blog McSweeney's raw denim beard next level photo booth Banksy. Keytar mustache vegan cardigan etsy Carles keffiyeh retro. Diy +1 bicycle rights etsy fap Williamsburg.	f	\N	11	2022-08-04 18:33:19.758954	2022-08-04 18:33:19.758954
143	Artisan tumblr Wes Anderson ethical put a bird on it raw denim brunch cardigan. Squid lo-fi Carles blog chambray Portland. Tattooed farm-to-table you probably haven't heard of them thundercats bicycle rights leggings Cosby Sweater 8-bit quinoa.	f	\N	11	2022-08-04 18:33:19.761895	2022-08-04 18:33:19.761895
144	Tattooed blog vegan farm-to-table tumblr Carles. Trust fund vegan viral gentrify butcher. Quinoa keffiyeh lo-fi blog gentrify squid.	f	\N	16	2022-08-04 18:33:19.76501	2022-08-04 18:33:19.76501
145	Blog leggings Shoreditch raw denim irony. Etsy iPhone helvetica squid lomo. Raw denim dreamcatcher beard craft beer you probably haven't heard of them yr seitan. Brooklyn seitan Austin Marfa scenester.	f	\N	5	2022-08-04 18:33:19.767796	2022-08-04 18:33:19.767796
146	Wayfarers lo-fi next level American Apparel tofu locavore aesthetic seitan organic. Vegan twee aesthetic sartorial photo booth fap Four Loko. Tumblr letterpress gluten-free iPhone echo park McSweeney's.	f	\N	14	2022-08-04 18:33:19.770542	2022-08-04 18:33:19.770542
147	Austin Rerry Richardson DIY mustache party mixtape. Mixtape trust fund locavore single-origin coffee iPhone tumblr stumptown seitan irony. Twee Portland letterpress salvia readymade mustache. Fanny pack locavore banh mi mixtape biodiesel Shoreditch before they sold out.	f	\N	15	2022-08-04 18:33:19.773562	2022-08-04 18:33:19.773562
148	Shoreditch master cleanse raw denim moon mlkshk jean shorts thundercats. Wolf party seitan American Apparel helvetica. Leggings messenger bag Austin organic helvetica tumblr etsy stumptown Four Loko. Leggings keffiyeh lomo vegan Williamsburg Carles sartorial twee.	f	\N	2	2022-08-04 18:33:19.776375	2022-08-04 18:33:19.776375
149	Banksy letterpress hoodie Pitchfork DIY irony next level cardigan Williamsburg. Craft beer Banksy vegan DIY yr cliche single-origin coffee VHS chambray. Portland stumptown readymade VHS food truck brunch twee put a bird on it.	f	\N	20	2022-08-04 18:33:19.779115	2022-08-04 18:33:19.779115
150	Four loko raw denim high life chambray Banksy. Gentrify raw denim vice chambray single-origin coffee American Apparel. Art organic etsy helvetica twee. Mixtape lomo sartorial letterpress vice craft beer VHS. Vegan sartorial mustache readymade Austin.	f	\N	12	2022-08-04 18:33:19.782634	2022-08-04 18:33:19.782634
151	Vinyl cred irony retro vice viral locavore etsy chambray. Bicycle rights mustache Banksy lomo dreamcatcher hoodie art. Vinyl mustache hoodie mlkshk gluten-free Williamsburg DIY wolf. Williamsburg iPhone Banksy squid farm-to-table etsy stumptown ethical. Put a bird on it Pitchfork Shoreditch gluten-free tumblr vice Rerry Richardson.	f	\N	18	2022-08-04 18:33:19.785843	2022-08-04 18:33:19.785843
152	Thundercats scenester Four Loko yr freegan fanny pack. Sustainable jean shorts raw denim tattooed farm-to-table. Whatever high life Carles craft beer biodiesel iPhone next level. Keffiyeh retro synth Pitchfork freegan leggings Williamsburg. Food truck Portland viral sustainable PBR quinoa fixie American Apparel.	f	\N	6	2022-08-04 18:33:19.790459	2022-08-04 18:33:19.790459
153	Single-origin coffee retro mustache mlkshk butcher gentrify trust fund. Lo-fi before they sold out viral Banksy tofu helvetica scenester biodiesel tumblr. Photo booth Portland aesthetic PBR biodiesel high life twee art Austin.	f	\N	16	2022-08-04 18:33:19.793786	2022-08-04 18:33:19.793786
154	Next level McSweeney's sartorial tattooed cliche single-origin coffee. Wes anderson trust fund ethical PBR vice lomo freegan. Fap tofu messenger bag lo-fi Austin Cosby Sweater VHS readymade.	f	\N	6	2022-08-04 18:33:19.796911	2022-08-04 18:33:19.796911
155	Mixtape master cleanse cliche Brooklyn whatever brunch etsy. Sartorial lomo stumptown sustainable dreamcatcher Carles. Readymade party blog sustainable Austin Wayfarers high life vegan Shoreditch. Twee VHS Carles salvia fixie blog. Thundercats organic Wayfarers keffiyeh vice.	f	\N	17	2022-08-04 18:33:19.799895	2022-08-04 18:33:19.799895
156	Hoodie Wayfarers blog high life gentrify leggings irony Brooklyn. Banksy sartorial thundercats yr Four Loko Brooklyn. Cosby sweater cliche vegan jean shorts quinoa dreamcatcher helvetica biodiesel.	f	\N	4	2022-08-04 18:33:19.803438	2022-08-04 18:33:19.803438
157	Brunch +1 high life readymade Wayfarers DIY aesthetic gluten-free. Beard Brooklyn Wes Anderson photo booth Austin readymade sustainable yr. Fanny pack jean shorts skateboard high life biodiesel fap organic. Echo park single-origin coffee helvetica keytar banh mi. Moon stumptown locavore keytar scenester Cosby Sweater Wayfarers McSweeney's.	f	\N	13	2022-08-04 18:33:19.806263	2022-08-04 18:33:19.806263
158	Diy etsy synth leggings moon thundercats. Mcsweeney's skateboard jean shorts high life messenger bag fixie iPhone DIY. Single-origin coffee skateboard artisan cred vice thundercats.	f	\N	12	2022-08-04 18:33:19.809474	2022-08-04 18:33:19.809474
159	Iphone mustache butcher tumblr aesthetic. Organic moon freegan photo booth mlkshk Williamsburg. Vice freegan sartorial echo park readymade lo-fi chambray. Gluten-free next level PBR vice farm-to-table biodiesel whatever. Yr vice squid twee butcher PBR Banksy party skateboard.	f	\N	18	2022-08-04 18:33:19.812178	2022-08-04 18:33:19.812178
160	Biodiesel freegan whatever craft beer vinyl Carles. Banh mi Portland fixie squid hoodie tofu letterpress. American apparel tumblr tattooed sustainable lomo.	f	\N	7	2022-08-04 18:33:19.815878	2022-08-04 18:33:19.815878
161	Echo park trust fund squid Marfa craft beer irony aesthetic twee artisan. Mustache quinoa squid Rerry Richardson readymade VHS. Yr cardigan Banksy 8-bit fanny pack Williamsburg. High life scenester thundercats keytar iPhone put a bird on it Four Loko farm-to-table Pitchfork.	f	\N	13	2022-08-04 18:33:19.819205	2022-08-04 18:33:19.819205
162	Four loko blog fixie sustainable Williamsburg. Vhs next level put a bird on it echo park photo booth Shoreditch beard Wes Anderson. Wayfarers VHS tattooed vinyl biodiesel.	f	\N	5	2022-08-04 18:33:19.82216	2022-08-04 18:33:19.82216
163	Rerry richardson scenester synth artisan lomo banh mi sartorial. Sartorial scenester Williamsburg gluten-free echo park ethical chambray. Echo park next level beard fanny pack sartorial leggings McSweeney's Rerry Richardson trust fund. Put a bird on it raw denim +1 fixie letterpress scenester.	f	\N	16	2022-08-04 18:33:19.825099	2022-08-04 18:33:19.825099
164	Sartorial biodiesel tofu photo booth letterpress fap Wayfarers mustache bicycle rights. Gluten-free bicycle rights Williamsburg brunch mixtape craft beer farm-to-table Portland quinoa. Iphone you probably haven't heard of them Four Loko PBR biodiesel organic Rerry Richardson sustainable. Photo booth gentrify 8-bit sustainable raw denim put a bird on it scenester. Vegan master cleanse cliche lo-fi sustainable +1 Portland.	f	\N	6	2022-08-04 18:33:19.828135	2022-08-04 18:33:19.828135
165	Blog Williamsburg next level photo booth locavore biodiesel. Sustainable moon bicycle rights Shoreditch scenester helvetica freegan. Chambray moon Williamsburg Portland trust fund Austin put a bird on it salvia. Master cleanse twee irony +1 skateboard. Farm-to-table 8-bit Four Loko American Apparel readymade.	f	\N	9	2022-08-04 18:33:19.830943	2022-08-04 18:33:19.830943
166	Single-origin coffee retro artisan blog chambray art irony synth. Cardigan photo booth butcher sartorial before they sold out next level PBR. Squid quinoa tofu chambray thundercats high life leggings. Gluten-free biodiesel cliche raw denim viral. Letterpress skateboard cardigan Carles iPhone readymade PBR vinyl McSweeney's.	f	\N	1	2022-08-04 18:33:19.833761	2022-08-04 18:33:19.833761
167	Vegan mlkshk readymade tattooed messenger bag tumblr put a bird on it. Organic hoodie raw denim Shoreditch mlkshk skateboard. Vhs vinyl PBR DIY Pitchfork cliche.	f	\N	6	2022-08-04 18:33:19.836531	2022-08-04 18:33:19.836531
168	Vice Brooklyn cliche gluten-free irony synth. Sartorial chambray gentrify stumptown biodiesel. Master cleanse Portland skateboard Williamsburg Wes Anderson wolf lo-fi fap. Yr irony sustainable art leggings put a bird on it. Helvetica retro thundercats chambray Austin.	f	\N	19	2022-08-04 18:33:19.839114	2022-08-04 18:33:19.839114
169	Lo-fi mustache biodiesel Carles seitan fixie. Next level tumblr PBR lomo echo park. Scenester high life tattooed food truck banh mi. Austin you probably haven't heard of them raw denim squid retro lomo. Master cleanse wolf mustache +1 Austin stumptown McSweeney's thundercats sustainable.	f	\N	18	2022-08-04 18:33:19.841918	2022-08-04 18:33:19.841918
170	Mlkshk fixie Williamsburg art salvia lomo master cleanse irony tattooed. Stumptown art thundercats sartorial retro fap tofu next level. Party aesthetic cliche irony locavore chambray Four Loko biodiesel. Letterpress thundercats squid Carles mustache Portland readymade fap synth.	f	\N	2	2022-08-04 18:33:19.844666	2022-08-04 18:33:19.844666
171	Stumptown photo booth aesthetic etsy high life twee American Apparel organic. Mustache PBR lomo before they sold out 8-bit. Mustache +1 Pitchfork scenester bicycle rights you probably haven't heard of them gluten-free. Portland etsy tofu stumptown helvetica.	f	\N	4	2022-08-04 18:33:19.847311	2022-08-04 18:33:19.847311
172	Next level fixie Rerry Richardson messenger bag craft beer ethical sartorial. Wes anderson single-origin coffee Wayfarers messenger bag Four Loko viral Marfa helvetica VHS. Tattooed Portland trust fund art butcher before they sold out master cleanse Wayfarers skateboard.	f	\N	8	2022-08-04 18:33:19.85006	2022-08-04 18:33:19.85006
173	Letterpress farm-to-table aesthetic etsy bicycle rights mustache. Squid Marfa VHS yr McSweeney's vegan Portland artisan organic. Pbr sustainable lomo fanny pack tofu echo park synth.	f	\N	6	2022-08-04 18:33:19.852918	2022-08-04 18:33:19.852918
174	Irony Four Loko craft beer skateboard party quinoa Wayfarers food truck etsy. Mlkshk thundercats mixtape ethical squid freegan keytar leggings. You probably haven't heard of them art Pitchfork irony iPhone hoodie fap fixie American Apparel. Pitchfork before they sold out helvetica Shoreditch wolf.	f	\N	7	2022-08-04 18:33:19.855809	2022-08-04 18:33:19.855809
175	Bicycle rights blog Brooklyn vegan moon. Lomo Brooklyn helvetica brunch cred mustache Austin leggings. Scenester fixie readymade Rerry Richardson farm-to-table.	f	\N	8	2022-08-04 18:33:19.858806	2022-08-04 18:33:19.858806
176	Rerry richardson whatever McSweeney's jean shorts blog organic butcher. Banksy fap tattooed trust fund hoodie seitan butcher ethical Wes Anderson. High life stumptown American Apparel Brooklyn sustainable. Artisan Marfa master cleanse photo booth locavore. Marfa quinoa photo booth vice butcher.	f	\N	14	2022-08-04 18:33:19.861494	2022-08-04 18:33:19.861494
177	Gentrify Pitchfork vinyl thundercats brunch. Retro wolf cliche iPhone freegan. Cred helvetica hoodie food truck McSweeney's. Vegan sartorial keytar blog craft beer synth.	f	\N	14	2022-08-04 18:33:19.864173	2022-08-04 18:33:19.864173
178	Salvia bicycle rights Marfa jean shorts retro tumblr +1 trust fund. Irony dreamcatcher before they sold out chambray photo booth next level. Readymade viral master cleanse Banksy artisan cliche American Apparel Austin. Biodiesel Carles high life you probably haven't heard of them tumblr tofu cardigan.	f	\N	10	2022-08-04 18:33:19.867182	2022-08-04 18:33:19.867182
179	Vice aesthetic etsy Portland stumptown. Vice American Apparel Williamsburg salvia artisan trust fund locavore fap brunch. Retro farm-to-table Williamsburg keytar synth hoodie. Cosby sweater Pitchfork synth tattooed brunch moon.	f	\N	6	2022-08-04 18:33:19.870142	2022-08-04 18:33:19.870142
180	You probably haven't heard of them biodiesel Wayfarers cardigan mlkshk lo-fi. Four loko readymade twee letterpress gentrify tattooed Rerry Richardson. Iphone 8-bit lo-fi ethical jean shorts gentrify master cleanse Wes Anderson locavore. Sartorial raw denim Cosby Sweater food truck tofu scenester. Wolf aesthetic jean shorts Rerry Richardson ethical dreamcatcher.	f	\N	13	2022-08-04 18:33:19.873236	2022-08-04 18:33:19.873236
181	Stumptown wolf Austin chambray photo booth synth Wayfarers. Rerry richardson Marfa hoodie messenger bag mixtape. Rerry richardson mlkshk whatever yr lomo sartorial fixie.	f	\N	16	2022-08-04 18:33:19.876296	2022-08-04 18:33:19.876296
182	Yr next level echo park tofu dreamcatcher tumblr farm-to-table Williamsburg. Single-origin coffee messenger bag yr mixtape raw denim twee dreamcatcher jean shorts mustache. Pbr fap Williamsburg photo booth artisan.	f	\N	9	2022-08-04 18:33:19.879168	2022-08-04 18:33:19.879168
183	Iphone fap fixie scenester jean shorts Banksy yr lo-fi readymade. Viral whatever Shoreditch Pitchfork lo-fi vinyl art iPhone. Food truck readymade beard vice Brooklyn butcher raw denim photo booth iPhone. Iphone hoodie mixtape Williamsburg Austin fanny pack dreamcatcher.	f	\N	16	2022-08-04 18:33:19.881896	2022-08-04 18:33:19.881896
184	Chambray VHS vinyl beard photo booth skateboard Marfa. Vinyl yr keffiyeh stumptown gluten-free Williamsburg gentrify. Diy Marfa butcher PBR letterpress art. Cardigan before they sold out Carles American Apparel fixie.	f	\N	16	2022-08-04 18:33:19.884588	2022-08-04 18:33:19.884588
185	Marfa high life gentrify artisan vegan sartorial photo booth Portland Cosby Sweater. +1 high life Williamsburg mustache hoodie single-origin coffee. Craft beer irony letterpress Austin blog Carles 8-bit art Wes Anderson.	f	\N	1	2022-08-04 18:33:19.887167	2022-08-04 18:33:19.887167
186	Tofu irony Brooklyn moon Williamsburg Cosby Sweater. Salvia sustainable PBR you probably haven't heard of them high life iPhone. Retro messenger bag salvia Carles fanny pack Portland. Raw denim tattooed farm-to-table Four Loko before they sold out.	f	\N	6	2022-08-04 18:33:19.889674	2022-08-04 18:33:19.889674
187	Sustainable scenester mixtape Shoreditch Brooklyn Carles blog vegan. High life quinoa stumptown sustainable leggings echo park Four Loko. Yr artisan lo-fi vinyl viral put a bird on it lomo blog cred. Vinyl you probably haven't heard of them quinoa etsy art single-origin coffee. Synth ethical Wes Anderson Four Loko salvia viral hoodie.	f	\N	1	2022-08-04 18:33:19.892352	2022-08-04 18:33:19.892352
188	Etsy farm-to-table Rerry Richardson Shoreditch Pitchfork mlkshk. Master cleanse Portland helvetica before they sold out photo booth sartorial. Diy cliche cardigan irony biodiesel. Sustainable gentrify artisan irony blog vinyl mustache. Bicycle rights retro blog messenger bag DIY Rerry Richardson Marfa gluten-free stumptown.	f	\N	3	2022-08-04 18:33:19.895133	2022-08-04 18:33:19.895133
189	Organic letterpress sartorial messenger bag PBR Cosby Sweater synth skateboard. Organic beard synth messenger bag locavore art wolf. Lo-fi scenester McSweeney's stumptown PBR jean shorts butcher Banksy.	f	\N	9	2022-08-04 18:33:19.898268	2022-08-04 18:33:19.898268
190	Ethical photo booth moon salvia fixie tumblr food truck letterpress. Viral Brooklyn single-origin coffee sustainable +1 thundercats echo park. Marfa Williamsburg keffiyeh locavore Cosby Sweater.	f	\N	2	2022-08-04 18:33:19.90104	2022-08-04 18:33:19.90104
191	Salvia Wayfarers Carles cred raw denim McSweeney's stumptown sustainable scenester. Wolf keytar stumptown Marfa chambray yr quinoa viral raw denim. Mlkshk DIY jean shorts Wayfarers Rerry Richardson twee. Blog etsy cred keytar Shoreditch lomo tumblr trust fund.	f	\N	12	2022-08-04 18:33:19.903675	2022-08-04 18:33:19.903675
192	Pbr retro Brooklyn Four Loko seitan Portland. Mcsweeney's raw denim wolf vice Wes Anderson PBR helvetica mlkshk +1. Seitan artisan high life party ethical Four Loko.	f	\N	14	2022-08-04 18:33:19.906656	2022-08-04 18:33:19.906656
193	Fap squid banh mi Banksy iPhone Portland. Fixie jean shorts leggings hoodie Brooklyn cardigan next level. Beard sustainable DIY etsy stumptown. Readymade sartorial mlkshk you probably haven't heard of them gentrify. Brunch butcher fanny pack tattooed Brooklyn scenester iPhone Cosby Sweater yr.	f	\N	20	2022-08-04 18:33:19.909493	2022-08-04 18:33:19.909493
194	Sustainable squid twee PBR Rerry Richardson. Stumptown fap put a bird on it next level echo park McSweeney's trust fund. Chambray Portland put a bird on it Pitchfork cliche irony echo park beard.	f	\N	15	2022-08-04 18:33:19.912047	2022-08-04 18:33:19.912047
195	Cosby sweater hoodie viral trust fund Austin ethical chambray. Synth mustache ethical irony party next level thundercats Cosby Sweater biodiesel. Pbr +1 viral banh mi artisan craft beer. Messenger bag thundercats party master cleanse VHS sustainable iPhone. Echo park sustainable keytar quinoa squid cliche gentrify.	f	\N	7	2022-08-04 18:33:19.914632	2022-08-04 18:33:19.914632
196	American apparel Wes Anderson sustainable iPhone fanny pack Banksy readymade freegan. Portland raw denim cred tumblr dreamcatcher messenger bag. Biodiesel craft beer +1 tattooed art thundercats.	f	\N	7	2022-08-04 18:33:19.917395	2022-08-04 18:33:19.917395
197	Wolf fixie chambray etsy put a bird on it quinoa ethical before they sold out +1. Mustache art retro scenester cardigan freegan iPhone. Fap thundercats next level dreamcatcher locavore retro before they sold out.	f	\N	12	2022-08-04 18:33:19.920039	2022-08-04 18:33:19.920039
198	Marfa Brooklyn synth food truck helvetica thundercats vegan tattooed. Leggings vegan fanny pack viral sartorial Pitchfork irony Banksy. Organic +1 freegan lomo viral. Sustainable ethical yr locavore before they sold out Marfa.	f	\N	1	2022-08-04 18:33:19.922673	2022-08-04 18:33:19.922673
199	Sartorial vinyl iPhone American Apparel Rerry Richardson squid. Irony Brooklyn artisan photo booth fap ethical. Art Four Loko viral jean shorts PBR.	f	\N	10	2022-08-04 18:33:19.925246	2022-08-04 18:33:19.925246
200	Skateboard lomo scenester McSweeney's DIY art tumblr. Carles DIY Portland freegan ethical. Fanny pack etsy quinoa Brooklyn fixie. Twee you probably haven't heard of them irony hoodie mixtape party tattooed.	f	\N	11	2022-08-04 18:33:19.927741	2022-08-04 18:33:19.927741
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.roles (id, name, code, created_at, updated_at) FROM stdin;
1	Пользователь	default	2022-08-04 18:33:19.007941	2022-08-04 18:33:19.007941
2	Администратор	admin	2022-08-04 18:33:19.011978	2022-08-04 18:33:19.011978
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.schema_migrations (version) FROM stdin;
20211209181300
20211213161839
20211213161931
20211213161957
20211216180727
20211216183413
20211216185257
20220111180720
20220301172813
20220303171133
20220329171906
20220329172415
20220329173747
20220329181906
20220405172930
20220405181944
20220405184106
\.


--
-- Data for Name: traffic_lights; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.traffic_lights (id, address, created_at, updated_at, state, active) FROM stdin;
\.


--
-- Data for Name: tree_comments; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.tree_comments (id, parent_id, child_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jenkins
--

COPY public.users (id, name, email, active, created_at, updated_at, role_id, events_count, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM stdin;
1	администратор	admin@example.com	t	2022-08-04 18:33:19.045141	2022-08-04 18:33:19.045141	2	0	$2a$04$uPADCIRfsChP4pQ6nbk.cuws/xwmJPTu1v2Yu9vYz7KTWyXGUcYRe	\N	\N	\N	0	\N	\N	\N	\N
4	Chieko	alfredia@example.org	t	2022-08-04 18:33:19.075747	2022-08-04 18:33:19.075747	1	0	$2a$04$S4tQT0otUNqHNu4e9emncOLJ8Q1CIYgyYWTDv2ppL1z/5falXyPSG	\N	\N	\N	0	\N	\N	\N	\N
3	Eliza Bailey	olevia@example.org	t	2022-08-04 18:33:19.069586	2022-08-04 18:33:19.069586	1	2	$2a$04$6WulpqDJ8dvH6POojuaawu0WcKscej9jvm9.QE74QmbqV9yhsuu8i	\N	\N	\N	0	\N	\N	\N	\N
5	Epifania	eun@example.com	t	2022-08-04 18:33:19.081818	2022-08-04 18:33:19.081818	1	1	$2a$04$BwY3WQgyM6G.7rK2x7.quOVekI7R9bkaWwsbm/b9cPGlRulXOv8Xe	\N	\N	\N	0	\N	\N	\N	\N
7	Brice Schuster	carroll.corkery@example.org	t	2022-08-04 18:33:19.093945	2022-08-04 18:33:19.093945	1	1	$2a$04$9nTVobCHLINTnVVNc2fKGuuzPjXhTUlb6mVQpa8p7nAp8/Yt.G3ba	\N	\N	\N	0	\N	\N	\N	\N
8	Ute Barton	eunice@example.net	t	2022-08-04 18:33:19.099901	2022-08-04 18:33:19.099901	1	2	$2a$04$/D4hAx0l3wO2QlhDGyuWF.QjlZ2mLcCb1Rl6eLuEzoJfc9ZrEAqAe	\N	\N	\N	0	\N	\N	\N	\N
2	Laura	felicia@example.net	t	2022-08-04 18:33:19.06293	2022-08-04 18:33:19.06293	1	2	$2a$04$1idlYG.0EwN/zQKrkUt85OgageIcVuhV0O8U2q/U43/v3Yb4.gt/K	\N	\N	\N	0	\N	\N	\N	\N
10	Genevieve Reilly	juliana@example.net	t	2022-08-04 18:33:19.112601	2022-08-04 18:33:19.112601	1	4	$2a$04$6Zr955JFiAf34IFwbJ6uHuhUui4w6RmZqVuNgb9fT/KdcCQrkvHKm	\N	\N	\N	0	\N	\N	\N	\N
6	Ulysses.Beer	mariana@example.com	t	2022-08-04 18:33:19.087578	2022-08-04 18:33:19.087578	1	4	$2a$04$QuXCe2yi6mFS8ta6dzU4pefiBSL0ce72TtKhRxv4J9O5UjXffgCIS	\N	\N	\N	0	\N	\N	\N	\N
9	Sparkle.Grady	doreen@example.net	t	2022-08-04 18:33:19.10625	2022-08-04 18:33:19.10625	1	2	$2a$04$XRE2mx5.cr84YsTJBlCUGetlLxpaz4dVh.MhguU9sBGrLKZM0U4rG	\N	\N	\N	0	\N	\N	\N	\N
11	Cassie	adolph@example.net	t	2022-08-04 18:33:19.118542	2022-08-04 18:33:19.118542	1	2	$2a$04$bzwhGn1S6XrUKGrsQj9yJO5XiipxY2eoED5F/IvJh5zoRjCR.6xR6	\N	\N	\N	0	\N	\N	\N	\N
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.comments_id_seq', 100, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.events_id_seq', 20, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.items_id_seq', 200, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: traffic_lights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.traffic_lights_id_seq', 1, false);


--
-- Name: tree_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.tree_comments_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jenkins
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: traffic_lights traffic_lights_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.traffic_lights
    ADD CONSTRAINT traffic_lights_pkey PRIMARY KEY (id);


--
-- Name: tree_comments tree_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.tree_comments
    ADD CONSTRAINT tree_comments_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_active_admin_comments_on_author ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_active_admin_comments_on_resource ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_comments_on_commentable; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_comments_on_commentable ON public.comments USING btree (commentable_type, commentable_id);


--
-- Name: index_comments_on_parent_id; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_comments_on_parent_id ON public.comments USING btree (parent_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_events_on_user_id; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_events_on_user_id ON public.events USING btree (user_id);


--
-- Name: index_items_on_event_id; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_items_on_event_id ON public.items USING btree (event_id);


--
-- Name: index_tree_comments_on_child_id; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE INDEX index_tree_comments_on_child_id ON public.tree_comments USING btree (child_id);


--
-- Name: index_tree_comments_on_parent_id_and_child_id; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE UNIQUE INDEX index_tree_comments_on_parent_id_and_child_id ON public.tree_comments USING btree (parent_id, child_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_name; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE UNIQUE INDEX index_users_on_name ON public.users USING btree (name);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: jenkins
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: events fk_rails_0cb5590091; Type: FK CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_0cb5590091 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users fk_rails_642f17018b; Type: FK CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: items fk_rails_7c292ae2fe; Type: FK CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_7c292ae2fe FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: jenkins
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

