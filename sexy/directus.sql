--
-- PostgreSQL database dump
--

\restrict fZoRqDC2go4frRFN7OarPWk2QjDg1msDEUS1707oFzKeEomuTOuGERnuVObcarJ

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

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

SET default_table_access_method = heap;

--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO sexy;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO sexy;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO sexy;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO sexy;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO sexy;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO sexy;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO sexy;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO sexy;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO sexy;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO sexy;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO sexy;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO sexy;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO sexy;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO sexy;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO sexy;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO sexy;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO sexy;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO sexy;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO sexy;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO sexy;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO sexy;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO sexy;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO sexy;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO sexy;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO sexy;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO sexy;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO sexy;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO sexy;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    accepted_terms boolean DEFAULT false,
    project_id uuid,
    mcp_enabled boolean DEFAULT false NOT NULL,
    mcp_allow_deletes boolean DEFAULT false NOT NULL,
    mcp_prompts_collection character varying(255) DEFAULT NULL::character varying,
    mcp_system_prompt_enabled boolean DEFAULT true NOT NULL,
    mcp_system_prompt text
);


ALTER TABLE public.directus_settings OWNER TO sexy;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO sexy;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO sexy;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO sexy;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);


ALTER TABLE public.directus_users OWNER TO sexy;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO sexy;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO sexy;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO sexy;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: junction_directus_users_files; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.junction_directus_users_files (
    id integer NOT NULL,
    directus_users_id uuid,
    directus_files_id uuid
);


ALTER TABLE public.junction_directus_users_files OWNER TO sexy;

--
-- Name: junction_directus_users_files_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.junction_directus_users_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.junction_directus_users_files_id_seq OWNER TO sexy;

--
-- Name: junction_directus_users_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.junction_directus_users_files_id_seq OWNED BY public.junction_directus_users_files.id;


--
-- Name: sexy_articles; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.sexy_articles (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    slug character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    excerpt text,
    content text,
    image uuid NOT NULL,
    tags json,
    publish_date timestamp without time zone,
    category character varying(255) DEFAULT NULL::character varying,
    featured boolean DEFAULT false,
    author uuid
);


ALTER TABLE public.sexy_articles OWNER TO sexy;

--
-- Name: sexy_recordings; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.sexy_recordings (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    description text,
    slug character varying(255) DEFAULT NULL::character varying NOT NULL,
    duration double precision NOT NULL,
    events json NOT NULL,
    device_info json NOT NULL,
    tags json,
    linked_video uuid,
    featured boolean DEFAULT false,
    public boolean DEFAULT false
);


ALTER TABLE public.sexy_recordings OWNER TO sexy;

--
-- Name: sexy_video_likes; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.sexy_video_likes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    video_id uuid NOT NULL,
    user_id uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sexy_video_likes OWNER TO sexy;

--
-- Name: sexy_video_plays; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.sexy_video_plays (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    video_id uuid NOT NULL,
    user_id uuid,
    session_id character varying(255),
    duration_watched integer DEFAULT 0,
    completed boolean DEFAULT false,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sexy_video_plays OWNER TO sexy;

--
-- Name: sexy_videos; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.sexy_videos (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    slug character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    image uuid,
    upload_date timestamp without time zone,
    premium boolean,
    featured boolean,
    tags json,
    movie uuid,
    description text,
    likes_count integer DEFAULT 0,
    plays_count integer DEFAULT 0,
    views_count integer DEFAULT 0
);


ALTER TABLE public.sexy_videos OWNER TO sexy;

--
-- Name: sexy_videos_directus_users; Type: TABLE; Schema: public; Owner: sexy
--

CREATE TABLE public.sexy_videos_directus_users (
    id integer NOT NULL,
    sexy_videos_id uuid,
    directus_users_id uuid
);


ALTER TABLE public.sexy_videos_directus_users OWNER TO sexy;

--
-- Name: sexy_videos_directus_users_id_seq; Type: SEQUENCE; Schema: public; Owner: sexy
--

CREATE SEQUENCE public.sexy_videos_directus_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sexy_videos_directus_users_id_seq OWNER TO sexy;

--
-- Name: sexy_videos_directus_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sexy
--

ALTER SEQUENCE public.sexy_videos_directus_users_id_seq OWNED BY public.sexy_videos_directus_users.id;


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: junction_directus_users_files id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.junction_directus_users_files ALTER COLUMN id SET DEFAULT nextval('public.junction_directus_users_files_id_seq'::regclass);


--
-- Name: sexy_videos_directus_users id; Type: DEFAULT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos_directus_users ALTER COLUMN id SET DEFAULT nextval('public.sexy_videos_directus_users_id_seq'::regclass);


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
f8ce93a1-e89a-4fef-92f9-506771d8996e	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
6130664d-5841-49cb-b8ae-22e96a742026	9ba6b595-65e3-4c96-a45e-44a1f6ff2a02	\N	e74c4f1f-cf95-4689-9fac-619703a7a316	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	2025-10-28 03:42:39.719+00	172.20.0.1	curl/8.14.1	directus_users	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	\N
2	login	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	2025-10-28 03:44:35.702+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	directus_users	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	http://localhost:3000
3	login	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	2025-10-28 03:47:41.794+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	directus_users	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	http://localhost:3000
4	create	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	2025-10-28 04:15:35.61+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	sexy_recordings	1ff93997-a606-4442-9448-0180cc3a810f	http://localhost:3000
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
junction_directus_users_files	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
sexy_articles	newsmode	\N	\N	f	f	[{"language":"en-US","plural":"Articles","singular":"Article","translation":"Sexy Articles"}]	status	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	t
sexy_videos	videocam	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	f
sexy_videos_directus_users	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
sexy_recordings	fiber_manual_record	\N	\N	f	f	[{"language":"en-US","plural":"Recordings","singular":"Recording","translation":"Sexy Recordings"}]	status	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
t	55353e93-1736-4fb7-a0ef-7a4824cf8dcc	sexy.pivoine.art	local	\N
t	3cb32824-9324-4265-b0cd-f10ed1a82bb0	endpoint	local	55353e93-1736-4fb7-a0ef-7a4824cf8dcc
t	7714b5fb-202b-416d-be27-eeb3a5c24300	hook	local	55353e93-1736-4fb7-a0ef-7a4824cf8dcc
t	fa303a44-5e8f-46cf-9f35-20ef647fd74f	theme	local	55353e93-1736-4fb7-a0ef-7a4824cf8dcc
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
106	junction_directus_users_files	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
107	junction_directus_users_files	directus_users_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
108	junction_directus_users_files	directus_files_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
109	sexy_articles	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
110	sexy_articles	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
111	sexy_articles	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
112	sexy_articles	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
113	sexy_articles	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
114	sexy_articles	slug	\N	input	{"slug":true}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
115	sexy_articles	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
116	sexy_articles	excerpt	\N	input-multiline	{"trim":true}	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
117	sexy_articles	content	\N	input-rich-text-html	{"folder":"c214c905-885b-4d66-a6a1-6527b0606200","toolbar":["bold","italic","underline","h2","h3","numlist","bullist","removeformat","blockquote","customLink","hr","fullscreen","code"]}	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
118	sexy_articles	image	file	file-image	{"folder":"452680cc-8e19-4352-a943-21520d3f3621"}	\N	\N	f	f	11	full	\N	\N	\N	t	\N	\N	\N
119	sexy_articles	tags	cast-json	tags	{"capitalization":"auto-format","whitespace":"_"}	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
120	sexy_articles	publish_date	\N	datetime	\N	\N	\N	f	f	13	full	\N	\N	\N	t	\N	\N	\N
121	sexy_articles	category	\N	input	\N	\N	\N	f	f	14	full	\N	\N	\N	t	\N	\N	\N
122	sexy_articles	featured	cast-boolean	boolean	{"label":"Featured"}	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N
123	sexy_articles	author	m2o	select-dropdown-m2o	{"enableLink":true,"filter":{"_and":[{"policies":{"policy":{"name":{"_eq":"Editor"}}}}]}}	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
124	sexy_videos	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
125	sexy_videos	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
126	sexy_videos	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
127	sexy_videos	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
128	sexy_videos	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
129	sexy_videos	slug	\N	input	{"slug":true,"trim":true}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
130	sexy_videos	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
131	sexy_videos	image	file	file-image	{"folder":"26657630-d9cd-47a3-9e45-9831f3674f97"}	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
132	sexy_videos	upload_date	\N	datetime	\N	\N	\N	f	f	12	full	\N	\N	\N	t	\N	\N	\N
133	sexy_videos	premium	cast-boolean	boolean	{"label":"Premium"}	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
134	sexy_videos	featured	cast-boolean	boolean	{"label":"Featured"}	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N
135	sexy_videos	tags	cast-json	tags	\N	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N
136	sexy_videos	models	m2m	list-m2m	\N	\N	\N	f	f	11	full	\N	\N	\N	t	\N	\N	\N
137	sexy_videos	movie	file	file	{"filter":{"_and":[{"type":{"_eq":"video/mp4"}}]},"folder":"3f83c727-9c90-4e0d-871f-ab81c295043a"}	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
138	sexy_videos	description	\N	input-multiline	{"trim":true}	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
139	sexy_videos_directus_users	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
140	sexy_videos_directus_users	sexy_videos_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
141	sexy_videos_directus_users	directus_users_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
142	sexy_recordings	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
143	sexy_recordings	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
144	sexy_recordings	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
145	sexy_recordings	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
146	sexy_recordings	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
147	sexy_recordings	title	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
148	sexy_recordings	description	\N	input-multiline	{"trim":true}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
149	sexy_recordings	slug	\N	input	{"slug":true,"trim":true}	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
150	sexy_recordings	duration	\N	input	\N	\N	\N	f	f	9	full	\N	Duration in milliseconds	\N	t	\N	\N	\N
151	sexy_recordings	events	cast-json	input-code	{"language":"json"}	\N	\N	f	f	10	full	\N	Array of recorded events with timestamps	\N	t	\N	\N	\N
152	sexy_recordings	device_info	cast-json	input-code	{"language":"json"}	\N	\N	f	f	11	full	\N	Array of device metadata	\N	t	\N	\N	\N
153	sexy_recordings	tags	cast-json	tags	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
154	sexy_recordings	linked_video	m2o	select-dropdown-m2o	{"enableLink":true}	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
155	sexy_recordings	featured	cast-boolean	boolean	{"label":"Featured"}	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N
156	sexy_recordings	public	cast-boolean	boolean	{"label":"Public"}	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-10-28 03:32:58.684271+00
20201029A	Remove System Relations	2025-10-28 03:32:58.698505+00
20201029B	Remove System Collections	2025-10-28 03:32:58.725637+00
20201029C	Remove System Fields	2025-10-28 03:32:58.757542+00
20201105A	Add Cascade System Relations	2025-10-28 03:32:58.85519+00
20201105B	Change Webhook URL Type	2025-10-28 03:32:58.870505+00
20210225A	Add Relations Sort Field	2025-10-28 03:32:58.883634+00
20210304A	Remove Locked Fields	2025-10-28 03:32:58.892693+00
20210312A	Webhooks Collections Text	2025-10-28 03:32:58.907661+00
20210331A	Add Refresh Interval	2025-10-28 03:32:58.914254+00
20210415A	Make Filesize Nullable	2025-10-28 03:32:58.927453+00
20210416A	Add Collections Accountability	2025-10-28 03:32:58.936236+00
20210422A	Remove Files Interface	2025-10-28 03:32:58.942828+00
20210506A	Rename Interfaces	2025-10-28 03:32:58.979867+00
20210510A	Restructure Relations	2025-10-28 03:32:59.00972+00
20210518A	Add Foreign Key Constraints	2025-10-28 03:32:59.022836+00
20210519A	Add System Fk Triggers	2025-10-28 03:32:59.086483+00
20210521A	Add Collections Icon Color	2025-10-28 03:32:59.090625+00
20210525A	Add Insights	2025-10-28 03:32:59.123494+00
20210608A	Add Deep Clone Config	2025-10-28 03:32:59.128323+00
20210626A	Change Filesize Bigint	2025-10-28 03:32:59.153655+00
20210716A	Add Conditions to Fields	2025-10-28 03:32:59.158959+00
20210721A	Add Default Folder	2025-10-28 03:32:59.168181+00
20210802A	Replace Groups	2025-10-28 03:32:59.174699+00
20210803A	Add Required to Fields	2025-10-28 03:32:59.18078+00
20210805A	Update Groups	2025-10-28 03:32:59.186816+00
20210805B	Change Image Metadata Structure	2025-10-28 03:32:59.193989+00
20210811A	Add Geometry Config	2025-10-28 03:32:59.199739+00
20210831A	Remove Limit Column	2025-10-28 03:32:59.205655+00
20210903A	Add Auth Provider	2025-10-28 03:32:59.236712+00
20210907A	Webhooks Collections Not Null	2025-10-28 03:32:59.251736+00
20210910A	Move Module Setup	2025-10-28 03:32:59.261722+00
20210920A	Webhooks URL Not Null	2025-10-28 03:32:59.275885+00
20210924A	Add Collection Organization	2025-10-28 03:32:59.292604+00
20210927A	Replace Fields Group	2025-10-28 03:32:59.311499+00
20210927B	Replace M2M Interface	2025-10-28 03:32:59.316609+00
20210929A	Rename Login Action	2025-10-28 03:32:59.321869+00
20211007A	Update Presets	2025-10-28 03:32:59.333525+00
20211009A	Add Auth Data	2025-10-28 03:32:59.339321+00
20211016A	Add Webhook Headers	2025-10-28 03:32:59.345387+00
20211103A	Set Unique to User Token	2025-10-28 03:32:59.356496+00
20211103B	Update Special Geometry	2025-10-28 03:32:59.364849+00
20211104A	Remove Collections Listing	2025-10-28 03:32:59.371943+00
20211118A	Add Notifications	2025-10-28 03:32:59.40916+00
20211211A	Add Shares	2025-10-28 03:32:59.450737+00
20211230A	Add Project Descriptor	2025-10-28 03:32:59.457248+00
20220303A	Remove Default Project Color	2025-10-28 03:32:59.473663+00
20220308A	Add Bookmark Icon and Color	2025-10-28 03:32:59.481501+00
20220314A	Add Translation Strings	2025-10-28 03:32:59.487621+00
20220322A	Rename Field Typecast Flags	2025-10-28 03:32:59.494947+00
20220323A	Add Field Validation	2025-10-28 03:32:59.499961+00
20220325A	Fix Typecast Flags	2025-10-28 03:32:59.511118+00
20220325B	Add Default Language	2025-10-28 03:32:59.530999+00
20220402A	Remove Default Value Panel Icon	2025-10-28 03:32:59.547299+00
20220429A	Add Flows	2025-10-28 03:32:59.605959+00
20220429B	Add Color to Insights Icon	2025-10-28 03:32:59.613303+00
20220429C	Drop Non Null From IP of Activity	2025-10-28 03:32:59.617743+00
20220429D	Drop Non Null From Sender of Notifications	2025-10-28 03:32:59.621621+00
20220614A	Rename Hook Trigger to Event	2025-10-28 03:32:59.62504+00
20220801A	Update Notifications Timestamp Column	2025-10-28 03:32:59.636606+00
20220802A	Add Custom Aspect Ratios	2025-10-28 03:32:59.642464+00
20220826A	Add Origin to Accountability	2025-10-28 03:32:59.650881+00
20230401A	Update Material Icons	2025-10-28 03:32:59.668161+00
20230525A	Add Preview Settings	2025-10-28 03:32:59.675276+00
20230526A	Migrate Translation Strings	2025-10-28 03:32:59.693251+00
20230721A	Require Shares Fields	2025-10-28 03:32:59.705195+00
20230823A	Add Content Versioning	2025-10-28 03:32:59.743304+00
20230927A	Themes	2025-10-28 03:32:59.770296+00
20231009A	Update CSV Fields to Text	2025-10-28 03:32:59.778412+00
20231009B	Update Panel Options	2025-10-28 03:32:59.78408+00
20231010A	Add Extensions	2025-10-28 03:32:59.792771+00
20231215A	Add Focalpoints	2025-10-28 03:32:59.798812+00
20240122A	Add Report URL Fields	2025-10-28 03:32:59.806087+00
20240204A	Marketplace	2025-10-28 03:32:59.853393+00
20240305A	Change Useragent Type	2025-10-28 03:32:59.871576+00
20240311A	Deprecate Webhooks	2025-10-28 03:32:59.886447+00
20240422A	Public Registration	2025-10-28 03:32:59.896575+00
20240515A	Add Session Window	2025-10-28 03:32:59.902034+00
20240701A	Add Tus Data	2025-10-28 03:32:59.909099+00
20240716A	Update Files Date Fields	2025-10-28 03:32:59.918554+00
20240806A	Permissions Policies	2025-10-28 03:33:00.004654+00
20240817A	Update Icon Fields Length	2025-10-28 03:33:00.061847+00
20240909A	Separate Comments	2025-10-28 03:33:00.089917+00
20240909B	Consolidate Content Versioning	2025-10-28 03:33:00.098379+00
20240924A	Migrate Legacy Comments	2025-10-28 03:33:00.110287+00
20240924B	Populate Versioning Deltas	2025-10-28 03:33:00.11933+00
20250224A	Visual Editor	2025-10-28 03:33:00.127698+00
20250609A	License Banner	2025-10-28 03:33:00.139226+00
20250613A	Add Project ID	2025-10-28 03:33:00.155876+00
20250718A	Add Direction	2025-10-28 03:33:00.160718+00
20250813A	Add MCP	2025-10-28 03:33:00.171207+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
e74c4f1f-cf95-4689-9fac-619703a7a316	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	junction_directus_users_files	directus_files_id	directus_files	\N	\N	\N	directus_users_id	\N	nullify
2	junction_directus_users_files	directus_users_id	directus_users	photos	\N	\N	directus_files_id	\N	nullify
3	sexy_articles	user_created	directus_users	\N	\N	\N	\N	\N	nullify
4	sexy_articles	image	directus_files	\N	\N	\N	\N	\N	nullify
5	sexy_articles	author	directus_users	\N	\N	\N	\N	\N	nullify
6	sexy_videos	user_created	directus_users	\N	\N	\N	\N	\N	nullify
7	sexy_videos	image	directus_files	\N	\N	\N	\N	\N	nullify
8	sexy_videos	movie	directus_files	\N	\N	\N	\N	\N	nullify
9	sexy_videos_directus_users	directus_users_id	directus_users	\N	\N	\N	sexy_videos_id	\N	nullify
10	sexy_videos_directus_users	sexy_videos_id	sexy_videos	models	\N	\N	directus_users_id	\N	nullify
11	sexy_recordings	user_created	directus_users	\N	\N	\N	\N	\N	nullify
12	sexy_recordings	linked_video	sexy_videos	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	4	sexy_recordings	1ff93997-a606-4442-9448-0180cc3a810f	{"title":"test","description":"Claude!!!!","slug":"test","duration":12919.40000000596,"events":[{"timestamp":2582.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2753.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2760,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2766.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2774.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2781,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2789.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2797.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2807.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2814.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2828.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2840.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2846.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2857.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2865.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2878.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2885.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2900,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2911.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2921.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2930.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2941,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2948.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":3278.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":3292.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":3300.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":3310,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":3317.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":3334,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":3347.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3357,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3365.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3487.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3495.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3501.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3509.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":3523.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3533.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3541.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3548.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3561.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3569.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3582.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3589.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3602.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3610.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5958.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5965.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5971,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5978.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5987.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5996.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6005.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6012.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6021.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6033.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6043,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6048.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6061.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6070.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6077.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6085.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6094.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6104.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6110,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6117.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6134.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6141.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6147.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6160.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6168.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6177.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6183.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6193,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6200.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6209.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6219.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6228.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6235.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6246,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":6257.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":6268.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":6276.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":6288.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6297.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6305.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6315.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6529.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6623.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6632.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":6638.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":6645.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":6654.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":6668,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":6685.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":6695,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7278,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7289.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7296.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":7303.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":7311.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":7318.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":7330.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":7342.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":7443.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7587.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7603.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7611.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7618.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7630.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7636.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7645.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8389.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8397.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8404,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8412.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8432.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":8439.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8445.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8452.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8462,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8472.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8479.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8486.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8530.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":8557.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8564,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8571,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8580.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8590.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8599.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":8605.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":8612.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":8623.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":8634.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":8643.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":8649.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":8659.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8669.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8797.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8804.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8810,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8821.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8836,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8846.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":8856.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":8868,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8876.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8882,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8889.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8897.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":9056.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":9069.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9076.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9082,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9091.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9101.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9109.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9351.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9362.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9372.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":9380,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":9395.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9405.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9412.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9417.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9431.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9440.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9449.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9460.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9472.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9478.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9484.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9503.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9512.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9522.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9531.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9541.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9549.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9559,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9567.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9576.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9614.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10459.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10467.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10474.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10480.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10489.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10499.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10507.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10512.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10519.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10530.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10538.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10543.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10550.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10560.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10570.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10576.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10583.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10591.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10599.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10606.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":10613,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":10623.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":10635.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":10643.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":10649.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":10658.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10668.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10676.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10835.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10842.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10856.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":10865.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":10873,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":10880.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":10890.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":10905.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":10915,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":10923.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10939.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10948.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10986.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10994.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11000.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11013.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11023.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11029.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11038.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":11049.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":11063.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":11083,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":11100.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11116.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11148,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11232.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11274.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":11286.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11294.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11303.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11326.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11332.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11343.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11359.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":11369.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11393.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11403,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11410.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11417.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11426.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11491.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11498.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11499,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11512.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11524.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11536.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11544.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11580.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11589.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11676.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11684.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11694.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11701.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11711.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11722.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11725.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11787,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11796.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11802.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11813.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11825.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11834.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11844.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11859.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":11866.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12016.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12026.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12033,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12041.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12057.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":12068.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12078.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12129.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12135.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12144.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12161,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":12168.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12184.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":12195.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":12216.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12226.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12256,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12262.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12268.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12278.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12300.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":12310.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":12333,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":12347.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":12362.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12375,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":12392.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12757.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":12768.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12782.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":12792.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":12804,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":12831.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12838.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12898,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12905.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12919.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0}],"device_info":[{"name":"Lovense Lush","index":0,"capabilities":["Vibrate"]}],"tags":["Sexy"],"linked_video":null,"status":"draft","public":false}	{"title":"test","description":"Claude!!!!","slug":"test","duration":12919.40000000596,"events":[{"timestamp":2582.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2753.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2760,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2766.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2774.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2781,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2789.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2797.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2807.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2814.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2828.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2840.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2846.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2857.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2865.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2878.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2885.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2900,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2911.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2921.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2930.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2941,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2948.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":3278.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":3292.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":3300.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":3310,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":3317.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":3334,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":3347.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3357,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3365.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3487.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3495.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3501.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3509.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":3523.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3533.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3541.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3548.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3561.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3569.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3582.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3589.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3602.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3610.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5958.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5965.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5971,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5978.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5987.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5996.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6005.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6012.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6021.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6033.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6043,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6048.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6061.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6070.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6077.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6085.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6094.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6104.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6110,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6117.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6134.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6141.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6147.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6160.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6168.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6177.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6183.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6193,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6200.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6209.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6219.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6228.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6235.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6246,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":6257.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":6268.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":6276.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":6288.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6297.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6305.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6315.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6529.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6623.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6632.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":6638.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":6645.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":6654.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":6668,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":6685.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":6695,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7278,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7289.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7296.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":7303.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":7311.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":7318.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":7330.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":7342.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":7443.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7587.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7603.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7611.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7618.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7630.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7636.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7645.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8389.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8397.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8404,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8412.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8432.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":8439.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8445.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8452.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8462,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8472.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8479.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8486.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8530.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":8557.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8564,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8571,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8580.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8590.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8599.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":8605.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":8612.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":8623.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":8634.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":8643.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":8649.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":8659.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8669.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8797.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8804.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8810,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8821.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8836,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8846.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":8856.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":8868,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8876.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8882,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8889.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8897.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":9056.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":9069.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9076.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9082,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9091.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9101.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9109.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9351.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9362.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9372.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":9380,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":9395.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9405.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9412.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9417.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9431.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9440.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9449.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9460.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9472.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9478.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9484.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9503.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9512.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9522.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9531.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9541.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9549.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9559,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9567.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9576.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9614.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10459.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10467.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10474.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10480.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10489.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10499.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10507.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10512.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10519.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10530.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10538.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10543.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10550.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10560.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10570.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10576.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10583.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10591.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10599.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10606.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":10613,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":10623.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":10635.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":10643.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":10649.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":10658.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10668.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10676.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10835.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10842.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10856.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":10865.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":10873,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":10880.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":10890.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":10905.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":10915,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":10923.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10939.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10948.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10986.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10994.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11000.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11013.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11023.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11029.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11038.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":11049.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":11063.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":11083,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":11100.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11116.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11148,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11232.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11274.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":11286.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11294.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11303.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11326.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11332.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11343.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11359.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":11369.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11393.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11403,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11410.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11417.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11426.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11491.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11498.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11499,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11512.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11524.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11536.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11544.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11580.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11589.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11676.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11684.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11694.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11701.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11711.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11722.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11725.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11787,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11796.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11802.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11813.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11825.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11834.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11844.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11859.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":11866.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12016.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12026.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12033,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12041.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12057.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":12068.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12078.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12129.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12135.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12144.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12161,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":12168.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12184.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":12195.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":12216.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12226.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12256,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12262.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12268.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12278.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12300.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":12310.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":12333,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":12347.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":12362.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12375,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":12392.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12757.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":12768.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12782.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":12792.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":12804,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":12831.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12838.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12898,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12905.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12919.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0}],"device_info":[{"name":"Lovense Lush","index":0,"capabilities":["Vibrate"]}],"tags":["Sexy"],"linked_video":null,"status":"draft","public":false}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
9ba6b595-65e3-4c96-a45e-44a1f6ff2a02	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
AW2Pr3uAhpkP7votvd5_im9QhgKFxSzVZ-BiMXAuKm38CM93GGiW9uqV2QAvcqeh	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	2025-11-04 03:42:39.698+00	172.20.0.1	curl/8.14.1	\N	\N	\N
icj3hXKsOnGwmP00n6-mHPaDM2Nax8otmz09a7dK_QB4ollta2gP0CLJs7CnDjbD	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	2025-11-04 03:44:35.696+00	172.20.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	\N	http://localhost:3000	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls, accepted_terms, project_id, mcp_enabled, mcp_allow_deletes, mcp_prompts_collection, mcp_system_prompt_enabled, mcp_system_prompt) FROM stdin;
1	Directus	\N	#6644FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N	\N	en-US	\N	\N	auto	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N	\N	f	019a28e0-4e79-75d3-9728-8195d576ca87	f	f	\N	t	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, text_direction) FROM stdin;
ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	Admin	User	admin@sexy.pivoine.art	$argon2id$v=19$m=65536,t=3,p=4$qrMFVQWDObsiJs3xmBspOw$gvzN8LOaxEM1w8mOKBCOTJAxbjuBpG75gLMtgIx0aMU	\N	\N	\N	\N	\N	\N	\N	active	9ba6b595-65e3-4c96-a45e-44a1f6ff2a02	\N	2025-10-28 03:47:41.797+00	\N	default	\N	\N	t	\N	\N	\N	\N	\N	auto
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: junction_directus_users_files; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.junction_directus_users_files (id, directus_users_id, directus_files_id) FROM stdin;
\.


--
-- Data for Name: sexy_articles; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.sexy_articles (id, status, user_created, date_created, date_updated, slug, title, excerpt, content, image, tags, publish_date, category, featured, author) FROM stdin;
\.


--
-- Data for Name: sexy_recordings; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.sexy_recordings (id, status, user_created, date_created, date_updated, title, description, slug, duration, events, device_info, tags, linked_video, featured, public) FROM stdin;
1ff93997-a606-4442-9448-0180cc3a810f	draft	ef4304dc-ea9a-4128-97fb-0e3cb5f709bb	2025-10-28 04:15:35.598+00	\N	test	Claude!!!!	test	12919.40000000596	[{"timestamp":2582.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2753.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2760,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2766.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":2774.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2781,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2789.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2797.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2807.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2814.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":2828.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2840.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2846.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2857.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2865.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":2878.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2885.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2900,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2911.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":2921.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2930.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2941,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":2948.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":3278.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":3292.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":3300.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":3310,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":3317.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":3334,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":3347.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3357,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3365.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3487.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3495.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3501.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":3509.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":3523.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3533.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3541.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3548.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3561.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3569.2000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3582.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3589.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3602.7000000178814,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":3610.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5958.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5965.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5971,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5978.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5987.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":5996.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6005.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6012.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6021.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6033.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6043,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6048.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6061.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6070.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6077.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6085.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6094.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6104.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6110,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6117.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6134.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6141.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6147.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6160.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6168.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6177.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6183.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6193,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6200.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6209.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":6219.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6228.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6235.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":6246,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":6257.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":6268.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":6276.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":6288.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6297.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6305.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":6315.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6529.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6623.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":6632.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":6638.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":6645.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":6654.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":6668,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":6685.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":6695,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7278,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7289.4000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":7296.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":7303.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":7311.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":7318.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":7330.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":7342.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":7443.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7587.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7603.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7611.9000000059605,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7618.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7630.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7636.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":7645.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8389.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8397.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8404,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8412.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":8432.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":8439.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8445.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8452.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":8462,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8472.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8479.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8486.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8530.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":8557.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8564,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":8571,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8580.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8590.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":8599.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":8605.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":8612.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":8623.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":8634.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":8643.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":8649.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":8659.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8669.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8797.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8804.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8810,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8821.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8836,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":8846.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":8856.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":8868,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8876.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8882,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8889.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":8897.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":9056.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":9069.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9076.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9082,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":9091.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9101.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9109.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9351.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9362.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":9372.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":80},{"timestamp":9380,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":9395.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9405.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9412.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9417.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9431.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9440.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9449.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9460.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9472.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9478.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9484.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9503.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9512.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9522.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9531.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9541.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9549.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9559,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9567.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9576.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":9614.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10459.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10467.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10474.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10480.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10489.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10499.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10507.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10512.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10519.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10530.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10538.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10543.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10550.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10560.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10570.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10576.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10583.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10591.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10599.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10606.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":85},{"timestamp":10613,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":10623.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":65},{"timestamp":10635.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":60},{"timestamp":10643.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":10649.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":10658.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10668.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10676.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10835.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10842.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":10856.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":10865.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":10873,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":10880.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":10890.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":10905.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":75},{"timestamp":10915,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":10923.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10939.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10948.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10986.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":10994.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11000.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11013.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11023.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11029.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":100},{"timestamp":11038.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":95},{"timestamp":11049.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":90},{"timestamp":11063.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":70},{"timestamp":11083,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":11100.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11116.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11148,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11232.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11274.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":11286.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11294.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11303.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11326.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11332.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11343.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11359.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":11369.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11393.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11403,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11410.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11417.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11426.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":11491.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11498.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11499,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11512.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11524.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11536.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11544.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":11580.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11589.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11676.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11684.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11694.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11701.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11711.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11722.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":11725.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":15},{"timestamp":11787,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11796.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11802.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11813.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":11825.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11834.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11844.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":11859.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":11866.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12016.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12026.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12033,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12041.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12057.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":12068.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12078.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12129.600000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12135.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12144.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12161,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":12168.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":35},{"timestamp":12184.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":12195.300000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":12216.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12226.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12256,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12262.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12268.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12278.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12300.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":10},{"timestamp":12310.5,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":20},{"timestamp":12333,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":30},{"timestamp":12347.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":40},{"timestamp":12362.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12375,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":12392.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12757.700000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":55.00000000000001},{"timestamp":12768.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":50},{"timestamp":12782.90000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":45},{"timestamp":12792.800000011921,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":25},{"timestamp":12804,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":5},{"timestamp":12831.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12838.100000023842,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12898,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12905.200000017881,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0},{"timestamp":12919.40000000596,"deviceIndex":0,"deviceName":"Lovense Lush","actuatorIndex":0,"actuatorType":"Vibrate","value":0}]	[{"name":"Lovense Lush","index":0,"capabilities":["Vibrate"]}]	["Sexy"]	\N	f	f
\.


--
-- Data for Name: sexy_video_likes; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.sexy_video_likes (id, video_id, user_id, date_created) FROM stdin;
\.


--
-- Data for Name: sexy_video_plays; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.sexy_video_plays (id, video_id, user_id, session_id, duration_watched, completed, date_created, date_updated) FROM stdin;
\.


--
-- Data for Name: sexy_videos; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.sexy_videos (id, status, user_created, date_created, date_updated, slug, title, image, upload_date, premium, featured, tags, movie, description, likes_count, plays_count, views_count) FROM stdin;
\.


--
-- Data for Name: sexy_videos_directus_users; Type: TABLE DATA; Schema: public; Owner: sexy
--

COPY public.sexy_videos_directus_users (id, sexy_videos_id, directus_users_id) FROM stdin;
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 4, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 156, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, false);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, false);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 12, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 1, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: junction_directus_users_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.junction_directus_users_files_id_seq', 1, false);


--
-- Name: sexy_videos_directus_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sexy
--

SELECT pg_catalog.setval('public.sexy_videos_directus_users_id_seq', 1, false);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: junction_directus_users_files junction_directus_users_files_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.junction_directus_users_files
    ADD CONSTRAINT junction_directus_users_files_pkey PRIMARY KEY (id);


--
-- Name: sexy_articles sexy_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_articles
    ADD CONSTRAINT sexy_articles_pkey PRIMARY KEY (id);


--
-- Name: sexy_articles sexy_articles_slug_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_articles
    ADD CONSTRAINT sexy_articles_slug_unique UNIQUE (slug);


--
-- Name: sexy_recordings sexy_recordings_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_recordings
    ADD CONSTRAINT sexy_recordings_pkey PRIMARY KEY (id);


--
-- Name: sexy_recordings sexy_recordings_slug_unique; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_recordings
    ADD CONSTRAINT sexy_recordings_slug_unique UNIQUE (slug);


--
-- Name: sexy_video_likes sexy_video_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_video_likes
    ADD CONSTRAINT sexy_video_likes_pkey PRIMARY KEY (id);


--
-- Name: sexy_video_likes sexy_video_likes_video_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_video_likes
    ADD CONSTRAINT sexy_video_likes_video_id_user_id_key UNIQUE (video_id, user_id);


--
-- Name: sexy_video_plays sexy_video_plays_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_video_plays
    ADD CONSTRAINT sexy_video_plays_pkey PRIMARY KEY (id);


--
-- Name: sexy_videos_directus_users sexy_videos_directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos_directus_users
    ADD CONSTRAINT sexy_videos_directus_users_pkey PRIMARY KEY (id);


--
-- Name: sexy_videos sexy_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos
    ADD CONSTRAINT sexy_videos_pkey PRIMARY KEY (id);


--
-- Name: sexy_articles_slug_index; Type: INDEX; Schema: public; Owner: sexy
--

CREATE INDEX sexy_articles_slug_index ON public.sexy_articles USING btree (slug);


--
-- Name: sexy_recordings_slug_index; Type: INDEX; Schema: public; Owner: sexy
--

CREATE INDEX sexy_recordings_slug_index ON public.sexy_recordings USING btree (slug);


--
-- Name: sexy_video_likes_user_id_idx; Type: INDEX; Schema: public; Owner: sexy
--

CREATE INDEX sexy_video_likes_user_id_idx ON public.sexy_video_likes USING btree (user_id);


--
-- Name: sexy_video_likes_video_id_idx; Type: INDEX; Schema: public; Owner: sexy
--

CREATE INDEX sexy_video_likes_video_id_idx ON public.sexy_video_likes USING btree (video_id);


--
-- Name: sexy_video_plays_session_id_idx; Type: INDEX; Schema: public; Owner: sexy
--

CREATE INDEX sexy_video_plays_session_id_idx ON public.sexy_video_plays USING btree (session_id);


--
-- Name: sexy_video_plays_user_id_idx; Type: INDEX; Schema: public; Owner: sexy
--

CREATE INDEX sexy_video_plays_user_id_idx ON public.sexy_video_plays USING btree (user_id);


--
-- Name: sexy_video_plays_video_id_idx; Type: INDEX; Schema: public; Owner: sexy
--

CREATE INDEX sexy_video_plays_video_id_idx ON public.sexy_video_plays USING btree (video_id);


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: junction_directus_users_files junction_directus_users_files_directus_files_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.junction_directus_users_files
    ADD CONSTRAINT junction_directus_users_files_directus_files_id_foreign FOREIGN KEY (directus_files_id) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: junction_directus_users_files junction_directus_users_files_directus_users_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.junction_directus_users_files
    ADD CONSTRAINT junction_directus_users_files_directus_users_id_foreign FOREIGN KEY (directus_users_id) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: sexy_articles sexy_articles_author_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_articles
    ADD CONSTRAINT sexy_articles_author_foreign FOREIGN KEY (author) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: sexy_articles sexy_articles_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_articles
    ADD CONSTRAINT sexy_articles_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id);


--
-- Name: sexy_articles sexy_articles_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_articles
    ADD CONSTRAINT sexy_articles_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: sexy_recordings sexy_recordings_linked_video_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_recordings
    ADD CONSTRAINT sexy_recordings_linked_video_foreign FOREIGN KEY (linked_video) REFERENCES public.sexy_videos(id) ON DELETE SET NULL;


--
-- Name: sexy_recordings sexy_recordings_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_recordings
    ADD CONSTRAINT sexy_recordings_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: sexy_video_likes sexy_video_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_video_likes
    ADD CONSTRAINT sexy_video_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: sexy_video_likes sexy_video_likes_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_video_likes
    ADD CONSTRAINT sexy_video_likes_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.sexy_videos(id) ON DELETE CASCADE;


--
-- Name: sexy_video_plays sexy_video_plays_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_video_plays
    ADD CONSTRAINT sexy_video_plays_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: sexy_video_plays sexy_video_plays_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_video_plays
    ADD CONSTRAINT sexy_video_plays_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.sexy_videos(id) ON DELETE CASCADE;


--
-- Name: sexy_videos_directus_users sexy_videos_directus_users_directus_users_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos_directus_users
    ADD CONSTRAINT sexy_videos_directus_users_directus_users_id_foreign FOREIGN KEY (directus_users_id) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: sexy_videos_directus_users sexy_videos_directus_users_sexy_videos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos_directus_users
    ADD CONSTRAINT sexy_videos_directus_users_sexy_videos_id_foreign FOREIGN KEY (sexy_videos_id) REFERENCES public.sexy_videos(id) ON DELETE SET NULL;


--
-- Name: sexy_videos sexy_videos_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos
    ADD CONSTRAINT sexy_videos_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: sexy_videos sexy_videos_movie_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos
    ADD CONSTRAINT sexy_videos_movie_foreign FOREIGN KEY (movie) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: sexy_videos sexy_videos_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: sexy
--

ALTER TABLE ONLY public.sexy_videos
    ADD CONSTRAINT sexy_videos_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict fZoRqDC2go4frRFN7OarPWk2QjDg1msDEUS1707oFzKeEomuTOuGERnuVObcarJ

