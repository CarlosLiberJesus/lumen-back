--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Ubuntu 17.4-1.pgdg24.10+2)
-- Dumped by pg_dump version 17.4 (Ubuntu 17.4-1.pgdg24.10+2)

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
-- Name: anexo_tipos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.anexo_tipos (
    id bigint NOT NULL,
    tipo character varying(50) NOT NULL,
    descricao character varying(150),
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.anexo_tipos OWNER TO local_user;

--
-- Name: TABLE anexo_tipos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.anexo_tipos IS 'Organização de Anexos, de links paths em server ou base64';


--
-- Name: anexo_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.anexo_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.anexo_tipos_id_seq OWNER TO local_user;

--
-- Name: anexo_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.anexo_tipos_id_seq OWNED BY public.anexo_tipos.id;


--
-- Name: aplicacoes; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.aplicacoes (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.aplicacoes OWNER TO local_user;

--
-- Name: TABLE aplicacoes; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.aplicacoes IS 'O campo uuid conta com token de autorização. Layer simples seg, que pode descartar algumas tentativas remotas de acesso.';


--
-- Name: aplicacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.aplicacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aplicacoes_id_seq OWNER TO local_user;

--
-- Name: aplicacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.aplicacoes_id_seq OWNED BY public.aplicacoes.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO local_user;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO local_user;

--
-- Name: cidadao_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    cidadao_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadao_anexos OWNER TO local_user;

--
-- Name: TABLE cidadao_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.cidadao_anexos IS 'Documentos genéricos para o cidadão, como imagens ou outros links interessantes. não esquecer que deverá ser na tabela cidadao_cargo_anexos que teremos a maioria dos documentos, que são os que são específicos para cada cargo';


--
-- Name: COLUMN cidadao_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadao_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: cidadao_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_anexos_id_seq OWNER TO local_user;

--
-- Name: cidadao_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_anexos_id_seq OWNED BY public.cidadao_anexos.id;


--
-- Name: cidadao_cargo_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_cargo_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    cidadao_cargo_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadao_cargo_anexos OWNER TO local_user;

--
-- Name: TABLE cidadao_cargo_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.cidadao_cargo_anexos IS 'Tentativa de armazenar anexos de cargos de cidadãos, para fiscalização de documentos, não esquecer que deverá ser na tabela cidadao_anexos coisas genéricas à pessoa, aqui ao cargo e nomeação';


--
-- Name: COLUMN cidadao_cargo_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadao_cargo_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: cidadao_cargo_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_cargo_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_cargo_anexos_id_seq OWNER TO local_user;

--
-- Name: cidadao_cargo_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_cargo_anexos_id_seq OWNED BY public.cidadao_cargo_anexos.id;


--
-- Name: cidadao_cargos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_cargos (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    cargo_id bigint NOT NULL,
    instituicao_id bigint,
    inicio date,
    fim date,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadao_cargos OWNER TO local_user;

--
-- Name: TABLE cidadao_cargos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.cidadao_cargos IS 'Tabela super importante, que mapeará a carreira de um cidadão, com os cargos que ocupou, em que legislatura, etc.';


--
-- Name: COLUMN cidadao_cargos.cargo_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadao_cargos.cargo_id IS 'Cargo que ocupou, nascida da tabela instituicao_cargos. Exemplo: Deputado';


--
-- Name: COLUMN cidadao_cargos.instituicao_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadao_cargos.instituicao_id IS 'Instituição por qual exerceu o cargo. Exemplo: Partido Socialista';


--
-- Name: COLUMN cidadao_cargos.inicio; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadao_cargos.inicio IS 'Nullable se cargo depende de legislaturas ou presidenciais';


--
-- Name: cidadao_cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_cargos_id_seq OWNER TO local_user;

--
-- Name: cidadao_cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_cargos_id_seq OWNED BY public.cidadao_cargos.id;


--
-- Name: cidadao_contactos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_contactos (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    contacto_tipo_id bigint NOT NULL,
    contacto character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadao_contactos OWNER TO local_user;

--
-- Name: cidadao_contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_contactos_id_seq OWNER TO local_user;

--
-- Name: cidadao_contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_contactos_id_seq OWNED BY public.cidadao_contactos.id;


--
-- Name: cidadao_dados; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_dados (
    id bigint NOT NULL,
    nif double precision,
    cc double precision,
    cc_aux character(5),
    seg_social double precision,
    n_saude double precision,
    cidadao_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadao_dados OWNER TO local_user;

--
-- Name: cidadao_dados_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_dados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_dados_id_seq OWNER TO local_user;

--
-- Name: cidadao_dados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_dados_id_seq OWNED BY public.cidadao_dados.id;


--
-- Name: cidadao_moradas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_moradas (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    morada text NOT NULL,
    codigo_postal character varying(10),
    localidade character varying(100),
    concelho_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadao_moradas OWNER TO local_user;

--
-- Name: cidadao_moradas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_moradas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_moradas_id_seq OWNER TO local_user;

--
-- Name: cidadao_moradas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_moradas_id_seq OWNED BY public.cidadao_moradas.id;


--
-- Name: cidadao_nacionalidades; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_nacionalidades (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    nacionalidade_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadao_nacionalidades OWNER TO local_user;

--
-- Name: TABLE cidadao_nacionalidades; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.cidadao_nacionalidades IS 'Ou o cidadao tem o default true, ou tem de herdar multiplas nacionalidades. Tabela para associar cidadao a nacionalidades.';


--
-- Name: cidadao_nacionalidades_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_nacionalidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_nacionalidades_id_seq OWNER TO local_user;

--
-- Name: cidadao_nacionalidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_nacionalidades_id_seq OWNED BY public.cidadao_nacionalidades.id;


--
-- Name: cidadao_relacoes; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadao_relacoes (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    com_cidadao_id bigint NOT NULL,
    relacao_tipo_id bigint NOT NULL,
    onde character varying(255),
    onde_id character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT cidadao_relacoes_onde_check CHECK (((onde)::text = ANY ((ARRAY['instituicao'::character varying, 'instituicao_legislatura'::character varying, 'instituicao_presidencial'::character varying, 'instituicao_governo'::character varying])::text[])))
);


ALTER TABLE public.cidadao_relacoes OWNER TO local_user;

--
-- Name: TABLE cidadao_relacoes; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.cidadao_relacoes IS 'Tabela super importante para nested search. Neste Portugal nepotista, é importante saber quem relacionado com quem.';


--
-- Name: COLUMN cidadao_relacoes.onde; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadao_relacoes.onde IS 'Onde se passa a relação';


--
-- Name: COLUMN cidadao_relacoes.onde_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadao_relacoes.onde_id IS 'ID da relação';


--
-- Name: cidadao_relacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadao_relacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadao_relacoes_id_seq OWNER TO local_user;

--
-- Name: cidadao_relacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadao_relacoes_id_seq OWNED BY public.cidadao_relacoes.id;


--
-- Name: cidadaos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.cidadaos (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    nome character varying(255) NOT NULL,
    nome_completo character varying(255),
    data_nascimento date,
    data_falecimento date,
    genero character(1),
    freguesia_id bigint,
    sinopse text,
    nacional boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cidadaos OWNER TO local_user;

--
-- Name: TABLE cidadaos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.cidadaos IS 'Acumulação dos Cidadãos que vamos apanhamos';


--
-- Name: COLUMN cidadaos.nacional; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.cidadaos.nacional IS 'Não queria fazer isto, mas... está do DRe.';


--
-- Name: cidadaos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.cidadaos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidadaos_id_seq OWNER TO local_user;

--
-- Name: cidadaos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.cidadaos_id_seq OWNED BY public.cidadaos.id;


--
-- Name: concelho_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.concelho_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    concelho_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.concelho_anexos OWNER TO local_user;

--
-- Name: COLUMN concelho_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.concelho_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: concelho_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.concelho_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.concelho_anexos_id_seq OWNER TO local_user;

--
-- Name: concelho_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.concelho_anexos_id_seq OWNED BY public.concelho_anexos.id;


--
-- Name: concelhos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.concelhos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(100) NOT NULL,
    sinopse text,
    distrito_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.concelhos OWNER TO local_user;

--
-- Name: TABLE concelhos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.concelhos IS 'Reflete a organização territorial a nível de municipio.';


--
-- Name: concelhos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.concelhos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.concelhos_id_seq OWNER TO local_user;

--
-- Name: concelhos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.concelhos_id_seq OWNED BY public.concelhos.id;


--
-- Name: conselho_ministros; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.conselho_ministros (
    id bigint NOT NULL,
    instituicao_governo_id bigint NOT NULL,
    cargo_id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.conselho_ministros OWNER TO local_user;

--
-- Name: TABLE conselho_ministros; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.conselho_ministros IS 'Tabela de resumo de cargos principais que acompanham o Governo.';


--
-- Name: COLUMN conselho_ministros.instituicao_governo_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.conselho_ministros.instituicao_governo_id IS 'Vai directamente à replica filho da Instituicao Governo';


--
-- Name: COLUMN conselho_ministros.cargo_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.conselho_ministros.cargo_id IS 'O cargo que o cidadao ocupa na instituicao_governo principalmente.';


--
-- Name: conselho_ministros_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.conselho_ministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conselho_ministros_id_seq OWNER TO local_user;

--
-- Name: conselho_ministros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.conselho_ministros_id_seq OWNED BY public.conselho_ministros.id;


--
-- Name: contacto_tipos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.contacto_tipos (
    id bigint NOT NULL,
    tipo character varying(255) NOT NULL,
    description text,
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contacto_tipos OWNER TO local_user;

--
-- Name: TABLE contacto_tipos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.contacto_tipos IS 'Separar emails, telefones, endereços, etc. Os params contêm arrays de parametros para o front-end (css classes)';


--
-- Name: contacto_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.contacto_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacto_tipos_id_seq OWNER TO local_user;

--
-- Name: contacto_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.contacto_tipos_id_seq OWNED BY public.contacto_tipos.id;


--
-- Name: diario_republica_glossarios; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.diario_republica_glossarios (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    texto text,
    path character varying(255) NOT NULL,
    src character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.diario_republica_glossarios OWNER TO local_user;

--
-- Name: COLUMN diario_republica_glossarios.nome; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_glossarios.nome IS 'Nome do glossário';


--
-- Name: COLUMN diario_republica_glossarios.texto; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_glossarios.texto IS 'Texto da lei, extraido da web';


--
-- Name: COLUMN diario_republica_glossarios.path; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_glossarios.path IS 'Caminho em server do arquivo';


--
-- Name: COLUMN diario_republica_glossarios.src; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_glossarios.src IS 'URL Fonte do arquivo';


--
-- Name: diario_republica_glossarios_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.diario_republica_glossarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diario_republica_glossarios_id_seq OWNER TO local_user;

--
-- Name: diario_republica_glossarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.diario_republica_glossarios_id_seq OWNED BY public.diario_republica_glossarios.id;


--
-- Name: diario_republica_publicacao_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.diario_republica_publicacao_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    diario_republica_publicacao_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.diario_republica_publicacao_anexos OWNER TO local_user;

--
-- Name: COLUMN diario_republica_publicacao_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_publicacao_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: diario_republica_publicacao_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.diario_republica_publicacao_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diario_republica_publicacao_anexos_id_seq OWNER TO local_user;

--
-- Name: diario_republica_publicacao_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.diario_republica_publicacao_anexos_id_seq OWNED BY public.diario_republica_publicacao_anexos.id;


--
-- Name: diario_republica_publicacao_leis; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.diario_republica_publicacao_leis (
    id bigint NOT NULL,
    dr_publicacao_id bigint NOT NULL,
    lei_id bigint NOT NULL,
    src text,
    paginas character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.diario_republica_publicacao_leis OWNER TO local_user;

--
-- Name: COLUMN diario_republica_publicacao_leis.src; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_publicacao_leis.src IS 'Web link';


--
-- Name: diario_republica_publicacao_leis_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.diario_republica_publicacao_leis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diario_republica_publicacao_leis_id_seq OWNER TO local_user;

--
-- Name: diario_republica_publicacao_leis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.diario_republica_publicacao_leis_id_seq OWNED BY public.diario_republica_publicacao_leis.id;


--
-- Name: diario_republica_publicacoes; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.diario_republica_publicacoes (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    nome character varying(255) NOT NULL,
    src text,
    diario_republica_id bigint NOT NULL,
    serie_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.diario_republica_publicacoes OWNER TO local_user;

--
-- Name: TABLE diario_republica_publicacoes; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.diario_republica_publicacoes IS 'Tabela complexa, que representa uma publicacao do diário da republica, que pode ter mais de uma série. Exemplo nome: Diário da República n.º 32/2025, Série I de 2025-02-14; Exemplo src: https://diariodarepublica.pt/dr/detalhe/diario-republica/32-2025-907468769';


--
-- Name: COLUMN diario_republica_publicacoes.src; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_publicacoes.src IS 'Web link';


--
-- Name: COLUMN diario_republica_publicacoes.serie_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_publicacoes.serie_id IS 'Série do Diário da República';


--
-- Name: diario_republica_publicacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.diario_republica_publicacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diario_republica_publicacoes_id_seq OWNER TO local_user;

--
-- Name: diario_republica_publicacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.diario_republica_publicacoes_id_seq OWNED BY public.diario_republica_publicacoes.id;


--
-- Name: diario_republica_series; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.diario_republica_series (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    sinopse text,
    serie_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.diario_republica_series OWNER TO local_user;

--
-- Name: TABLE diario_republica_series; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.diario_republica_series IS 'Dentro do Dre, cada publicacao vem dentro de series. Cada serie tem um proposito diferente.';


--
-- Name: COLUMN diario_republica_series.serie_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.diario_republica_series.serie_id IS 'As séries poderão ter suplementos, dentro de cada série, havemos de mapear também os suplementos';


--
-- Name: diario_republica_series_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.diario_republica_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diario_republica_series_id_seq OWNER TO local_user;

--
-- Name: diario_republica_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.diario_republica_series_id_seq OWNED BY public.diario_republica_series.id;


--
-- Name: diario_republicas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.diario_republicas (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    nome character varying(255) NOT NULL,
    publicacao date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.diario_republicas OWNER TO local_user;

--
-- Name: TABLE diario_republicas; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.diario_republicas IS 'Tabela que aceita uma data unica para publicação. 1 Diário da republica pode ter vários diario_republicas_publicacoes. Exemplo nome: Diário da República n.º 32/2025';


--
-- Name: diario_republicas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.diario_republicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diario_republicas_id_seq OWNER TO local_user;

--
-- Name: diario_republicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.diario_republicas_id_seq OWNED BY public.diario_republicas.id;


--
-- Name: distrito_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.distrito_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    distrito_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.distrito_anexos OWNER TO local_user;

--
-- Name: COLUMN distrito_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.distrito_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: distrito_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.distrito_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.distrito_anexos_id_seq OWNER TO local_user;

--
-- Name: distrito_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.distrito_anexos_id_seq OWNED BY public.distrito_anexos.id;


--
-- Name: distritos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.distritos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(100) NOT NULL,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.distritos OWNER TO local_user;

--
-- Name: TABLE distritos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.distritos IS 'Reflete a organização territorial a nível de regiões.';


--
-- Name: distritos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.distritos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.distritos_id_seq OWNER TO local_user;

--
-- Name: distritos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.distritos_id_seq OWNED BY public.distritos.id;


--
-- Name: entidade_juridica_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.entidade_juridica_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    entidades_juridica_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.entidade_juridica_anexos OWNER TO local_user;

--
-- Name: TABLE entidade_juridica_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.entidade_juridica_anexos IS 'Atalhar as nossas procuras, lançar links externos de interesse, imagens, etc';


--
-- Name: COLUMN entidade_juridica_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.entidade_juridica_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: entidade_juridica_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.entidade_juridica_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entidade_juridica_anexos_id_seq OWNER TO local_user;

--
-- Name: entidade_juridica_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.entidade_juridica_anexos_id_seq OWNED BY public.entidade_juridica_anexos.id;


--
-- Name: entidade_juridica_leis; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.entidade_juridica_leis (
    id bigint NOT NULL,
    entidade_juridica_id bigint NOT NULL,
    lei_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.entidade_juridica_leis OWNER TO local_user;

--
-- Name: TABLE entidade_juridica_leis; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.entidade_juridica_leis IS 'Entidade Juridica é um termo legal que é coberto por definição legal. Tabela vai agregando as leis que impactam os direitos e deveres da entidade juridica.';


--
-- Name: entidade_juridica_leis_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.entidade_juridica_leis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entidade_juridica_leis_id_seq OWNER TO local_user;

--
-- Name: entidade_juridica_leis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.entidade_juridica_leis_id_seq OWNED BY public.entidade_juridica_leis.id;


--
-- Name: entidade_juridicas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.entidade_juridicas (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    sinopse text,
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.entidade_juridicas OWNER TO local_user;

--
-- Name: entidade_juridicas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.entidade_juridicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entidade_juridicas_id_seq OWNER TO local_user;

--
-- Name: entidade_juridicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.entidade_juridicas_id_seq OWNED BY public.entidade_juridicas.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO local_user;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO local_user;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: freguesia_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.freguesia_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    freguesia_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.freguesia_anexos OWNER TO local_user;

--
-- Name: COLUMN freguesia_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.freguesia_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: freguesia_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.freguesia_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.freguesia_anexos_id_seq OWNER TO local_user;

--
-- Name: freguesia_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.freguesia_anexos_id_seq OWNED BY public.freguesia_anexos.id;


--
-- Name: freguesia_tipos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.freguesia_tipos (
    id bigint NOT NULL,
    tipo character varying(255) NOT NULL,
    descricao character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.freguesia_tipos OWNER TO local_user;

--
-- Name: TABLE freguesia_tipos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.freguesia_tipos IS 'Houve historicamente uma união de freguesia, marca o seu periodo';


--
-- Name: freguesia_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.freguesia_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.freguesia_tipos_id_seq OWNER TO local_user;

--
-- Name: freguesia_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.freguesia_tipos_id_seq OWNED BY public.freguesia_tipos.id;


--
-- Name: freguesias; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.freguesias (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(100) NOT NULL,
    sinopse text,
    distrito_id bigint NOT NULL,
    concelho_id bigint NOT NULL,
    freguesia_tipo_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.freguesias OWNER TO local_user;

--
-- Name: TABLE freguesias; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.freguesias IS 'Reflete a organização territorial mais básica';


--
-- Name: freguesias_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.freguesias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.freguesias_id_seq OWNER TO local_user;

--
-- Name: freguesias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.freguesias_id_seq OWNED BY public.freguesias.id;


--
-- Name: governo_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.governo_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    governo_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.governo_anexos OWNER TO local_user;

--
-- Name: TABLE governo_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.governo_anexos IS 'Anexos por governo.';


--
-- Name: COLUMN governo_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.governo_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: governo_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.governo_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.governo_anexos_id_seq OWNER TO local_user;

--
-- Name: governo_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.governo_anexos_id_seq OWNED BY public.governo_anexos.id;


--
-- Name: governos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.governos (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    sigla character(6) NOT NULL,
    nome character varying(255) NOT NULL,
    republica_id bigint NOT NULL,
    legislatura_id bigint NOT NULL,
    formacao date NOT NULL,
    dissolucao date,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.governos OWNER TO local_user;

--
-- Name: TABLE governos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.governos IS 'Listagens dos governos de Portugal, com data de formação e dissolução, e a que república pertence.';


--
-- Name: governos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.governos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.governos_id_seq OWNER TO local_user;

--
-- Name: governos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.governos_id_seq OWNED BY public.governos.id;


--
-- Name: instituicao_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    instituicao_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_anexos OWNER TO local_user;

--
-- Name: TABLE instituicao_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_anexos IS 'Documentos genéricos para Instituição; não esquecer que pode ser preferível colocar em instituicao_legislatura_anexos, que são elas que devem estar activas';


--
-- Name: COLUMN instituicao_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: instituicao_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_anexos_id_seq OWNER TO local_user;

--
-- Name: instituicao_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_anexos_id_seq OWNED BY public.instituicao_anexos.id;


--
-- Name: instituicao_cargo_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_cargo_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    instituicao_cargo_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_cargo_anexos OWNER TO local_user;

--
-- Name: TABLE instituicao_cargo_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_cargo_anexos IS 'Documentos genéricos para Instituição Cargo, não esquecer que deverá ser no cidadão que individualmente se colocam os documentos, na tabela cidadao_cargo_anexos';


--
-- Name: COLUMN instituicao_cargo_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_cargo_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: instituicao_cargo_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_cargo_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_cargo_anexos_id_seq OWNER TO local_user;

--
-- Name: instituicao_cargo_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_cargo_anexos_id_seq OWNED BY public.instituicao_cargo_anexos.id;


--
-- Name: instituicao_cargo_leis; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_cargo_leis (
    id bigint NOT NULL,
    instituicao_cargo_id bigint NOT NULL,
    lei_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_cargo_leis OWNER TO local_user;

--
-- Name: TABLE instituicao_cargo_leis; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_cargo_leis IS 'As instituições criam cargos, mas os cargos devem existir dentro de uma autorização legal. Tabela para associar leis que rondam os direitos e deveres dos cargos.';


--
-- Name: instituicao_cargo_leis_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_cargo_leis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_cargo_leis_id_seq OWNER TO local_user;

--
-- Name: instituicao_cargo_leis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_cargo_leis_id_seq OWNED BY public.instituicao_cargo_leis.id;


--
-- Name: instituicao_cargos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_cargos (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    cargo character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    instituicao_id bigint NOT NULL,
    cargo_responde_id bigint,
    sinopse text,
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT instituicao_cargos_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['instituicao'::character varying, 'instituicao_legislatura'::character varying, 'instituicao_presidencial'::character varying, 'instituicao_governo'::character varying])::text[])))
);


ALTER TABLE public.instituicao_cargos OWNER TO local_user;

--
-- Name: TABLE instituicao_cargos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_cargos IS 'Um Cargo tem sempre de nascer de uma instituicao, o tipo vai repetir o cargo, mas fâ-ze-lo num ciclo temporal; Um Presidente da República é um cargo da instituição Presidencia da República, vai gerar vários presidentes, associado à sua caixa temporal';


--
-- Name: COLUMN instituicao_cargos.tipo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_cargos.tipo IS 'Cargo pode ser de uma instituição, ou dos seus filhos temporais';


--
-- Name: COLUMN instituicao_cargos.instituicao_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_cargos.instituicao_id IS 'Instituição a que pertence o cargo';


--
-- Name: COLUMN instituicao_cargos.cargo_responde_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_cargos.cargo_responde_id IS 'Este cargo responde a outro cargo';


--
-- Name: COLUMN instituicao_cargos.params; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_cargos.params IS 'Guardar configs do frontend';


--
-- Name: instituicao_cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_cargos_id_seq OWNER TO local_user;

--
-- Name: instituicao_cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_cargos_id_seq OWNED BY public.instituicao_cargos.id;


--
-- Name: instituicao_com_tipos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_com_tipos (
    id bigint NOT NULL,
    instituicao_id bigint NOT NULL,
    instituicao_tipo_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_com_tipos OWNER TO local_user;

--
-- Name: TABLE instituicao_com_tipos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_com_tipos IS 'Com a tabela 1:n de instituicoes para tipos de instituicoes, podemos ter executivo e saúde na mesma instituição.';


--
-- Name: instituicao_com_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_com_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_com_tipos_id_seq OWNER TO local_user;

--
-- Name: instituicao_com_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_com_tipos_id_seq OWNED BY public.instituicao_com_tipos.id;


--
-- Name: instituicao_contactos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_contactos (
    id bigint NOT NULL,
    instituicao_id bigint NOT NULL,
    contacto_tipo_id bigint NOT NULL,
    contacto text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_contactos OWNER TO local_user;

--
-- Name: instituicao_contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_contactos_id_seq OWNER TO local_user;

--
-- Name: instituicao_contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_contactos_id_seq OWNED BY public.instituicao_contactos.id;


--
-- Name: instituicao_dados; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_dados (
    id bigint NOT NULL,
    nif double precision,
    certidao_permanente text,
    instituicao_id bigint NOT NULL,
    sinopse text,
    fundacao date,
    dissolucao date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_dados OWNER TO local_user;

--
-- Name: instituicao_dados_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_dados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_dados_id_seq OWNER TO local_user;

--
-- Name: instituicao_dados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_dados_id_seq OWNED BY public.instituicao_dados.id;


--
-- Name: instituicao_entidade_juridicas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_entidade_juridicas (
    id bigint NOT NULL,
    entidade_juridica_id bigint,
    instituicao_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_entidade_juridicas OWNER TO local_user;

--
-- Name: instituicao_entidade_juridicas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_entidade_juridicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_entidade_juridicas_id_seq OWNER TO local_user;

--
-- Name: instituicao_entidade_juridicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_entidade_juridicas_id_seq OWNED BY public.instituicao_entidade_juridicas.id;


--
-- Name: instituicao_governos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_governos (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    instituicao_id bigint NOT NULL,
    governo_id bigint NOT NULL,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_governos OWNER TO local_user;

--
-- Name: TABLE instituicao_governos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_governos IS 'Conceito que desmultiplica uma instituição tipo Governo, para um governo especifico.';


--
-- Name: instituicao_governos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_governos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_governos_id_seq OWNER TO local_user;

--
-- Name: instituicao_governos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_governos_id_seq OWNED BY public.instituicao_governos.id;


--
-- Name: instituicao_legislatura_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_legislatura_anexos (
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    instituicao_legislatura_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_legislatura_anexos OWNER TO local_user;

--
-- Name: TABLE instituicao_legislatura_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_legislatura_anexos IS 'Durante os ciclos legislativos, a instituição tem uma nova versão pós formação de orgãos e gera informação';


--
-- Name: COLUMN instituicao_legislatura_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_legislatura_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: instituicao_legislaturas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_legislaturas (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    nome character varying(255),
    instituicao_id bigint NOT NULL,
    legislatura_id bigint NOT NULL,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_legislaturas OWNER TO local_user;

--
-- Name: TABLE instituicao_legislaturas; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_legislaturas IS 'Conceito que desmultiplica uma instituição tipo Parlamento, formado devido às eleições de 2023, por exemplo.';


--
-- Name: COLUMN instituicao_legislaturas.nome; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_legislaturas.nome IS 'Caso necessário nomear excepções ao nome da instituição';


--
-- Name: instituicao_legislaturas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_legislaturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_legislaturas_id_seq OWNER TO local_user;

--
-- Name: instituicao_legislaturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_legislaturas_id_seq OWNED BY public.instituicao_legislaturas.id;


--
-- Name: instituicao_leis; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_leis (
    id bigint NOT NULL,
    instituicao_id bigint NOT NULL,
    lei_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_leis OWNER TO local_user;

--
-- Name: TABLE instituicao_leis; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_leis IS 'Tabela que mapeará os direitos e deveres de uma instituição, com base nas leis que a regem.';


--
-- Name: instituicao_leis_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_leis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_leis_id_seq OWNER TO local_user;

--
-- Name: instituicao_leis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_leis_id_seq OWNED BY public.instituicao_leis.id;


--
-- Name: instituicao_moradas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_moradas (
    id bigint NOT NULL,
    instituicao_id bigint NOT NULL,
    morada text NOT NULL,
    codigo_postal character varying(10),
    localidade character varying(100),
    concelho_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_moradas OWNER TO local_user;

--
-- Name: instituicao_moradas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_moradas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_moradas_id_seq OWNER TO local_user;

--
-- Name: instituicao_moradas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_moradas_id_seq OWNED BY public.instituicao_moradas.id;


--
-- Name: instituicao_nacionalidades; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_nacionalidades (
    id bigint NOT NULL,
    instituicao_id bigint NOT NULL,
    nacionalidade_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_nacionalidades OWNER TO local_user;

--
-- Name: TABLE instituicao_nacionalidades; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_nacionalidades IS 'Ou a instituicao tem o default true, ou tem de herdar multiplas nacionalidades. Tabela para associar instituicoes a nacionalidades.';


--
-- Name: instituicao_nacionalidades_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_nacionalidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_nacionalidades_id_seq OWNER TO local_user;

--
-- Name: instituicao_nacionalidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_nacionalidades_id_seq OWNED BY public.instituicao_nacionalidades.id;


--
-- Name: instituicao_presidenciais; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_presidenciais (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    nome character varying(255),
    instituicao_id bigint NOT NULL,
    presidencial_id bigint NOT NULL,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_presidenciais OWNER TO local_user;

--
-- Name: TABLE instituicao_presidenciais; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_presidenciais IS 'Como as instituicao_legislativas, algumas instituições, como o conselho de estado mudam com as eleições do presidente .';


--
-- Name: COLUMN instituicao_presidenciais.nome; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_presidenciais.nome IS 'Caso necessário nomear excepções ao nome da instituição';


--
-- Name: instituicao_presidenciais_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_presidenciais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_presidenciais_id_seq OWNER TO local_user;

--
-- Name: instituicao_presidenciais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_presidenciais_id_seq OWNED BY public.instituicao_presidenciais.id;


--
-- Name: instituicao_presidencial_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_presidencial_anexos (
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    instituicao_presidencial_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_presidencial_anexos OWNER TO local_user;

--
-- Name: COLUMN instituicao_presidencial_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_presidencial_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: instituicao_relacoes; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_relacoes (
    id bigint NOT NULL,
    instituicao_id bigint NOT NULL,
    com_instituicao_id bigint,
    com_cidadao_id bigint,
    relacao_tipo_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_relacoes OWNER TO local_user;

--
-- Name: TABLE instituicao_relacoes; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_relacoes IS 'Tabela super importante para nested search. Neste Portugal corrupto, é normal que certas instituições tenham relações de financiamento, nomeacao.';


--
-- Name: instituicao_relacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_relacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_relacoes_id_seq OWNER TO local_user;

--
-- Name: instituicao_relacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_relacoes_id_seq OWNED BY public.instituicao_relacoes.id;


--
-- Name: instituicao_tipos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicao_tipos (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    codigo character varying(255),
    tipo character varying(255) NOT NULL,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicao_tipos OWNER TO local_user;

--
-- Name: TABLE instituicao_tipos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.instituicao_tipos IS 'Odeio o Nome desta tabela, é um conceito teorico, que vai ajudar a filtrar as instituições. Exemplo: Governo, Saúde, Educação, etc.';


--
-- Name: COLUMN instituicao_tipos.tipo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicao_tipos.tipo IS 'Inicialmente para mapear o ramo legislativo | executivo | judicial mas a complexidade de ONGs também vai entrar em conta.';


--
-- Name: instituicao_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicao_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_tipos_id_seq OWNER TO local_user;

--
-- Name: instituicao_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicao_tipos_id_seq OWNED BY public.instituicao_tipos.id;


--
-- Name: instituicoes; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.instituicoes (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    nome character varying(255) NOT NULL,
    sigla character varying(255),
    sinopse text,
    responde_instituicao_id bigint,
    nacional boolean DEFAULT true NOT NULL,
    extinta boolean DEFAULT false NOT NULL,
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.instituicoes OWNER TO local_user;

--
-- Name: COLUMN instituicoes.sinopse; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicoes.sinopse IS 'Descrição da instituição';


--
-- Name: COLUMN instituicoes.nacional; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicoes.nacional IS 'Queria fazer isto, Vamos a ver que OGNs é que vão aparecer';


--
-- Name: COLUMN instituicoes.extinta; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicoes.extinta IS 'Devido ao DRe, temos pré 1974 a true';


--
-- Name: COLUMN instituicoes.params; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.instituicoes.params IS 'Guardar configs do frontend';


--
-- Name: instituicoes_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.instituicoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicoes_id_seq OWNER TO local_user;

--
-- Name: instituicoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.instituicoes_id_seq OWNED BY public.instituicoes.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO local_user;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO local_user;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO local_user;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: legislatura_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.legislatura_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    legislatura_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.legislatura_anexos OWNER TO local_user;

--
-- Name: TABLE legislatura_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.legislatura_anexos IS 'Devido à estrutura da DB, acaba por ser os documentos do ramo do executivo do Governo, por presidente representado legislatura_id. Não esquecer que existe uma mais importante instituicao_legislatura_anexos.';


--
-- Name: COLUMN legislatura_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.legislatura_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: legislatura_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.legislatura_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.legislatura_anexos_id_seq OWNER TO local_user;

--
-- Name: legislatura_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.legislatura_anexos_id_seq OWNED BY public.legislatura_anexos.id;


--
-- Name: legislaturas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.legislaturas (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    sigla character(6),
    nome character varying(255) NOT NULL,
    republica_id bigint NOT NULL,
    eleicoes date,
    formacao date NOT NULL,
    dissolucao date,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.legislaturas OWNER TO local_user;

--
-- Name: TABLE legislaturas; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.legislaturas IS 'Representa os ciclos das eleições e formação de Governo|Assembleia da Republica. Vai funcionar excelente para a actualidade pós 1974, republicas.id = 4, teremos de adaptar as anteriores.';


--
-- Name: legislaturas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.legislaturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.legislaturas_id_seq OWNER TO local_user;

--
-- Name: legislaturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.legislaturas_id_seq OWNED BY public.legislaturas.id;


--
-- Name: lei_adendas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.lei_adendas (
    id bigint NOT NULL,
    lei_original_id bigint NOT NULL,
    lei_adenda_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.lei_adendas OWNER TO local_user;

--
-- Name: lei_adendas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.lei_adendas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lei_adendas_id_seq OWNER TO local_user;

--
-- Name: lei_adendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.lei_adendas_id_seq OWNED BY public.lei_adendas.id;


--
-- Name: lei_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.lei_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    lei_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.lei_anexos OWNER TO local_user;

--
-- Name: COLUMN lei_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.lei_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: lei_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.lei_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lei_anexos_id_seq OWNER TO local_user;

--
-- Name: lei_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.lei_anexos_id_seq OWNED BY public.lei_anexos.id;


--
-- Name: lei_emissores; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.lei_emissores (
    id bigint NOT NULL,
    lei_id bigint NOT NULL,
    emissor_tipo character varying(255) NOT NULL,
    emissor_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT lei_emissores_emissor_tipo_check CHECK (((emissor_tipo)::text = ANY ((ARRAY['instituicao'::character varying, 'instituicao_legislatura'::character varying, 'instituicao_presidencial'::character varying, 'instituicao_cargo'::character varying, 'instituicao_governo'::character varying])::text[])))
);


ALTER TABLE public.lei_emissores OWNER TO local_user;

--
-- Name: TABLE lei_emissores; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.lei_emissores IS 'Única tabela para saber emissores; todas as outras tabelas *_leis são direitos e responsabilidade do tópico.';


--
-- Name: lei_emissores_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.lei_emissores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lei_emissores_id_seq OWNER TO local_user;

--
-- Name: lei_emissores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.lei_emissores_id_seq OWNED BY public.lei_emissores.id;


--
-- Name: lei_partes; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.lei_partes (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    codigo character(2) NOT NULL,
    parte character varying(255) NOT NULL,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.lei_partes OWNER TO local_user;

--
-- Name: lei_partes_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.lei_partes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lei_partes_id_seq OWNER TO local_user;

--
-- Name: lei_partes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.lei_partes_id_seq OWNED BY public.lei_partes.id;


--
-- Name: lei_tipos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.lei_tipos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.lei_tipos OWNER TO local_user;

--
-- Name: TABLE lei_tipos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.lei_tipos IS 'Para não inferir do nome do documento, agrupamos por tipo.';


--
-- Name: lei_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.lei_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lei_tipos_id_seq OWNER TO local_user;

--
-- Name: lei_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.lei_tipos_id_seq OWNED BY public.lei_tipos.id;


--
-- Name: leis; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.leis (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    lei_tipo_id bigint NOT NULL,
    codigo character varying(255) NOT NULL,
    nome_completo character varying(255) NOT NULL,
    proponente character varying(255),
    lei_parte_id bigint,
    sumario text,
    texto text,
    em_vigor boolean DEFAULT true NOT NULL,
    data_toggle date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.leis OWNER TO local_user;

--
-- Name: TABLE leis; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.leis IS 'Tabela principal de leis, com todas as informações necessárias para a sua consulta e pesquisa.';


--
-- Name: COLUMN leis.proponente; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.leis.proponente IS 'Caso não se conheça o emissor fica a string extraída';


--
-- Name: COLUMN leis.lei_parte_id; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.leis.lei_parte_id IS 'Recente filtro por tipo de entidade';


--
-- Name: COLUMN leis.sumario; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.leis.sumario IS 'Resumo da lei, extraido da web';


--
-- Name: COLUMN leis.texto; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.leis.texto IS 'Texto da lei, extraido da web';


--
-- Name: COLUMN leis.data_toggle; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.leis.data_toggle IS 'Leis começam activas, mas mudam para outros quando são revogadas ou substituídas';


--
-- Name: leis_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.leis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leis_id_seq OWNER TO local_user;

--
-- Name: leis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.leis_id_seq OWNED BY public.leis.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.logs (
    id bigint NOT NULL,
    user_id bigint,
    aplicacao_id bigint NOT NULL,
    method character varying(255) NOT NULL,
    code integer NOT NULL,
    url character varying(255) NOT NULL,
    message character varying(255),
    params json,
    reply json,
    "time" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.logs OWNER TO local_user;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_id_seq OWNER TO local_user;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO local_user;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO local_user;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: nacionalidades; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.nacionalidades (
    id bigint NOT NULL,
    nacionalidade character varying(255) NOT NULL,
    pais character varying(255) NOT NULL,
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nacionalidades OWNER TO local_user;

--
-- Name: COLUMN nacionalidades.params; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.nacionalidades.params IS 'Como outras, será classes de css para as bandeiras';


--
-- Name: nacionalidades_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.nacionalidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nacionalidades_id_seq OWNER TO local_user;

--
-- Name: nacionalidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.nacionalidades_id_seq OWNED BY public.nacionalidades.id;


--
-- Name: newsletter_users; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.newsletter_users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255),
    hash character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.newsletter_users OWNER TO local_user;

--
-- Name: COLUMN newsletter_users.hash; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.newsletter_users.hash IS 'uuid para unsubscribe';


--
-- Name: newsletter_users_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.newsletter_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.newsletter_users_id_seq OWNER TO local_user;

--
-- Name: newsletter_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.newsletter_users_id_seq OWNED BY public.newsletter_users.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO local_user;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO local_user;

--
-- Name: TABLE permissions; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.permissions IS 'Unidade base de permissão.';


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO local_user;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO local_user;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO local_user;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: presidenciais; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.presidenciais (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    sigla character(6),
    nome character varying(255) NOT NULL,
    republica_id bigint NOT NULL,
    eleicoes date,
    posse date NOT NULL,
    termino date,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.presidenciais OWNER TO local_user;

--
-- Name: TABLE presidenciais; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.presidenciais IS 'Representa os ciclos das eleições de Presidente da Republica Republica. Vai funcionar excelente para a actualidade pós 1974, republicas.id = 4, talvez pós 1910, republicas.id > 2.';


--
-- Name: presidenciais_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.presidenciais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presidenciais_id_seq OWNER TO local_user;

--
-- Name: presidenciais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.presidenciais_id_seq OWNED BY public.presidenciais.id;


--
-- Name: presidencial_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.presidencial_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    presidencial_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.presidencial_anexos OWNER TO local_user;

--
-- Name: TABLE presidencial_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.presidencial_anexos IS 'Devido à estrutura da DB, acaba por ser os documentos do ramo do executivo mas da Presidencia da República, por presidente representado presidencial_id. Não esquecer que existe uma mais importante instituicao_presidencial_anexos.';


--
-- Name: COLUMN presidencial_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.presidencial_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: presidencial_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.presidencial_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presidencial_anexos_id_seq OWNER TO local_user;

--
-- Name: presidencial_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.presidencial_anexos_id_seq OWNED BY public.presidencial_anexos.id;


--
-- Name: relacao_tipos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.relacao_tipos (
    id bigint NOT NULL,
    entre character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT relacao_tipos_entre_check CHECK (((entre)::text = ANY ((ARRAY['cidadaos'::character varying, 'instituicoes'::character varying, 'instituicao_cidadao'::character varying])::text[])))
);


ALTER TABLE public.relacao_tipos OWNER TO local_user;

--
-- Name: TABLE relacao_tipos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.relacao_tipos IS 'Tabela de apoio entre relação entre cidadãos e instituições, sob uma justificação.';


--
-- Name: relacao_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.relacao_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.relacao_tipos_id_seq OWNER TO local_user;

--
-- Name: relacao_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.relacao_tipos_id_seq OWNED BY public.relacao_tipos.id;


--
-- Name: republica_anexos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.republica_anexos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    republica_id bigint NOT NULL,
    anexo_tipo_id bigint NOT NULL,
    anexo character varying(255) NOT NULL,
    descricao character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.republica_anexos OWNER TO local_user;

--
-- Name: TABLE republica_anexos; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.republica_anexos IS 'Atalhar as nossas procuras à Republica, lançar links externos de interesse, imagens, etc';


--
-- Name: COLUMN republica_anexos.anexo; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON COLUMN public.republica_anexos.anexo IS 'Ex: O URL do anexo';


--
-- Name: republica_anexos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.republica_anexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.republica_anexos_id_seq OWNER TO local_user;

--
-- Name: republica_anexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.republica_anexos_id_seq OWNED BY public.republica_anexos.id;


--
-- Name: republicas; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.republicas (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    nome character varying(100) NOT NULL,
    inicio date NOT NULL,
    fim date,
    sinopse text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.republicas OWNER TO local_user;

--
-- Name: TABLE republicas; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.republicas IS 'Representa os grandes ciclos históricos desde a Monarquia Constitucional até à atualidade. Exemplo: Primeira República, Estado Novo, Terceira República, etc.';


--
-- Name: republicas_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.republicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.republicas_id_seq OWNER TO local_user;

--
-- Name: republicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.republicas_id_seq OWNED BY public.republicas.id;


--
-- Name: role_cargos; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.role_cargos (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    params json,
    role_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_cargos OWNER TO local_user;

--
-- Name: role_cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.role_cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_cargos_id_seq OWNER TO local_user;

--
-- Name: role_cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.role_cargos_id_seq OWNED BY public.role_cargos.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_permissions OWNER TO local_user;

--
-- Name: TABLE role_permissions; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.role_permissions IS 'Associa permissões me bloco por role.';


--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_permissions_id_seq OWNER TO local_user;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    params json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO local_user;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO local_user;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO local_user;

--
-- Name: statuses; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.statuses (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    params json NOT NULL,
    descricao text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT statuses_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['users'::character varying, 'documents'::character varying, 'tasks'::character varying])::text[])))
);


ALTER TABLE public.statuses OWNER TO local_user;

--
-- Name: TABLE statuses; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.statuses IS 'Tabela de apoio para objectos que tenham de ser confirmados no work-flow.';


--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statuses_id_seq OWNER TO local_user;

--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- Name: user_comentarios; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.user_comentarios (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    em character varying(255) NOT NULL,
    comentario_id bigint NOT NULL,
    comentario text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT user_comentarios_em_check CHECK (((em)::text = ANY ((ARRAY['users'::character varying, 'instituicoes'::character varying, 'cidadaos'::character varying, 'cidadao_cargos'::character varying, 'instituicao_legislaturas'::character varying, 'instituicao_presidencial'::character varying, 'instituicao_cargo'::character varying, 'instituicao_governo'::character varying])::text[])))
);


ALTER TABLE public.user_comentarios OWNER TO local_user;

--
-- Name: TABLE user_comentarios; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.user_comentarios IS 'Users com permissoes podem deixar comentários em vários objectos|tabelas. por em é a tabela, comentario_id o value da tabela';


--
-- Name: user_comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.user_comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_comentarios_id_seq OWNER TO local_user;

--
-- Name: user_comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.user_comentarios_id_seq OWNED BY public.user_comentarios.id;


--
-- Name: user_permissions; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_permissions OWNER TO local_user;

--
-- Name: TABLE user_permissions; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.user_permissions IS 'Permissões Extra se não coberto por roles.';


--
-- Name: user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_permissions_id_seq OWNER TO local_user;

--
-- Name: user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.user_permissions_id_seq OWNED BY public.user_permissions.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.user_roles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    cargo_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_roles OWNER TO local_user;

--
-- Name: TABLE user_roles; Type: COMMENT; Schema: public; Owner: local_user
--

COMMENT ON TABLE public.user_roles IS 'Maneira preferida de permissões, o role dá em bloco. Pode ter cargo extensível no role';


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_roles_id_seq OWNER TO local_user;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: local_user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    name character varying(255) NOT NULL,
    status_id bigint NOT NULL,
    email character varying(255) NOT NULL,
    cidadao_id bigint,
    rgpd boolean DEFAULT true NOT NULL,
    password character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO local_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: local_user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO local_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: anexo_tipos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.anexo_tipos ALTER COLUMN id SET DEFAULT nextval('public.anexo_tipos_id_seq'::regclass);


--
-- Name: aplicacoes id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.aplicacoes ALTER COLUMN id SET DEFAULT nextval('public.aplicacoes_id_seq'::regclass);


--
-- Name: cidadao_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_anexos ALTER COLUMN id SET DEFAULT nextval('public.cidadao_anexos_id_seq'::regclass);


--
-- Name: cidadao_cargo_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargo_anexos ALTER COLUMN id SET DEFAULT nextval('public.cidadao_cargo_anexos_id_seq'::regclass);


--
-- Name: cidadao_cargos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargos ALTER COLUMN id SET DEFAULT nextval('public.cidadao_cargos_id_seq'::regclass);


--
-- Name: cidadao_contactos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_contactos ALTER COLUMN id SET DEFAULT nextval('public.cidadao_contactos_id_seq'::regclass);


--
-- Name: cidadao_dados id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_dados ALTER COLUMN id SET DEFAULT nextval('public.cidadao_dados_id_seq'::regclass);


--
-- Name: cidadao_moradas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_moradas ALTER COLUMN id SET DEFAULT nextval('public.cidadao_moradas_id_seq'::regclass);


--
-- Name: cidadao_nacionalidades id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_nacionalidades ALTER COLUMN id SET DEFAULT nextval('public.cidadao_nacionalidades_id_seq'::regclass);


--
-- Name: cidadao_relacoes id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_relacoes ALTER COLUMN id SET DEFAULT nextval('public.cidadao_relacoes_id_seq'::regclass);


--
-- Name: cidadaos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadaos ALTER COLUMN id SET DEFAULT nextval('public.cidadaos_id_seq'::regclass);


--
-- Name: concelho_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelho_anexos ALTER COLUMN id SET DEFAULT nextval('public.concelho_anexos_id_seq'::regclass);


--
-- Name: concelhos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelhos ALTER COLUMN id SET DEFAULT nextval('public.concelhos_id_seq'::regclass);


--
-- Name: conselho_ministros id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.conselho_ministros ALTER COLUMN id SET DEFAULT nextval('public.conselho_ministros_id_seq'::regclass);


--
-- Name: contacto_tipos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.contacto_tipos ALTER COLUMN id SET DEFAULT nextval('public.contacto_tipos_id_seq'::regclass);


--
-- Name: diario_republica_glossarios id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_glossarios ALTER COLUMN id SET DEFAULT nextval('public.diario_republica_glossarios_id_seq'::regclass);


--
-- Name: diario_republica_publicacao_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_anexos ALTER COLUMN id SET DEFAULT nextval('public.diario_republica_publicacao_anexos_id_seq'::regclass);


--
-- Name: diario_republica_publicacao_leis id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_leis ALTER COLUMN id SET DEFAULT nextval('public.diario_republica_publicacao_leis_id_seq'::regclass);


--
-- Name: diario_republica_publicacoes id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacoes ALTER COLUMN id SET DEFAULT nextval('public.diario_republica_publicacoes_id_seq'::regclass);


--
-- Name: diario_republica_series id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_series ALTER COLUMN id SET DEFAULT nextval('public.diario_republica_series_id_seq'::regclass);


--
-- Name: diario_republicas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republicas ALTER COLUMN id SET DEFAULT nextval('public.diario_republicas_id_seq'::regclass);


--
-- Name: distrito_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distrito_anexos ALTER COLUMN id SET DEFAULT nextval('public.distrito_anexos_id_seq'::regclass);


--
-- Name: distritos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distritos ALTER COLUMN id SET DEFAULT nextval('public.distritos_id_seq'::regclass);


--
-- Name: entidade_juridica_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_anexos ALTER COLUMN id SET DEFAULT nextval('public.entidade_juridica_anexos_id_seq'::regclass);


--
-- Name: entidade_juridica_leis id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_leis ALTER COLUMN id SET DEFAULT nextval('public.entidade_juridica_leis_id_seq'::regclass);


--
-- Name: entidade_juridicas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridicas ALTER COLUMN id SET DEFAULT nextval('public.entidade_juridicas_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: freguesia_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesia_anexos ALTER COLUMN id SET DEFAULT nextval('public.freguesia_anexos_id_seq'::regclass);


--
-- Name: freguesia_tipos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesia_tipos ALTER COLUMN id SET DEFAULT nextval('public.freguesia_tipos_id_seq'::regclass);


--
-- Name: freguesias id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesias ALTER COLUMN id SET DEFAULT nextval('public.freguesias_id_seq'::regclass);


--
-- Name: governo_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governo_anexos ALTER COLUMN id SET DEFAULT nextval('public.governo_anexos_id_seq'::regclass);


--
-- Name: governos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governos ALTER COLUMN id SET DEFAULT nextval('public.governos_id_seq'::regclass);


--
-- Name: instituicao_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_anexos ALTER COLUMN id SET DEFAULT nextval('public.instituicao_anexos_id_seq'::regclass);


--
-- Name: instituicao_cargo_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_anexos ALTER COLUMN id SET DEFAULT nextval('public.instituicao_cargo_anexos_id_seq'::regclass);


--
-- Name: instituicao_cargo_leis id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_leis ALTER COLUMN id SET DEFAULT nextval('public.instituicao_cargo_leis_id_seq'::regclass);


--
-- Name: instituicao_cargos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargos ALTER COLUMN id SET DEFAULT nextval('public.instituicao_cargos_id_seq'::regclass);


--
-- Name: instituicao_com_tipos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_com_tipos ALTER COLUMN id SET DEFAULT nextval('public.instituicao_com_tipos_id_seq'::regclass);


--
-- Name: instituicao_contactos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_contactos ALTER COLUMN id SET DEFAULT nextval('public.instituicao_contactos_id_seq'::regclass);


--
-- Name: instituicao_dados id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_dados ALTER COLUMN id SET DEFAULT nextval('public.instituicao_dados_id_seq'::regclass);


--
-- Name: instituicao_entidade_juridicas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_entidade_juridicas ALTER COLUMN id SET DEFAULT nextval('public.instituicao_entidade_juridicas_id_seq'::regclass);


--
-- Name: instituicao_governos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_governos ALTER COLUMN id SET DEFAULT nextval('public.instituicao_governos_id_seq'::regclass);


--
-- Name: instituicao_legislaturas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislaturas ALTER COLUMN id SET DEFAULT nextval('public.instituicao_legislaturas_id_seq'::regclass);


--
-- Name: instituicao_leis id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_leis ALTER COLUMN id SET DEFAULT nextval('public.instituicao_leis_id_seq'::regclass);


--
-- Name: instituicao_moradas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_moradas ALTER COLUMN id SET DEFAULT nextval('public.instituicao_moradas_id_seq'::regclass);


--
-- Name: instituicao_nacionalidades id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_nacionalidades ALTER COLUMN id SET DEFAULT nextval('public.instituicao_nacionalidades_id_seq'::regclass);


--
-- Name: instituicao_presidenciais id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidenciais ALTER COLUMN id SET DEFAULT nextval('public.instituicao_presidenciais_id_seq'::regclass);


--
-- Name: instituicao_relacoes id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_relacoes ALTER COLUMN id SET DEFAULT nextval('public.instituicao_relacoes_id_seq'::regclass);


--
-- Name: instituicao_tipos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_tipos ALTER COLUMN id SET DEFAULT nextval('public.instituicao_tipos_id_seq'::regclass);


--
-- Name: instituicoes id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicoes ALTER COLUMN id SET DEFAULT nextval('public.instituicoes_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: legislatura_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislatura_anexos ALTER COLUMN id SET DEFAULT nextval('public.legislatura_anexos_id_seq'::regclass);


--
-- Name: legislaturas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislaturas ALTER COLUMN id SET DEFAULT nextval('public.legislaturas_id_seq'::regclass);


--
-- Name: lei_adendas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_adendas ALTER COLUMN id SET DEFAULT nextval('public.lei_adendas_id_seq'::regclass);


--
-- Name: lei_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_anexos ALTER COLUMN id SET DEFAULT nextval('public.lei_anexos_id_seq'::regclass);


--
-- Name: lei_emissores id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_emissores ALTER COLUMN id SET DEFAULT nextval('public.lei_emissores_id_seq'::regclass);


--
-- Name: lei_partes id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_partes ALTER COLUMN id SET DEFAULT nextval('public.lei_partes_id_seq'::regclass);


--
-- Name: lei_tipos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_tipos ALTER COLUMN id SET DEFAULT nextval('public.lei_tipos_id_seq'::regclass);


--
-- Name: leis id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.leis ALTER COLUMN id SET DEFAULT nextval('public.leis_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: nacionalidades id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.nacionalidades ALTER COLUMN id SET DEFAULT nextval('public.nacionalidades_id_seq'::regclass);


--
-- Name: newsletter_users id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.newsletter_users ALTER COLUMN id SET DEFAULT nextval('public.newsletter_users_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: presidenciais id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidenciais ALTER COLUMN id SET DEFAULT nextval('public.presidenciais_id_seq'::regclass);


--
-- Name: presidencial_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidencial_anexos ALTER COLUMN id SET DEFAULT nextval('public.presidencial_anexos_id_seq'::regclass);


--
-- Name: relacao_tipos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.relacao_tipos ALTER COLUMN id SET DEFAULT nextval('public.relacao_tipos_id_seq'::regclass);


--
-- Name: republica_anexos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republica_anexos ALTER COLUMN id SET DEFAULT nextval('public.republica_anexos_id_seq'::regclass);


--
-- Name: republicas id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republicas ALTER COLUMN id SET DEFAULT nextval('public.republicas_id_seq'::regclass);


--
-- Name: role_cargos id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_cargos ALTER COLUMN id SET DEFAULT nextval('public.role_cargos_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- Name: user_comentarios id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_comentarios ALTER COLUMN id SET DEFAULT nextval('public.user_comentarios_id_seq'::regclass);


--
-- Name: user_permissions id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_permissions_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: anexo_tipos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.anexo_tipos (id, tipo, descricao, params, created_at, updated_at) FROM stdin;
1	profile	Imagem minima para procurar para preencher front-end	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
2	image	Imagens em geral, referências em tabela Própria	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
3	url	Url da Internet	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
4	path	Path do servidor	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
5	document	Documento Remoto	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
6	base64	Encode Base64	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
7	video	Vídeo	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
8	audio	Áudio	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
9	other	Outro	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: aplicacoes; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.aplicacoes (id, uuid, name, slug, description, created_at, updated_at) FROM stdin;
1	3d924b69-0063-4943-824a-0d5bb445e7ca	Api DEV	http://localhost:4200	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
2	22993c21-2e98-454f-a1df-8b8d9c5150c1	Main App Api	https://bewhy.org	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: cidadao_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_anexos (id, uuid, nome, cidadao_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadao_cargo_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_cargo_anexos (id, uuid, nome, cidadao_cargo_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadao_cargos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_cargos (id, cidadao_id, cargo_id, instituicao_id, inicio, fim, sinopse, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadao_contactos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_contactos (id, cidadao_id, contacto_tipo_id, contacto, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadao_dados; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_dados (id, nif, cc, cc_aux, seg_social, n_saude, cidadao_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadao_moradas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_moradas (id, cidadao_id, morada, codigo_postal, localidade, concelho_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadao_nacionalidades; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_nacionalidades (id, cidadao_id, nacionalidade_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadao_relacoes; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadao_relacoes (id, cidadao_id, com_cidadao_id, relacao_tipo_id, onde, onde_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cidadaos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.cidadaos (id, uuid, nome, nome_completo, data_nascimento, data_falecimento, genero, freguesia_id, sinopse, nacional, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: concelho_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.concelho_anexos (id, uuid, nome, concelho_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: concelhos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.concelhos (id, uuid, nome, sinopse, distrito_id, created_at, updated_at) FROM stdin;
1	7afa24c0-465e-4c53-8031-277d273f6552	Angra do Heroísmo	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
2	ef671579-67ac-4d29-a652-e5c030d51d4b	Calheta	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
3	23e3f680-7c8d-4f51-812f-d0314817330c	Corvo	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
4	74a0faa5-6f87-4f8e-afde-95e2f2504d6c	Horta	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
5	4a784231-c1ce-49ca-945d-082e8fdf65c8	Lagoa	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
6	a69bbd3e-3c02-46e9-a959-718449f6485c	Lajes das Flores	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
7	cea1a79d-b1a1-451e-943f-c434d5af8f7d	Lajes do Pico	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
8	3d99969c-d29b-4aab-bd7a-234a0f19fcd1	Madalena	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
9	f36a708c-6f85-4b59-9e42-37d923dc855b	Nordeste	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
10	5df44b09-fb45-463e-be4d-babc7ad154da	Ponta Delgada	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
11	79c759bd-1351-4627-bb34-32e4a23564a9	Povoação	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
12	69f7cd17-bb67-4d23-a282-40ca85ca145f	Ribeira Grande	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
13	f470ebd4-25af-43ba-8f73-40e47756c867	Santa Cruz da Graciosa	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
14	996904f2-acb6-4177-b301-c32ba9c5a757	Santa Cruz das Flores	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
15	e8d9a34c-d6b1-44e2-887c-941279994969	São Roque do Pico	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
16	dd7ffac2-98fc-4def-99bd-58d7ca2f4cb8	Velas	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
17	b9436bfe-4067-4fb8-8204-123d0d0602d5	Vila do Porto	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
18	3c249b70-6a13-4c9f-a38b-01f25286a8a8	Vila Franca do Campo	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
19	5a0c3360-fda7-46a4-b863-b06539ff0310	Praia da Vitória	\N	1	2025-03-23 11:47:09	2025-03-23 11:47:09
20	ff3d6007-425b-4c9d-9bdd-28dcb7dc1391	Águeda	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
21	3764bfcf-38af-4192-8609-a9d1d338dd10	Albergaria-a-Velha	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
22	966b5f35-d3cb-4f4e-a733-2701c4dfb53d	Anadia	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
23	5ba4d1b1-cc1f-49cd-930c-05d7b4586432	Arouca	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
24	3b010a70-5e86-4768-83d8-645ced05e914	Aveiro	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
25	fcbdf80c-72df-418e-9d10-01d10a89ce02	Castelo de Paiva	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
26	7ec70d0b-4412-4d54-93b2-f439b9203490	Espinho	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
27	aae898b0-6d98-4e89-b4f2-c2e42e784966	Estarreja	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
28	06b51888-bd56-48f6-8093-c937c1115f64	Ílhavo	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
29	a1b554a6-d8cb-417e-a2a5-1d5467051370	Mealhada	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
30	af937476-9d99-4d58-9c76-0aafc2ac9902	Murtosa	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
31	4db1de1a-990a-48c2-bc4b-ea583281a687	Oliveira de Azeméis	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
32	60618c54-6502-442b-8a2c-10171bc64dde	Oliveira do Bairro	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
33	f6623586-eb7c-47db-ae16-c87fc29c0532	Ovar	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
34	1f28e3db-0e45-4a4c-9409-ba44ee86f2c1	Santa Maria da Feira	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
35	09550f2b-657a-440c-b9ad-2790215ba328	São João da Madeira	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
36	f62819f7-dec0-4ffd-9e2a-fb2b620bca9b	Sever do Vouga	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
37	3a47cac3-095b-431f-ad69-76e58d4f37c0	Vagos	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
38	cdfc2d9f-b5d5-432c-9828-46f3c9a4c083	Vale de Cambra	\N	2	2025-03-23 11:47:09	2025-03-23 11:47:09
39	d2471975-3abe-4091-8148-9403d16e45a0	Aljustrel	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
40	79a2a0dd-fdc4-4641-994c-c866669de648	Almodôvar	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
41	8c5c8fe8-5570-4a05-a7e9-4c85dbe0e5f6	Alvito	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
42	5acbff85-1ac1-4d22-b815-5db6f1429a87	Barrancos	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
43	a9f1455c-733e-48cf-9b85-53e6555cdbbc	Beja	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
44	7abf906e-d149-42cb-a22e-74972f79cb47	Castro Verde	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
45	7d0a394a-0078-4ef0-85cd-2cd0d3cfe5e9	Cuba	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
46	74b3b920-8fba-4ae8-a3eb-589d28738b56	Ferreira do Alentejo	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
47	879024fd-9324-48ac-bebf-27fb1619cf2a	Mértola	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
48	6d82a435-6ce7-4139-9030-78898ea213d8	Moura	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
49	bb93679f-41b1-4449-ab46-7e2cafd22c60	Odemira	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
50	48744175-e0df-4cc1-9ede-ac1972549bf3	Ourique	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
51	8c1d7dbe-ed29-4dba-8d21-2aca99167e27	Serpa	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
52	864a1727-2b1a-4611-a588-81b5933ed686	Vidigueira	\N	3	2025-03-23 11:47:09	2025-03-23 11:47:09
53	92582c89-bbc1-47de-98b0-ac66c76cf364	Amares	\N	4	2025-03-23 11:47:09	2025-03-23 11:47:09
54	fb3556af-21cb-41a5-b2ac-ebd7367e91d4	Barcelos	\N	4	2025-03-23 11:47:09	2025-03-23 11:47:09
55	f28edf20-023c-4397-902a-febcd4e60deb	Braga	\N	4	2025-03-23 11:47:09	2025-03-23 11:47:09
56	233fd94a-d21c-46dc-9198-a62b3ecabc48	Cabeceiras de Basto	\N	4	2025-03-23 11:47:09	2025-03-23 11:47:09
57	f3cd5359-288d-4131-a3d4-2d19bbdfb21c	Celorico de Basto	\N	4	2025-03-23 11:47:09	2025-03-23 11:47:09
58	3222a6da-5944-4112-9eee-7e7b1b4a5120	Esposende	\N	4	2025-03-23 11:47:09	2025-03-23 11:47:09
59	60fdd0c8-472a-49bb-958d-568cc2011365	Fafe	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
60	7b943b1b-daf2-4fff-8a72-bbf54985424e	Guimarães	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
61	9e11c6d6-76a9-4ffd-88df-bf31e7a92b58	Póvoa de Lanhoso	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
62	e6de3f9a-72c1-4537-9309-72ec4d99b050	Terras de Bouro	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
63	9bcee15b-feee-4346-a6b9-9bd386718fd1	Vieira do Minho	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
64	2c9211ed-026f-4cb4-85ac-3ec48a0c0d0f	Vila Nova de Famalicão	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
65	7cf0dcb9-ca47-4a0a-8997-a043b3e9107d	Vila Verde	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
66	932db655-b194-4750-bd43-e68da567c4ab	Vizela	\N	4	2025-03-23 11:47:10	2025-03-23 11:47:10
67	b39e3545-864a-48f8-8678-b4bd2b12d0ac	Alfândega da Fé	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
68	9b9e8f52-b598-4803-b6dd-fe5e1cc0f0fb	Bragança	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
69	032151e9-9cae-4fd9-a581-be2cb42bb3fd	Carrazeda de Ansiães	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
70	42cc39cb-a5d0-47fa-abe2-d4c4cd8d8c7f	Freixo de Espada à Cinta	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
71	24cc487f-0d34-418c-aa14-24c330d396e6	Macedo de Cavaleiros	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
72	b95e1e5d-9872-402d-9fcc-7c1c314b7aa8	Miranda do Douro	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
73	013779d9-5b69-4508-b1fc-6237274584bb	Mirandela	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
74	4d545483-b102-405b-9946-7df95ed9c12e	Mogadouro	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
75	351e6c96-94a2-4ff1-80c0-6d33138b3cd9	Torre de Moncorvo	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
76	da1dc4f6-1dbd-48be-b555-611eb952671d	Vila Flor	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
77	d6cc90dd-f703-4a5a-bd8c-d945d0ca0360	Vimioso	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
78	adea48f2-fce6-441d-97b1-8ab2437064cb	Vinhais	\N	5	2025-03-23 11:47:10	2025-03-23 11:47:10
79	73e5484b-6177-4267-9536-a47d933e1b5b	Belmonte	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
80	9177bffc-3faa-425c-a271-d32c83eef4b9	Castelo Branco	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
81	8da07ea8-1683-4919-9c7d-06711cf72495	Covilhã	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
82	5f40c631-5cec-4c34-9a7b-6e175d541fde	Fundão	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
83	c6d784bd-ddbb-425b-9f5d-2e368c2772bc	Idanha-a-Nova	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
84	bfb7c70d-5105-4af4-bb3c-fd32756f7be8	Oleiros	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
85	aa4bcc8c-19f4-4838-8747-62fddd7ef40b	Penamacor	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
86	bc3fcd3e-e4af-4397-a6bc-46413a9e917a	Proença-a-Nova	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
87	cd479038-cdc8-4f96-8124-e5cf7d3926bb	Sertã	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
88	e0a14a73-9c38-4b2d-b9bb-dc20ab50a004	Vila de Rei	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
89	83b4d62a-cde4-42f0-9ece-b76491375487	Vila Velha de Ródão	\N	6	2025-03-23 11:47:10	2025-03-23 11:47:10
90	773cf6dc-d323-49d8-88dc-733ef68d9fd8	Arganil	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
91	994d0392-453a-475f-88fb-1a2f1d40cdeb	Cantanhede	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
92	5e84f212-f369-452c-a122-b148cf5e1e10	Coimbra	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
93	8e2d1eb3-22d0-4751-b3c4-568d7a5e277a	Condeixa-a-Nova	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
94	9c19211a-0162-49c6-a2bb-a269ff80985f	Figueira da Foz	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
95	ca753288-d888-410c-953b-3f02ec879c10	Góis	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
96	73f99aa0-7981-4a97-84cc-6d973fd11dcd	Lousã	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
97	00124703-0df6-4f92-8454-c6e58e91924b	Mira	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
98	450e0900-b5fc-4486-a7c9-a468fa0b94c6	Miranda do Corvo	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
99	af432e59-d2e1-4cc8-90f1-7e8ec6f070c3	Montemor-o-Velho	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
100	b8fcf896-1d7f-4e5d-bbf5-e1d66d41a73d	Oliveira do Hospital	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
101	6b9d88a3-56ce-4a06-8000-ee3c29ceb1a3	Pampilhosa da Serra	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
102	24f6f17b-68c9-4d7d-95b7-d82e3f053c54	Penacova	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
103	70730b2e-e290-4f12-a592-0bc98ecbabe8	Penela	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
104	da5a25b9-d0fb-4110-a7cf-a7926c619216	Soure	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
105	0c17b105-b9d7-4036-9e54-57956a179642	Tábua	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
106	546652e9-bacd-44c9-9f2d-93f4cd23ab4d	Vila Nova de Poiares	\N	7	2025-03-23 11:47:10	2025-03-23 11:47:10
107	90043651-b67f-4725-87b8-8d35fd861c0b	Alandroal	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
108	75b16bfe-8459-4d6c-a394-1a5810e5e25f	Arraiolos	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
109	2b9b4548-23e1-4042-aba0-8caaceee2a8b	Borba	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
110	8a6a048b-5618-41e8-97bc-0a5df455c66b	Estremoz	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
111	f816d77b-e023-4a62-b51c-d6567a4033aa	Évora	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
112	641514a6-cf05-4dac-98a4-650be453bc82	Montemor-o-Novo	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
113	2d0db95c-f950-4c12-a1b0-37311e68a5e8	Mora	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
114	5b217698-e009-43a0-b805-dc3134365134	Mourão	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
115	86e73214-ea1d-487b-9109-f1f679422b66	Portel	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
116	a00f1319-caf6-4f3c-8157-20e9762475b5	Redondo	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
117	0c1d8b0c-25e1-4589-91db-443ff67847c5	Reguengos de Monsaraz	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
118	8e2736a5-300e-40f4-9403-9b1474f4def1	Vendas Novas	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
119	b3e86755-abfe-40b4-b105-4b7a23ae503b	Viana do Alentejo	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
120	674661bc-f78d-474f-9b4a-fbf6485c6c96	Vila Viçosa	\N	8	2025-03-23 11:47:10	2025-03-23 11:47:10
121	a571f368-685a-4a72-9d53-ba8baaeb867e	Albufeira	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
122	e0f291ee-aac5-4d93-8e22-1d1f438d1ab6	Alcoutim	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
123	89c2e485-285b-476d-a128-c93bd9493d5f	Aljezur	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
124	f2770ea0-04b2-4e8b-808a-761f1e4dd92b	Castro Marim	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
125	5905a52e-f6d0-4a1c-8f52-4bb08b0769c1	Faro	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
126	ac49832b-8835-4659-ba34-83519c4cca56	Lagoa	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
127	c0d2674a-2804-426e-b025-98975a20bc79	Lagos	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
128	da05a306-473a-4255-b74b-073ec153fea7	Loulé	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
129	cd910c3b-99a6-41ef-b788-200134f265a3	Monchique	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
130	7f030181-7fb2-4892-afc1-bebed6d9c80b	Olhão	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
131	60f4d660-7b53-4a20-9203-cc8e1f81fbc3	Portimão	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
132	854aa506-8ec3-455b-894c-b6f52ba31ab9	São Brás de Alportel	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
133	05555e62-fcb4-4f72-b295-2f33bc78f1e3	Silves	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
134	4ad15f3d-e4cf-4cd3-8c86-b5f7f7439d2e	Tavira	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
135	ec17a0ad-3388-4c45-8c27-73db37cf4ce0	Vila do Bispo	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
136	344f458f-69ec-401a-8d08-29211230e138	Vila Real de Santo António	\N	9	2025-03-23 11:47:10	2025-03-23 11:47:10
137	b446995c-d01c-46e2-9b17-818531bc28b0	Aguiar da Beira	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
138	5facf657-672c-4b8a-9965-507382ec7639	Almeida	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
139	71c547f8-4b41-4ae0-9be9-b766b3654cbb	Celorico da Beira	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
140	a2402d20-2410-461f-8347-a7ca2d91b6cd	Figueira de Castelo Rodrigo	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
141	f6ee4671-6f06-4b99-bd2b-7b093a019156	Fornos de Algodres	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
142	77ce5007-5762-42f0-837d-b945bcfcc580	Gouveia	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
143	f8e2de68-095e-468f-a876-7a8cd7886d64	Guarda	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
144	76a3892d-206a-4b02-9b2c-d7272954b8f5	Manteigas	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
145	c9c2e576-5219-4945-9dee-9343dd4adcde	Mêda	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
146	a9d0f940-1e14-4f5a-aeca-afe97b438e08	Pinhel	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
147	e1dad2d6-9f83-47b2-8328-0713ad72fadc	Sabugal	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
148	d6c055f9-5472-4447-adca-9c105b8a350e	Seia	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
149	6bc5948a-9067-4260-a258-809216620731	Trancoso	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
150	d9c85b1a-cb00-438c-ae4c-fc6c98e68fb7	Vila Nova de Foz Côa	\N	10	2025-03-23 11:47:10	2025-03-23 11:47:10
151	e396642c-5de6-4e7c-bc30-a129fdbbeeee	Alcobaça	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
152	72de4402-4421-4a59-9487-203e5bbfba3e	Alvaiázere	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
153	d7416618-d673-446e-a5fc-3551100631d0	Ansião	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
154	1f2f4954-5d19-415a-861f-23dfd019916b	Batalha	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
155	9b5ea589-dc29-4a99-9718-b9e6be585acc	Bombarral	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
156	a93249fc-198d-4813-90b5-2b60be17789e	Caldas da Rainha	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
157	0f13caf0-92d3-407e-a38c-83490661cdf9	Castanheira de Pêra	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
158	040a7879-ca80-4f80-b985-6da87d4df0a3	Figueiró dos Vinhos	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
159	e41b4752-cf88-455a-85f6-10ca1aadd52c	Leiria	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
160	673b7177-119e-4450-a607-fd93dff52b5d	Marinha Grande	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
161	151c301e-31b3-4af4-a759-dc6736c0ff60	Nazaré	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
162	68a0ee8b-89ab-463d-b340-b4ee88baea4d	Óbidos	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
163	43b2b84e-3738-4eb0-b7bc-40d7fa66ed17	Pedrógão Grande	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
164	c2e563cf-b954-4d05-b0cf-2306e4d45947	Peniche	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
165	8d54bdcb-6338-44e4-87be-d24055466feb	Pombal	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
166	6e159bf3-5cf8-4579-82f1-5699f46f736e	Porto de Mós	\N	11	2025-03-23 11:47:10	2025-03-23 11:47:10
167	c7755515-6585-4b84-a6db-c7d7cf86fd31	Alenquer	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
168	97abc7ac-0b92-4f06-adb7-d368d8c4d457	Amadora	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
169	38f18851-555d-46f9-831a-eb9cc5b782a7	Arruda dos Vinhos	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
170	c3337554-ed94-45ac-b14b-258dda3f7a86	Azambuja	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
171	03635006-7acf-4cef-9c7d-5d8ab05d03e4	Cadaval	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
172	6bbaa0c8-da8e-43e6-9762-8bc53291dc9d	Cascais	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
173	81101cb0-3459-4fa2-ac51-efbfeb00e120	Lisboa	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
174	77ceb83c-004e-4c58-8e11-d79d75a2a929	Loures	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
175	2e36b277-ed72-4d05-9089-8d4efa5fc8bb	Lourinhã	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
176	c4d05476-43ac-41e7-8883-bef7756ce804	Mafra	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
177	b57a9509-41d9-479c-9232-6a6471cbc7a5	Odivelas	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
178	b4e7f05d-fcc9-41d2-a82e-b25cba9f1611	Oeiras	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
179	00874de9-9435-4f80-883d-16ff49ec8357	Sintra	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
180	4afadc89-9c1f-4c08-a6e4-815f233bb44f	Sobral de Monte Agraço	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
181	badfa931-5932-4b32-bab7-d1413abd0a2e	Torres Vedras	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
182	94714d79-d534-45c2-b677-79f8aabcfb3b	Vila Franca de Xira	\N	12	2025-03-23 11:47:10	2025-03-23 11:47:10
183	df4b76aa-0774-473d-8c6b-a58e7d3e96ad	Calheta	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
184	3324dc29-b7b2-44f5-8e28-fa075f0ab1cc	Câmara de Lobos	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
185	48162e74-4302-4b94-a20b-dcfa29c560dd	Funchal	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
186	11be598c-8814-4b85-b47f-dc1cd1ba951f	Machico	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
187	397782c3-8b7b-4ef0-a356-7c57ea8d6d45	Ponta do Sol	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
188	41928c59-8ad7-472c-9e53-82981a06ca5d	Porto Moniz	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
189	32da0f02-19ab-438e-8e02-0ab95cd99282	Porto Santo	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
190	3afc3775-e378-4314-a5be-8080b95eac52	Ribeira Brava	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
191	f05018ba-e775-425e-a791-1a3591726af6	Santa Cruz	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
192	8cebe9f6-37d8-48ad-9928-00d3e80a9345	Santana	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
193	ea665694-17e2-4ba6-8ad5-cfbbadd046fc	São Vicente	\N	13	2025-03-23 11:47:10	2025-03-23 11:47:10
194	61567046-bdf2-4283-a17a-1b15fa7a57f7	Alter do Chão	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
195	555cdcff-c681-4039-92ea-2aafb0592746	Arronches	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
196	9721703f-8b3f-4f0a-838d-583f4510d706	Avis	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
197	157347d5-69dd-418c-9912-5a76db6f4585	Campo Maior	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
198	613b1486-2fa6-464f-9921-e237474f7032	Castelo de Vide	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
199	f880ac4b-9fb5-43b0-b95e-73474ca9fc42	Crato	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
200	3d498064-8e69-43f7-bdbe-d7a69e20cd8d	Elvas	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
201	c70bea61-bc03-484e-930c-b0358a5678b2	Fronteira	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
202	f4c3d63e-53e4-4172-ba3e-d65bca6283c8	Gavião	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
203	d7af8a57-32cb-417d-920e-6330cbac273b	Marvão	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
204	0efef29f-87ae-43e2-9f86-a4187cb5c131	Monforte	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
205	24a4a7c0-89a7-460f-b8f4-61bfe55ad6da	Nisa	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
206	c43d1157-f9e1-4342-b7d1-461c9ee86486	Ponte de Sôr	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
207	244c88d9-69c5-4957-8930-b47117f42925	Portalegre	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
208	18fc9ad2-cde3-4790-9dd3-164f39d1bc4b	Sousel	\N	14	2025-03-23 11:47:10	2025-03-23 11:47:10
209	95e3fa43-1880-4fef-9d57-02942e9f3a7d	Amarante	\N	15	2025-03-23 11:47:10	2025-03-23 11:47:10
210	39cba1e6-02f4-4a88-a484-165cd69b4eff	Baião	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
211	9268f290-06b0-4a8d-87c7-c725128ef5a4	Felgueiras	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
212	a75a56a8-538d-48bf-800f-381bde0e1a64	Gondomar	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
213	005c3f8b-1fe6-4dff-a874-1f605095c977	Lousada	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
214	b1f9763b-b717-4daa-bb52-ec77a3399016	Maia	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
215	832a7d6a-d34f-4499-874e-d39ef5473c76	Marco de Canaveses	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
216	a4104201-9eef-455c-9c57-7da53cf1ec17	Matosinhos	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
217	fe3ed668-9d4a-40cc-ba25-3affdc9ff1bf	Paços de Ferreira	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
218	ac0422b0-ca9c-4038-9b85-75ab02c7e89c	Paredes	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
219	45736ba8-9755-4865-8b1f-14f09378cb6a	Penafiel	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
220	83037491-4f74-4d9b-a13c-588167ea16aa	Porto	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
221	8e3ab56e-b7bf-4bb5-a3f0-37f6f5ab0f3e	Póvoa de Varzim	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
222	1230bfa2-411a-464e-b63f-3883732e68ca	Santo Tirso	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
223	068fe975-bccf-46a3-88ec-319eea1a1251	Trofa	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
224	8ed6ecf5-e2ae-41b7-b790-d5b8d77e98fb	Valongo	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
225	12f151f1-f9d4-4895-ad70-357051d9448d	Vila do Conde	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
226	98ab3e31-c098-4fc9-94a8-98b35c5012da	Vila Nova de Gaia	\N	15	2025-03-23 11:47:11	2025-03-23 11:47:11
227	a2a5f83f-3773-4762-9d9a-f300acf87d69	Abrantes	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
228	1bc6387f-ea12-4ef0-98b2-c0afa34e800a	Alcanena	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
229	3210f9a2-2e65-4d1c-b25a-1866756437d6	Almeirim	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
230	974fae31-2921-4916-98a4-ec2200ed843d	Alpiarça	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
231	ab5e6144-7220-4b06-b9c2-94f859d00230	Benavente	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
232	8a6170d9-cfcc-4d22-8bc7-e7b4081885f8	Cartaxo	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
233	bf768d90-b5f9-43a6-b7a1-f0eb789779bd	Chamusca	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
234	eae6087b-7a34-4d74-adff-6c1d3ebcf479	Constância	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
235	03dea853-2358-4db5-b993-af3413218a34	Coruche	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
236	60a9c91b-ac23-4ce2-88ca-438a324862e6	Entroncamento	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
237	c430016a-5967-4105-bfe5-3fb9d78baa44	Ferreira do Zêzere	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
238	e082c912-2837-42b3-afd5-733a82e7f409	Golegã	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
239	2d2dc391-177f-4de0-9153-4c705841b3e7	Mação	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
240	16ea6b53-87a9-4170-af27-96360f6041ec	Ourém	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
241	ef80396a-5560-4eea-ac40-e555205ab939	Rio Maior	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
242	221fcb14-13a2-4053-adbc-61cd5a1dd85e	Salvaterra de Magos	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
243	1b8b3845-cc6b-47fa-acbe-25a7b314f3f0	Santarém	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
244	2feae6c0-cc08-4b3e-ad15-37c77a1ff0b0	Sardoal	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
245	d11a8550-8fb3-4695-9236-e85a1be169bd	Tomar	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
246	0b05e412-2135-4bf2-b7a0-1249629625d3	Torres Novas	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
247	fb0523c2-8947-452c-894c-b6053769e955	Vila Nova da Barquinha	\N	16	2025-03-23 11:47:11	2025-03-23 11:47:11
248	91a32928-1db3-486c-b2f4-ebcf49a89f2e	Alcácer do Sal	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
249	b005a152-4769-4a78-93d6-a89d68b4fa78	Alcochete	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
250	a397a206-14e7-465d-8d2e-04c5a09dc914	Almada	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
251	52204902-c038-4839-860a-b6bbed7618ef	Barreiro	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
252	cf756797-92db-4216-9187-7772c8a2c378	Grândola	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
253	1fb9a5f3-1bc0-40be-8923-f425f6276827	Moita	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
254	cf67c9fa-5db2-4fa1-b407-a53b7118e32b	Montijo	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
255	29abce60-d6ea-4613-b2c3-dfacc8ec5d58	Palmela	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
256	9d216d8e-aee0-4dd0-8139-68adcf4723f4	Santiago do Cacém	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
257	8adb4c17-3b74-4d3b-97af-1a3022dafdd3	Seixal	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
258	f37e0aa5-ae96-49cc-bc96-be6c416d71ec	Sesimbra	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
259	507f8fe7-0f0b-4c29-96a3-25ce08b28e42	Setúbal	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
260	21e5dfe6-2d29-44ac-b44c-ab7225e5724e	Sines	\N	17	2025-03-23 11:47:11	2025-03-23 11:47:11
261	51d80a5c-771d-4138-a3ef-fcb3feb510ce	Arcos de Valdevez	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
262	b62282ed-e286-42ff-9f2d-9f2bb95537e9	Caminha	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
263	3ff0dae9-1831-4471-a131-9b693d8ed53e	Melgaço	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
264	6629242b-7b15-40be-a693-82a525fa8dbc	Monção	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
265	17c266c9-f6a4-4e0e-8133-949377247b9f	Paredes de Coura	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
266	2e577271-5eb7-48c5-ab3e-336c8c54d9d8	Ponte da Barca	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
267	f3bc504a-beb0-4c3b-b402-a2e7e32db75f	Ponte de Lima	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
268	2fb717b9-e37e-4196-9854-f47dcf59c588	Valença	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
269	812af09b-c735-4c87-b670-8b4f0ce2762e	Viana do Castelo	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
270	97dd2430-258c-4bd2-82da-04e4404b98cc	Vila Nova de Cerveira	\N	18	2025-03-23 11:47:11	2025-03-23 11:47:11
271	e20a9707-51a5-4d80-bd56-e96b146790cf	Alijó	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
272	9c6397a9-e4a0-4c68-891e-f5aed5abb41d	Boticas	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
273	8a0978e8-729d-4983-bf73-f14f2e418861	Chaves	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
274	126a7758-9373-406e-8028-5fcc7cab061a	Mesão Frio	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
275	893e3540-99ea-4eb8-bf8b-a79d12397330	Mondim de Basto	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
276	4136e425-a841-4849-9bc8-45aae64a6169	Montalegre	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
277	c4c3a680-037e-4af9-b444-eda54ceca1da	Murça	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
278	d41a800a-b294-4154-ab3a-3386a4141169	Peso da Régua	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
279	554d7556-1743-4ea0-a507-40b5c61598fa	Ribeira de Pena	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
280	274fb383-2890-49e1-af65-3e63fd7785e6	Sabrosa	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
281	c3d54416-1a6a-4eac-9dc0-3be7dbc28f97	Santa Marta de Penaguião	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
282	21fef357-1879-47d5-b74c-ee8b965f06f7	Valpaços	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
283	8193c47f-f075-4228-b518-65897b779125	Vila Pouca de Aguiar	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
284	37e872a6-cce4-4453-afb0-31a9db943232	Vila Real	\N	19	2025-03-23 11:47:11	2025-03-23 11:47:11
285	4fb29c50-8f91-46a4-b071-0df75ffba0c4	Armamar	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
286	8309bfc9-0a27-41fb-83e1-7e5262b182cd	Carregal do Sal	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
287	99613362-cdc8-4f6c-9711-0e2559e982ad	Castro Daire	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
288	66d073dc-aab7-4b76-a712-ac4ce9916435	Cinfães	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
289	ef24eb33-5b4b-4eaf-b700-d6ca83ae46fd	Lamego	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
290	4b433a79-1c30-4cdc-ad80-1a48f477d6b2	Mangualde	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
291	42595b7f-e3e7-413a-937b-b421c127d6b7	Moimenta da Beira	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
292	7f0d97e1-6d57-4481-9579-8bfe22349a5c	Mortágua	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
293	6c4bc928-3004-490b-941d-bd1a788b805a	Nelas	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
294	83b57449-e101-4c36-8a27-2ded356f356f	Oliveira de Frades	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
295	ab53c939-4e0f-4b2d-9109-a7cd1f22e84a	Penalva do Castelo	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
296	aeed0f22-decd-464c-855f-78f37aff5792	Penedono	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
297	26cb2b88-3776-4451-8c7b-8be656008e19	Resende	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
298	893cffc0-1fe8-4667-83be-5e6b3304c7c2	Santa Comba Dão	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
299	16973881-b464-49fa-98d7-8017a30d2336	São João da Pesqueira	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
300	a5901c21-8020-4c19-870a-cb738e8e094e	São Pedro do Sul	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
301	6dbf730e-c5c7-4676-9e5e-ea078f4a617f	Sátão	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
302	7df90abe-dd6f-40aa-bd8c-92fce5f22bed	Sernancelhe	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
303	d9cca9a8-4984-42f2-9465-c9eb68f9de39	Tabuaço	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
304	a9f148d1-db77-443e-a724-934bc4d5861d	Tarouca	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
305	bc871b0c-26e1-4263-9312-833dac86c1f2	Tondela	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
306	d5755e80-19f2-4018-b76f-a0d6c4d88f92	Vila Nova de Paiva	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
307	6c352297-8bcc-4304-b2f2-3fcc61fba355	Viseu	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
308	d7b75e05-3ec1-4a5d-8366-dfc45d4a5506	Vouzela	\N	20	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: conselho_ministros; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.conselho_ministros (id, instituicao_governo_id, cargo_id, cidadao_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: contacto_tipos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.contacto_tipos (id, tipo, description, params, created_at, updated_at) FROM stdin;
1	Website	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
2	Email	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
3	Telefone	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
4	Fax	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
5	X	Redes Sociais	"{\\"background\\":{\\"hex\\":\\"#000000\\",\\"bootstrap\\":\\"black\\"},\\"color\\":{\\"hex\\":\\"#FFFFFF\\",\\"bootstrap\\":\\"white\\"},\\"icon\\":\\"fa fa-x\\"}"	2025-03-23 11:47:11	2025-03-23 11:47:11
6	Facebook	Facebook	"{\\"background\\":{\\"hex\\":\\"#3b5998\\",\\"bootstrap\\":\\"facebook\\"},\\"color\\":{\\"hex\\":\\"#FFFFFF\\",\\"bootstrap\\":\\"white\\"},\\"icon\\":\\"fa fa-facebook\\"}"	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: diario_republica_glossarios; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.diario_republica_glossarios (id, uuid, nome, texto, path, src, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: diario_republica_publicacao_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.diario_republica_publicacao_anexos (id, uuid, nome, diario_republica_publicacao_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: diario_republica_publicacao_leis; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.diario_republica_publicacao_leis (id, dr_publicacao_id, lei_id, src, paginas, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: diario_republica_publicacoes; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.diario_republica_publicacoes (id, uuid, nome, src, diario_republica_id, serie_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: diario_republica_series; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.diario_republica_series (id, nome, sinopse, serie_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: diario_republicas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.diario_republicas (id, uuid, nome, publicacao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: distrito_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.distrito_anexos (id, uuid, nome, distrito_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: distritos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.distritos (id, uuid, nome, sinopse, created_at, updated_at) FROM stdin;
1	104f4ef4-8b67-45f1-8869-5cac128b274d	Açores	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
2	ab2affda-f253-4b86-9345-4d01823cc12c	Aveiro	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
3	63e3b350-2a7b-43d7-91dc-8ae7283273c8	Beja	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
4	2bb05b37-e3dd-46c9-a362-9fda53858ef1	Braga	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
5	a63b4afc-c989-4f3c-9bda-4cedf4f1b26c	Bragança	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
6	f37036b6-2a22-432a-9d4f-049436e360e1	Castelo Branco	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
7	74d148ca-5f3d-4a50-9324-26eb20516d2e	Coimbra	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
8	f5e02586-79c6-4752-b3b3-ac1cebae5af9	Évora	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
9	8944abd9-8d7d-4e7d-b9b7-4ed478edbc60	Faro	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
10	ff19bc10-2535-48f6-9980-b97342f4f5a2	Guarda	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
11	aca8355e-8b2f-43e4-a3e2-71d040033b1d	Leiria	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
12	72662d3e-6ddf-4064-82c5-c436f776a604	Lisboa	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
13	db4123ad-22de-40c2-a1b1-54dd3a20c94e	Madeira	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
14	c277e635-0ff7-4df0-b7f8-5b1d7fea016a	Portalegre	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
15	2658c2e4-feb5-4e37-a82a-5c2e5b80aeec	Porto	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
16	d23abe1e-5f0f-4e5a-a366-3837e36f445f	Santarém	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
17	8a4f85c8-cf76-4beb-8140-26e35d5e8d72	Setúbal	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
18	714a0405-c9ed-460e-8964-2ed4e7933cb2	Viana do Castelo	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
19	ce7c3b5f-8bef-4084-87be-a27af8dd600f	Vila Real	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
20	ed322005-5515-4877-b33f-a393fc3fb8ac	Viseu	\N	2025-03-23 11:47:09	2025-03-23 11:47:09
\.


--
-- Data for Name: entidade_juridica_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.entidade_juridica_anexos (id, uuid, nome, entidades_juridica_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: entidade_juridica_leis; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.entidade_juridica_leis (id, entidade_juridica_id, lei_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: entidade_juridicas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.entidade_juridicas (id, nome, sinopse, params, created_at, updated_at) FROM stdin;
1	Organismos da Administração Pública	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
2	Entidades públicas empresariais	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
3	Entidades públicas municipais, intermunicipais e regionais	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
4	Empresas públicas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
5	Pessoas coletivas de direito público - N.E.	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
6	Sociedade anónima	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
7	Sociedade por quotas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
8	Sociedade em nome coletivo	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
9	Agrup. complementares de empresas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
10	Cooperativas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
11	Cooperativas 2º grau	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
12	Entidades equiparadas a pessoas coletivas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
13	Fundações	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
14	EIRL	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
15	Trusts	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
16	Sociedade Unipessoal	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
17	Empresário em nome individual	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
18	Comerciantes individuais	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
19	Soc. civil com personalidade jurídica	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
20	Soc. civis	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
21	Soc. irregulares	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
22	Soc. em comandita	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
23	Soc. anónimas desportivas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
24	Associações	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
25	Representação permanente de entidade não Sujeita a registo	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
26	Representação permanente	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
27	Pessoas coletivas religiosas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
28	Pessoas coletivas religiosas católicas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
29	Pessoas coletivas religiosas não católicas	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
30	Pessoas coletivas internacionais	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
31	Pessoas coletivas estrangeiras	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
32	Entidades equiparadas estrangeiras - identificação	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
33	Soc. civis estrangeiras	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
34	Soc. anónimas europeias	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
35	Agrup. europeus interesse económico	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
36	Sucursais financeiras exteriores	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: freguesia_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.freguesia_anexos (id, uuid, nome, freguesia_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: freguesia_tipos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.freguesia_tipos (id, tipo, descricao, created_at, updated_at) FROM stdin;
1	União de Freguesias	Freguesias que foram formadas pela união de duas ou mais freguesias.	2025-03-23 11:47:09	2025-03-23 11:47:09
2	Freguesia	Freguesias que se mantiveram após a reorganização territorial.	2025-03-23 11:47:09	2025-03-23 11:47:09
3	Freguesia Extinta	Freguesias que se extinguiram após a reorganização territorial.	2025-03-23 11:47:09	2025-03-23 11:47:09
\.


--
-- Data for Name: freguesias; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.freguesias (id, uuid, nome, sinopse, distrito_id, concelho_id, freguesia_tipo_id, created_at, updated_at) FROM stdin;
1	2821bb79-d550-4155-856a-26e1c47a9376	Altares	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
2	580d7250-1480-4feb-9da3-4c5fb3a1a1aa	Angra - Nossa Senhora da Conceição	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
3	8446d51b-1c61-4739-bd83-94f46743884b	Angra - Santa Luzia	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
4	f57cbc39-e15a-4af4-81c8-c596b914cd34	Angra - São Pedro	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
5	48e45c26-ac0a-436e-bf76-12795941bd96	Angra - Sé	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
6	20550658-c873-4107-84da-0adf28cc3c93	Cinco Ribeiras	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
7	3ac7c483-bcf9-45b9-bb07-158f2ddab751	Doze Ribeiras	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
8	a73b092d-37a8-45df-9190-5fb58dbaadba	Feteira	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
9	cf08402b-2e7e-4176-bbdc-c3f891f43526	Porto Judeu	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
10	b82e1644-b127-4ef4-bc00-0f8a57e9eb17	Posto Santo	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
11	f183469f-5fb3-48c0-b9b1-a392745c4b5a	Raminho	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
12	80b26126-7b33-4e0c-95d5-066982ce6750	Ribeirinha	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
13	11cab2ef-d4c8-4241-b933-5169bdb6a4ce	Santa Bárbara	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
14	9ef3162d-b644-45f9-8a81-51fa3449715a	São Bartolomeu de Regatos	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
15	be518b60-3e5c-4275-adf4-416181100888	São Bento	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
16	cece2689-ff66-419b-9f03-144b20df7f50	São Mateus da Calheta	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
17	e5e2eab4-997d-411b-8d5f-e99c4a57625f	Serreta	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
18	ff1e0628-c321-421e-ae24-e784f5be9950	Terra Chã	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
19	d3c8c95e-3765-4a13-9d8f-0d78f45e73b3	Vila de São Sebastião	\N	1	1	2	2025-03-23 11:47:09	2025-03-23 11:47:09
20	29597a53-00e4-43bb-a1a9-f7c5ac06efe4	Calheta	\N	1	2	2	2025-03-23 11:47:09	2025-03-23 11:47:09
21	f3cd5a0d-cd9d-4323-95ed-35a092f71386	Norte Pequeno	\N	1	2	2	2025-03-23 11:47:09	2025-03-23 11:47:09
22	c8729990-4dab-4e21-b488-c462cf9b847f	Ribeira Seca	\N	1	2	2	2025-03-23 11:47:09	2025-03-23 11:47:09
23	f8d5b207-4857-4237-b6fb-df3cac608fca	Santo Antão	\N	1	2	2	2025-03-23 11:47:09	2025-03-23 11:47:09
24	978829c0-cebf-412b-b63d-a65c2f715567	Topo - Nossa Senhora do Rosário	\N	1	2	2	2025-03-23 11:47:09	2025-03-23 11:47:09
25	0cc624b2-5434-4a02-a21e-252633f7325a	Corvo	\N	1	3	2	2025-03-23 11:47:09	2025-03-23 11:47:09
26	fe4809da-305b-438e-a6ff-d2d62c3b389a	Capelo	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
27	420c8695-4354-4250-970d-54aa16617f52	Castelo Branco	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
28	298cbc59-5aa4-47b8-b77b-beac8792a60f	Cedros	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
29	28f7313b-e6a1-41dd-ba96-8c0e11031b00	Feteira	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
30	e9aa6f89-398f-4bc8-b3d8-a571e7be5bfd	Flamengos	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
31	71446325-8dd5-4aea-8945-01dc933f52c8	Horta - Angústias	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
32	19a41ffe-d57e-4375-8511-f2f8bf7aebad	Horta - Conceição	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
33	8869c51e-1d8a-49ee-becb-a1d3b771be2d	Horta - Matriz	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
34	a062ed3d-9d8c-4b6f-8881-39bf0b3fd360	Pedro Miguel	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
35	e66832ba-4e9d-4c11-ab88-d3c256964691	Praia do Almoxarife	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
36	bb82769d-4b2b-4b90-aa63-8d566c2b50d1	Praia do Norte	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
37	4df6cc80-b974-44cd-886f-5b82125c3e2f	Ribeirinha	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
38	6706a0b3-c480-4a40-8b84-3f362a50ff1c	Salão	\N	1	4	2	2025-03-23 11:47:09	2025-03-23 11:47:09
39	d30e039d-b4e1-4c7f-b8e8-fe39bcce8360	Água de Pau	\N	1	5	2	2025-03-23 11:47:09	2025-03-23 11:47:09
40	f17b378f-8fc9-4c83-a472-3da36e5201a0	Cabouco	\N	1	5	2	2025-03-23 11:47:09	2025-03-23 11:47:09
41	17672df8-56dd-46aa-aa9a-450769acb52f	Lagoa - Nossa Senhora do Rosário	\N	1	5	2	2025-03-23 11:47:09	2025-03-23 11:47:09
42	156f471d-a3c1-4169-a567-5444d0eed994	Lagoa - Santa Cruz	\N	1	5	2	2025-03-23 11:47:09	2025-03-23 11:47:09
43	e75ee837-2db9-4fe1-9adf-bc433079aa06	Ribeira Chã	\N	1	5	2	2025-03-23 11:47:09	2025-03-23 11:47:09
44	c4d93388-9c0f-407b-8395-523e0e23eb64	Fajã Grande	\N	1	6	2	2025-03-23 11:47:09	2025-03-23 11:47:09
45	db7b7d45-ad04-4146-8304-86b9e28f94c4	Fajãzinha	\N	1	6	2	2025-03-23 11:47:09	2025-03-23 11:47:09
46	3afab491-4a81-4a16-8dba-298d4fa0dcbb	Fazenda	\N	1	6	2	2025-03-23 11:47:09	2025-03-23 11:47:09
47	585d00d7-de9f-4df0-8275-8f5021c2f7ba	Lajedo	\N	1	6	2	2025-03-23 11:47:09	2025-03-23 11:47:09
48	3d584872-9fcb-43f1-8b73-afe07168a514	Lajes das Flores	\N	1	6	2	2025-03-23 11:47:09	2025-03-23 11:47:09
49	db8bc34c-f441-4015-b630-b5d75eb8ae37	Lomba	\N	1	6	2	2025-03-23 11:47:09	2025-03-23 11:47:09
50	cb35b4e3-ebcb-49b7-abcd-f45a0aada32c	Mosteiro	\N	1	6	2	2025-03-23 11:47:09	2025-03-23 11:47:09
51	2ae74c0c-a395-4f07-995c-933aa6254ff1	Calheta de Nesquim	\N	1	7	2	2025-03-23 11:47:09	2025-03-23 11:47:09
52	a017532c-3882-47ea-b308-4ac1df460303	Lajes do Pico	\N	1	7	2	2025-03-23 11:47:09	2025-03-23 11:47:09
53	3e7820bf-fd5b-4b6e-8fe4-0a45fb7fd6d6	Piedade	\N	1	7	2	2025-03-23 11:47:09	2025-03-23 11:47:09
54	2edf6e5c-fcd9-47e9-8bb5-64d7c73f8e8d	Ribeiras	\N	1	7	2	2025-03-23 11:47:09	2025-03-23 11:47:09
55	65478961-7dfd-46c2-b81a-92ffb876e1e9	Ribeirinha	\N	1	7	2	2025-03-23 11:47:09	2025-03-23 11:47:09
56	5701492b-6155-46f1-93bb-fd38e698a3b3	São João	\N	1	7	2	2025-03-23 11:47:09	2025-03-23 11:47:09
57	4d4e8d77-0ae5-4859-93d2-ac5c01985be6	Bandeiras	\N	1	8	2	2025-03-23 11:47:09	2025-03-23 11:47:09
58	46b2b6cb-9760-4ad0-bb62-e5329f6aa6b2	Candelária	\N	1	8	2	2025-03-23 11:47:09	2025-03-23 11:47:09
59	4ab4ca91-89f0-4a21-9319-5c30a7f991af	Criação Velha	\N	1	8	2	2025-03-23 11:47:09	2025-03-23 11:47:09
60	7bc8a070-03de-4159-a5d9-b322b4e60c34	Madalena	\N	1	8	2	2025-03-23 11:47:09	2025-03-23 11:47:09
61	c2a097be-15b5-4bcf-8071-b0bd2a408807	São Caetano	\N	1	8	2	2025-03-23 11:47:09	2025-03-23 11:47:09
62	afebad48-2e14-4e83-bf05-05846836668e	São Mateus	\N	1	8	2	2025-03-23 11:47:09	2025-03-23 11:47:09
63	bae97189-27a5-4a24-8c09-08cfef4b8dd8	Achada	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
64	75d0275c-7b84-4252-912e-f6d16dbefc84	Achadinha	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
65	55859efd-16d3-47b4-bc90-bf1155573277	Algarvia	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
66	cc4239d5-a241-49c2-9ec9-4d9e3b60d230	Lomba da Fazenda	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
67	54c8666c-9fb5-4a32-bf5e-bc59b753140f	Nordeste	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
68	b813582b-f5a2-4525-b170-4aabd52ea7df	Salga	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
69	3a37fb09-ef19-4b86-8eb5-0f2ed4fe5f3f	Santana	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
70	ce1fc770-ce61-4de2-848f-b928f5c8ef15	Santo António de Nordestinho	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
71	ab057743-d06c-4a4d-9ea5-793f9f313385	São Pedro de Nordestinho	\N	1	9	2	2025-03-23 11:47:09	2025-03-23 11:47:09
72	d5249999-9a85-479a-ac25-f3f55a6b84f0	Nordestinho	\N	1	9	3	2025-03-23 11:47:09	2025-03-23 11:47:09
73	665390f3-43be-4186-87dd-36468ffa8824	Ajuda da Bretanha	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
74	019e3f06-a43a-4b87-ba57-15bbbd352eeb	Arrifes	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
75	f88af034-ecee-46f4-acdf-361022c7d4c1	Candelária	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
76	73812b38-22f2-46ad-b70f-9dffd06831f7	Capelas	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
77	95d2a302-84b5-466e-b6ee-b012880ccfa0	Covoada	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
78	f440ad23-e711-4266-996e-9799227a8492	Fajã de Baixo	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
79	26f68116-1cec-4b12-b4a2-0fb17128ca44	Fajã de Cima	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
80	bce92353-ef00-4217-94b9-9f50bbc2be0f	Fernais da Luz	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
81	4b697197-616b-425c-8d30-9db318d32e3e	Feteiras	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
82	ec5f9a06-aa93-4e0e-a728-fd778546ce39	Ginetes	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
83	299310c5-7c9e-4c94-b834-a587345e34a3	Mosteiros	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
84	ecbd37c4-250d-4fe3-9b97-525d58cf73a6	Pilar da Bretanha	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
85	fba9d356-1a6b-4958-98a9-4fa9a348f4e1	Ponta Delgada - São José	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
86	032e3899-0788-4fe1-a8e8-6c55d66a2edb	Ponta Delgada - São Pedro	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
87	4ba73b56-0dd8-41bb-a1d9-f8f19c9490e6	Ponta Delgada - São Roque	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
88	4563c8dc-2451-4c06-9360-2da93d97b0d7	Ponta Delgada - São Sebastião	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
89	abb9fa0b-91a6-47e8-b3e2-72942ed1cfce	Relva	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
90	c1f06449-1ae8-4600-b6c2-433abe0c5f7e	Remédios	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
91	864303ca-4e56-454b-90ff-53a4803223c6	Rosto do Cão - Livramento	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
92	e97b3ba1-badd-4dcc-ac82-f418b5858926	Santa Bárbara	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
93	438f3ee5-7aac-426c-857a-f1e46e35e94b	Santa Clara	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
94	c8351c48-5355-4bd5-815f-5fd4398bb952	Santo António	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
95	0c289b50-8b30-44d7-a71e-84fbaf18d125	São Vicente Ferreira	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
96	f1839c04-2382-46b0-9b14-61297de29d1d	Sete Cidades	\N	1	10	2	2025-03-23 11:47:09	2025-03-23 11:47:09
97	8ad3569f-bd73-4ca5-8023-b10fee335278	Bretanha	\N	1	10	3	2025-03-23 11:47:09	2025-03-23 11:47:09
98	e3dba38c-0b08-4d22-b0f1-1dea8d6b2517	Água Retorta	\N	1	11	2	2025-03-23 11:47:09	2025-03-23 11:47:09
99	892e0254-372e-496e-8b81-62bcda59b071	Faial da Terra	\N	1	11	2	2025-03-23 11:47:09	2025-03-23 11:47:09
100	e72e98be-d9c5-4c77-86ea-f851df364f06	Furnas	\N	1	11	2	2025-03-23 11:47:09	2025-03-23 11:47:09
101	9644061e-261e-441f-9823-ba46ec641343	Nossa Senhora dos Remédios	\N	1	11	2	2025-03-23 11:47:09	2025-03-23 11:47:09
102	a66c68a8-1f51-4cda-a181-2af1d10fe836	Povoação	\N	1	11	2	2025-03-23 11:47:09	2025-03-23 11:47:09
103	3f437762-a1e6-4cae-8919-25414f983917	Ribeira Quente	\N	1	11	2	2025-03-23 11:47:09	2025-03-23 11:47:09
104	0d780ca8-bd79-4847-9d9c-5e76a5734cc4	Calhetas	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
105	ed6500af-f616-4768-80e4-30b8638fcd84	Fenais da Ajuda	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
106	b2b23ee2-2b28-408c-ba0d-b8a099988d39	Lomba da Maia	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
107	2b451784-99b3-47a9-b1cf-839755a72473	Lomba de São Pedro	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
108	ab208b6b-65e4-4755-9498-5a9cf98ebe96	Maia	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
109	edccb6cb-5021-41d7-b8a1-3498e499b8e8	Pico da Pedra	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
110	f9e2b1fa-b3b0-46d8-952d-10164cf68d7d	Porto Formoso	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
111	5801eab5-c34e-4a1e-ba0c-21117b741ac9	Rabo de Peixe	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
112	bee50185-138f-48b2-ba68-5be9bd7cd145	Ribeira Grande - Conceição	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
113	0ff3e964-b129-4247-aa37-0dbfb879c61a	Ribeira Grande - Matriz	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
114	2a7a4a7d-bfe7-4704-b106-7edb1c8842b9	Ribeira Seca	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
115	00221f3d-aa9d-4b13-9ff2-36347ead6819	Ribeirinha	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
116	d8219c56-0c8f-44ac-91a1-2960207ea322	Santa Bárbara	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
117	c2d67227-b972-4972-b8c8-70c2b9a6ed9f	São Brás	\N	1	12	2	2025-03-23 11:47:09	2025-03-23 11:47:09
118	bcbf07fe-d60b-4b34-882d-3dc2ed52bc13	Guadalupe	\N	1	13	2	2025-03-23 11:47:09	2025-03-23 11:47:09
119	5c39be1f-0a04-4251-b994-27b1e45323cd	Luz	\N	1	13	2	2025-03-23 11:47:09	2025-03-23 11:47:09
120	54f06eb4-fcba-481e-930e-7c9aec4fceb2	Santa Cruz da Graciosa	\N	1	13	2	2025-03-23 11:47:09	2025-03-23 11:47:09
121	185880b8-d329-45f0-8121-e90fcfac8b9d	São Mateus	\N	1	13	2	2025-03-23 11:47:09	2025-03-23 11:47:09
122	ea8df4c8-1449-416e-8038-11a8fbed47b8	Caveira	\N	1	14	2	2025-03-23 11:47:09	2025-03-23 11:47:09
123	c9003918-8723-41a4-b7b1-2dda89e63b93	Cedros	\N	1	14	2	2025-03-23 11:47:09	2025-03-23 11:47:09
124	54b281fa-c94c-4424-996f-c3989ced1d23	Ponta Delgada	\N	1	14	2	2025-03-23 11:47:09	2025-03-23 11:47:09
125	7741c3ee-f7c0-4889-a528-e1e58b804203	Santa Cruz das Flores	\N	1	14	2	2025-03-23 11:47:09	2025-03-23 11:47:09
126	823cc9e9-eec9-47ba-a165-0306f54767b0	Prainha	\N	1	15	2	2025-03-23 11:47:09	2025-03-23 11:47:09
127	92fd5624-7f40-4266-b412-817452459509	Santa Luzia	\N	1	15	2	2025-03-23 11:47:09	2025-03-23 11:47:09
128	7a88921a-8e31-496c-ad22-ba5cb9df08bf	Santo Amaro	\N	1	15	2	2025-03-23 11:47:09	2025-03-23 11:47:09
129	a7cc1f71-6407-4085-bded-1657622534fb	Santo António	\N	1	15	2	2025-03-23 11:47:09	2025-03-23 11:47:09
130	66542d41-940f-435e-8e7f-4f15f9c780f2	São Roque do Pico	\N	1	15	2	2025-03-23 11:47:09	2025-03-23 11:47:09
131	ff97e9d6-d3a8-4af0-b8c1-1f5b57a3b22c	Manadas - Santa Bárbara	\N	1	16	2	2025-03-23 11:47:09	2025-03-23 11:47:09
132	b82ae0b5-ccd5-44cb-9eb5-eaaf7fb78380	Norte Grande - Neves	\N	1	16	2	2025-03-23 11:47:09	2025-03-23 11:47:09
133	52bb1970-bf90-4892-acee-64bf1d8e9cbc	Rosais	\N	1	16	2	2025-03-23 11:47:09	2025-03-23 11:47:09
134	8862e677-6697-4b69-92ff-a6aa87ceb514	Santo Amaro	\N	1	16	2	2025-03-23 11:47:09	2025-03-23 11:47:09
135	6b397b69-d45c-4f0f-bce7-e169ed64a54d	Velas - São Mateus	\N	1	16	2	2025-03-23 11:47:09	2025-03-23 11:47:09
136	5b71c15f-d96c-4a2f-b232-99f08d3af23c	Velas - São Jorge	\N	1	16	2	2025-03-23 11:47:09	2025-03-23 11:47:09
137	a4f04f7e-4cf3-4e45-9cc8-f6e8cacd5f6a	Almagreira	\N	1	17	2	2025-03-23 11:47:09	2025-03-23 11:47:09
138	06022de3-d229-4a97-9e0c-091e8b5ee26c	Santa Bárbara	\N	1	17	2	2025-03-23 11:47:09	2025-03-23 11:47:09
139	7976f8b6-2c35-4e4c-8dbe-80ffdf57e19a	Santo Espírito	\N	1	17	2	2025-03-23 11:47:09	2025-03-23 11:47:09
140	bae04bc4-47f0-481a-91a9-797b64d73f52	São Pedro	\N	1	17	2	2025-03-23 11:47:09	2025-03-23 11:47:09
141	2089463a-1170-4183-895e-f16538f239ad	Vila do Porto	\N	1	17	2	2025-03-23 11:47:09	2025-03-23 11:47:09
142	e8b947bc-295b-475c-976e-840d98269229	Água de Alto	\N	1	18	2	2025-03-23 11:47:09	2025-03-23 11:47:09
143	e3af24ed-02e7-4c65-8a15-9d55722f0bf3	Ponta Garça	\N	1	18	2	2025-03-23 11:47:09	2025-03-23 11:47:09
144	9386d62d-3d32-49d4-8dbd-44136403371b	Ribeira das Tainhas	\N	1	18	2	2025-03-23 11:47:09	2025-03-23 11:47:09
145	a7966ae4-1d5d-4bdd-b8d9-a93224c376e3	Ribeira Seca	\N	1	18	2	2025-03-23 11:47:09	2025-03-23 11:47:09
146	a3d90f07-8c03-425b-a545-bd1cc2f6963e	Vila Franca do Campo - São Miguel	\N	1	18	2	2025-03-23 11:47:09	2025-03-23 11:47:09
147	28917eef-c3b8-44a7-b8b3-9935d9986e85	Vila Franca do Campo - São Pedro	\N	1	18	2	2025-03-23 11:47:09	2025-03-23 11:47:09
148	9add8fe5-c046-48f8-81fe-719f042ba688	Agualva	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
149	d6bac4c8-65f9-421d-a05e-62ded812ba24	Biscoitos	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
150	345a835f-9c54-4602-a795-d8a4af8ac5d1	Cabo da Praia	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
151	81f7cff5-bd9b-436c-bb96-8654fbd23146	Fonte do Bastardo	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
152	806d7708-cf72-43ba-bb6f-6d774a21af98	Fontinhas	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
153	05193de4-6871-4c97-a9cb-7f3489a440af	Lajes	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
154	c9f35fad-a7f7-4b0f-8305-b9564ab0087c	Porto Martins	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
155	3abb86ca-c7c2-41c7-8df9-793e489f877d	Praia da Vitoria - Santa Cruz	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
156	de25805f-dfa4-47b1-9553-78d3d0ddf6f1	Quatro Ribeiras	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
157	78d213d9-ec1a-4d67-8e26-51819a7e0a14	São Brás	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
158	40d50c8a-c905-4fa3-a5fd-e2dbf5f61000	Vila Nova	\N	1	19	2	2025-03-23 11:47:09	2025-03-23 11:47:09
159	45d1f7be-2ab6-494e-8411-c5e836bcde70	Águeda de Cima	\N	2	20	2	2025-03-23 11:47:09	2025-03-23 11:47:09
160	a2cd7992-c430-42f6-9459-234a78548a6c	Águeda e Borralha	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
161	d94b0057-6f4a-4e04-8267-1e07458bd156	Barrô e Aguada de Baixo	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
162	fb2dbf99-6f7a-46c1-8620-b6bfe42f0f08	Belazaima do Chão, Castanheira do Vouga e Agadão	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
163	cca105a5-4ecc-4a24-9f35-f4db94161ccf	Fermentelos	\N	2	20	2	2025-03-23 11:47:09	2025-03-23 11:47:09
164	e2ffdbba-8523-405c-8000-3eb35ffc169d	Macinhata do Vouga	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
165	8b97b3e0-3783-4ebb-aad5-9792f49a2fb7	Préstimo e Macieira de Alcobá	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
166	426f5c60-cefd-4262-b0bc-6166ba4a7487	Recardães e Espinhel	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
167	e8d3682f-d749-45e5-864a-976013bba45b	Travassô e Ois da Ribeira	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
168	2a50def0-0969-4862-a98e-c355016fdd3a	Trofa, Segadães e Lamas do Vouga	\N	2	20	1	2025-03-23 11:47:09	2025-03-23 11:47:09
169	477ae325-c8e2-4096-a2a3-343c0670f79c	Valongo do Vouga	\N	2	20	2	2025-03-23 11:47:09	2025-03-23 11:47:09
170	a49f9cee-79ac-46af-9b39-3339dcec2e9d	Agadão	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
171	b1ec0b95-970d-4e38-a790-1ad10094c3bb	Águada de Baixo	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
172	c76010af-4c9d-4b1f-baf3-c085ea4d214a	Águada	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
173	368cd54e-5b98-44a0-909f-155754bc448b	Barro	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
174	a6e77fe4-dfab-4ebc-a1e4-59f294bb21b3	Belazaina do Chão	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
234	dc7d211a-aace-48e0-bdc9-dcb7859b6f48	Aradas	\N	2	24	2	2025-03-23 11:47:09	2025-03-23 11:47:09
175	37032bb2-dfa4-4453-ab22-28e3a6334b2c	Castanheira do Vouga	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
176	0ce6e2fe-0259-4911-84d8-1df7bcce7f91	Espinhel	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
177	3d8017d4-33cc-4bc8-bb42-c610355a12f4	Lamas do Vouga	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
178	1449d5b8-dfd2-4505-96ef-d844477fbb7a	Macieira de Alcoba	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
179	6e8ce411-8bcb-43d0-b060-54692d64eebc	Ois da Riberia	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
180	c974d673-cf57-496a-8a44-3964749bc414	Prestimo	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
181	ac1fdaca-5813-46a0-bf51-121dd8d10238	Recardães	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
182	4820e46b-5372-4582-bbb4-dc8d4c34a86d	Segadães	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
183	eff13d71-3b86-4d27-bbf6-24ad711b5de4	Travassô	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
184	114bbf2e-882f-4a07-bb6e-05163102cb7c	Trofa	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
185	8d274cac-f0bb-4339-ae3e-8b153eb377d5	Borralha	\N	2	20	3	2025-03-23 11:47:09	2025-03-23 11:47:09
186	93f43f3f-5669-42f8-9765-7c1a47f2e731	Albergaria-a-Velha e Valmaior	\N	2	21	1	2025-03-23 11:47:09	2025-03-23 11:47:09
187	9d2c4ecd-4405-4323-9413-2722c3c6109b	Alquerubim	\N	2	21	2	2025-03-23 11:47:09	2025-03-23 11:47:09
188	55773717-2b8b-4d8b-b2e2-09081d9a6a4e	Angeja	\N	2	21	2	2025-03-23 11:47:09	2025-03-23 11:47:09
189	53e951e2-0ee2-4827-aa1d-08b81f5c1576	Branca	\N	2	21	2	2025-03-23 11:47:09	2025-03-23 11:47:09
190	0dfa3c54-a09b-4ba1-b345-97ad71d4395b	Ribeira de Fráguas	\N	2	21	2	2025-03-23 11:47:09	2025-03-23 11:47:09
191	df7e5ae1-be01-4159-897f-50b6ec1c5622	São João de Loure e Frossos	\N	2	21	1	2025-03-23 11:47:09	2025-03-23 11:47:09
192	df2bab15-7d1b-451f-aeb0-1cce044f02c8	Albergaria-a-Velha	\N	2	21	3	2025-03-23 11:47:09	2025-03-23 11:47:09
193	877637e7-1cdf-4a4b-8763-1ca1295bcb59	Amoreira da Gândara, Paredes do Bairro e Ancas	\N	2	22	1	2025-03-23 11:47:09	2025-03-23 11:47:09
194	1cd67c3e-f91e-43bd-bc4b-98cef7f17c09	Arcos e Mogofores	\N	2	22	1	2025-03-23 11:47:09	2025-03-23 11:47:09
195	ecb95004-c39a-45d4-943a-8db838a92dfc	Avelãs de Caminho	\N	2	22	2	2025-03-23 11:47:09	2025-03-23 11:47:09
196	9251315b-eb34-4756-8ca3-18ade9a1eceb	Avelãs de Cima	\N	2	22	2	2025-03-23 11:47:09	2025-03-23 11:47:09
197	c8fc3888-e1fb-43e7-ab09-c1c9b24fc172	Moita	\N	2	22	2	2025-03-23 11:47:09	2025-03-23 11:47:09
198	ee810af2-fc84-4b35-b76f-e5381dadc070	Sangalhos	\N	2	22	2	2025-03-23 11:47:09	2025-03-23 11:47:09
199	30720891-f5b6-424f-b721-c9582e24951f	São Lourenço do Bairro	\N	2	22	2	2025-03-23 11:47:09	2025-03-23 11:47:09
200	0737b219-ef61-4b44-9b75-0b39f54c0f07	Tamengos, Aguim e Óis do Bairro	\N	2	22	1	2025-03-23 11:47:09	2025-03-23 11:47:09
201	3d59de13-73da-4abb-aaf0-d364c74761db	Vila Nova de Monsarros	\N	2	22	2	2025-03-23 11:47:09	2025-03-23 11:47:09
202	154f75d3-e198-475e-ab95-d615a93e424e	Vilarinho do Bairro	\N	2	22	2	2025-03-23 11:47:09	2025-03-23 11:47:09
203	60601790-cdd1-412a-be88-e0bcc36b30dc	Amoreira da Gandara	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
204	5b03ec97-70f0-4857-801e-7e9311b59182	Ancas	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
205	18660bd5-ec38-42f8-8bed-fb06ce424888	Arcos	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
206	8336b51b-c70f-4d2e-88ce-1cd8f7e711c1	Mogofores	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
207	d3f0912e-a027-446c-a8e8-048febf2382a	Ois do Bairro	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
208	76af6b1f-f49b-446d-ab5f-d740f4987051	Tamegos	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
209	99705f35-9d09-4c66-a2fb-d650d6510d42	Paredes do Bairro	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
210	70e24b0f-5237-425b-a243-566861731cbe	Aguim	\N	2	22	3	2025-03-23 11:47:09	2025-03-23 11:47:09
211	4d097082-0d56-456a-91c6-9667b9291163	Alvarenga	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
212	040b2f71-722f-404e-8e6b-73426a8eb8b8	Arouca e Burgo	\N	2	23	1	2025-03-23 11:47:09	2025-03-23 11:47:09
213	e338f039-f6d6-4188-bdd7-58733ad59218	Cabreiros e Albergaria da Serra	\N	2	23	1	2025-03-23 11:47:09	2025-03-23 11:47:09
214	23e4945b-4dc9-4cc7-ba59-0e4184677103	Canelas e Espiunca	\N	2	23	1	2025-03-23 11:47:09	2025-03-23 11:47:09
215	fd0bfe08-0c07-425e-96df-1c4b7750ae90	Chave	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
216	120172b6-b937-45b8-a4b8-28f231c1f2d5	Coelho de Paivó e Janarde	\N	2	23	1	2025-03-23 11:47:09	2025-03-23 11:47:09
217	2afd8d22-bf9a-4c08-9065-755a47d95d96	Escariz	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
218	419f3b18-bb56-4413-abb6-3177b3cca15a	Fermedo	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
219	79e93b56-8d46-4406-81fe-d4d65ac4ccb9	Mansores	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
220	425d51de-3a5e-4362-8942-25348637c6c1	Moldes	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
221	04c1b597-d2b3-4d92-b882-221fd33d0567	Rossas	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
222	6779fa71-9245-4339-ad36-fc871d8983aa	Santa Eulália	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
223	9e1a96a4-0d53-417e-b16e-0f32699af981	São Miguel do Mato	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
224	2e774c9a-0e60-42f0-b2be-fdf3b08c7729	Tropeço	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
225	8fbd1986-dcf3-48ac-a829-e37fa4b40f8e	Urrô	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
226	2bd4de7d-71fd-4942-851b-686ee66a15bc	Várzea	\N	2	23	2	2025-03-23 11:47:09	2025-03-23 11:47:09
227	36fa2ece-6c59-4128-b1b2-024766640628	Albergaria da Serra	\N	2	23	3	2025-03-23 11:47:09	2025-03-23 11:47:09
228	09327fc1-b325-4ee1-b47f-c7a48c55b49f	Arouca	\N	2	23	3	2025-03-23 11:47:09	2025-03-23 11:47:09
229	0e25861e-3525-43da-9230-230bfb9b9960	Burgo	\N	2	23	3	2025-03-23 11:47:09	2025-03-23 11:47:09
230	aba8a062-e768-4470-a0d9-bde58d6abc8e	Cabreiros	\N	2	23	3	2025-03-23 11:47:09	2025-03-23 11:47:09
231	3c17269c-0c2a-4afd-9cea-ed99ce28244f	Canelas	\N	2	23	3	2025-03-23 11:47:09	2025-03-23 11:47:09
232	d41d641a-7cae-4fa8-bfdf-acedeb86d5d6	Espiunca	\N	2	23	3	2025-03-23 11:47:09	2025-03-23 11:47:09
233	d06a7ef7-749e-4fef-8327-223d65569b13	Janarde	\N	2	23	3	2025-03-23 11:47:09	2025-03-23 11:47:09
235	f267516b-2243-4a20-9811-2288c2693d93	Cacia	\N	2	24	2	2025-03-23 11:47:09	2025-03-23 11:47:09
236	4201b482-1a0d-4ba7-97f3-28b78568bb44	Eixo e Eirol	\N	2	24	1	2025-03-23 11:47:09	2025-03-23 11:47:09
237	8e4b2bde-7dca-4557-8913-22da9cd45864	Esgueira	\N	2	24	2	2025-03-23 11:47:09	2025-03-23 11:47:09
238	4d3ae41e-7394-4428-82a6-34507f5eb1f7	Oliveirinha	\N	2	24	2	2025-03-23 11:47:09	2025-03-23 11:47:09
239	64f8224f-7130-4ca8-b3f9-76004ddeec6d	Glória e Vera Cruz	\N	2	24	1	2025-03-23 11:47:09	2025-03-23 11:47:09
240	11da695d-2b29-4108-9175-f82455de8e7a	Requeixo, Nossa Senhora de Fátima e Nariz	\N	2	24	1	2025-03-23 11:47:09	2025-03-23 11:47:09
241	e817c49e-6d43-4c0c-874d-83712a87183f	Santa Joana	\N	2	24	2	2025-03-23 11:47:09	2025-03-23 11:47:09
242	79ef0615-6e61-4176-9725-204a33a444e1	São Bernardo	\N	2	24	2	2025-03-23 11:47:09	2025-03-23 11:47:09
243	565f445e-5c7e-4201-bbb7-db2cdbeded05	São Jacinto	\N	2	24	2	2025-03-23 11:47:09	2025-03-23 11:47:09
244	bb3419bb-c779-47ba-9357-50ad8765e243	Eirol	\N	2	24	3	2025-03-23 11:47:09	2025-03-23 11:47:09
245	8e7ee46a-fc22-45cd-9e72-8661ae19e71a	Eixo	\N	2	24	3	2025-03-23 11:47:09	2025-03-23 11:47:09
246	d9e87f04-98d7-4376-8f78-06237218daca	Glória	\N	2	24	3	2025-03-23 11:47:09	2025-03-23 11:47:09
247	cec7e317-3800-4cbd-be96-132dbc226b67	Nariz	\N	2	24	3	2025-03-23 11:47:09	2025-03-23 11:47:09
248	d0ed280d-1fc9-4ecb-a78f-c0f249b3ce13	Requeixo	\N	2	24	3	2025-03-23 11:47:09	2025-03-23 11:47:09
249	c7e90bd5-a9f5-4a2f-9bf8-7c70ece5827e	Vera Cruz	\N	2	24	3	2025-03-23 11:47:09	2025-03-23 11:47:09
250	3682125d-8961-4aa2-a4d8-7acf790b510b	Nossa Senhora de Fátima	\N	2	24	3	2025-03-23 11:47:09	2025-03-23 11:47:09
251	a0847c62-737b-4fb4-b554-ed8f740ef696	Fornos	\N	2	25	2	2025-03-23 11:47:09	2025-03-23 11:47:09
252	381f7a22-659c-460e-ba34-a089614cc982	Raiva, Pedroso e Paraíso	\N	2	25	1	2025-03-23 11:47:09	2025-03-23 11:47:09
253	35628807-c0f7-4726-9a9a-fe21260fa8a1	Real	\N	2	25	2	2025-03-23 11:47:09	2025-03-23 11:47:09
254	0e2cf9c5-aefc-4ff0-8d91-b46cf3c165b0	Santa Maria de Sardoura	\N	2	25	2	2025-03-23 11:47:09	2025-03-23 11:47:09
255	c035b4e0-7ab5-48e7-a145-7df964e4b79e	São Martinho de Sardoura	\N	2	25	2	2025-03-23 11:47:09	2025-03-23 11:47:09
256	d93b5703-ce43-4ae9-8d80-88fa42cd4b03	Sobrado e Bairros	\N	2	25	1	2025-03-23 11:47:09	2025-03-23 11:47:09
257	718cc13f-2bb6-4a5a-aff2-6b7b06dd5462	Bairros	\N	2	25	3	2025-03-23 11:47:09	2025-03-23 11:47:09
258	708a2074-bf0d-41e6-8c0a-a69abb69cde4	Paraiso	\N	2	25	3	2025-03-23 11:47:09	2025-03-23 11:47:09
259	d39de3ea-415f-4602-ad52-ee1c50086270	Pedorido	\N	2	25	3	2025-03-23 11:47:09	2025-03-23 11:47:09
260	64d8ae7b-7ccd-48f5-8140-6990546566a5	Raiva	\N	2	25	3	2025-03-23 11:47:09	2025-03-23 11:47:09
261	20c305e9-2483-4d0b-b1cb-8a1acdaeb258	Sobrado	\N	2	25	3	2025-03-23 11:47:09	2025-03-23 11:47:09
262	7f2a3bd2-2beb-49b7-b5f4-70df87b17f45	Anta e Guetim	\N	2	26	1	2025-03-23 11:47:09	2025-03-23 11:47:09
263	7f9926ec-d638-4ba5-9cc8-3616600cd17e	Espinho	\N	2	26	2	2025-03-23 11:47:09	2025-03-23 11:47:09
264	b25b8ddc-10ec-47fd-bf3a-333994729b1d	Paramos	\N	2	26	2	2025-03-23 11:47:09	2025-03-23 11:47:09
265	6412d135-abd4-44f3-916e-c6b5c366263c	Silvalde	\N	2	26	2	2025-03-23 11:47:09	2025-03-23 11:47:09
266	fec1a048-0f01-4bde-ad96-fc0fd655010c	Anta	\N	2	26	3	2025-03-23 11:47:09	2025-03-23 11:47:09
267	841c7069-b227-4b10-935e-3036b89c891f	Guetim	\N	2	26	3	2025-03-23 11:47:09	2025-03-23 11:47:09
268	9d653370-314d-4df1-a658-79128859718d	Avanca	\N	2	27	2	2025-03-23 11:47:09	2025-03-23 11:47:09
269	4a1aeaf8-b408-49d8-8b0e-4c0aedd6d39e	Beduído e Veiros	\N	2	27	1	2025-03-23 11:47:09	2025-03-23 11:47:09
270	25b5f1fa-6f2d-42fb-94a4-7de9974ccbe8	Canelas e Fermelã	\N	2	27	1	2025-03-23 11:47:09	2025-03-23 11:47:09
271	ef85011c-9a7f-4004-b030-f826083f001f	Pardilhó	\N	2	27	2	2025-03-23 11:47:09	2025-03-23 11:47:09
272	4e6a9ef0-2b60-4a25-9183-7d8e092f0b96	Salreu	\N	2	27	2	2025-03-23 11:47:09	2025-03-23 11:47:09
273	8eb504fe-262d-4b50-882a-08afd108ab28	Beduído	\N	2	27	3	2025-03-23 11:47:09	2025-03-23 11:47:09
274	ca469d4f-3e14-4e47-bfb7-7fc44badbe8f	Veiros	\N	2	27	3	2025-03-23 11:47:09	2025-03-23 11:47:09
275	ab5118cd-9f7c-45b2-8b95-ecfda295376c	Canelas	\N	2	27	3	2025-03-23 11:47:09	2025-03-23 11:47:09
276	71bfe6c7-171c-400f-9b9f-41cd9f68ed4c	Fermelã	\N	2	27	3	2025-03-23 11:47:09	2025-03-23 11:47:09
277	960181ed-63dc-4e74-a0e2-6a3621caac9b	Gafanha da Encarnação	\N	2	28	2	2025-03-23 11:47:09	2025-03-23 11:47:09
278	48ea07d3-4062-49bd-ba5d-633a1651c003	Gafanha da Nazaré	\N	2	28	2	2025-03-23 11:47:09	2025-03-23 11:47:09
279	c36d183e-ab20-4933-956c-6ccbbe2ad829	Gafanha do Carmo	\N	2	28	2	2025-03-23 11:47:09	2025-03-23 11:47:09
280	71d05286-b689-4e67-8da8-f7644c5d695c	Ílhavo - São Salvador	\N	2	28	2	2025-03-23 11:47:09	2025-03-23 11:47:09
281	2b32a062-9b83-46cd-9003-7bef8e7f690a	Barcouço	\N	2	29	2	2025-03-23 11:47:09	2025-03-23 11:47:09
282	23b93795-e6dd-42dc-8e74-0cddddf441ad	Casal Comba	\N	2	29	2	2025-03-23 11:47:09	2025-03-23 11:47:09
283	0dd5900c-59b3-4db5-a874-04c811838a3c	Luso	\N	2	29	2	2025-03-23 11:47:09	2025-03-23 11:47:09
284	fcbbff99-8c77-4afd-a0b9-c95f26f10efd	Mealhada, Ventosa do Bairro e Antes	\N	2	29	1	2025-03-23 11:47:09	2025-03-23 11:47:09
285	526b1d66-a6d2-4fe0-a185-bfefee1d99f1	Pampilhosa	\N	2	29	2	2025-03-23 11:47:09	2025-03-23 11:47:09
286	a35e5da1-cb9a-4131-8c7a-023b876fc190	Vacariça	\N	2	29	2	2025-03-23 11:47:09	2025-03-23 11:47:09
287	02ba0bfd-72c6-434c-a8d9-a09f97b885db	Antes	\N	2	29	3	2025-03-23 11:47:09	2025-03-23 11:47:09
288	3565d199-8489-4a08-97e9-80ab09b9aaae	Mealhada	\N	2	29	3	2025-03-23 11:47:09	2025-03-23 11:47:09
289	160f7e90-b19b-4a0f-9f97-0d7f8c947502	Ventosa do Bairro	\N	2	29	3	2025-03-23 11:47:09	2025-03-23 11:47:09
290	99fd10dc-ed96-43b4-bcbf-e38efb8bb948	Bunheiro	\N	2	30	2	2025-03-23 11:47:09	2025-03-23 11:47:09
291	41a870b9-c55a-4f94-8357-be13a51d51d3	Monte	\N	2	30	2	2025-03-23 11:47:09	2025-03-23 11:47:09
292	470098da-258f-4d35-b1b7-f80b42e5dece	Murtosa	\N	2	30	2	2025-03-23 11:47:09	2025-03-23 11:47:09
293	adee14ae-993e-4de7-bb1f-a26fea02cebc	Torreira	\N	2	30	2	2025-03-23 11:47:09	2025-03-23 11:47:09
294	8079fe6d-d3e2-4b69-9ca9-2887aaee0b59	Carregosa	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
295	46fb0083-d275-4fab-979f-b88304759f14	Cesar	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
296	59f776c7-4a18-4f5f-a49d-4216ac76ba2f	Fajões	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
297	40789fd5-53fe-4ad2-acd6-de4c860b5fea	Loureiro	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
298	fe4cd073-52e4-43c3-b600-3074d1272044	Macieira de Sarnes	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
299	bcceab7a-9c4e-4f55-9951-164eb815cea1	Nogueira do Cravo e Pindelo	\N	2	31	1	2025-03-23 11:47:09	2025-03-23 11:47:09
300	11f07b31-5d76-47c0-9e19-92d81284dd80	Oliveira de Azeméis, Ribas-Ul, Ul, Macinhata Seixa, Madail	\N	2	31	1	2025-03-23 11:47:09	2025-03-23 11:47:09
301	8a065167-2c8e-4973-b738-fa1e487af7e6	Ossela	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
302	6242ee0f-e1d2-4aa2-b10f-0868d7300d94	Pinheiro da Bemposta, Travanca e Palmaz	\N	2	31	1	2025-03-23 11:47:09	2025-03-23 11:47:09
303	2b754e4b-e390-4c2d-bad2-f04db9889123	São Martinho da Gândara	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
304	e608546c-e1fb-4fc3-a32f-e826b58ffd32	São Roque	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
305	ef7696f8-1726-4845-91ec-0c253e9fa9fd	Vila de Cucujães	\N	2	31	2	2025-03-23 11:47:09	2025-03-23 11:47:09
306	67dbd912-3e10-43aa-9798-62c7d9e09fa4	Oliveira de Azeméis	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
307	0c223c03-6ba0-4f6d-b682-8ed10191186a	Ribas-Ul	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
308	000b3fc5-4860-4795-a5ac-fc99e9f48b00	Ul	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
309	fb9abe60-8908-4ad0-8d3d-1fc8cc66d5cb	Macinhata Seixa	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
310	cf6da918-f35c-48d6-bf8e-50b36f12ac65	Madail	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
311	b78309b5-c9d2-471e-8b17-af1a49ecabe6	Nogueira do Cravo	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
312	243009c5-1efb-4296-859c-2573fd1a6f6e	Pindelo	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
313	d0d2103d-0cdc-4584-b9b0-cc8bbda100b9	Pinheiro da Bemposta	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
314	066a8976-6ae9-4ad3-986b-bd40e906f56b	Travanca	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
315	09d18513-eec2-47b2-b1b5-d237ed4cab5a	Palmaz	\N	2	31	3	2025-03-23 11:47:09	2025-03-23 11:47:09
316	fbc0b57b-dba8-4906-9439-799438ba7882	Bustos, Troviscal e Mamarrosa	\N	2	32	1	2025-03-23 11:47:09	2025-03-23 11:47:09
317	df6e71d5-ddc3-4adf-812f-f199d01ccc35	Oiã	\N	2	32	2	2025-03-23 11:47:09	2025-03-23 11:47:09
318	b309c11b-542c-4d37-b1b3-2041f0bb1b05	Oliveira do Bairro	\N	2	32	2	2025-03-23 11:47:09	2025-03-23 11:47:09
319	f5e3ab7e-9941-43aa-939b-44ad7c2b2a9b	Palhaça	\N	2	32	2	2025-03-23 11:47:09	2025-03-23 11:47:09
320	8699f0f0-b730-4574-a49d-4e083fc7cae6	Bustos	\N	2	32	3	2025-03-23 11:47:09	2025-03-23 11:47:09
321	53e3c8b9-3c63-4b65-b117-305935282128	Mamarrosa	\N	2	32	3	2025-03-23 11:47:09	2025-03-23 11:47:09
322	9d20cda3-74be-485a-93a5-a91ba5b77808	Troviscal	\N	2	32	3	2025-03-23 11:47:09	2025-03-23 11:47:09
323	dc698d2c-1e00-40eb-8db2-fd6f7e13aeb6	Cortegaça	\N	2	33	2	2025-03-23 11:47:09	2025-03-23 11:47:09
324	f09ad8b1-89b6-400a-b09e-c8e8a9772dc8	Esmoriz	\N	2	33	2	2025-03-23 11:47:09	2025-03-23 11:47:09
325	ab5b133d-c0f4-4ca2-a45c-b51f3b6f3ef4	Maceda	\N	2	33	2	2025-03-23 11:47:09	2025-03-23 11:47:09
326	8c4a19df-cd4b-445f-a21a-78dd89556b84	Ovar, São João, Arada e São Vicente de Pereira Jusã	\N	2	33	1	2025-03-23 11:47:09	2025-03-23 11:47:09
327	a4a7f62e-c426-45ff-90c9-95d6f5fc9bfb	Válega	\N	2	33	2	2025-03-23 11:47:09	2025-03-23 11:47:09
328	e5fca2a3-ebec-494e-9cf2-3c1f864fbd59	Arada	\N	2	33	3	2025-03-23 11:47:09	2025-03-23 11:47:09
329	07ff42e3-a6c5-4657-9865-22bd19474af9	Ovar	\N	2	33	3	2025-03-23 11:47:09	2025-03-23 11:47:09
330	5e87acc9-48ff-485a-b0a0-d491cd52858c	São João	\N	2	33	3	2025-03-23 11:47:09	2025-03-23 11:47:09
331	88019d59-80fd-47d6-bbc9-6d71ce3e0dca	São Vicente de Pereira Jusã	\N	2	33	3	2025-03-23 11:47:09	2025-03-23 11:47:09
332	8fe1b2f3-c0a7-49a4-8c20-cd55029671ba	Argoncilhe	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
333	0fb3cc88-f521-4f4a-b4be-e0fad2bf7cb3	Arrifana	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
334	fb0c0998-4f46-46ac-b5e9-28806864509c	Caldas de São Jorge e Pigeiros	\N	2	34	1	2025-03-23 11:47:09	2025-03-23 11:47:09
335	f324fdbb-f779-42b2-a200-7b3a27cd9b8e	Canedo e Vila Maior	\N	2	34	1	2025-03-23 11:47:09	2025-03-23 11:47:09
336	6eee98eb-e497-4434-a986-20f9b19b8776	Escapães	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
337	b8a426cd-7a87-499a-8cf0-2796423818c7	Fiães	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
338	c8766dbb-dc78-413a-b0cd-af829d7bd363	Fornos	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
339	59414c61-e9c8-4d14-b4a2-ae4c1309d3d0	Lobão, Gião, Louredo e Guisande	\N	2	34	1	2025-03-23 11:47:09	2025-03-23 11:47:09
340	432cc718-5aab-4099-865f-3f7349d8deed	Lourosa	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
341	49a55364-5bb6-4b84-b619-d34c9c57c661	Milheirós de Poiares	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
342	da0f61af-7cf7-4178-9256-9aba7458d892	Mozelos	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
343	88f44010-9f5a-4491-9484-9aacb82f108d	Nogueira da Regedoura	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
344	84156fb1-34d0-4e47-8984-0683914e101c	Paços de Brandão	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
345	2594cc0b-86e7-468d-8585-eb7b130731c6	Rio Meão	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
346	71aca8ad-ef5c-41b7-8ea1-31fef578e2bc	Romariz	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
347	d286e65b-d5d5-4d81-ad00-d9e8cb8e9489	Sanguedo	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
348	7f54d00b-fcdb-4d9c-aa4d-17a8f237b394	Santa Maria da Feira, Travanca, Sanfins e Espargo	\N	2	34	1	2025-03-23 11:47:09	2025-03-23 11:47:09
349	536054e1-7b01-4e64-a0c3-9baed7257ca6	Santa Maria de Lamas	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
350	b3b02a31-f9fd-46a1-b025-6b84f13f2874	São João de Ver	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
351	0b335c9d-ee40-4080-b5f4-827147e71b05	São Miguel do Souto e Mosteirô	\N	2	34	1	2025-03-23 11:47:09	2025-03-23 11:47:09
352	742c5c46-f33a-463a-8655-a5af7da7ab47	São Paio de Oleiros	\N	2	34	2	2025-03-23 11:47:09	2025-03-23 11:47:09
353	9333cb78-67a2-4a97-a4db-90d6a23efab4	Canedo	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
354	b11b3ae0-fb71-43dc-a577-164ae13a3c86	Espargo	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
355	0c6867d8-5d71-4f4b-ac1f-7100083862ed	Feira	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
356	adc0c8d1-a143-4367-b066-4239dc1505cc	Gião	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
357	31e9f8f6-559c-449f-b0c4-51b838501b14	Guisande	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
358	5257d4e1-2637-4f84-bd5a-8e5da39f4787	Lobão	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
359	5ac99f1d-ba82-4a15-ad88-ec264a1268e6	Louredo	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
360	af30dece-0245-4e61-8041-a55351688b39	Mosteirô	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
361	963e6004-b002-47a2-b63f-6616be8ed7c2	Pigeiros	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
362	2a85e93e-73a3-48f0-aa7b-27349a8891f3	Sanfins	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
363	60f4d702-cb13-48a4-90fd-88deaf1a2647	Caldas de São Jorge	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
364	799a31dd-c4fd-4199-9101-fde158ec1249	Souto	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
365	a2b2c589-a369-47c6-aec3-c4fba3df65ac	Travanca	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
366	0b4403e1-bbfc-4f8a-84b5-73bbfeade8a8	Vale	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
367	7e4d0a99-4ff2-4ecd-a5be-f8d019fad13e	Vila Maior	\N	2	34	3	2025-03-23 11:47:09	2025-03-23 11:47:09
368	73e71fda-dfa2-4798-9783-51392294ad54	São João da Madeira	\N	2	35	2	2025-03-23 11:47:09	2025-03-23 11:47:09
369	996fdc40-0098-41bc-b7ce-b4d81af66d91	Cedrim e Paradela	\N	2	36	1	2025-03-23 11:47:09	2025-03-23 11:47:09
370	818cde1a-8b5d-40e0-99da-17f158faacaa	Couto de Esteves	\N	2	36	2	2025-03-23 11:47:09	2025-03-23 11:47:09
371	74f6edb9-7fbc-4af8-8c08-f4b12b38f6b1	Pessegueiro do Vouga	\N	2	36	2	2025-03-23 11:47:09	2025-03-23 11:47:09
372	8a7f5b07-57a1-413f-8d41-5f19229004ea	Rocas do Vouga	\N	2	36	2	2025-03-23 11:47:09	2025-03-23 11:47:09
373	4c2704d4-1d96-44dc-a403-145b4cdc12eb	Sever do Vouga	\N	2	36	2	2025-03-23 11:47:09	2025-03-23 11:47:09
374	ec87783c-3426-4935-9c4c-a0cac480236f	Silva Escura e Dornelas	\N	2	36	1	2025-03-23 11:47:09	2025-03-23 11:47:09
375	9fd42afe-e318-453c-9fd3-9a0cdee31d53	Talhadas	\N	2	36	2	2025-03-23 11:47:09	2025-03-23 11:47:09
376	0c5d94e0-392e-48a1-820e-1c5c864cad04	Cedrim	\N	2	36	3	2025-03-23 11:47:09	2025-03-23 11:47:09
377	e4c81e6a-6a2f-4aee-8d45-f732de47b78c	Paradela	\N	2	36	3	2025-03-23 11:47:09	2025-03-23 11:47:09
378	ae64f0fe-e1c9-4965-a628-1b280f34775d	Silva Escura	\N	2	36	3	2025-03-23 11:47:09	2025-03-23 11:47:09
379	f2696303-a3b0-4585-b616-7df94c9c16c2	Dornelas	\N	2	36	3	2025-03-23 11:47:09	2025-03-23 11:47:09
380	1ccb0daf-87aa-4972-92e5-210e9a74f9bf	Calvão	\N	2	37	2	2025-03-23 11:47:09	2025-03-23 11:47:09
381	9714cfba-50f3-4d07-b0c4-6dcd33809e71	Fonte de Angeão e Covão do Lobo	\N	2	37	1	2025-03-23 11:47:09	2025-03-23 11:47:09
382	e7024b6c-ead8-4b45-a254-198995bd7837	Gafanha da Boa Hora	\N	2	37	2	2025-03-23 11:47:09	2025-03-23 11:47:09
383	7d0d61fa-3fee-4968-b826-b1fb53e1c412	Ouca	\N	2	37	2	2025-03-23 11:47:09	2025-03-23 11:47:09
384	52a1c0ac-1154-45f5-a573-e9bb0e6e1123	Ponte de Vagos e Santa Catarina	\N	2	37	1	2025-03-23 11:47:09	2025-03-23 11:47:09
385	d5df4ae9-2b35-4e34-a902-01b58fe049f3	Santo André de Vagos	\N	2	37	2	2025-03-23 11:47:09	2025-03-23 11:47:09
386	e84c8a5f-79aa-4730-912c-321f2f5f374e	Vagos e Santo António	\N	2	37	1	2025-03-23 11:47:09	2025-03-23 11:47:09
387	760e7a21-0b98-4259-84e0-145350c2b9a7	Soza	\N	2	37	2	2025-03-23 11:47:09	2025-03-23 11:47:09
388	dc4092f0-b3b6-4b78-bad5-3351d71098ab	Covão do Lobo	\N	2	37	3	2025-03-23 11:47:09	2025-03-23 11:47:09
389	b35f0c00-bc94-41b6-9777-ad0adb1e195f	Fonte de Angeão	\N	2	37	3	2025-03-23 11:47:09	2025-03-23 11:47:09
390	cfbe99ca-2962-4d6e-9711-1a3b1f0f8385	Ponte de Vagos	\N	2	37	3	2025-03-23 11:47:09	2025-03-23 11:47:09
391	b44b56fb-1536-4b54-92cb-90529155b492	Santa Catarina	\N	2	37	3	2025-03-23 11:47:09	2025-03-23 11:47:09
392	f9714c45-74cd-4a8e-9fbf-726515d1197a	Santo António de Vagos	\N	2	37	1	2025-03-23 11:47:09	2025-03-23 11:47:09
393	8bae02bc-960e-4b65-bddc-01e83caf6c51	Vagos	\N	2	37	1	2025-03-23 11:47:09	2025-03-23 11:47:09
394	a6a6b9bf-85d1-45a9-ad3e-c656e5dd116e	Arões	\N	2	38	2	2025-03-23 11:47:09	2025-03-23 11:47:09
395	ab2545ac-f9af-4e3b-af50-4aca64671ac7	Cepelos	\N	2	38	2	2025-03-23 11:47:09	2025-03-23 11:47:09
396	3aca9d28-0db7-415a-aefe-31d58f753715	Junqueira	\N	2	38	2	2025-03-23 11:47:09	2025-03-23 11:47:09
397	78acf978-ce68-4226-8687-9108f4a46dcc	Macieira de Cambra	\N	2	38	2	2025-03-23 11:47:09	2025-03-23 11:47:09
398	f09a7894-0b28-406a-bcb3-2c75a72fc080	Roge	\N	2	38	2	2025-03-23 11:47:09	2025-03-23 11:47:09
399	4d83a6e3-9196-4805-9cdd-dea734d3a4c6	São Pedro de Castelões	\N	2	38	2	2025-03-23 11:47:09	2025-03-23 11:47:09
400	f87e08b5-88cb-4862-99fe-c6dedf4411b0	Vila Chã, Codal e Vila Cova de Perrinho	\N	2	38	1	2025-03-23 11:47:09	2025-03-23 11:47:09
401	d2802868-ce33-4d27-81fb-7c5bd6771abe	Codal	\N	2	38	3	2025-03-23 11:47:09	2025-03-23 11:47:09
402	c9652264-4b3d-4d4f-aa76-b42f82e24c8f	Vila Chã	\N	2	38	3	2025-03-23 11:47:09	2025-03-23 11:47:09
403	7087a908-050d-4a0e-8af0-2c1a40e8974a	Vila Cova de Perrinho	\N	2	38	3	2025-03-23 11:47:09	2025-03-23 11:47:09
404	7cb8d0a0-56ed-4e07-9aa4-8c4c2a6c52f3	Aljustrel e Rio de Moinhos	\N	3	39	1	2025-03-23 11:47:09	2025-03-23 11:47:09
405	114bb215-9bb8-4f63-9073-ce2b8a7e9e68	Ervidel	\N	3	39	2	2025-03-23 11:47:09	2025-03-23 11:47:09
406	1eca90bd-32e0-4041-8189-617e90ff5c86	Messejana	\N	3	39	2	2025-03-23 11:47:09	2025-03-23 11:47:09
407	1b0322ea-2f69-4346-8748-d55f5363dce8	São João de Negrilhos	\N	3	39	2	2025-03-23 11:47:09	2025-03-23 11:47:09
408	9b202617-69a2-445f-a6c6-cdb9cad04f6a	Aljustrel	\N	3	39	3	2025-03-23 11:47:09	2025-03-23 11:47:09
409	32fe559f-648d-4c3b-b9ed-47c3f4d47b4c	Rio de Moinhos	\N	3	39	3	2025-03-23 11:47:09	2025-03-23 11:47:09
639	c155b6c8-b540-4487-a0ab-33671083f907	Milhazes	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
410	cfb694f3-9d75-4c71-a932-c189db923907	Aldeia dos Fernandes	\N	3	40	2	2025-03-23 11:47:09	2025-03-23 11:47:09
411	ceb2d88d-d7e6-4bf4-b5e6-68e770258d41	Almodôvar e Graça dos Padrões	\N	3	40	1	2025-03-23 11:47:09	2025-03-23 11:47:09
412	a93657ce-2bdd-4d4d-9cc1-45a3bf0d2e43	Rosário	\N	3	40	2	2025-03-23 11:47:09	2025-03-23 11:47:09
413	299a60cd-6e7e-4a17-8a04-19885b3511fa	Santa Clara-A-Nova e Gomes Aires	\N	3	40	1	2025-03-23 11:47:09	2025-03-23 11:47:09
414	bd9ef5cf-2252-4c91-8662-6bc196c6a3fd	Santa Cruz	\N	3	40	2	2025-03-23 11:47:09	2025-03-23 11:47:09
415	b15acda4-8fe5-42ff-acd1-aa46559d104d	São Barnabé	\N	3	40	2	2025-03-23 11:47:09	2025-03-23 11:47:09
416	7cb28db9-3b58-486a-b354-e9515926c2b4	Almodôvar	\N	3	40	3	2025-03-23 11:47:09	2025-03-23 11:47:09
417	7eb71647-81b4-48a9-9b2d-e9dffed79973	Senhora da Graça dos Padrões	\N	3	40	3	2025-03-23 11:47:09	2025-03-23 11:47:09
418	2382b152-ff51-4b49-b384-000517f2e01d	Gomes Aires	\N	3	40	3	2025-03-23 11:47:09	2025-03-23 11:47:09
419	7aaf7ef4-f65d-438e-9958-8bf8a37278d8	Santa Clara-A-Nova	\N	3	40	3	2025-03-23 11:47:09	2025-03-23 11:47:09
420	87267c3f-d21d-4c3d-8c45-29f2b7209463	Alvito	\N	3	41	2	2025-03-23 11:47:09	2025-03-23 11:47:09
421	5cac4a23-38b1-458a-bcbb-924c02d85643	Vila Nova da Baronia	\N	3	41	2	2025-03-23 11:47:09	2025-03-23 11:47:09
422	01939b7b-b11d-4837-b39b-270c00a105d9	Barrancos	\N	3	42	2	2025-03-23 11:47:09	2025-03-23 11:47:09
423	73aba427-f984-4e96-94a1-0cf5707fd404	Albernoa e Trindade	\N	3	43	1	2025-03-23 11:47:09	2025-03-23 11:47:09
424	ac21f282-49cd-4fab-a91d-83f293ff4cd5	Baleizão	\N	3	43	2	2025-03-23 11:47:09	2025-03-23 11:47:09
425	9d7096e9-cc6e-4d20-b848-b4a7e661436b	Beja - Salvador e Santa Maria da Feira	\N	3	43	1	2025-03-23 11:47:09	2025-03-23 11:47:09
426	b74dc51b-91d9-4262-b4da-10c36524a94c	Beja - Santiago Maior e São João Batista	\N	3	43	1	2025-03-23 11:47:09	2025-03-23 11:47:09
427	89aed021-bbae-4142-8ac7-92704f5e6c51	Beringel	\N	3	43	2	2025-03-23 11:47:09	2025-03-23 11:47:09
428	25db10ed-e625-4ba1-aa9c-159fcf466a66	Cabeça Gorda	\N	3	43	2	2025-03-23 11:47:09	2025-03-23 11:47:09
429	e9370504-88a8-4c5a-880a-2d6888f91d9a	Nossa Senhora das Neves	\N	3	43	2	2025-03-23 11:47:09	2025-03-23 11:47:09
430	2636a969-b889-41b2-8f28-285352266180	Salvada e Quintos	\N	3	43	1	2025-03-23 11:47:09	2025-03-23 11:47:09
431	8b643bf5-71a0-4db8-9b6a-cb6e37875e78	Santa Clara de Louredo	\N	3	43	2	2025-03-23 11:47:09	2025-03-23 11:47:09
432	1f533148-e004-4a8a-bc25-1cd386120b6b	São Matias	\N	3	43	2	2025-03-23 11:47:09	2025-03-23 11:47:09
433	255675f5-96de-443f-907f-387469f0e8c3	Santa Vitória e Mombeja	\N	3	43	1	2025-03-23 11:47:09	2025-03-23 11:47:09
434	4169c7b3-06f4-466e-83cd-1311ed97a3f5	Trigaches e São Brissos	\N	3	43	1	2025-03-23 11:47:09	2025-03-23 11:47:09
435	31285c22-eb00-4c26-bb86-fef61f3e77ab	Albernoa	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
436	cd2f639c-5bca-4399-a91b-b44e56e7fc31	Beja - Salvador	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
437	d9ed647e-470d-4f1b-ace1-7609eeaa6b98	Beja - Santa Maria da Feira	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
438	2d42ff72-c3cc-47b0-8872-273e5b755bcf	Beja - Santiago Maior	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
439	d309971f-4225-4214-a08a-595df20346db	Beja - São João Batista	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
440	759a718f-46f4-4993-8b3c-6b90477f3346	Trigaches	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
441	52c09180-34d1-4fec-abbb-7c667e9d5cac	Trindade	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
442	be99c4ec-aabc-4bd1-b74c-6173b7545674	Mombeja	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
443	79ddfade-9c70-48c1-9b42-c2c2f1fa7d45	Quintos	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
444	d53e1309-4ac9-43f7-9496-83c64a54be4d	Salvada	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
445	3b28d8e7-1aaa-4dd5-ab7e-dc7ad5880b18	Santa Vitória	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
446	887abb6b-6ed1-4d23-b914-e8cb19084aca	São Brissos	\N	3	43	3	2025-03-23 11:47:09	2025-03-23 11:47:09
447	6ceb3e7b-68ce-4861-94b3-c282b0b3d115	Castro Verde e Casével	\N	3	44	1	2025-03-23 11:47:09	2025-03-23 11:47:09
448	67689395-3f3c-4b4a-95bb-750cbc5766ea	Entradas	\N	3	44	2	2025-03-23 11:47:09	2025-03-23 11:47:09
449	fd8a28cd-bae6-481b-8617-04ae58d67d14	Santa Bárbara de Padrões	\N	3	44	2	2025-03-23 11:47:09	2025-03-23 11:47:09
450	34de9bb2-50e6-4e9e-b9ec-93830e0a3846	São Marcos da Ataboeira	\N	3	44	2	2025-03-23 11:47:09	2025-03-23 11:47:09
451	0cf7fc42-48f1-4ab0-8f72-49f111665bcf	Castro Verde	\N	3	44	3	2025-03-23 11:47:09	2025-03-23 11:47:09
452	4a109e7d-f71e-40e5-8ea3-4d5dcb0097b5	Casével	\N	3	44	3	2025-03-23 11:47:09	2025-03-23 11:47:09
453	d249b45e-4f89-4147-9159-502d51969f8c	Cuba	\N	3	45	2	2025-03-23 11:47:09	2025-03-23 11:47:09
454	99376d9a-8a50-46df-bfa0-a6883dcce6d8	Faro do Alentejo	\N	3	45	2	2025-03-23 11:47:09	2025-03-23 11:47:09
455	4fde96ae-07d5-4211-8773-f71a85c23d75	Vila Alva	\N	3	45	2	2025-03-23 11:47:09	2025-03-23 11:47:09
456	c135f34e-6edd-484c-80bc-9fac891b37fa	Vila Ruiva	\N	3	45	2	2025-03-23 11:47:09	2025-03-23 11:47:09
457	6d1159a6-e1cd-40f0-bf3f-7ff5aadab92f	Alfundão e Peroguarda	\N	3	46	1	2025-03-23 11:47:09	2025-03-23 11:47:09
458	310450df-d34c-4e87-a85f-7c2d955b309d	Ferreira do Alentejo e Canhestros	\N	3	46	2	2025-03-23 11:47:09	2025-03-23 11:47:09
459	e80d3f1a-eac9-48e0-a35c-c6c300e89155	Figueira dos Cavaleiros	\N	3	46	2	2025-03-23 11:47:09	2025-03-23 11:47:09
460	dbbf3a17-f195-48f5-b6c4-b0bf7cc04231	Odivelas	\N	3	46	2	2025-03-23 11:47:09	2025-03-23 11:47:09
461	0026c731-559c-493a-9208-3b00dbbb4042	Alfundão	\N	3	46	3	2025-03-23 11:47:09	2025-03-23 11:47:09
462	1435bd6c-2a2a-4e56-81fd-d2774ffbd15b	Peroguarda	\N	3	46	3	2025-03-23 11:47:09	2025-03-23 11:47:09
463	c63cf245-26d3-4249-84b8-96eeb747c00f	Canhestros	\N	3	46	3	2025-03-23 11:47:09	2025-03-23 11:47:09
464	b3699896-f593-4272-aef1-a5bdbcd6b649	Ferreira do Alentejo	\N	3	46	3	2025-03-23 11:47:09	2025-03-23 11:47:09
465	eab584c2-96a3-4013-91e1-530f9fbc7a50	Alcaria Ruiva	\N	3	47	2	2025-03-23 11:47:09	2025-03-23 11:47:09
466	cf17e150-8ac5-4ee5-9323-3afda58ef4a7	Corte do Pinto	\N	3	47	2	2025-03-23 11:47:09	2025-03-23 11:47:09
467	169faabd-5418-4557-adbe-e2e109e25312	Espírito Santo	\N	3	47	2	2025-03-23 11:47:09	2025-03-23 11:47:09
468	6985950a-de6a-4703-bbfd-3b7d8ebecd7f	Mértola	\N	3	47	2	2025-03-23 11:47:09	2025-03-23 11:47:09
469	11192df1-79f3-47f4-938a-743519039a99	Santana de Cambas	\N	3	47	2	2025-03-23 11:47:09	2025-03-23 11:47:09
470	799f6293-4295-48fa-ae7e-42437580ae66	São João dos Caldeireiros	\N	3	47	2	2025-03-23 11:47:09	2025-03-23 11:47:09
471	69bc8cb6-9e36-4f8b-bcfc-82e6680d21b8	São Miguel do Pinheiro, São Pedro Solis, São Sebastião Carros	\N	3	47	1	2025-03-23 11:47:09	2025-03-23 11:47:09
472	50071000-fba3-4550-97c0-0793b4b419d3	São Miguel do Pinheiro	\N	3	47	1	2025-03-23 11:47:09	2025-03-23 11:47:09
473	2b5b0699-e970-4dae-b680-488e04816c0c	São Pedro Solis	\N	3	47	1	2025-03-23 11:47:09	2025-03-23 11:47:09
474	1495528b-8f0f-4983-946c-2fe716bcd4ab	São Sebastião Carros	\N	3	47	1	2025-03-23 11:47:09	2025-03-23 11:47:09
475	3155329b-cc54-4762-b0ee-80452971bcfc	Amareleja	\N	3	48	2	2025-03-23 11:47:09	2025-03-23 11:47:09
476	f332bb06-04c0-4a8b-ae71-bba46116993d	Moura - Santo Agostinho e São João Baptista e Santo Amador	\N	3	48	1	2025-03-23 11:47:09	2025-03-23 11:47:09
477	f1328224-611b-4dc7-9115-19c996f11b51	Póvoa de São Miguel	\N	3	48	2	2025-03-23 11:47:09	2025-03-23 11:47:09
478	7bd60904-6f74-4362-bab0-75242d8eb26d	Safara e Santo Aleixo da Restauração	\N	3	48	1	2025-03-23 11:47:09	2025-03-23 11:47:09
479	5337ae20-d079-4c71-b825-ee294541742f	Sobral da Adiça	\N	3	48	2	2025-03-23 11:47:09	2025-03-23 11:47:09
480	14748a51-7c65-4210-a8d8-4e64d983afcf	Safara	\N	3	48	3	2025-03-23 11:47:09	2025-03-23 11:47:09
481	5ab41bcf-acf0-4d69-8d44-189dd571aab7	Santo Aleixo da Restauração	\N	3	48	3	2025-03-23 11:47:09	2025-03-23 11:47:09
482	c50b4eee-4336-474d-b10b-199f502f3d58	Santo Agostinho	\N	3	48	3	2025-03-23 11:47:09	2025-03-23 11:47:09
483	2b646763-aca3-42c8-ab97-36c074b58e54	São João Baptista	\N	3	48	3	2025-03-23 11:47:09	2025-03-23 11:47:09
484	3b5d2535-ca8a-43df-8214-b41ad5be84ec	Santo Amador	\N	3	48	3	2025-03-23 11:47:09	2025-03-23 11:47:09
485	1cbe10b5-8b26-4b59-976a-66240690c331	Boavista dos Pinheiros	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
486	5a778ab2-95f1-4ddb-84de-02815c6e835e	Colos	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
487	971c878d-e457-4c02-a12e-30ec0e27baa7	Longueira/Almograve	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
488	cf3c899e-de35-492f-9bff-ad8198f24736	Luzianes-Gare	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
489	3ac6c5c9-3ce2-4972-9b66-33cdf7410374	Relíquias	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
490	296a782e-dd35-4060-8f09-b1039888e890	Saboia	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
491	3ac55889-3b96-467e-82e5-f28d0396c673	Santa Clara-a-Velha	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
492	0b3fdf50-887e-462f-9b08-83bd656255fb	São Luís	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
493	d1c3eccb-7be9-49de-bdb1-8ff57f6ada70	São Martinho das Amoreiras	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
494	b0446577-5c9b-436f-9bb9-a31984031794	São Salvador e Santa Maria	\N	3	49	1	2025-03-23 11:47:09	2025-03-23 11:47:09
495	39de39cd-21d2-4fee-9487-f4383c2d76f1	São Teotónio	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
496	ecb9b911-7f52-4bf8-bdbc-aa9ff191b6fe	Vale de Santiago	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
497	41b02791-f8e5-4d72-8b10-cfa4483849d3	Vila Nova de Milfontes	\N	3	49	2	2025-03-23 11:47:09	2025-03-23 11:47:09
498	f535768a-c731-4733-9c6b-34d07fcf948c	Odemira - São Salvador	\N	3	49	3	2025-03-23 11:47:09	2025-03-23 11:47:09
499	2581216e-c9c3-401f-82c0-fb4a0c1ddb6e	Odemira - Santa Maria	\N	3	49	3	2025-03-23 11:47:09	2025-03-23 11:47:09
500	50ffae9d-d04a-4260-814a-0c6a928c72bf	Pereiras-Gare	\N	3	49	3	2025-03-23 11:47:09	2025-03-23 11:47:09
501	2fa8e980-94f5-426e-8b79-7d4696fdf176	Bicos	\N	3	49	3	2025-03-23 11:47:09	2025-03-23 11:47:09
502	dfc4ee31-ba8f-4a93-9fbd-013445542153	Zambujeira do Mar	\N	3	49	3	2025-03-23 11:47:09	2025-03-23 11:47:09
503	509a9aef-2fd0-437c-96e7-4ed681854602	Garvão e Santa Luzia	\N	3	50	1	2025-03-23 11:47:09	2025-03-23 11:47:09
504	43ccd38c-d2d0-4d52-aabb-b455b7712d07	Ourique	\N	3	50	2	2025-03-23 11:47:09	2025-03-23 11:47:09
505	f83b72f0-7295-423b-82be-f66055bfe566	Panoias e Conceição	\N	3	50	1	2025-03-23 11:47:09	2025-03-23 11:47:09
506	7226a04e-d787-480a-abea-93dbee01f545	Santana da Serra	\N	3	50	2	2025-03-23 11:47:09	2025-03-23 11:47:09
507	a24a2196-b8da-45c2-b137-ee85342f9b20	Garvão	\N	3	50	3	2025-03-23 11:47:09	2025-03-23 11:47:09
508	7417ddf3-e47a-45e5-ba51-773ceb15aaa0	Santa Luzia	\N	3	50	3	2025-03-23 11:47:09	2025-03-23 11:47:09
509	42febd47-f13b-40b1-a31d-8360b38b7444	Panoias	\N	3	50	3	2025-03-23 11:47:09	2025-03-23 11:47:09
510	4fef2d70-892c-485d-b862-7d35b46b2a4b	Conceição	\N	3	50	3	2025-03-23 11:47:09	2025-03-23 11:47:09
511	b98335cd-f78c-4d54-8ccc-74cd26b07837	Brinches	\N	3	51	2	2025-03-23 11:47:09	2025-03-23 11:47:09
512	aeac03d2-0a81-4476-af1f-9385b5da83dd	Pias	\N	3	51	2	2025-03-23 11:47:09	2025-03-23 11:47:09
513	06e28f65-5636-4106-a317-c2905bd0b20d	Serpa - Salvador e Santa Maria	\N	3	51	1	2025-03-23 11:47:09	2025-03-23 11:47:09
514	0f9a462e-3275-427c-b618-70b7ab364a17	Vila Nova de São Bento e Vale de Vargo	\N	3	51	1	2025-03-23 11:47:09	2025-03-23 11:47:09
515	78e8f0ab-7d07-420e-b72d-bf680c6f5325	Vila Verde de Ficalho	\N	3	51	2	2025-03-23 11:47:09	2025-03-23 11:47:09
516	3589d308-1999-4ff1-aafc-c167a8062664	Serpa - Salvador	\N	3	51	3	2025-03-23 11:47:09	2025-03-23 11:47:09
517	db1b92c8-190b-4f12-90b9-523441b4046b	Serpa - Santa Maria	\N	3	51	3	2025-03-23 11:47:09	2025-03-23 11:47:09
518	d5f7ec72-474d-418f-9eed-3aa0c669f693	Vale de Vargo	\N	3	51	3	2025-03-23 11:47:09	2025-03-23 11:47:09
519	29baf1ab-7f0a-404c-a00f-4a26b306575d	Pedrógão	\N	3	52	2	2025-03-23 11:47:09	2025-03-23 11:47:09
520	fe96be00-fd30-4857-83cc-d8dd9c1f5c92	Selmes	\N	3	52	2	2025-03-23 11:47:09	2025-03-23 11:47:09
521	6cb60dab-4fb7-4977-8820-f3bc1816b7d1	Vidigueira	\N	3	52	2	2025-03-23 11:47:09	2025-03-23 11:47:09
522	403f4097-32bc-4b45-bd55-69df57ae4573	Vila de Frades	\N	3	52	2	2025-03-23 11:47:09	2025-03-23 11:47:09
523	c4337622-cb85-476b-a4a8-1c579721c86e	Amares e Figueiredo	\N	4	53	1	2025-03-23 11:47:09	2025-03-23 11:47:09
524	b5d8b907-1760-4f1f-9547-be1190567fde	Barreiros	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
525	83a4bf8f-961c-493d-ac05-60b710d14aeb	Bico	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
526	a4328af1-1ca1-423a-a4bd-893743029945	Bouro - Santa Maria	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
527	2669af09-f6b8-40ed-a0ff-220779897a3e	Caires	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
528	c5dce061-8072-4de9-bf7b-960e0cfe8c1a	Caldelas, Sequerios e Paranhos	\N	4	53	1	2025-03-23 11:47:09	2025-03-23 11:47:09
529	6a9a9ba5-b93b-41d6-b66a-ea22f8f9ea00	Carrazedo	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
530	3665e057-7c06-4b2c-80ec-08615a017185	Dornelas	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
531	765665a8-05d8-4498-8001-9c3ab9068022	Ferreiros, Prozelo e Besteiros	\N	4	53	1	2025-03-23 11:47:09	2025-03-23 11:47:09
532	6cb0d12d-6deb-48f8-bbf6-a799e9862a2e	Fiscal	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
533	114bced1-572c-4960-b60a-841f3e51815e	Goães	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
534	ede6c595-0d5f-4168-92b0-b994379cca76	Lago	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
535	4848d062-d272-4114-8214-e30a48c250cf	Rendufe	\N	4	53	2	2025-03-23 11:47:09	2025-03-23 11:47:09
536	295d45a7-d7e7-45bf-b780-86092ed693e4	Torre e Portela	\N	4	53	1	2025-03-23 11:47:09	2025-03-23 11:47:09
537	890337d6-c94a-4199-b5ed-6e9f153a6186	Vilela, Seramil e Paredes Secas	\N	4	53	1	2025-03-23 11:47:09	2025-03-23 11:47:09
538	48301ab6-9d3b-403d-9d12-3988294cdfa3	Amares e Figueiredo	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
539	3fd602fc-4f05-444d-8a63-fb3157594dd0	Amares e Figueiredo	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
540	9b2b40a9-4a6a-459c-a083-5f07a315ba7b	Besteiros	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
541	97817fb0-81f1-4849-898f-205bfde93b30	Ferreiros	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
542	e07b998e-e1b9-482a-ab8d-26269b356a5c	Prozelo	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
543	b2fd1e1e-2582-4ade-bac7-a766c3efa9e1	Caldelas	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
544	2b0ac667-fc64-41e4-89c7-b8ca33140a3d	Paranhos	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
545	0524332a-a305-4f5d-8a89-52b8d8fdc269	Sequerios	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
546	dc4140da-f3d1-46f0-8171-618374852ebe	Paredes Secas	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
547	92b682bb-24b2-4f44-82e4-c78b2bf39b70	Seramil	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
548	9214ab5c-065b-41ca-9bee-8e18bd53c341	Vilela	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
549	9d4f423e-31e0-438a-ab96-aecdc99ad270	Portela	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
550	8a184de5-ab59-48ba-a8ae-d68281180b0f	Torre	\N	4	53	3	2025-03-23 11:47:09	2025-03-23 11:47:09
551	2fc131e6-32f9-40f1-8da8-6064e8da91cf	Abade de Neiva	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
552	2682b0b2-6f41-4547-9d99-0cbc74135936	Aborim	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
553	0292b016-6063-47d0-b89e-57cc1ae835cb	Adães	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
554	a2e5caa5-d64a-4a07-8788-1d978127cb1c	Airó	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
555	c289f8e2-1926-4d9e-9afa-045efe4280b8	Aldreu	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
556	12c11439-439b-448c-b1a0-2ad50910a426	Alheira e Igreja Nova	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
557	c5ce08b2-2e4d-4dbf-9a84-900901694a4f	Alvelos	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
558	383dbfeb-20ef-4812-9aca-2a0d672f88aa	Alvito - São Pedro e São Martinho e Couto	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
559	cb6c6c1c-3bda-4ff7-af1e-ee67beba1ba0	Arcozelo	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
560	c105f364-6387-4fc0-8747-95d713613802	Areias	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
561	2d17db18-a16e-4bf5-81b2-196aa3a7b9a4	Areias de Vilar e Encourados	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
562	505407d9-2b0c-4de5-bf63-f9e8a82d9195	Balugães	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
563	2ba164ff-9d54-4bfd-a5af-2f6993068357	Barcelinhos	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
564	cfbc9476-4386-4666-b496-b9cc22c85eb4	Barcelos, Vila Boa, Vila Frescainha - São Martinho e São Pedro	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
565	aec9a2b4-919e-4ec2-b9eb-feea8f039d64	Barqueiros	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
566	a3219e3d-4dce-4b0f-b019-90c1667dcf25	Cambeses	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
567	f6b7b164-cd32-45c0-aa2d-628e3a194cfa	Campo e Tamel - São Pedro Fins	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
568	2793dc91-e920-468c-a3d8-5def058ed3fc	Carapeços	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
569	95b9db76-c9a6-4993-b9f8-4164fd563917	Carreira e Fonte Coberta	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
570	451a8490-1ba9-4f03-b6d8-6b2d8546925a	Carvalhal	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
571	b153bdaa-aad6-4c1f-8171-88628fb69b80	Carvalhas	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
572	7c70baf4-65d4-428c-b421-4f6ababbeaec	Chorente, Gios, Courel, Pedra Furada e Gueral	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
573	131c1334-938a-4a3f-ad1e-a61576631eb5	Cossourado	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
574	9cbeae6b-fd30-4428-a169-f64156c62303	Creixomil e Mariz	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
575	797c8f7d-b985-407d-8796-7e83233e8fbe	Cristelo	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
576	8cacf38a-50f5-4a33-b31c-561436cc69e8	Durrães e Tregosa	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
577	73077913-8a01-4482-8ef9-884333855384	Fornelos	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
578	307a9668-de4d-49f3-b83d-19242e390ebc	Fragoso	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
579	fc9c5933-e651-4fba-b458-8c89a3b3baba	Gamil e Midões	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
580	e154672c-3416-479a-bd9a-998a4444f732	Galegos - Santa Maria	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
581	7c823c16-5708-49f6-827c-309ac1b0799a	Galegos - São Martinho	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
582	f90210e2-a3c0-4314-95d1-33fe30725ed4	Gilmonde	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
583	5f50b69d-d55b-408b-8851-d9582bc2dbfa	Lama	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
584	cbc929ac-10a1-43a3-901c-a7cb95e688da	Lijo	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
585	7be59a02-e316-41ed-ba8d-9d32d5a0d15c	Macieira de Rates	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
586	f4bcba62-cbf7-4334-a432-73a90d768922	Manhente	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
587	53afd550-6125-4c6a-85df-a62830c27590	Martim	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
588	b3dbf4d4-8df4-47c5-a674-92d3fcc65e99	Milhazes, Vilar de Figos e Faria	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
589	4b648e0b-822d-4e42-8edc-ac77f32d0f98	Moure	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
590	35f8b845-e144-4f10-8d4c-a94341c540f5	Negreiros e Chavão	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
591	81a7c3d0-0608-4289-b3cb-24603dc4d5e9	Oliveira	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
592	4f137f77-7fc9-4284-8a4e-8805bd058983	Palme	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
593	bbd926c1-1d94-4228-9797-5be8a09d05b6	Panque	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
594	b2de69aa-ae94-45cb-ad98-bb40e2f1a313	Paradela	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
595	75e7b5bb-92a5-4ef9-8538-8959d8cb3a53	Pereira	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
596	3e2974f6-71d4-414d-9d55-3fb37b36e8ef	Perelhal	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
597	ad60ebac-2e1a-4436-9176-7f0553f1b91f	Pousa	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
598	e7180dd8-acb9-4d4f-8cfa-4b4a1cd4d726	Quintiães e Aguiar	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
599	7f74002d-adc8-471c-9033-829b222d9f7d	Remelhe	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
600	ff45ace1-5ddc-49af-b743-e01c237e9dd8	Rio Covo - Santa Eugénia	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
601	bfd26a6a-7dab-40b4-9759-c1162f8bae1b	Roriz	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
602	bcdcda12-3a95-4b69-a74d-12ffd277188e	Sequeade e Bastuço - São João e Santo Estevão	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
603	a4dac2f9-d7e9-4e0c-b9a5-b669ea17e39b	Silva	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
604	e50dd6ac-0558-4bb2-a99e-7ad5bc1617cf	Silveiros e Rio Covo - Santa Eulalia	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
605	25ca08f5-3231-42ac-85a6-0d1ba5986667	Tamel - Santa Leocadia e Vilar do Monte	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
606	38330100-a572-4c7d-bc0a-318b7c2ef502	Tamel - São Verissimo	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
607	ce806731-2f10-4c86-b0f4-d7e029d2ecbc	Ucha	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
608	9ac739be-d42b-4912-bbda-fdf392ce0f33	Várzea	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
609	053bbd5f-f0be-4408-98ad-e3c5665a5953	Viatodos, Grimancelos, Minhotães, Monte Fralães	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
610	b10095d8-f7ab-43fa-81f6-f3f6f5254190	Vila Cova de Feitos	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
611	7c55fcba-012a-4d13-9f4c-1f079a9e8aa3	Vila Seca	\N	4	54	2	2025-03-23 11:47:09	2025-03-23 11:47:09
612	4d0775a8-d024-4375-92d3-53f549e1082b	Aguiar	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
613	8d566993-f6ac-42db-81f7-b31177efc94a	Quintiães	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
614	2e8a7491-8f42-483c-8eea-d3c4aeff80f8	Alheira	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
615	69bdccff-0787-4442-bd62-68020bc2ea8f	Igreja Nova	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
616	4cd8d080-e444-4ecf-a4e4-c8c2e8073b29	Areias de Vilar	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
617	ef8e9b56-d155-4121-ab72-4671b3ec1cba	Encourados	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
618	7824d3fd-16c7-4982-8528-02f0fd9eda16	Barcelos	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
619	678573b9-2135-41ce-8e76-8e224b473334	Vila Boa, Vila Frescainha - São Martinho e São Pedro	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
620	f8412149-d986-4257-93b8-c8989d2ff4b8	Campo	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
621	557277fa-ea27-4fda-9d7b-8d44ace8b100	Tamel - São Pedro Fins	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
622	acc831cc-2575-4e48-abe7-205b25252090	Carreira	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
623	08394c0d-ff29-40d6-8c58-b3cefbf5cc3f	Fonte Coberta	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
624	bc41262f-7d73-4629-aeb6-bb5f13a2c9cc	Chavão	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
625	e7e8fd46-4563-4d95-92e6-10b12daf20cb	Negreiros	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
626	67836af5-07a3-47ef-a25e-f3713d923786	Chorente	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
627	2c3d5967-fed2-4a85-950a-607b6ba96c90	Courel	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
628	9e6fff23-b43b-4a4c-a03a-7ac3b6c62b0a	Gios	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
629	97538def-a827-4e25-bfea-1130baa43436	Gueral	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
630	0048a990-8686-4ba7-b830-e3138d847db8	Pedra Furada	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
631	c87fc4f3-30c1-45be-90ca-6c5e99745e09	Couto	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
632	b57538c9-383e-4103-b103-9d1fd1ae84c5	Alvito - São Pedro	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
633	b6165bd3-a51d-40d1-af80-f94a56629788	Alvito - São Martinho	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
634	b731112c-5514-42b0-b011-de65cfc91b78	Creixomil	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
635	3c9a43c6-d2fe-4f78-84ed-1aa2de227129	Mariz	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
636	63830af5-b44f-4dd6-badb-593ab8143e25	Durrães	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
637	5850f0d9-a28c-4292-918a-379009386517	Tregosa	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
638	d8f64798-3c79-4e0f-8a1d-f48606f9e091	Faria	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
640	3325de15-4e4b-4b6f-bbca-dea94f62f66d	Vilar de Figos	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
641	1aed7932-9641-49ef-9e46-cffd9cf64e70	Feitos	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
642	77f2c2cf-b5db-4e6b-8012-a727c8c45010	Vila Cova	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
643	13ebf705-9494-4fbf-884a-8ba3b4d6bb37	Gamil	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
644	df2c8b69-dff2-4243-aa16-5835027da432	Midões	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
645	8011461c-cdcb-481e-af17-536836c36d11	Grimancelos	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
646	736050c7-eaa1-491a-9f97-1a9ffc8cf141	Minhotães	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
647	fadbc89a-81e5-4946-be6b-73ee56db9179	Monte Fralães	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
648	1aad8ad3-3fd8-4ec1-993f-9730654cdc6c	Tamel - Santa Leocadia	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
649	1817b553-3cde-4f39-87bd-7202d3f27270	Vilar do Monte	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
650	278e95eb-b819-4507-a44a-882e164e57a5	Bastuço - São João	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
651	10c7f9a7-1630-4e88-be5c-39d0fac33fb1	Bastuço - São João	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
652	f32ecbb1-f36a-422b-b233-cbf8287f87a7	Sequeade	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
653	ec12858a-da6c-441a-af00-e6cf9411a746	Vila Boa	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
654	4dfab596-9cf9-48e8-8eb1-2030afbbfccb	Vila Frescainha - São Martinho	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
655	a21fafc6-5473-4bd9-8ffb-41461181b51a	Vila Frescainha - São Pedro	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
656	259db6ce-f991-4558-a42e-c435c1b16241	Silveiros	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
657	f34b6c96-3206-4d39-8b2f-09060c3c0d5f	Rio Covo - Santa Eulalia	\N	4	54	3	2025-03-23 11:47:09	2025-03-23 11:47:09
658	af161908-c823-462c-a412-a73a2dbea02e	Viatodos	\N	4	54	1	2025-03-23 11:47:09	2025-03-23 11:47:09
659	af5cbf8c-1a33-40fd-b5c5-90b901605a55	Adaúfe	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
660	59219d3f-891c-4f69-8e59-9470ba35373f	Arentim e Cunha	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
661	232de8e2-afee-44df-b8bd-842d1fd657ab	Braga - Maximinos, Sé Cividade	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
662	ed2dd161-d5ad-4e79-be5d-6f0f68c4794f	Braga - São José de São Lazaro e São João do Souto	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
663	581f57c8-3c0c-44c9-a3b6-86880bfde77f	Braga - São Vicente	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
664	c3336b02-08ff-4354-906c-b7a3dde0af4d	Braga - São Vitor	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
665	bb7e7edf-0034-417b-971e-33945b2e97af	Cabreiros e Passos - São Julião	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
666	803e6b52-a8b1-4e95-b43a-d03d9d6556ce	Celeirós, Aveleda e Vimieiro	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
667	57faaefe-e81b-45a8-a05a-b96930875c6b	Crespos e Pousada	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
668	1e20e79e-735a-4e0f-a0fe-de87ff38e87a	Escudeiros e Penso - Santo Estevão e São Vicente	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
669	eddb33d7-3379-4f12-8189-d1a0eac8c763	Espinho	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
670	4d53d011-46dc-4735-a832-77b2304a6619	Esporões	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
671	db54ff1a-707b-4e37-a4d4-171220925678	Este - São Pedro e São Mamede	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
672	0f3bca2a-9cdf-4b4e-98b9-73b692a791b3	Ferreiros e Gondizalves	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
673	afd3e695-6257-4a82-a72c-9ea670982a3e	Figueiredo	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
674	8a39afbd-a406-4a1e-a7a9-70b8cb9fb7a3	Gualtar	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
675	359f25f3-4b14-43b9-ae52-87549030bad9	Guisande e Oliveira - São Pedro	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
676	968d9214-5579-4fb8-b095-86920843815e	Lamas	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
677	f91936e3-c668-4d25-8f47-5d07872db0ff	Lomar e Arcos	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
678	8b274b97-0af7-443b-b5bc-39b80ddf03d0	Merelim - São Paio, Panoias e Parada de Tibães	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
679	e283a000-3889-43d2-aeae-e43a67e39b89	Merelim - São Pedro e Frossos	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
680	6bdfd679-0b86-44e9-b979-a39b454357b8	Mire de Tibães	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
681	1add180e-ef12-4146-96d9-a8170a16a87c	Morreira e Trandeiras	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
682	60f4d763-d749-48a3-9830-72cf4079c0ff	Nogueira, Fraião e Lamaçães	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
683	5cfc1205-d5fe-4ec7-b2c4-84195d2f44e9	Nogueiró e Tenões	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
684	f223e3ee-65a6-4195-a932-300be3c774c2	Padim da Graça	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
685	f575c580-7bfa-4c1f-b8de-0f504e46c173	Palmeira	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
686	242a6173-c46b-487b-b96c-acf759931d45	Pedralva	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
687	7fd8c221-a064-4187-8c33-e6874291b4ad	Priscos	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
688	a4e59dee-b2a7-4629-923b-10d535b42136	Real, Dume e Semelhe	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
689	9cf41c8b-4ff8-4db6-b989-a27fc9c4ebe4	Ruilhe	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
690	6aec6643-d314-474c-b1bb-fa6d1ab78a62	Santa Lucrécia de Algeriz e Navarra	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
691	dc814d65-423c-4ff9-aef9-9e2a58b141c1	Sobreposta	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
692	a71ad13e-2eec-420a-b285-a634e0640873	Tadim	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
693	52fa80c4-2013-4258-b7fd-5f80d259ab09	Tebosa	\N	4	55	2	2025-03-23 11:47:09	2025-03-23 11:47:09
694	ab99cab7-d1f5-4dfb-aaf3-dfaccd42fc6e	Vilaça e Fradelos	\N	4	55	1	2025-03-23 11:47:09	2025-03-23 11:47:09
695	b7e8d4c9-96d9-454b-a33b-24a0115777c9	Arcos	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
696	291be86a-e5a4-4abf-a6f1-cae6672af08e	Arentim	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
697	2e44fcb0-0c58-4d50-8ba1-94970c57374e	Aveleda	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
698	14588783-6ded-49cc-b84e-7642b2f0e432	Braga - Cividade	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
699	24c56914-a5ec-487d-8e92-21d1d4749ca8	Braga - Maximinos	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
700	6773d63f-b0ab-4604-93fe-ab5c26f6ed20	Braga - São José de São Lazaro	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
701	c7e88bd5-8a5d-4da8-a4f2-a5cf98eb7c2a	Braga - São João do Souto	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
702	302deca5-6810-4b90-b7b5-da78c0495aa4	Braga - Sé	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
703	d7f9a485-ec07-4e4d-978a-712a26e43bf0	Cabreiros	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
704	61b573ee-db02-435e-ba0d-c803b228ee0a	Celeirós	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
705	20c1f456-0c64-4fba-b8c3-4e288386f034	Cunha	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
706	f22cc910-49d1-4a30-a26b-7ca1dff8f0df	Crespos	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
707	b0ef5c73-54f5-4126-9655-733490f307d6	Dume	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
708	ea5847d6-1c0c-4715-a137-0f24a1188c4f	Escudeiros	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
709	470a8000-84df-4a53-8399-a52aa84d2c2f	Este - São Mamede	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
710	c687e96a-771b-497f-82a9-3f35eab4c61c	Este - São Pedro	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
711	0113db72-5d28-40bd-8f81-70afaa7002b7	Fraião	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
712	7d5d1964-3599-48b9-a47f-17c6ba40e671	Ferreiros	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
713	7959c0d2-58f0-493c-b642-8e03c93b1ad7	Fradelos	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
714	8975f429-bfcc-4116-b55b-4b6ef8ae7972	Lomar	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
715	02556883-5a8c-434b-aa38-52968a0c8da6	Oliveira - São Pedro	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
716	bcced362-0b9a-4840-ad06-1a7bb19981d8	Penso - Santo Estevão	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
717	ec41ea6e-937b-4d7c-bf94-472d31980cdc	Penso - São Vicente	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
718	1da51b42-a99c-4157-aeec-48a676b53387	Passos - São Julião	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
719	57fbc030-2ffe-4d6b-b4e2-8f89daf4b6ce	Pousada	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
720	414278bf-8f0d-4976-af92-7fe02ea87586	Real	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
721	69716dca-63f9-4424-85a3-255c65851c20	Semelhe	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
722	fe50a7b4-0992-4e24-bf06-56d8baf0b2ac	Vimieiro	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
723	04b6bddf-4c9a-4245-8d95-3d2755c4718a	Gondizalves	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
724	516d7395-61d7-4aa2-a4c4-4bfbb135eb8e	Lamaçães	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
725	972365a6-859d-4939-88f5-df5a6396df4b	Nogueira	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
726	ec44cb2e-3bc7-4d7c-ad80-f5e0012ccad0	Frossos	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
727	a0b4891b-6f2f-4124-8e08-958be102177c	Merelim - São Pedro	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
728	47f6de61-1e90-43ac-9bc8-ed81551ab5b3	Guisande	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
729	00540d00-fcb8-44dd-b282-314492d8a187	Morreira	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
730	aa9fc383-fab3-403f-8e96-117854670704	Trandeiras	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
731	c1b1dbb2-f7c6-46e9-9fd0-339b5aed5693	Navarra	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
732	2c34d463-b348-487c-9a83-092e023e3a8a	Santa Lucrécia de Algeriz	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
733	b99301d1-4254-474f-b510-13849d394934	Nogueiró	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
734	fa0f989f-3c6d-4459-aedb-24b5878af967	Tenões	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
735	20c050c2-d82e-40aa-9e68-e3911a8d9dc7	Merelim -São Paio	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
736	6ed17abc-c16d-406c-be6d-98b0e5cac7ca	Panoias	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
737	4bb166eb-2d02-423a-b4cb-3cdb46a59e9e	Parada de Tibães	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
738	75276d7b-8ef1-4765-a0b3-f68ea981d26f	Vilaça	\N	4	55	3	2025-03-23 11:47:09	2025-03-23 11:47:09
739	cb76576e-4e4c-4891-8b91-8b369623654b	Abadim	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
740	4b17624e-fdfd-4ba8-9b6e-2c10fb4ca79c	Alvite e Passos	\N	4	56	1	2025-03-23 11:47:09	2025-03-23 11:47:09
741	dda44024-6085-4a5a-abeb-f914c334e4ba	Arco de Baúlhe e Vila Nune	\N	4	56	1	2025-03-23 11:47:09	2025-03-23 11:47:09
742	6df834b0-1798-4f2b-887e-0a55c256f111	Basto	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
743	a425ff48-0d47-4db2-9772-5d05ace2957c	Bucos	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
744	0920d597-ca29-4fd8-a338-03ed77a3faab	Cabeceiras de Basto	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
745	f49b0d75-d111-4ad8-818b-581361f2cc06	Cavez	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
746	fe4da364-de8b-4b88-999a-9d0336af029a	Faia	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
747	db1b5115-2de4-456a-a4b9-1a3faad75721	Gondiães e Vilar de Cunhas	\N	4	56	1	2025-03-23 11:47:09	2025-03-23 11:47:09
748	412a2763-e647-4c1c-8ec6-c26c38403322	Pedraça	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
749	70e7fdb6-4f9e-4912-bc4e-43bf9d45591a	Refojos de Basto, Outeiro e Painzela	\N	4	56	1	2025-03-23 11:47:09	2025-03-23 11:47:09
750	460da29c-c980-4a76-b5db-9631bd71ab2b	Rio Douro	\N	4	56	2	2025-03-23 11:47:09	2025-03-23 11:47:09
751	cffebe3c-0168-4d66-96b6-18263bef7e42	Alvite	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
752	94419cb1-21e9-4dc0-82fd-041e6b1b7cc0	Passos	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
753	d1b24c45-e8f0-4eb5-bd64-45e625404f06	Arco de Baúlhe	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
754	ff6e6ed5-6d9d-4d52-ad37-a6ec50cbf429	Vila Nune	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
755	e7e35ed6-76aa-4234-a2a2-1f79a1e4f004	Gondiães	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
756	2094302f-7b05-4ff0-ab64-1c88331a8d22	Vilar de Cunhas	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
757	a4ad7c09-6e6a-44be-91f3-b74355e7e71c	Outeiro	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
758	38087fff-f73f-4144-99a2-cb1c79c57b61	Painzela	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
759	ac16ac5e-da77-418d-a10d-bc19c69c8355	Refojos de Basto	\N	4	56	3	2025-03-23 11:47:09	2025-03-23 11:47:09
760	763c946b-34f6-47db-96b1-fecc661224f7	Agilde	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
761	1db68809-c404-4b78-aff3-68505e16a899	Arnoia	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
762	cd36fade-ceec-4a53-919c-f77dd604d1d4	Basto - São Clemente	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
763	48c5e8bc-b9c7-4205-a8c8-3fdccb9bf066	Borba da Montanha	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
764	f012a292-e740-40ac-9009-83b9bd132c61	Britelo, Gemeos e Ourilhe	\N	4	57	1	2025-03-23 11:47:09	2025-03-23 11:47:09
765	b4da6aa1-2536-4e32-8e4b-8c6fcde34b82	Caçarilhe e Infesta	\N	4	57	1	2025-03-23 11:47:09	2025-03-23 11:47:09
766	500b35de-6189-4a6f-8204-25355960f19b	Canedo de Basto e Corgo	\N	4	57	1	2025-03-23 11:47:09	2025-03-23 11:47:09
767	3252a181-41f4-450c-af79-5b2db3efa038	Carvalho e Basto - Santa Tecla	\N	4	57	1	2025-03-23 11:47:09	2025-03-23 11:47:09
768	5dc4ab9f-a21c-45ac-95ab-00a5720c1117	Codeçoso	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
769	24241422-48f5-43a0-9ce8-3f3c2ece0686	Fervença	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
770	41aa97f2-3121-444b-8057-66c811144476	Moreira do Castelo	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
771	c20cea4b-f8dc-4009-9ed7-ffff106effe1	Rego	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
772	fc7bf329-cc6a-4191-af33-d22ac870a891	Ribas	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
773	ce10141d-d42b-4ac1-ae08-d3fa0347235e	Vale de Bouro	\N	4	57	2	2025-03-23 11:47:09	2025-03-23 11:47:09
774	35ce6f06-de66-4214-a8af-8aa7981fe8da	Veade, Gagos e Molares	\N	4	57	1	2025-03-23 11:47:09	2025-03-23 11:47:09
775	35c900a7-86cc-4248-879e-93b6925ce2b3	Britelo	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
776	4407d7a6-51f7-4e3b-be85-1d107fb00d71	Gemeos	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
777	53b022e5-3d80-4040-814f-a8d04c4cb5a0	Ourilhe	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
778	e529b868-7c04-4eb4-bb3f-f436ddb728db	Caçarilhe	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
779	e0e3d05a-1ab4-453d-8626-74a2db7b8a12	Infesta	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
780	89b5233e-7389-46f0-95d5-81192cf4c3c9	Canedo de Basto	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
781	8d8777fd-09ca-4572-be7a-a6c71683da9e	Corgo	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
782	16797889-8c94-4081-b1c4-cfa0eb579737	Basto - Santa Tecla	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
783	0fb4bb8f-c458-4138-9685-a548b7264241	Carvalho	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
784	5e307073-319a-451e-804c-f339002531b1	Gagos	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
785	66d1e009-4d67-4387-a538-1e7d1e086b3e	Molares	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
786	08fd3fd2-8267-46f2-bf5c-9aa9cf932476	Veade	\N	4	57	3	2025-03-23 11:47:09	2025-03-23 11:47:09
787	c3020021-9373-4ae0-a0c0-d9c616da0c46	Antas	\N	4	58	2	2025-03-23 11:47:09	2025-03-23 11:47:09
788	4f1020f4-af0b-4b8d-a73f-d3e7d312e84e	Apúlia e Fão	\N	4	58	1	2025-03-23 11:47:09	2025-03-23 11:47:09
789	02f26efa-f936-4df1-80cf-751c6c319bed	Belinho e Mar	\N	4	58	1	2025-03-23 11:47:09	2025-03-23 11:47:09
790	fea3c21c-d23d-4235-a64a-01dc2f62768c	Esposende, Marinhas e Gandra	\N	4	58	1	2025-03-23 11:47:09	2025-03-23 11:47:09
791	e95f3385-8119-482b-a60e-7ceb57c06023	Fonte Boa e Rio Tinto	\N	4	58	1	2025-03-23 11:47:09	2025-03-23 11:47:09
792	9bfd4fc5-d8d7-4485-bfdd-59ca866caa3d	Forjães	\N	4	58	2	2025-03-23 11:47:09	2025-03-23 11:47:09
793	cc0b92e7-fb82-48d0-939f-b39bda016e07	Gemeses	\N	4	58	2	2025-03-23 11:47:09	2025-03-23 11:47:09
794	8c748086-531e-4054-989a-457ff24fb6ce	Palmeira de Faro e Curvos	\N	4	58	1	2025-03-23 11:47:09	2025-03-23 11:47:09
795	d5fce0e1-4ef9-4cdf-b8a8-7f6ae1a8240f	Vila Chã	\N	4	58	2	2025-03-23 11:47:09	2025-03-23 11:47:09
796	76c72020-b413-4f59-9c2a-0e209c1be3b0	Apúlia	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
797	31061d32-da9c-46da-9674-7fdee4c96ae1	Fão	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
798	aeb49dae-7945-4524-bd41-374c905c4394	Belinho	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
799	e1ec5d2e-1bbe-49af-8ebb-0d34ba5e2a82	Mar	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
800	004f1683-2428-475b-a2e6-f9b3e3500ee3	Esposende	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
801	560710f0-6ffb-4939-b99e-7870d2652477	Gandra	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
802	13ab2234-3d7a-4f02-8dd0-79ca39306ab9	Marinhas	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
803	43b8da59-5723-4ab9-a398-dc072d0ffa20	Fonte Boa	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
804	503b3342-a113-4e4a-aa54-39be45e42b5e	Rio Tinto	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
805	fbaeb2f0-cc70-4d26-ac78-4c862be1c05e	Curvos	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
806	c1753100-b6f5-49ab-8571-ebf525275c8a	Palmeira de Faro	\N	4	58	3	2025-03-23 11:47:09	2025-03-23 11:47:09
807	fd354afe-a105-4184-97f7-7dca2d375d13	Aboim, Felgueiras, Gontim e Pedraido	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
808	c3349248-65be-423e-9d78-77500195ef98	Agrela e Serafão	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
809	e04c61b7-4167-4290-88f7-d06a8356a5f6	Antime e Silvares - São Clemente	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
810	eb73b574-b2bd-4f1a-8d20-604f00d42c64	Ardegão, Arnozela e Seidões	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
811	e9e5eb91-b0f3-4acc-aa07-493e32da4cfa	Armil	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
812	fdcb9381-7208-403c-bf16-28fe509e432f	Arões - Santa Cristina	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
813	1cbb15de-6fae-478f-b4c4-14abb3d2e2ef	Arões - São Romão	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
814	788e8de9-c79b-47d0-8a76-3fd5244b202a	Cepães e Fareja	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
815	cd4db9aa-f493-4f30-bbba-21b14de5fef0	Estorãos	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
816	d8a0bad9-1980-493d-808a-6ea69267acb9	Fafe	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
817	051c118f-b9ef-47c2-800c-bc3d389b9030	Fornelos	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
818	fc2f273e-8748-45fc-ab9d-7c71041ed41f	Freitas e Vila Cova	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
819	01c750c3-3b1a-4033-973a-86f701a6d25e	Golães	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
820	ff056009-ab3e-483d-a846-6945bb19adb7	Medelo	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
821	5081f6bb-4b4d-4dae-8175-b263141e062f	Monte e Queimadela	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
822	5e85a806-cc29-41da-a53c-3c30f10081cc	Moreira do Rei e Varzea Cova	\N	4	59	1	2025-03-23 11:47:10	2025-03-23 11:47:10
823	036cd26d-eccc-4629-9e52-fa0bb7db6ab5	Passos	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
824	4d1dac80-e53f-414e-af81-5721974d0db4	Quinchães	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
825	eb077e1b-85d6-47e6-9aac-f013e48137ff	Regadas	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
826	d3ca267a-f156-4562-b3c7-922f7dc680fd	Revelhe	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
827	e90aef1c-ba21-4eef-adad-b6ade4b46c58	Ribeiros	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
828	63932a77-1d0e-4ee0-9fb3-c75a867a74ec	São Gens	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
829	88a29500-4099-427e-8e50-65ccf1373127	Silvares - São Martinho	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
830	6f2a1124-f00e-48f8-8b51-d0772ae83f9d	Travassós	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
831	1f2cab1f-2360-4e68-8c22-33f7009a717f	Vinhós	\N	4	59	2	2025-03-23 11:47:10	2025-03-23 11:47:10
832	88056bce-044b-41fc-93a5-ac79366d9079	Aboim	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
833	4fccdf76-c1fa-4895-9ceb-9531d1482193	Felgueiras	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
834	96b890c8-5820-4e6b-b84a-59cdecf14c43	Gontim	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
835	39a8b139-38b6-4ceb-bfd2-debd59ebd466	Pedraido	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
836	ef0d495e-20c1-491b-879d-3b39765cc1b9	Agrela	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
837	75f1a475-09cf-4061-a4a3-63d9821eabea	Serafão	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
838	9ecaf360-8128-431c-ad9a-e138c6ae4ba2	Antime	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
839	eec35fb7-c3bb-49ee-be4a-72f3ea7f7bf7	Silvares - São Clemente	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
840	d4fc058a-b8b9-4b7b-af96-ef079e5d27d1	Ardegão	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
841	fc47411f-b2b7-43fe-9da8-b89e46bc4c21	Arnozela	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
842	ef0c0ca7-68f0-4ccf-b8c9-994b1453490a	Seidões	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
843	38dd68ae-30db-4f4d-b651-0a55ab745ce1	Cepães	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
844	2e3ab1a9-59de-461a-a6b1-ea25ad3c9a79	Fareja	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
845	37904d42-24aa-494d-88ff-352c94c278cf	Freitas	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
846	fc4d3a99-7cf2-4792-bc10-5534f4518166	Vila Cova	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
847	36b15dfd-1782-449b-9481-01ecd69c2799	Queimadela	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
848	78fdc4db-11aa-4048-a499-e99cae185068	Monte	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
849	286a7bb4-5bcb-4736-b074-510412dd1518	Moreira do Rei	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
850	ec85fa72-069f-4391-b752-b350679df9fb	Varzea Cova	\N	4	59	3	2025-03-23 11:47:10	2025-03-23 11:47:10
851	3e39ca03-4c28-4db0-a6a7-feddba23071e	Abação e Gemeos	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
852	2bd85559-6ea6-4be1-a557-c7cefbc49f62	Airão Santa Maria, Airão São João e Vermil	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
853	0f2be7ed-a8aa-4d3a-bc65-9f03d4ad5442	Aldão	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
854	7764c33f-28ab-4910-b6cc-f5f923dbc62b	Arosa e Castelões	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
855	e4fc3fb4-49b9-4fc1-8bd1-19fac4e8592c	Atães e Rendufe	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
856	263f302c-a1e1-4068-9e75-c30fda1fbc7f	Azurém	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
857	eb17ad6d-f44d-4f6c-a7a7-715168f7fa40	Barco	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
858	a0d202cd-ada3-4fe1-bea2-502ac69bf388	Briteiros Santo Estevão e Donim	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
859	9d81806b-77d2-4732-b289-bd70dcd70950	Briteiros São Salvador e Briteiros Santa Leocádia	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
860	53998238-2b5f-4ae9-9eae-8128c263d5e0	Brito	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
861	ecb9e6ce-8a18-4bc1-bcea-573f43443483	Caldelas	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
862	ba3bdcea-cd17-4c9f-aecd-9f427bf99a5f	Candoso - São Martinho	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
863	25445716-92de-4cbf-9abf-63aec456326a	Candoso São Tiago e Mascotelos	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
864	5f08b006-fd04-4d42-9d28-6264bb2e445d	Conde e Gandarela	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
865	88885f04-003c-4eb3-b13a-8909f445ac72	Costa	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
866	9057c3eb-ed9d-4c34-932b-7163d1b791be	Creixomil	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
867	323afcfa-e2a4-489c-8f9c-9d37247ae1d9	Fermentões	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
868	c191b543-dfb9-47ba-bdf1-62b5d7d88805	Gonça	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
869	b5996d2d-efca-418a-aae4-1554d9e2b244	Gondar	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
870	8bc2f896-f718-49ed-807b-b9e3d5417c06	Guardizela	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
871	f332fc2f-85b2-4408-8f3c-d4e3acadac55	Infantas	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
872	bbbb1d97-f188-4894-8999-f088d5fc70de	Leitões, Oleiros e Figueiredo	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
873	37d0053b-2b32-417c-b597-0d5e48a12992	Longos	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
874	ccc7ece9-e91b-4b9d-8ea5-de4e592c1987	Lordelo	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
875	0621800d-ecc6-43f3-b9a0-69e06ab8f54d	Mesão Frio	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
876	51b6d6e9-bf3e-4352-a49d-ee07e602218a	Moreira de Conegos	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
877	025a64cd-7321-4747-ad95-bff906baf09e	Nespereira	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
878	ddfcab89-0201-48b2-8790-0b19331457be	Oliveira, São Paio e São Sebastião	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
879	8b95241d-a373-4c62-8aa7-8e7c0fcc4764	Pencelo	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
880	ee067a14-f24f-40f0-b9d8-67b84f700fa9	Pinheiro	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
881	cc3632b3-d610-49cf-beab-86bedbbd532a	Polvoreira	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
882	fdbe53dc-179f-4418-98a6-230f0605ebb3	Ponte	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
883	d917f7c9-730a-4985-acd8-eec15244ded7	Prazins - Santa Eufémia	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
884	c641fbb4-ce57-4dfd-9500-98f05dae3577	Prazins Santo Tirso e Corvite	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
885	a1072ac6-0436-4910-9f44-7e8dacd4f441	Ronfe	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
886	38a97fd4-f8ab-4bde-baeb-ef57c3f6534a	Sande - São Martinho	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
887	0e56d98e-aff9-495d-a095-ebb351ac9c3b	Sande São Lourenço e Balazar	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
888	08a9e64c-c6d0-422b-a3af-c686c6acddfb	Sande Vila Nova e Sande São Clemente	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
889	3fe5a440-be96-46b4-8373-c534d4346e55	São Torcato	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
890	2cabc07b-1027-4bf1-9cb3-7d021d9889fa	Selho São Cristovão	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
891	c8bed3f4-dc74-4e62-8672-5b3935e4c861	Selho São Lourenço e Gominhães	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
892	2d9b8171-8827-4294-843a-ac654ab3edff	Selho São Jorge	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
893	3860eaf6-a669-485a-b06b-0621004de363	Serzedelo	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
894	fe477a60-7cfa-46e3-b6b7-3be2cf3224b5	Serzedo e Calvos	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
895	c2f50a51-6045-420a-9d78-6b119d20d387	Silvares	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
896	9d3edd0d-817a-4626-956e-de25054f09f0	Souto Santa Maria, Souto São Salvador e Gondomar	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
897	8e2e55a0-f952-471a-bef9-578a7bc23c48	Tabuadelo e São Faustino	\N	4	60	1	2025-03-23 11:47:10	2025-03-23 11:47:10
898	638035d8-e873-400b-afa2-f8fdb1338116	Urgezes	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
899	91b0f838-2a6a-42f7-ac8d-11f085c2bd28	Arosa	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
900	0d6d1994-1d5e-4efe-a89d-164b6d05ade4	Castelões	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
901	46d494da-09ce-44db-a860-65844359ab82	Atães	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
902	1f2bc05d-1e52-44ce-ac1f-7e38b8c79c8f	Rendufe	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
903	d4d8b8c7-92e5-4aba-b149-07d41f79ffd8	Balazar	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
904	80f820af-bb7c-48ed-b9e1-d7f680c09a57	Sande - São Lourenço	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
905	d677641c-17c9-4731-8423-bce2f44f196c	Calvos	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
906	7e5a4842-3843-4498-a0bd-4653a7e8577f	Serzedo	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
907	0aafc1ca-f9e5-4346-b8a3-806a27a3de06	Conde	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
908	157c57a4-913a-4341-86f7-96961a403231	Gandarela	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
909	b2fb207c-19a4-4e34-a0bc-00b2508d1282	Briteiros - Santo Estevão	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
910	1a7ff4f6-9b31-4316-9191-0abc899dd43d	Donim	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
911	811ea2b1-c9f3-4374-8104-270632ab0279	Leitões	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
912	9374d39b-aa9a-49c1-a5d7-b36de1e9b1bc	Oleiros	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
913	dc4c4541-6ac4-42d8-8c57-010f7250d9c1	Figueiredo	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
914	08fe301e-eae1-4e04-9254-0ea18359c5e2	Abação	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
915	982309a6-ae1b-417a-a21c-188e0e057a95	Gemeos	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
916	00ef478c-7496-41db-b012-4ccc143b65b1	Selho - São Lourenço	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
917	4c1a5e48-b175-4b54-89f3-8e6f49ca7aa6	Gominhães	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
918	f9e3740c-6f88-4dcf-a024-aa317209afeb	Souto - Santa Maria	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
919	c806f765-71c6-4e9b-92cf-a6409c9b38d1	Souto - São Salvador	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
920	103e2c42-dc44-4681-b179-64eeff045851	Gondomar	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
921	593599b1-5b2b-4dff-a6ba-6827fa19ba17	Infias	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
922	41abedbe-1018-4de6-b9ac-0b7c909be78d	Candoso - Santiago	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
923	3c347ced-0656-4526-b5c9-2c27750c5131	Mascotelos	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
924	f871e8e5-964b-4f5e-b44a-cccb4d1c770e	Guimarães - Oliveira do Castelo	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
925	7aba6306-65cc-400a-92e8-5ee47152bdee	Briteiros - Salvador	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
926	5298368b-55fa-431e-869f-f5007ea953f5	Briteiros - Briteiros Santa Leocádia	\N	4	60	2	2025-03-23 11:47:10	2025-03-23 11:47:10
927	2773c0e4-53c4-4270-a7aa-80122a32a0a0	Airão - Santa Maria	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
928	7917cd9d-29bd-4ed8-b71f-b1eca6c499bf	Airão - São João Baptista	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
929	00cc33c4-9b99-42bc-8800-cc9c73a212d8	Vermil	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
930	58a91112-0d09-4be2-9c72-1c1de9e76e47	Prazins - Santo Tirso	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
931	aae508ba-9702-4113-8664-ba0095ff75cd	Corvite	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
932	76b6ca22-a3da-4003-ab5e-36366fb57b58	Sande - Vila Nova	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
933	f586f993-6110-4e16-b4a8-ecce675ff4e3	Sande - São Clemente	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
934	9ec4febd-911c-400f-9410-962ada9443ef	Tabuadelo	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
935	ce9a25f8-a357-4f5d-ac4b-5d2fcd70050d	São Faustino	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
936	efb9a96b-3a16-44cd-84ef-b23dc2b51f9a	Caldas de Vizela - São João	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
937	3d4061ad-700a-4122-9baf-2ac5f8f4b854	Caldas de Vizela - São Miguel	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
938	b62123bf-0795-42cd-bfae-6336e0f547e6	Vizela - São Paio	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
939	f4016128-3ad2-43ed-9324-089948078de6	Guimarães - São Sebastião	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
940	e6439f52-e33e-4401-bc95-ef31090f166c	Tagilde	\N	4	60	3	2025-03-23 11:47:10	2025-03-23 11:47:10
941	b7aa8cd9-097d-4627-9fdd-b17fdadecd25	Águas Santas e Moure	\N	4	61	1	2025-03-23 11:47:10	2025-03-23 11:47:10
942	99f2f84b-845f-481e-9164-4caec8706760	Calvos e Frades	\N	4	61	1	2025-03-23 11:47:10	2025-03-23 11:47:10
943	c93f9e89-55e1-4f49-8103-3f7f5c0ed950	Campos e Louredo	\N	4	61	1	2025-03-23 11:47:10	2025-03-23 11:47:10
944	b4f739a2-c6fe-4448-89ff-63fb5776baa7	Covelas	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
945	802b0324-65a3-40ee-af99-9f7cc23a6e38	Esperança e Brunhais	\N	4	61	1	2025-03-23 11:47:10	2025-03-23 11:47:10
946	451180f5-e91a-4d62-bbec-a5a201df7e8f	Ferreiros	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
947	3166d4f1-72ae-433a-a85f-d6122264c5bd	Fonte Arcada e Oliveira	\N	4	61	1	2025-03-23 11:47:10	2025-03-23 11:47:10
948	15091627-97f2-468a-9091-e8f19f2e72cb	Galegos	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
949	5a176a66-6fdc-4605-a352-6d7b135bf16f	Garfe	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
950	0793c6c9-5fd9-41c0-ac68-bd0bd262b825	Geraz do Minho	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
951	b58a02c5-f36d-461a-a300-73a4ed5a939a	Lanhoso	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
952	d5e5a3ab-9f10-4af6-9187-209af0067086	Monsul	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
953	a4ed491f-b0f5-4c09-9f76-9718f52c038f	Póvoa de Lanhoso - Nossa Senhora do Amparo	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
954	4600bc3f-c420-4079-80f7-be3b17639e64	Rendufinho	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
955	aa6c4318-7878-453c-9bea-04d016c2ed29	Santo Emilião	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
956	c13f7909-1d94-4f3c-adc5-1bcce7d48f7d	São João de Rei	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
957	4d425552-18ce-4a08-8063-d95db0de37b7	Serzedelo	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
958	9b4849b8-0f6b-49d6-95b5-6f27f862101f	Sobradelo da Goma	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
959	5da2b3e5-356d-453b-8ff8-f932c7fd7a26	Taíde	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
960	3053d3eb-31ad-4303-a5a1-e541fdc0f4af	Travassos	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
961	8d19c410-024c-41f7-a662-2cfb2b47d0d8	Verim, Friande e Ajude	\N	4	61	1	2025-03-23 11:47:10	2025-03-23 11:47:10
962	011f5768-5e03-48e7-b4bf-40a7ec8ac340	Vilela	\N	4	61	2	2025-03-23 11:47:10	2025-03-23 11:47:10
963	1e445060-51c0-4038-b5ad-c45d5edc2856	Águas Santas	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
964	4dcb8e2d-a508-4dde-aac0-423da44bc896	Moure	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
965	06c083bc-e07b-4c1f-9df2-72c55ad8cdaa	Ajude	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
966	2f17c9a3-be10-45de-a873-65bd13a2a9cb	Friande	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
967	ae0eddfe-59b3-43cd-9db3-a1218f8173ad	Verim	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
968	ef235ea5-d71f-4054-8117-b55c7448d5a5	Brunhais	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
969	5f6dfa42-1287-4e81-ab20-646810898b47	Esperança	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
970	53fdbb1a-42ba-4aa3-8d6c-64ae356bb2d8	Calvos	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
971	baf76de9-ba12-409d-b1b0-fa7fc648df3a	Frades	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
972	8473f6f6-bf37-4d33-ae2b-9e29830819b4	Campos	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
973	00ff2b69-d6ab-4d16-9513-612baa4de37e	Louredo	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
974	cc25ee63-574d-40a3-9181-ea23c1737b74	Fonte Arcada	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
975	e27e9562-d1c5-4e94-af40-6c61a32d07b0	Oliveira	\N	4	61	3	2025-03-23 11:47:10	2025-03-23 11:47:10
976	eeacb7ac-36dc-4a75-a485-8aa07989385a	Balança	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
977	6e9c4786-87eb-4265-951a-7630ccad26a5	Campo do Gerês	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
978	9f4d79d3-16cc-4a8f-adc6-aa916cb99394	Carvalheira	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
979	805cdd4d-f4ed-471a-8106-8066855b2c69	Chamoim e Vilar	\N	4	62	1	2025-03-23 11:47:10	2025-03-23 11:47:10
980	31eb1f2c-8185-4376-af54-dcf4ed53fc79	Chorense e Monte	\N	4	62	1	2025-03-23 11:47:10	2025-03-23 11:47:10
981	2011b9a2-44a8-4e01-aa7a-6a3a17d012cd	Cibões e Brufe	\N	4	62	1	2025-03-23 11:47:10	2025-03-23 11:47:10
982	6ff6126c-cfe4-4cc1-920f-e22a40e26ee9	Covide	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
983	bddca6fc-8a27-4c8e-961a-fdff92f3e625	Gondoriz	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
984	5d40c570-6644-42a1-b6fc-2a2965462c15	Moimenta	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
985	fe537108-5feb-4301-9595-5965221adb3a	Ribeira	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
986	6f6e6d37-3dfb-4fe3-aea2-fe53ad652221	Rio Caldo	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
987	a10750d8-ca64-4868-9a49-326cca172bdb	Souto	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
988	c2aae6e0-ea53-4b1c-8613-6f8c2063df36	Valdosende	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
989	8c808f8e-7a7e-484c-a33c-1bb745e4c1ed	Vilar da Veiga	\N	4	62	2	2025-03-23 11:47:10	2025-03-23 11:47:10
990	1f7eac55-3b22-46f4-bb95-1eb1b5e6306d	Brufe	\N	4	62	3	2025-03-23 11:47:10	2025-03-23 11:47:10
991	7483875d-7f8a-426b-a29b-6cdbc0995e1f	Cibões	\N	4	62	3	2025-03-23 11:47:10	2025-03-23 11:47:10
992	bf12eb6a-8531-4b4f-b4ce-53e8bf89fd24	Chamoim	\N	4	62	3	2025-03-23 11:47:10	2025-03-23 11:47:10
993	5623a004-0761-4aed-8336-d21ee6055592	Vilar	\N	4	62	3	2025-03-23 11:47:10	2025-03-23 11:47:10
994	96b10108-6613-4675-840a-dcf09a8c52d1	Chorense	\N	4	62	3	2025-03-23 11:47:10	2025-03-23 11:47:10
995	427b6285-dd7e-4a70-a94a-9cc9c301eb57	Monte	\N	4	62	3	2025-03-23 11:47:10	2025-03-23 11:47:10
996	edc124f6-9abc-4d59-9524-fa0905ac2b39	Anissó e Soutelo	\N	4	63	1	2025-03-23 11:47:10	2025-03-23 11:47:10
997	2cb130bd-344e-464c-851f-7c1449d5f707	Anjos e Vilar do Chão	\N	4	63	1	2025-03-23 11:47:10	2025-03-23 11:47:10
998	b89f5c13-ee06-48b3-b6e6-fc317ed8a98f	Caniçada e Soengas	\N	4	63	1	2025-03-23 11:47:10	2025-03-23 11:47:10
999	4b9f7788-9255-4eb4-b5aa-fcfc40015512	Cantelães	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1000	b01fb18d-1237-4aed-8527-366002be40e0	Eira Vedra	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1001	a31318e7-be9f-445a-9860-9b906acb32e9	Guilhofrei	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1002	860fde7c-9fd0-4211-a5cd-fefa09f0e6b1	Louredo	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1003	0de7e09f-3b30-41c9-87bd-51d52aa1b604	Mosteiro	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1004	07822850-78ad-4f87-9dab-93c34bc46e8d	Parada do Bouro	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1005	84a284dc-5279-40f1-9906-e603b7cd47b0	Pinheiro	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1006	396b9247-06e1-4667-8862-926c92f7083a	Rossas	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1007	04971b6c-2042-423f-acc8-b01374fb7e5b	Ruivães e Campos	\N	4	63	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1008	f73801ff-d21a-490f-8a3c-a217e431f9aa	Salamonde	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1009	5be3c73e-8709-495e-9044-692ae5e29efc	Tabuaças	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1010	126e4e68-c885-4f01-8668-982d02bea266	Ventosa e Cova	\N	4	63	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1011	710b4201-a777-4c96-b324-4a60a8ff112b	Vieira do Minho	\N	4	63	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1012	6e801290-6381-46c7-878a-f955094ac48b	Anissó	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1013	9fa4f2b4-6c65-4a87-8e1f-37b9da6f164d	Soutelo	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1014	90025025-3cf6-4bbb-8adc-8fbfd332ce9e	Anjos	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1015	ac346d51-b464-4852-a556-83204a9c9088	Vilar do Chão	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1016	4bbe8195-9af5-4f82-ad22-3dd4a090be8e	Campos	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1017	b56a667d-530d-4281-8f44-fe5046038d97	Ruivães	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1018	d27ccbdf-f196-4a07-a63a-c41d1123719f	Caniçada	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1019	078a86f1-9663-4bf3-8d43-dd6ef6f1ae0e	Soengas	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1020	74f54aea-3d87-497f-922b-106a02b28d62	Cova	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1021	d339292d-fbf8-4f58-83c2-0f3c2f7f6eee	Ventosa	\N	4	63	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1022	86120946-17de-4bab-81e1-b4609fd37866	Antas e Abade de Vermoim	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1023	288f2cfd-a8f6-4a21-bca8-48f5611fefcf	Arnoso - Santa Maria e Santa Eulalia e Sezures	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1024	06a0e483-4d01-4a37-9053-0ff9eb1ca5c6	Avidos e Lagoa	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1025	4a25f06e-0672-4dd3-beaa-8733b8c00a0e	Bairro	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1026	66e06605-7ba6-447c-967a-c1fc59dbcde7	Brufe	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1027	962d180e-934f-4c74-b74b-b32c50f9041f	Carreira e Bente	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1028	3266ee34-584e-4a65-a6f3-7b402a50576e	Castelões	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1029	6d9429ec-dff3-4304-86cc-762ac5f778b8	Cruz	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1030	50270c46-bb4e-4ee7-b902-87b19e986337	Delães	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1031	d582893a-a6d8-4cf1-926b-f9c724c05713	Esmeriz e Cabeçudos	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1032	8443f862-be89-440c-a26c-8516e7220d8c	Fradelos	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1033	9ee707ae-a8af-4a62-9a2c-c59dcc982eca	Gavião	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1034	d2454a85-f210-4ec9-9776-f3fd5a2dccd2	Gondifelos, Cavalões e Outiz	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1035	673c70f7-6043-4e9e-a802-2d37a7fc5a60	Joane	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1036	939fc625-2eee-4a14-93ef-eaf2a9c93d87	Landim	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1037	b83580e9-8fbb-474d-9990-6f76ed157972	Lemenhe, Mouquim e Jesufrei	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1038	2a6e9bb1-9b47-4571-b946-da0429e09cc0	Louro	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1039	db81f610-78ec-4260-903f-8961e52d2b56	Lousado	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1040	8e865823-624f-4e1a-9532-52cd33642bf6	Mogege	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1041	fc02e1a5-0dce-4f08-9509-1985b027a9a7	Nine	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1042	36e24b40-0444-4802-ab65-9b5080db3831	Oliveira - Santa Maria	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1043	45196085-7423-4d33-bd35-a380bada8f9f	Oliveira - São Mateus	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1044	91554eff-33c2-49ef-b89f-d11380bc2551	Pedome	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1045	d0457272-d3a7-406d-b059-87948c0c6238	Pousada de Saramagos	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1046	f141f2c6-b472-42ea-8bb6-494cc34e4898	Requião	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1047	697da988-6191-422e-919f-9d5db2bc04eb	Riba de Ave	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1048	a55d9c34-07fd-4107-84de-a2beba0b7df1	Ribeirão	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1049	423b5415-14b1-4357-8bbc-54aaca92e957	Ruivães e Novais	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1050	4e478f07-cf14-4d25-974e-9a5b9146e8ac	Seide	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1051	53fa8e5e-988d-4a1d-9d81-200a3e5af840	Vale - São Cosme, Telhado e Portela	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1052	dcb8e2d6-f8ae-4333-9c96-e984a32643d9	Vale - São Martinho	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1053	40276405-acfb-478b-86a7-f52d6ed0af7f	Vermoim	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1054	f6259560-3734-4eed-8e31-59e8bf8fcf39	Vilarinho das Cambas	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1055	9fc9f4fb-265f-4830-9181-3d8e60bfc68a	Vila Nova de Famalicão e Calendário	\N	4	64	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1056	1d32eb19-8da7-4056-b7fc-5901d92513f4	Vilarinho das Cambas	\N	4	64	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1057	ea0f3ee3-35e8-4116-bcf9-be41e137c552	Antas	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1058	3ed6c4fd-4f16-4f54-b73c-4f7f2fe9eac3	Abade de Vermoim	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1059	f39e7695-73ab-42a6-abc6-d2fbfc990afe	Avidos	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1060	4e99d472-6f0c-4d92-9c93-af7979a059a2	Lagoa	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1061	85d4204c-42f6-407e-8811-bf9493013a85	Bente	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1062	8ba06287-44ff-495b-b51d-29b4255184a2	Carreira	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1063	60bee1eb-7a6a-4799-83a8-296c45a6a0bb	Cabeçudos	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1064	e50485e7-78f4-4d6c-ac6d-07ad61e59d03	Esmeriz	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1065	c73aa7ec-f0e9-44a6-9afd-d5336fe3f7ca	Calendário	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1066	70faaff9-df02-40d7-9dcd-e5b6b77e2616	Cavalões	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1067	cf0a51ff-4629-48f9-97ff-a0fb8215b3b4	Gondifelos	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1068	70997da0-1d21-462c-aa76-54ec485daa0f	Outiz	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1069	32ae1c7e-3ca8-4d2e-88ab-c6f78211cb8e	Vila Nova de Famalicão	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1070	198a35dd-569f-42f6-bbd1-d9ccaf40b0e8	Lemenhe	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1071	66f57de1-949b-41bf-9107-63edacff35bd	Mouquim	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1072	2d85df74-4012-4980-bf2e-fbde37224074	Jesufrei	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1073	fc1d078d-cdfa-4e3b-9b1e-8f363600d40a	Ruivães	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1074	f61a6b9d-f300-4d20-a569-e0236e04c101	Novais	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1075	57f24f98-7697-4590-afc3-7c65c37f078f	Portela	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1076	48b28d69-feaa-41b1-a545-4a38978f9dde	Telhado	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1077	1e460cf2-e16e-45e1-9316-ccb83c4f21e2	Vale - São Cosme	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1078	e8928052-459d-44ae-8ffe-ce46fd867961	Arnoso - Santa Maria	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1079	ee98887b-fe5d-481a-b541-c714f93c37fa	Arnoso - Santa Eulalia	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1080	856adb76-ab46-40cc-aca5-2d0cb8162431	Sezures	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1081	872508c3-b21e-4dc9-a172-872b49a5ba95	Seide - São Miguel	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1082	7a4fc07c-f1f8-4ed6-9d74-bcb31ead8018	Seide - São Paio	\N	4	64	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1083	003c3bdc-2a07-4d1a-bed1-df886198ac09	Aboim da Nóbrega e Gondomar	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1084	7b53c954-1053-45e5-b479-f02682bfc270	Atiães	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1085	829a171b-27ce-4c02-aadb-d65bec5c1cf0	Cabanelas	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1086	f09eb4e9-2797-415a-9738-e7f74b3818b0	Carreiras - São Miguel, e Carreiras - Santiago	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1087	482d9762-f3b4-4458-a626-c955deb58d87	Cervães	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1088	7049bb9d-dca7-434a-8c6b-34a89424bd2a	Coucieiro	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1089	a330df19-030f-4825-820a-cf416c6d58e3	Dossãos	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1090	ea7068ee-55df-4f7a-bce5-4bbb9d0f5e0e	Escariz - São Mamede, e Escariz - São Martinho	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1091	8acb7a65-37dc-4d09-b61b-83737bf88a5a	Esqueiros, Nevogilde e Travassos	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1092	99abeaa6-847d-43f1-b4ed-4a2bef761a0c	Freiriz	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1093	77b6b166-3d9b-4a77-b07d-00df37158626	Gême	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1094	6aa7cdf1-e345-4291-abc6-65a8ed1a7818	Lage	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1095	b2d1117a-624a-46c6-9dcd-607c7c2124ec	Lanhas	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1096	2d72df90-ef13-45d0-ae09-e077ffefbd78	Loureira	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1097	88af19ae-bdad-4e0b-8155-e14f8b1c0c9e	Marrancos e Arcozelo	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1098	030e699c-02af-4ba0-ad61-c1a16918eb0a	Moure	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1099	f9a9ee63-5829-4a3d-82cd-66709ac882e9	Oleiros	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1100	0fb15d0f-8dd0-4e52-8bb0-c09031693c47	Oriz - São Marinha e Oriz - São Miguel	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1101	5a0bbba2-095d-4dba-bc13-58b071408666	Parada de Gatim	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1102	2b252b0c-ddf7-41b5-b620-1924f97a54f7	Pico	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1103	7a5d063c-e872-4f5b-8554-8fca1354f460	Pico de Regalados, Gondiães e Mós	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1104	1a27a6d3-6944-42c3-902f-f0b1238bfafc	Ponte	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1105	0a9066b4-5444-471f-ba7e-570b99ba6f75	Prado - São Miguel	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1106	c879de8d-28be-4840-8453-9a092303fa24	Ribeira do Neiva	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1107	632a982c-9fc5-40f8-8942-3f420b19e7bf	Sabariz	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1108	c3c0c4f6-1216-479e-a752-888f7c4e46c5	Vila de Prado	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1109	5a11e76f-bcea-4d69-9d59-bcf300b83fa4	Sande, Vilarinho, Barros e Gomide	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1110	55f5a2c2-5a59-4f03-b90c-74b9917757bf	Soutelo	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1111	908d30d9-cbf4-403a-8e03-7f8210a76fee	Turiz	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1112	9e10b77f-4f51-4b18-9f07-df8c0e14e574	Vade	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1113	1fb85c76-ff08-4252-84c9-18b8421136bb	Valbom - São Pedro, Passô e Valbom - São Martinho	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1114	c5040ac0-49c4-4bf7-b91f-906d3c4498e6	Valdreu	\N	4	65	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1115	17a6d074-dfa6-4d85-bd76-3cf67e41d51a	Vila Verde e Barbudo	\N	4	65	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1116	be5d89ed-7098-4918-b74c-065236ea1ea4	Aboim da Nóbrega	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1117	56529265-c96b-4cec-b23f-3b10ccc90010	Gondomar	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1118	937a1104-b993-4468-9bdc-997c2ab15811	Marrancos	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1119	6aa8c91b-f8f4-453f-9bae-c42dc8b1f36d	Arcozelo	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1120	7ba7060a-f76c-4c7a-961a-c44483f3e737	Atães	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1121	98f2e489-b53e-4bd5-85f6-c537ace659d8	Azões	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1122	4e796aba-1997-4584-829f-ad9c797bce51	Barbudo	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1123	b764194e-1192-41d0-b38f-96501d2f9ea1	Vila Verde	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1124	42191b0b-c8bb-4aca-8b7c-64d6d5fbe130	Sande	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1125	83112455-c7b3-4afe-874b-37533c536661	Vilarinho	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1126	4812e2a6-1043-4c09-bb95-d6cc57986ef3	Barros	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1127	f17f31f4-bfec-4501-9008-ab16c47ece41	Gomide	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1128	6dc5ade6-c66d-4579-ba0c-1cb1bc1c8dba	Cobeceda	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1129	79c284ec-133b-46c1-a3e4-4f900d367f52	Covas	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1130	f749e5a2-6954-402f-9469-54c07f0b58e0	Duas Igrejas	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1131	21483087-f6e6-4afb-95c9-389d436171c7	Esqueiros	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1132	cb426f2f-575e-420b-a54d-2b3143f2de12	Nevogilde	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1133	9fb3c6f8-a490-4f0a-bc1e-e2ce9bc94cb1	Travassos	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1134	d66645a3-8a68-4b9c-a58b-138f7298b0fe	Goães	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1135	fd947d46-3798-4fdf-9d96-a6d73164b748	Godinhaços	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1136	6d717dc0-734f-4bb1-86b2-4f1f7492ac7d	Gondiães	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1137	0406de47-395e-426a-abd5-00c430de5a39	Mós	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1138	cb230669-36ea-40cc-b246-76d9d339501a	Pico de Regalados	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1139	c8a9b64e-3315-4470-8571-6ef964f1e20f	Passo	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1140	4dd14666-153e-4ea6-bd04-21cba9511164	Pedregais	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1141	9a4a66dc-aba7-4d19-b27a-6026f19b7b5f	Penascais	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1142	45c68d15-551e-4f4e-b5b9-837259169bbe	Portela das Cabras	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1143	e0012537-07d1-4d9f-89f1-a9fa67e84b8e	Rio Mau	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1144	e9f18d3f-30a8-479b-be45-7cb77d987d6e	Oriz - São Marinha	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1145	c782473c-1657-4f6d-9186-2488a7631f7b	Oriz - São Miguel	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1146	d4544ec8-f16b-4403-b87e-3cc933d33181	Carreiras - Santiago	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1147	776b03ec-7434-4c33-9b68-a2241a0eeefa	Carreiras - São Miguel	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1148	703da07c-cb87-4c05-af7a-9ffaab326d54	Escariz - São Mamede	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1149	014fc014-b81d-4dc0-83b4-c4206d023b41	Escariz - São Martinho	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1150	7f5ec523-d510-41d3-b104-de3d2ac42508	Valbom - São Pedro	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1151	9f8b248f-0979-4476-ac0c-2592ef8bee4d	Valbom - São Martinho	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1152	86805ec5-dd16-4da7-b5d5-29e80fc75999	Passô	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1153	ff289151-c52d-4ea7-9b00-493aabfc3048	Valões	\N	4	65	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1154	56ec176a-da19-4f5a-964c-d90665cb1b92	Caldas de Vizela - São Miguel e São João	\N	4	66	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1155	de15797d-e9eb-4ab3-8d13-ec5bf8e9053b	Infias	\N	4	66	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1156	1c89f5da-bf64-482d-8db2-7f291ecb7c22	Santa Eulália	\N	4	66	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1157	121f6091-4e91-44a3-ac73-e2644e60f6a1	Tagilde e Vizela - São Paio	\N	4	66	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1158	909d48a2-31c3-407c-b705-f882b5eff040	Santo Adrião de Vizela	\N	4	66	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1159	a2ac1bf2-21e0-4bfe-9a13-81d0dc85d0ff	Caldas de Vizela - São Miguel	\N	4	66	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1160	c6868926-8bed-4322-8628-3177385ad97f	Caldas de Vizela - São João	\N	4	66	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1161	ca72e722-c61b-4472-aab9-3bc17b244813	Tagilde	\N	4	66	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1162	d7e8bc39-09fa-40f2-9fa9-60cf951a4c94	Vizela - São Paio	\N	4	66	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1163	996fa6e8-5fbd-43cd-befc-817436deab2f	Agrobom, Saldonha e Vale Pereiro	\N	5	67	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1164	157f80b6-cc19-44de-9991-a527e0408c28	Alfândega da Fé	\N	5	67	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1165	81921451-0bca-4171-b693-6390a4f63410	Cerejais	\N	5	67	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1166	ac4d03fb-1026-4368-8a21-b3d70577a860	Eucisia, Gouveia e Valverde	\N	5	67	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1167	6ac7efea-30a4-4d20-9ae3-adcee118587d	Ferradosa e Sendim da Serra	\N	5	67	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1168	6313c2d9-6413-4cc8-87f3-198bd32e3ea1	Gebelim e Soeima	\N	5	67	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1169	99f9f765-b3d0-4695-b087-60c97856cdaf	Parada e Sendim da Ribeira	\N	5	67	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1170	26fafc44-4246-4d61-b821-553851093eab	Pombal e Vales	\N	5	67	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1171	349c6ef3-4efb-41ca-a2c3-ccacb99bef4b	Sambade	\N	5	67	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1172	e05209a3-df4f-4474-a478-f20bc8033ba2	Vilar Chão	\N	5	67	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1173	006114e4-44ec-49bc-9cce-bec6f2e1dd7e	Vilarelhos	\N	5	67	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1174	2e84d687-b071-4540-8002-1e2603eed6dd	Vilares de Vilariça	\N	5	67	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1175	2abff2d5-082d-49f4-b7f4-211ac22cbe7a	Agrobom	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1176	e7576dce-6faf-4ee0-be44-30214977124b	Saldonha	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1177	1fa65b1f-a76d-4028-b6b6-c0122e3d5fca	Vale Pereiro	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1178	f00fb371-5596-45db-9389-4c61735cf3d8	Eucisia	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1179	f339ddd1-828b-45ed-9404-b84f790cebf5	Gouveia	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1180	4cea2722-2447-4aa4-94a4-885a0c858eaf	Valverde	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1181	87e51f11-54c0-472f-94c2-fd15c7c0be8d	Ferradosa	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1182	47e75cab-2d64-4f3e-a9c6-4d8ea5198099	Sendim da Serra	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1183	5baa3221-54de-4167-86be-207bc687a858	Gebelim	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1184	d4193dfc-f36e-47ce-b2aa-55733c512d8c	Soeima	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1185	611b2fe7-a9a0-48b1-8388-d025000726f2	Parada	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1186	091261a9-d48a-4728-8ef3-b0c26d5a47a8	Sendim da Ribeira	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1187	740a1421-f37c-4088-bb77-73fd30b9344a	Pombal	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1188	e2b93237-1e3f-420b-a2f9-1f5bc9a90151	Vales	\N	5	67	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1189	f46c8b48-7052-4fe0-ba0f-61189fee69b6	Alfaião	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1190	75b77143-2ca2-46f0-85cf-a8888c299d4c	Aveleda e Rio de Onor	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1191	077da590-28fc-47c3-893a-8e690ac9cdb1	Babe	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1192	e9fafde3-8ebc-4980-9fb3-c6057ee19b8c	Baçal	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1193	b67cc8c1-2461-4025-99ef-21bb97abc369	Carragosa	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1194	211b3b0b-9468-4796-a351-1dcb82a43747	Castrelos e Carrazedo	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1195	164177af-5480-4210-b99b-f2b27a390654	Castro de Avelãs	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1196	e8c8d8d0-9f26-4a4a-83d9-d23c09238bb4	Coelhoso	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1197	0b1398f0-fa37-4eb5-ace4-dc41d47594bf	Donai	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1198	cfabf3b3-9fb3-42c4-9382-772e08e96025	Espinhosela	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1199	88b5078b-dd8d-4928-a7b0-4a4aa36abdd9	França	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1200	4e2985b7-d15a-4add-a4ee-4a03085f5ea0	Gimonde	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1201	cbe6c668-0512-46f4-a939-5b348f63b67c	Gondesende	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1202	46b80b37-557a-4ba3-83ca-d7435b319d43	Gostei	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1203	545641ff-9bdd-4371-a855-3d58f1eec40f	Grijó de Parada	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1204	4305fa92-fd47-4658-a3dd-427c7244e368	Izeda, Calvelhe e Paradinha Nova	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1205	dd4bbcba-ed01-4b70-9967-88c5998583c8	Macedo do Mato	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1206	79abb746-87b6-4996-b6f0-34ed4a52b6ad	Mós	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1207	9c183b9c-3114-4aab-a8f8-ec51c6680959	Nogueira	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1208	e31b68fe-5fac-4655-8052-d2ed505c9789	Outeiro	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1209	e2beb1f2-9c8e-4f85-820b-5f67b99837bb	Parada e Failde	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1210	bc3356ee-557d-4b48-8c2f-73766c0201ba	Parâmio	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1211	083634bf-7e8e-4ade-ad56-969a1fa83236	Pinela	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1212	e4e82c67-b10e-42f6-95a9-e0b93957086f	Quintanilha	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1213	570cb9ab-400e-4784-b100-68087b844026	Quintela de Lampaças	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1214	4a3e75c6-02dd-47b5-bab3-3d99bf7d5001	Rabal	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1215	92c1e709-776d-43f9-bbe4-935442d56d47	Rebordainhos e Pombares	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1216	e57d21fa-c298-439f-8769-aa364a8a7898	Rebordãos	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1217	43badd78-84d4-4e12-a4ef-3886f6800097	Rio Frio e Milhão	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1218	bd9865db-2539-4400-b8f1-30a21d2e2979	Salsas	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1219	8980cf23-c973-44d3-90f1-480997d4452a	Samil	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1220	1e5b3771-a3f7-49b5-a09f-dd67e154fc5b	Santa Comba de Rossas	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1221	89cb6a78-ed0a-43a9-b507-ae987a4fe440	São Julião de Palacios e Deilão	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1222	174d1796-8a82-44b9-bddb-6c8d323585e2	São Pedro de Serracenos	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1223	80c9e20e-46dc-42a6-97c0-3f986bf27857	Sé, Santa Maria e Meixedo	\N	5	68	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1224	0fe44ddd-3618-42e3-8dc8-1d0e9570283b	Sendas	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1225	c098f089-3f13-4358-87c1-f4f4871c1cd3	Serapicos	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1226	c034f099-8a43-4e7f-87da-921ac05faaa3	Sortes	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1227	0d393402-a267-49c9-aecf-a1715b8bce11	Zoio	\N	5	68	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1228	07db257e-4bd6-41b0-96f7-69dd07e3a369	Aveleda	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1229	10e786ee-d2b6-494a-89c0-13e0726d6df1	Rio de Onor	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1230	c8de687c-afdc-4375-9475-433c0efe64a1	Calvelhe	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1231	65d450a7-dcab-4311-8faa-708367c4f7a1	Izeda	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1232	adcda0cb-a0d1-4304-ac29-d0a62fec80cb	Paradinha Nova	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1233	24c193de-195d-422b-b661-0e4333ba957e	Castrelos	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1234	ac592442-e78b-45a1-9e1c-dcb61fc9f98c	Carrazedo	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1235	cec9d979-9c58-4f70-96f9-730810a5bd52	São Julião de Palacios	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1236	f74d5693-9e95-4d3f-9d45-3e45e18ee989	Deilão	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1237	981769ca-d983-4cb2-b15f-802010d63054	Failde	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1238	0505bb64-e568-473c-8308-7dd14b4127c2	Parada	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1239	781281b6-d627-441f-b82b-5818604e3d32	Meixedo	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1240	33d009ef-6768-441d-8463-f0b3051173f0	Santa Maria	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1241	505ea3c5-9759-47ec-8831-80a2578a5248	Meixedo	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1242	84db70a0-79df-4865-93ab-9537acaa44d0	Rio Frio	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1243	d7e5ff45-fa4f-4180-bb8c-5ea919e10788	Milhão	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1244	4d83e61a-62ea-4070-9a5f-2eb0a23e1f51	Pombares	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1245	0e981cdc-25f3-452c-a2b5-cbf0910d7f96	Rebordainhos	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1246	bff06a26-a49e-47d8-9824-c923ced7393e	Bragança - Santa Maria	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1247	f48456d6-6e0d-480e-914c-78991b25b1ce	Bragança - Sé	\N	5	68	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1248	4ca2e12e-a7f0-478b-a751-9bcaa17db24a	Amedo e Zedes	\N	5	69	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1249	9308cd75-6300-4ce0-b7c4-2addc1297123	Belver e Mogo de Malta	\N	5	69	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1250	6a45bba9-c153-44b3-b5f6-967d4c01d434	Carrazeda de Ansiães	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1251	01cae70e-9208-4d05-ac49-899417ebaf6d	Castanheiro do Norte e Ribalonga	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1252	431d369a-4ea5-4827-a02e-4eaf2f24e14f	Fonte Longa	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1253	103c2d74-0fe5-4a85-a818-a1c4725ab985	Lavandeira, Beira Grande e Selores	\N	5	69	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1254	76ece38e-04aa-4c72-a4ca-b907525b75ff	Linhares	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1255	65edb7c0-7b91-4861-a8f2-2d84ccbb7725	Marzagão	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1256	638a14c0-d53b-4d43-a6d3-d269d68398da	Parambos	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1257	d7afe809-b4af-487f-92b6-1741e188a207	Pereiros	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1258	02f7946a-f5d8-42a6-be85-381ff9e2c7ba	Pinhal do Norte	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1259	5ea30698-9d9e-464b-bca7-20cb17a545c4	Pombal	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1260	463b3eee-0b98-43df-a6b0-138e7201dd60	Seixo de Ansiães	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1261	57bb60f4-d4a7-4d1a-b90b-a04160df696b	Vilarinho da Castanheira	\N	5	69	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1262	13580175-bb8f-4d7e-a351-fb9821d047f9	Amedo	\N	5	69	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1263	8079ea83-8c97-4414-b174-79ec482e677b	Zedes	\N	5	69	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1264	511c5d0b-0908-4638-ac67-4fe74338db04	Belver	\N	5	69	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1265	851e99a6-f8af-4d3b-b7d5-41efb5a0b010	Mogo de Malta	\N	5	69	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1266	6b8eb949-760b-4ab4-add9-a34c26228ab4	Beira Grande	\N	5	69	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1267	a7b04c93-26d5-421a-91df-67836156cadd	Lavandeira	\N	5	69	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1268	3436ec6a-5ef9-4939-9de2-6325794f4e53	Selores	\N	5	69	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1269	4c111957-6fb6-4a90-a5cd-9422abbabc2c	Freixo de Espada à Cinta e Mazouco	\N	5	70	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1270	e884df63-56e8-4c34-a7de-c1ecaf236a12	Lagoaça e Fornos	\N	5	70	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1271	83099054-bd29-4da2-a210-06dda4c33df2	Ligares	\N	5	70	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1272	1e4d0a37-05f1-49e5-860c-b018fd92d241	Poiares	\N	5	70	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1273	86d822ff-7873-48a8-aca8-e86eb51f4428	Fornos	\N	5	70	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1274	ae07f88b-1288-4c56-bf88-aa21117e779e	Lagoaça	\N	5	70	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1275	9ee32e99-5c44-4abb-8f52-abdf84bec6da	Freixo de Espada à Cinta	\N	5	70	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1276	057476e6-6639-4301-bf81-b4db99f935c4	Mazouco	\N	5	70	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1277	d8a1d4aa-e97d-445f-9a47-8dc353bcdf15	Ala e Vilarinho do Monte	\N	5	71	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1278	8b3be921-2957-4b84-b0d7-7b7ae5d39d9a	Amendoeira	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1279	73ec30d8-dbf2-4da0-ad06-e844a1f1eb75	Arcas	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1280	9e83605f-c1d1-4592-84f6-a14e54484ad6	Bornes e Burga	\N	5	71	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1281	6b7aa30b-03ac-45ce-8ba3-5bee7001bac3	Carrapatas	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1282	6bc051e8-11d7-4dcc-ab21-c5be4095c745	Castelãos e Vilar do Monte	\N	5	71	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1283	8c3ef1f0-8b55-4df9-bbfa-12e8937afc7f	Chacim	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1284	6133ea3e-1046-455a-a1dd-5056785b3630	Cortiços	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1285	fb5431d3-848b-4514-bf76-874532e1285e	Corujas	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1286	674be466-7ee0-4a67-b2c8-cdf37063f969	Espadanedo, Edroso, Murçós e Soutelo Mourisco	\N	5	71	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1287	b7c83770-0649-45f7-9669-5f3b5b2691e8	Ferreira	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1288	b2ac2ba0-a596-4188-8639-8e76f72a423e	Grijó	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1289	c73659a4-fcfd-4485-92ed-d9b3195f47c2	Lagoa	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1290	eac7f507-4774-40ee-90f1-ed520514ddb4	Lamalonga	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1291	62908232-6dba-4ae5-93ac-f20966d30b04	Lamas	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1292	6bb7c1e4-33a7-4e18-9eba-051bf194d31e	Lombo	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1293	4a81abe6-303b-4922-87b5-4b7a8de6951f	Macedo de Cavaleiros	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1294	a1a2b2f2-73ed-4e20-98c9-a96f38cf9e6b	Morais	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1295	fff2b5cb-5833-4f81-a7c8-6ca86cf692c3	Olmos	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1296	d745b1e2-72e7-4ffd-9738-c98afead0a08	Peredo	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1297	3657ec91-1f11-4e58-b800-46ca46f45b85	Podence e Santa Combinha	\N	5	71	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1298	7820efe6-a444-4805-9a40-c51b1a76cec8	Salselas	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1299	a02b6ede-fc3e-4a4b-a20a-341b955dbcd5	Sezulfe	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1300	da4dfb47-0bb2-42c3-9c90-7af938d92e56	Talhas	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1301	469b1f7e-a5d6-48a5-ba4b-992651f186bb	Talhinhas e Bagueixe	\N	5	71	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1302	70ffbb8e-5e7a-46c9-bb3c-f16646f27329	Vale Benfeito	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1303	454e6c18-5574-40fa-916d-01bac6ff6857	Vale da Porca	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1304	eecf6fbb-ee29-4603-8dbf-7f8e60c344e8	Vale de Prados	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1305	2adcdc50-1c99-4636-b95f-a743ac4de595	Vilarinho de Agrochão	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1306	98e506ad-c669-49a4-9a22-af1a13659dcd	Vinhas	\N	5	71	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1307	2208d0f6-7449-4294-a3c3-7fbbca3d53f1	Ala	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1308	df9172a3-050b-40cd-a05a-28db5ca8ae4f	Vilarinho do Monte	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1309	90bc61bb-6c32-4d5a-aa89-98a04e52b6b2	Bagueixe	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1310	03cadb4f-1564-4888-8ce0-5127f7642807	Talhinhas	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1311	1bd35bd9-ff5b-4474-a820-d294a2ed8eaa	Burga	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1312	e22ec8fe-6864-492e-a261-d4a111fb941c	Bornes	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1313	0527331e-e1b5-47eb-be6c-dec211370192	Castelãos	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1314	76dbcc2e-d0fb-46de-85d1-95bc5a9c3625	Vilar do Monte	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1315	30c53795-f66e-42d4-b9b5-edd19d83d9a7	Espadanedo	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1316	053db2f5-1e2e-4543-952e-ce4e7730f3c9	Edroso	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1317	e4af235f-310f-4e63-b1fc-84d021e6c22e	Murçós	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1318	58e495b5-b300-4691-88b3-c9fc36063f1f	Soutelo Mourisco	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1319	0d72c360-e15d-472a-827b-c44d490e9ee3	Podence	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1320	5a197b68-6fba-4f03-9601-406a19489d8b	Santa Combinha	\N	5	71	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1321	449250fb-5a9f-4105-87b3-8a08dd3069bd	Constantim e Cicouro	\N	5	72	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1322	56008b4e-1ec9-40a9-a420-7d4a31679985	Duas Igrejas	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1323	05253ce9-eddb-432e-88d9-d94ad3decb86	Genísio	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1324	ea7f1f7f-d251-49bc-b4e6-0f01dbabb37e	Ifanes e Paradela	\N	5	72	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1325	74c53edb-4fb8-4b56-a035-0c50ab57b914	Malhadas	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1326	e44a55a7-9b9a-4ab1-a7e2-a37af254c0ec	Miranda do Douro	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1327	7f7594fb-1f7b-428f-b6ba-934983bab45b	Palaçoulo	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1328	615b7cde-3e93-4ec1-a394-eb9cd550e4fc	Picote	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1329	3610e2b1-4e75-4b3d-9644-517c454eea69	Póvoa	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1330	76b85ffb-6eb5-4fe2-952c-13f154a0d0df	São Martinho de Angueira	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1331	c6193d92-02cf-4a50-b696-b34fdda27f2a	Sendim e Atenor	\N	5	72	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1332	52218fdd-d304-4ab0-a3b2-b9e3cda3217a	Silva e Águas Viva	\N	5	72	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1333	841a5d9c-41c9-4329-a75e-15b05771414b	Vila Chã de Braciosa	\N	5	72	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1334	419b2fb3-1476-4616-83b0-af67f921b9b5	Sendim	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1335	55a463b3-d7ea-40db-a09a-2e0ba3d0eb59	Atenor	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1336	e6d0dc2c-3cd6-4e7f-91f8-31490242e97e	Cicouro	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1337	f389c434-4af5-47fc-9168-723678a2a24e	Constantim	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1338	90c77b08-7394-4622-b290-1bcefaa69d75	Ifanes	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1339	3b4b6ff8-d994-461f-9f39-3797d2e86bb9	Paradela	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1340	90a0d118-5835-4e82-9b0b-c3e218fb6c0f	Águas Viva	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1341	fc33fcb8-e576-4063-a9d5-45c15f11ae35	Silva	\N	5	72	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1342	05cd1f16-daab-4b1c-935c-7ceaa1d8c36d	Abambres	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1343	e8c0f3cf-9724-467a-a024-3e559b4f95e4	Abreiro	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1344	023c2794-6cd2-48ae-92f1-290881d9ce17	Aguieiras	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1345	ac36ada9-6d13-4d8f-956f-53cc743b6026	Alvites	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1346	558686c6-c038-4ef7-81a9-a584a6401c74	Avantos e Romeu	\N	5	73	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1347	7f8f892b-be67-4124-992c-77d19249f1a5	Avidagos, Navalho e Pereira	\N	5	73	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1348	2cebad06-8d20-4ef0-a08e-c62896794c5b	Barcel, Marmelos e Valverde da Gestosa	\N	5	73	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1349	dba9fe77-97b7-4350-8394-a75b09849d6d	Bouça	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1350	4eb71955-03be-40e6-83b7-67fd59bb6d33	Cabanelas	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1351	1dfa3e7b-0a59-42c8-96c3-8df3b1ea05ac	Caravelas	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1352	bbc0bb1d-90a4-4a2d-932c-254e53e138a1	Carvalhais	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1353	7f563a90-f228-4362-96f8-f24182cb16e1	Cedães	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1354	2e986e2f-9f5a-4841-9382-0f4b752a6e24	Cobro	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1355	4e0af505-62ea-479a-872f-4731a7108421	Fradizela	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1356	336fdd1a-4b90-418c-8a9f-3df58ffa3a58	Franco e Vila Boa	\N	5	73	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1357	200f2396-7ddf-49af-a8f3-8ed6e7797258	Frechas	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1358	5e521647-5a32-4b21-be82-d0061f848642	Freixeda e Vila Verde	\N	5	73	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1359	79202dfe-299d-4698-a723-d644dcea6ca1	Lamas de Orelhão	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1360	53320213-b226-4690-baf3-a28e7de2f6a7	Mascarenhas	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1361	2d9d8eaf-df47-424e-b7e9-112f95485ff2	Mirandela	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1362	838f4a44-13d8-44bb-bee7-f8175656ebcb	Múrias	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1363	a962eb90-af69-4516-b890-4d9659486b0f	Passos	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1364	e96ba62e-2a7a-4749-a19a-4357c58d65a8	São Pedro Velho	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1365	5fd64a2d-d870-4940-9299-d75f7fac93a8	São Salvador	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1366	496ded85-1d83-41dd-a8c9-748a6c77e9c1	Suçães	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1367	36bef41a-309c-4ccb-a582-9cc4cf62546d	Torre de Doma Chama	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1368	646ddbe5-ebb4-4049-980b-28b5c56f698d	Vale de Asnes	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1369	fc5196cd-fb77-472d-bde7-44edc50dfbd8	Vale de Gouvinhas	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1370	fbd0240d-5643-4cc3-86ba-6f320fd55d87	Vale de Salgueiro	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1371	c9d666e9-3361-4ae4-9787-359289951e56	Vale de Telhas	\N	5	73	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1372	7430c669-83cd-4796-8c37-c6ab13d24d23	Avantos	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1373	82d77278-b9c6-4a26-80da-177905c4909d	Romeu	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1374	88d4877e-9940-4d39-9fa3-12489f9b2451	Avidagos	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1375	a6bda719-9c28-4693-9dff-577f51c9ce62	Navalho	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1376	9a6b9076-558c-4ec6-9e02-4b396c9c0ceb	Pereira	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1377	128ac981-518b-4f8f-adfc-13f17b322415	Barcel	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1378	1a4adfaa-bcd3-492a-a0c8-85a507b41621	Marmelos	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1379	2055021d-3bcc-4cd0-9bc0-6caec147c17d	Valverde da Gestosa	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1380	c785a21e-61b8-4c7a-82d5-c972e3fee4b4	Franco	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1381	7f1ad9ad-0e9a-4135-88dc-c722129c09c0	Vila Boa	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1382	3be3fd3a-eee6-4b7c-844c-71fdcfe35aaf	Freixeda	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1383	015c4e88-931c-4df2-8f5b-c52e06cc79fb	Vila Verde	\N	5	73	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1384	ce5f2cc7-4411-4f1f-95f3-d1e390c18587	Azinhoso	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1385	0c238915-d101-4311-a68f-b72a9eb8b043	Bemposta	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1386	4aaef943-2d87-4611-ae56-2f3ba171fce2	Bruçó	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1387	ca2f9262-1929-4f32-be79-39231976b94b	Brunhoso	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1388	8b46a6e6-eddf-4354-a550-d5a419e80b3b	Brunhozinho, Castanheira e Sanhoane	\N	5	74	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1389	225a8472-4bb9-4dab-af0f-e370c5540ce6	Castelo Branco	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1390	77551e42-a596-43a3-9000-51f28048424d	Castro Vicente	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1391	f804b322-c746-4a32-912f-3ed172ba7853	Meirinhos	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1392	5284bb98-3503-4225-a47d-4c233121b895	Mogadouro, Valverde, Vale de Porco e Vilar de Rei	\N	5	74	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1393	459f3816-9734-4b61-8dbc-9d186209fbe2	Paradela	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1394	b69340e9-c3fe-45f9-82ef-57dee6933a5e	Penas Roias	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1395	9ed153a3-25d4-4b31-b993-3b6ef7449014	Peredo da Bemposta	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1396	69c8fe0c-ca3d-47f7-b36f-df99185372f7	Remondes e Soutelo	\N	5	74	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1397	434973d9-dd82-47d5-8df9-3974a5afc06c	Saldanha	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1398	75749bee-efd4-4a2f-a48f-708ee600e02f	São Martinho do Peso	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1399	b4118fd1-83d2-46c9-810c-58644eff806e	Tó	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1400	1cc48b99-f992-4d74-ad9b-64bd8a615f92	Travanca	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1401	c8054e5c-9ffa-4ed6-94c0-7ed87f2e825e	Urrós	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1402	05c7fd6f-7faf-4dd3-8a96-f1dd71e4dd30	Vale da Madre	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1403	424b8a1d-42c1-401c-b29c-7c3c76c334c7	Vila de Ala	\N	5	74	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1404	bd2b5a21-ec5f-4aa7-90d5-35e0b48db6e4	Vilarinho dos Galegos e Ventozelo	\N	5	74	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1405	dbbefbb5-1932-46bd-a28a-d2c55891ed03	Brunhozinho	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1406	79377377-281f-4c89-9970-23d0a74ae051	Castanheira	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1407	d48038e8-d1a4-4928-b0f8-4854b04f7116	Sanhoane	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1408	67befab6-5297-4e52-b356-016b8a3ed984	Mogadouro	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1409	0cdb8c02-f877-457e-8f8b-ae1e7f346bda	Valverde	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1410	693f6d75-6a53-462c-ad53-1b7c3082af82	Vale de Porco	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1411	91e0bf05-a896-4542-ad96-28d330e3e879	Vilar de Rei	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1412	8267b6cf-3b54-4e1c-8d8f-2319c16b937b	Remondes	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1413	d07ed843-8363-4018-a4a6-e3b93d265c88	Soutelo	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1414	90390c07-1fa4-45aa-a2de-21a7da028a7b	Ventozelo	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1415	1ffc8016-7f09-40c5-9471-8ec52d06d7b4	Vilarinho dos Galegos	\N	5	74	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1416	90edcbbc-0ad9-4aeb-b2c7-2a964808d950	Açoreira	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1417	ac804d87-20bf-468f-bae9-9d43a2e8f477	Adeganha e Cardanha	\N	5	75	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1418	4d38de7f-d3dc-4e8d-b4f2-080f7c31a7fd	Cabeça Boa	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1419	b2b67da4-ac92-45c7-81a2-16d8107b66b0	Carviçais	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1420	4d5d8902-57b3-4476-80b5-aa248d830615	Castedo	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1421	f0e50845-c389-4486-a61a-7d60a1616472	Felgar e Souto da Velha	\N	5	75	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1422	7b285b72-7a6e-4d72-944f-9119293adadc	Felgueiras e Maçores	\N	5	75	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1423	447581b0-9a7c-4285-879e-8b7f58e6c987	Horta da Vilariça	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1424	2e490936-6d29-49d7-9e62-a8f45a519bbf	Larinho	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1425	229dfc89-be2c-4367-b7f6-bfc28f6ab9ae	Lousa	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1426	77513e3b-4e27-4e2e-a9e7-20d7bbbbb9cc	Mós	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1427	2231514f-9aa2-4184-a65b-ed8bbb5577da	Torre de Moncorvo	\N	5	75	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1428	aad3e10b-7f13-47f2-8daf-ff65015f8175	Urros e Peredo dos Castelhanos	\N	5	75	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1429	c8a1532d-d55c-4e8d-bdd9-abc77b67d3dd	Adeganha	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1430	38b7b08c-db11-4e03-b2f5-fd89e684d0a5	Cardanha	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1431	e1df85d2-ab83-47c6-b2e1-4b31960a0cf4	Felgar	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1432	2d47059b-344b-4ec7-a791-c4a8883959aa	Souto da Velha	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1433	0bd9ad70-c29e-453f-a3ec-ff836e90ecdd	Felgueiras	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1434	8ef9c5f1-d570-416e-aca2-258d761b1692	Maçores	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1435	1c307885-b78e-425d-bd23-61113a2d302c	Peredo dos Castelhanos	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1436	cf14ca0f-9076-4126-9705-7d02845fc064	Urros	\N	5	75	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1437	a4a8bd5a-a802-4c3b-a654-eba7750e4db5	Assares e Lodões	\N	5	76	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1438	1dd19be7-b469-46ad-b08e-f62e89e917bb	Benlhevai	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1439	8403ae0e-a829-4bea-9292-0f773690e21d	Candoso e Carvalho de Egas	\N	5	76	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1440	b8b2f50e-0335-4190-a75d-28e9a477c409	Freixiel	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1441	d42f4754-f71b-430b-9412-a06cd15ade18	Roios	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1442	56a9a49c-4034-46eb-ac22-faf5dc858360	Samões	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1443	45be6196-1b26-4d08-b322-f861cd1e7191	Sampaio	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1444	6d9fc183-4eaf-4271-9b96-0f10ec1e09ab	Santa Comba de Vilariça	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1445	4b3fb06f-df98-4f9c-bd94-1c3b2e31aaa1	Seixo de Manhoses	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1446	d0ea31dd-004c-46c8-9d2b-1529697a1900	Trindade	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1447	5498195d-8ce1-4dd7-a0c8-c6f3d421cad8	Vale Frechoso	\N	5	76	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1448	8bb3a287-a765-4bec-8a4b-305eac0bf207	Valtorno e Mourão	\N	5	76	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1449	da139720-2f7c-46c2-9a24-27b5eeee6cb6	Vila Flor e Nabo	\N	5	76	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1450	d9cc180c-2983-4e1f-8eb7-d32be0a46234	Vilas Boas e Vilarinho das Azenhas	\N	5	76	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1451	76e516ba-85dd-43d7-8025-18ff387be220	Assares	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1452	ff49bb76-71a2-4142-89f5-c64c1c8fbf26	Lodões	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1453	3dbe521e-604a-4e35-adcb-35053f38fa55	Candoso	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1454	09d7c62c-28e0-45fb-b44f-ffe2dcb7e2cb	Carvalho de Egas	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1455	b3bf491e-9536-41a2-ab26-a5892c1c4a65	Mourão	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1456	273988bb-e444-477d-91f5-d151b9e74c0e	Valtorno	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1457	9d98cf1a-97ff-4cf8-86ca-19119d3f106a	Nabo	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1458	9b87ccc6-1dd8-4631-8dc2-6214c0fccbc6	Vila Flor	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1459	730b7f21-2beb-4bf3-ba72-ef37714eb28c	Vilas Boas	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1460	e0e87189-946e-42a8-a619-ca9ef990a3fb	Vilarinho das Azenhas	\N	5	76	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1461	8741148b-e894-4ffc-90e7-d8ddd18d88c8	Algoso, Campos de Víboras e Uva	\N	5	77	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1462	d5a3e2ca-8b15-4789-ae69-f426b0e8fd98	Argozelo	\N	5	77	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1463	bec74419-1374-4a2e-bfce-241964510703	Caçarelhos e Angueira	\N	5	77	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1464	65f3e5ee-9f99-4661-b0fa-286284c76216	Carção	\N	5	77	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1465	1078635c-1ddc-4e1f-a41c-65ee6efc7f7a	Matela	\N	5	77	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1466	74d43d2d-1288-4fcb-aabf-b0858866f440	Pinelo	\N	5	77	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1467	92bf60e0-b6bf-4e9e-ba8a-f3b486e7a9c5	Santulhão	\N	5	77	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1468	64d34daf-ee71-474d-9a12-d4337e0fa243	Vale de Frades e Avelanoso	\N	5	77	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1469	c681afae-ce70-4163-bc42-4a392b04fdeb	Vilar Seco	\N	5	77	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1470	240ea562-5156-47c9-bbd9-2e240975a8e7	Vimioso	\N	5	77	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1471	98760935-2f35-458a-83c8-e8743928392b	Algoso	\N	5	77	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1472	2ebfdc8f-f966-49c0-88ad-7bf57d72c856	Campos de Víboras	\N	5	77	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1473	dded0296-b179-4195-a90d-a9bf6bdbdf89	Uva	\N	5	77	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1474	420b6d02-76fb-4375-9b99-9248d8b1dc08	Angueira	\N	5	77	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1475	05c0f331-f4d7-430c-9619-b7f9700c0547	Caçarelhos	\N	5	77	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1476	65efc24d-4fc9-4e50-9da5-e27e7e5cae2b	Avelanoso	\N	5	77	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1477	697766c5-2374-4068-bb49-9414a697d2b4	Vale de Frades	\N	5	77	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1478	08588d85-58a4-4941-84df-42f20f5ed4e3	Agrochão	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1479	16322453-01f0-4f0b-b6a7-6b0cd8e48644	Candedo	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1480	91521d47-54b0-4d53-9bcd-fc7cb038115a	Celas	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1481	931ccbbf-2200-4d5a-bfe0-1fcfac6fcd78	Curopos e Vale de Janeiro	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1482	7af788f1-ad82-4ed0-9564-4c5d84e13ca0	Edral	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1483	466ae1e2-3c35-4e0a-97d9-fdcc3f3a7787	Edrosa	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1484	bde9b36e-2f14-4c3e-9ef9-68848797a280	Ervedosa	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1485	3ae43d63-ce16-437a-baf4-d6782598ce54	Moimenta e Montouto	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1486	1e89a9b6-2499-4837-8c9e-850353325508	Nunes e Ousilhão	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1487	5ce0aa91-b292-456d-a555-5c81c10635b6	Paçó	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1488	b79492a9-5203-4f59-a2a3-44fb75310b5f	Penhas Juntas	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1489	1938e7ee-2107-438e-ba24-8c2d551f5bd2	Quirás e Pinheiro Novo	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1490	da0861b1-4555-4713-a60e-dd5a29fd529c	Rebordelo	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1491	8d4faf36-c0fa-4d6f-bb34-b464273eb51a	Santalha	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1492	a45a2e7f-ae6c-4d25-9181-e3a4dc39afc4	Sobreiro de Baixo e Alvaredos	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1493	593cf4c5-4533-4b90-bbda-f40899445ddc	Soeira, Fresulfe e Mofreita	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1494	3af44d2a-ad80-4deb-88e8-23f8c39236ae	Travanca e Santa Cruz	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1495	f79b8c34-9bb1-45a1-aa66-1dc4b461c045	Tuizelo	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1496	a6c8b9c5-25e2-407e-903e-a908179d168c	Vale das Fontes	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1497	3e315578-83cc-4552-99f5-7026e25b8eb2	Vila Boa de Ousilhão	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1498	2128bf67-c12b-435f-89a7-436c5045fb06	Vila Verde	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1499	3522a10d-c8b1-42c2-8b6f-2a40f8f108a2	Vilar de Lomba e São Jomil	\N	5	78	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1500	8c382c2a-c6d1-43d8-a3a2-094270b70162	Vilar de Ossos	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1501	eb015884-d0d7-4c63-8a5f-a094f8e26829	Vilar de Peregrinos	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1502	edc9d51d-360a-468d-8f39-fc74ef18c682	Vilar Seco de Lomba	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1503	d74c9117-2842-4d3d-a034-1f298a1fb88e	Vinhais	\N	5	78	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1504	2ad504c0-8885-4902-9026-ff8d4e5cb5f0	Alvaredos	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1505	0d197ae9-03ef-439b-aa6f-dc48d2425126	Curopos	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1506	04768af6-d1fd-45ca-bc64-1e95825b0da3	Vale de Janeiro	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1507	59b32c06-9e3e-4fc7-ba5b-aeb911d8a90f	Fresulfe	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1508	a379134a-ca0f-4591-8fb0-f5c3ba3a52e0	Mofreita	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1509	6dd33fa9-763b-4dec-938f-6435dc5f8807	Soeira	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1510	1397e10e-ee77-4c48-b1ba-5a69ade916f9	Moimenta	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1511	c2d1a39b-ba4a-4a4d-b343-7d8113df4252	Montouto	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1512	64f72853-ed82-45a6-8e1f-e6c127ae1a62	Nunes	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1513	fabfaf31-f7b0-4d3d-8fef-bc0820b0461b	Ousilhão	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1514	5dced4a3-2d46-4640-bb37-9271035ccb96	Pinheiro Novo	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1515	615339db-9e99-41fd-95a3-86dc13a4b367	Quirás	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1516	759b35e3-4b27-46d8-babf-c727e528631b	Santa Cruz	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1517	7741c3b4-178d-4407-b9da-c92226c463eb	São Jomil	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1518	afd98266-9ec7-4830-900e-296b782c4776	Pinheiro	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1519	1e1400f6-c178-4a0f-b6cd-0cb1d7f08564	Sobreiro de Baixo	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1520	576713b6-c3bb-4f8e-8e54-a21724b7945a	Travanca	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1521	c3ca1930-9d43-40dc-acb6-9716eb7a7343	Santa Cruz	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1522	b274da77-9d0d-46d4-8009-09eb9e403b88	Vilar de Lomba	\N	5	78	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1523	2f993e1a-afef-43d8-836e-2e92e2edbd07	Belmonte e Colmeal da Torre	\N	6	79	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1524	e2fc3988-71dd-4fe5-967c-9498806f1599	Caria	\N	6	79	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1525	19937ad5-34d4-435d-89db-6577f890bb88	Inguias	\N	6	79	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1526	ae1968e2-e62d-4034-84ba-0b35327c356b	Maçainhas	\N	6	79	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1527	5ea807cf-5932-4fb2-a0f9-24879cc099b1	Belmonte	\N	6	79	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1528	d106018e-71de-49be-94f2-cca86473bc30	Colmeal da Torre	\N	6	79	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1529	36c85d9e-cb60-4466-b42e-b0bf6c9a8617	Alcains	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1530	781eff79-0f36-4c45-b4f2-547b85f54223	Almaceda	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1531	6cf10339-1f05-48a6-8e1e-edf9aef30877	Benquerenças	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1532	d83d2e7c-6275-4f0a-a7ee-7a921cce447d	Castelo Branco	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1533	a6e8c4d1-f9ca-4431-ae03-1ccb26df93d2	Cebolais de Cima e Retaxo	\N	6	80	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1534	79cc40a3-951a-429e-a249-aac2aa77f9cc	Escalos de Baixo e Mata	\N	6	80	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1535	135fb3e6-7e61-4f2f-b619-bc893ba23368	Escalos de Cima e Lousa	\N	6	80	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1536	d9e5aeb0-f124-4d81-9abf-d96e00bab3a2	Freixial e Juncal do Campo	\N	6	80	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1537	7b99e8ef-4957-4033-9b31-c0ef02ad3e48	Lardosa	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1538	1296518a-5979-47dd-a255-2193dfb366d0	Louriçal do Campo	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1539	780fc38b-8b3b-4a7c-984e-0985e3f76294	Malpica do Tejo	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1540	51e3685a-458d-488b-adfb-18d937cbe7b7	Monforte da Beira	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1541	04e45aa9-5bec-4029-b5c6-1e829fe1c4e9	Ninho do Açor e Sobral do Campo	\N	6	80	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1542	5c358ab5-65a5-46db-8ed6-9d45a3d43ef8	Póvoa de Rio de Moinhos e Cafede	\N	6	80	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1543	46fa395d-f410-4dee-82f0-e31a0b3ff7db	Salgueiro do Campo	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1544	396f1dcc-3b61-4b02-91dd-0e8a388bf5fa	Santo André das Tojeiras	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1545	cba6c5b7-923f-42c3-bd71-0315f18ced07	São Vicente da Beira	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1546	f6365565-d6e8-40dd-b77b-22b73976871d	Sarzedas	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1547	c009aab2-0b5d-4391-bbc3-b0eadb2c150d	Tinalhas	\N	6	80	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1548	d0824a36-e67e-40e5-b151-e111e127b758	Cafede	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1549	66c4d509-fcc8-4a40-8d19-0500eb29ad47	Póvoa de Rio de Moinhos	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1550	d7088737-bf1d-4c65-855d-6c6df211da1f	Mata	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1551	001d0fb9-ec49-48d0-b763-325cea9c6aa9	Cebolais de Cima	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1552	8fcbc97e-fc74-4598-b1d4-b552cabd06f5	Retaxo	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1553	61a7c319-2b6f-4bfd-85c5-7013aec005f2	Escalos de Baixo	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1554	3890a43b-a3cb-41b4-9067-e15fea8be123	Escalos de Cima	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1555	d2ff6a3f-cd37-4d81-8041-5fcce4c2bff6	Lousa	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1556	37430cdc-8775-4060-b280-2cbade45add0	Freixial	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1557	4d1660dc-751c-435d-a5bd-734bfb511b0b	Juncal do Campo	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1558	d106dad6-df9f-4734-952d-5cf52ead288a	Ninho do Açor	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1559	d4a69c88-5a21-47c8-921c-19c1e8f6ee9f	Sobral do Campo	\N	6	80	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1560	32e0d63c-a364-4fdc-9042-032edc1f384e	Aldeia de São Francisco de Assis	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1561	0d0f9f89-35ee-4a55-a397-f57b7c9b2729	Barco e Coutada	\N	6	81	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1562	ee3ba7c2-1bc3-4224-870a-56bb8f79e0a9	Boidobra	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1563	c10cce40-650c-4937-8c88-94260f5c85bf	Cantar-Galo e Vila do Carvalho	\N	6	81	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1564	73108d50-12ec-4050-b6a6-1eaf3c8c62cd	Casegas e Ourondo	\N	6	81	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1565	30beb6fd-bdc1-4113-9595-044a7c9db6b6	Covilhã e Canhoso	\N	6	81	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1566	e1235bab-5564-46ac-aaad-f1398af6a0fa	Cortes do Meio	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1567	91435145-47aa-4676-a58d-6611725e7191	Dominguizo	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1568	125e0d50-3c66-478d-9301-ebea05fb891d	Erada	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1569	7e99895c-3462-401a-a681-3fdcfe20bedd	Ferro	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1570	f393908f-adda-4319-83df-f9018c9ddc45	Orjais	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1571	d01e8acf-9867-4034-bc38-83d6d7260bb6	Paul	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1572	6e97d53d-c7b8-48e9-a3f4-511de3bba727	Peraboa	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1573	2a797df4-c589-4efd-96a8-7f08d34df2a6	Peso e Valos do Rio	\N	6	81	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1574	b80d663f-7002-4527-8bc6-524069a1c893	São Jorge da Beira	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1575	170b351f-a8ee-4019-8fa9-1bdd3c4ede98	Sobral de São Miguel	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1576	d07ac680-2667-4a64-b935-5597c870ca84	Teixoso e Sarzedo	\N	6	81	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1577	efe963d3-7cae-4046-a3d7-e1ba1c7446f7	Tortosendo	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1578	b4e350b9-801a-4811-b271-be8e4841d6be	Unhais da Serra	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1579	077b0bf8-04fe-423d-b677-ba55135685c9	Vale Formoso e Aldeia do Souto	\N	6	81	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1580	35c735d8-d2be-4557-8004-1b8c944868d2	Verdelhos	\N	6	81	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1581	0fffd627-f524-4c08-bc22-4b2de024efb5	Cantar-Galo	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1582	b599e6e4-cbca-41fd-a847-c871889911f1	Vila do Carvalho	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1583	77c31307-3fb2-459b-b493-8362cf76248c	Vale Formoso	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1584	df96ceb6-7b14-4065-9e28-be3fc6bfd465	Aldeia do Souto	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1585	04f377c2-bf29-4d05-9f5a-dcca9ccffe18	Barco	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1586	a4ecc895-ad2e-4593-ab6a-6287c2fa0845	Coutada	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1587	0d9782f4-7fc8-44b0-8be0-90b95ca9c4f2	Casegas	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1588	0104b66a-f550-45ac-b2b2-023817d53df7	Ourondo	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1589	587f5ff2-9080-4d12-be6d-262aaa73ba78	Canhoso	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1590	52a88d99-2330-499d-8bb1-06bb3744a0e2	Covilhã - Conceição	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1591	2805d221-72cb-4659-adcb-6d901c3cfff8	Covilhã - Santa Maria	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1592	29cfebae-7bd6-42f5-aca6-1bc182c266d8	Covilhã - São Martinho	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1593	3735e905-863f-4396-b722-bdf4ba68ccb3	Covilhã - São Pedro	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1594	5b6fe593-b85f-4fc8-94de-ee48576543ad	Peso	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1595	4a387738-c378-431b-b528-c535bb21a815	Valos do Rio	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1596	f328dec1-9f37-4823-8637-254d255bb332	Sarzedo	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1597	daba4594-aa12-4e0e-9ebb-00f68ac0b76d	Teixoso	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1598	5ec5ae75-3e47-44fd-93b9-8623e2fc20b2	Vales do Rio	\N	6	81	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1599	f5316f29-16f8-4cd3-9147-9db391b2c3fb	Alcaide	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1600	e67fd524-b1bc-4f5b-ab2d-19c74b5ee39d	Alcaria	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1601	48acb1fd-9f61-4564-9e91-8876ede57c48	Alcongosta	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1602	8d84b35a-cd4c-4b39-a0d4-f4a095aa51b4	Alpedrinha	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1603	737f7988-df04-4f03-8544-20e30343a848	Barroca	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1604	af67785a-a080-4205-b124-f1aee494fb5b	Bogas de Cima	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1605	b027d29b-af40-4d50-bd79-df3bab2f0584	Capinha	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1606	ffa9ce93-023a-4480-b900-bcb91dcfe705	Castelejo	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1607	fbec1ea4-1b56-45e5-bc49-e6f92d03739c	Castelo Novo	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1608	777107b6-1bea-4cd5-afc6-33205a69cec1	Enxames	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1609	56782abc-b0fb-45c7-9d15-3849b4e9e5b7	Fatela	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1610	46292be1-a554-4bf6-920c-c7184a5cb3fe	Fundão, Valverde, Donas, Aldeia Joanes, Aldeia Nova Cabo	\N	6	82	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1611	adfaa0be-d847-4223-ac99-9dd2b1eb121c	Janeiro de Cima e Bogas de Baixo	\N	6	82	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1612	b9b2b85c-1bf6-4ffd-ab8d-8f890157b96a	Lavacolhos	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1613	c7208f15-8299-4a96-ba7c-934181e6668b	Orca	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1614	fda1360c-c708-4236-96b1-c606a14231b8	Pero Viseu	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1615	a787c51b-f227-4b97-9f4e-4df9b4196e08	Póvoa de Atalaia e Atalaia do Campo	\N	6	82	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1616	40a0d99b-5938-4c65-b3d6-84f4c6fa0e12	Silvares	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1617	5bde9909-fb34-484e-a7d8-3b6332850043	Soalheira	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1618	ca643c5b-ce2c-447a-b8f9-4504954b36d5	Souto da Casa	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1619	25be0332-7dc7-495b-b2d2-162ac6a877b4	Telhado	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1620	8f3f1052-5994-4064-8e67-9edc1587fc07	Três Povos	\N	6	82	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1621	d03031cd-56a0-4a7f-9cbc-1fca224fadd3	Vale de Prazeres e Mata da Rainha	\N	6	82	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1622	37f1f6fa-3728-4206-a63d-08a822af7355	Fundão	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1623	8aeefa04-a816-4c3b-ab2c-27bacbddf887	Valverde	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1624	f351bc35-3c7e-43c0-a548-124e2a83dde3	Donas	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1625	df803818-4953-4260-a18f-4870ed651227	Aldeia Joanes	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1626	5d9fcf95-bce4-498f-bf29-1457b2eab918	Aldeia Nova Cabo	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1627	a4fb2846-4399-41b2-abd6-7d0de53d1752	Póvoa de Atalaia	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1628	5b95fe05-c8b9-4b02-ba34-fc3dd5a46cea	Atalaia do Campo	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1629	51eeddf6-9713-4da5-a447-5733e497e02a	Bogas de Baixo	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1630	b90517ab-2be7-49b1-8ff1-d72f86e1b1b7	Janeiro de Cima	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1631	84bedc42-02bc-4646-8174-86b146de2b6c	Escarigo	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1632	ff118f20-f3ce-499a-9a2a-c98299de5965	Salgueiro	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1633	deb594c1-acf2-439b-be9b-11e5f49d4018	Mata da Rainha	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1634	cd9bbe11-b8af-4cae-8a61-6b0af34f9f41	Vale de Prazeres	\N	6	82	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1635	5b8b6365-e7cf-4cbe-ab48-23c1786dfb4b	Aldeia de Santa Margarida	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1636	4e987e51-c9a1-4df9-9bc0-d25921a3e093	Idanha-a-Nova e Alcafozes	\N	6	83	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1637	9efd9b34-64e1-4d34-b745-b47d268e13c2	Ladoeiro	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1638	88c19071-75e9-46e1-9b15-b530e6903a9d	Medelim	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1639	79e87d92-f4f1-4728-8ef5-1bf401f41c41	Monfortinho e Salvaterra do Extremo	\N	6	83	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1640	f65643ea-d8ba-4755-a810-b6fd2efc68bd	Monsanto e Idanha-a-Velha	\N	6	83	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1641	d9eac9ae-21e1-4560-a85e-1132b850d8f5	Oledo	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1642	ab334a31-2bab-42bc-943a-34987349786a	Penha Garcia	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1643	18ffbd45-1d2e-4fbf-ae46-4567399405d6	Proença-A-Velha	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1644	eaf2ed66-4839-428a-8b45-e7ce03d4aa29	Rosmaninhal	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1645	7672b5a5-2866-4f21-9406-1b19a3621019	São Miguel de Acha	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1646	0387c237-e766-4aef-abb0-f632ac2a5450	Toulões	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1647	510be5ba-ddc1-4737-9783-160e5260707d	Zebreira e Segura	\N	6	83	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1648	572402e5-1cf6-40ca-9868-091235c0b98e	Alcafozes	\N	6	83	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1649	d6f76b8b-725f-4301-9f59-a9690ed2dbd9	Idanha-a-Nova	\N	6	83	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1650	c5d4376e-ff19-48cb-8e60-170c97f16c6a	Monsanto	\N	6	83	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1651	595bdc33-573a-4304-a736-da2fdda7bb59	Idanha-a-Velha	\N	6	83	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1652	b7b580cd-fb1a-412c-9c3c-8461ee1f6570	Monfortinho	\N	6	83	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1653	799cdedb-3abd-4ccb-a9f7-e3747658dc6e	Salvaterra do Extremo	\N	6	83	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1654	952b9e4b-647a-4227-b862-426715bd611c	Álvaro	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1655	093f1f0f-7c63-49e0-a4a2-e95764e82485	Cambas	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1656	c07274a4-ca4b-46ec-953f-9af460a1fc46	Estreito-Vilar Barroco	\N	6	84	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1657	e08bdf92-f287-4179-9e22-8610c67a62ef	Isna	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1658	7fc3b562-01a2-4254-9330-27cb46bdca99	Madeirã	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1659	8ec79026-7925-4a7b-8e4b-be28310f795d	Mosteiro	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1660	31e06bfd-1ec8-431f-b51b-b7075814b110	Oleiros-Amieira	\N	6	84	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1661	5fd96a6f-3ab8-48c2-b37c-f5315175f56a	Orvalho	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1662	337de7fd-9efc-4730-ac2e-b9663c8e9110	Sarnadas de São Simão	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1663	d6e82c6a-8271-4572-bd3c-4e1c589bc1ad	Sobral	\N	6	84	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1664	2852ffd9-9e57-499b-8e59-313898d4861e	Amieira	\N	6	84	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1665	9c51ebc9-0175-47ac-9f41-522f4205dcc0	Oleiros	\N	6	84	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1666	eeaaea0e-5e5d-4a6d-af39-b2f08d7bbc87	Estreito	\N	6	84	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1667	2730bf45-f6ac-4413-9fd9-93fe662dc549	Vilar Barroco	\N	6	84	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1668	43d79681-6503-42f2-9ae2-b84bccc31ee5	Aldeia do Bispo, Águas e Aldeia de João Pires	\N	6	85	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1669	4004ba10-e442-41b0-a615-15f306ddaa61	Aranhas	\N	6	85	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1670	73e3e35a-e462-4d68-b598-4f6e04cdcc67	Benquerença	\N	6	85	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1671	d4058b73-7274-4c06-bfab-c52a546b8932	Meimão	\N	6	85	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1672	202e6788-c00b-45d6-9bcb-feec98d01364	Meimoa	\N	6	85	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1673	51704203-5637-426d-b526-ba9fdff95b75	Pedrogão de São Pedro e Bemposta	\N	6	85	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1674	e98b132f-9ca3-4c3d-8f68-575905571e0f	Penamacor	\N	6	85	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1675	c4190e2d-9419-4137-a727-f85d57d8be37	Salvador	\N	6	85	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1676	5a193daf-5d49-4ea9-8829-36c0e614c7aa	Vale da Senhora da Póvoa	\N	6	85	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1677	7e8ee5f5-7923-406c-a290-ccc7dda9ae49	Aldeia de João Pires	\N	6	85	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1678	d047d3ac-8dde-43a4-9911-8fda05fa5d9d	Águas	\N	6	85	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1679	e5e62687-6d34-4030-8f86-ff26ca053b0d	Aldeia do Bispo	\N	6	85	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1680	b044a5e5-fabd-48d6-a021-dacb399e5cce	Bemposta	\N	6	85	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1681	0fa5b73b-9985-41c4-b487-59c6d04a87ac	Pedrogão de São Pedro	\N	6	85	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1682	b42efe15-f31a-44a5-9a4a-454d187ccf44	Montes Da Senhora	\N	6	86	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1683	c01aa3eb-4d6a-4a64-8e50-2146a4749d02	Proença-a-Nova e Peral	\N	6	86	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1684	97b9ce30-8df8-4f19-8995-30c9eb6fd399	Sobreira Formosa e Alvito da Beira	\N	6	86	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1685	e208e243-741a-4cf0-850e-3e6e5b3cfd0d	São Pedro Do Esteval	\N	6	86	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1686	3b5a370b-bd2c-49bb-ac7e-e1e58bd4df66	Peral	\N	6	86	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1687	b3284317-63b2-42db-8eae-404cfd28cbe5	Proença-a-Nova	\N	6	86	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1688	17e2d63d-c0a8-46ff-b1cd-77798e29e6a8	Sobreira Formosa	\N	6	86	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1689	fe59d3b7-fcea-4b7c-9fb4-f2786d4383ec	Alvito da Beira	\N	6	86	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1690	63f4458d-9c0a-4399-bc9c-e91aa1335001	Cabeçudo	\N	6	87	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1691	219e9a80-aa59-48dd-be78-dc5c64928916	Carvalhal	\N	6	87	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1692	3cb3d67e-a55e-40b3-9373-1c2b82fec139	Castelo	\N	6	87	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1693	7969379e-4357-4637-ab47-523f7f6fcda4	Cernache do Bonjardim, Nesperal e Palhais	\N	6	87	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1694	95571fc0-7806-4454-96a6-b33d835bf070	Cumeada e Marmeleiro	\N	6	87	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1695	b3d5665d-da6b-4080-a425-4c76d93264e7	Ermida e Figueiredo	\N	6	87	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1696	995019a9-665a-457e-a52e-c2bf10b1c541	Pedrógão Pequeno	\N	6	87	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1697	d5148a32-5bcc-48dc-bb9c-3237a2485c07	Sertã	\N	6	87	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1698	5e5c2032-14c0-4cf6-b184-2ae4e02d837b	Troviscal	\N	6	87	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1699	5841b3d6-5487-4118-99e0-729364edeec7	Várzea dos Cavaleiros	\N	6	87	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1700	54f7a565-60e3-4481-99e5-9434bb1097b6	Cernache do Bonjardim	\N	6	87	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1701	4fde18fe-94b7-4e59-9708-42d2894d0953	Nesperal	\N	6	87	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1702	c23aa977-0744-4d93-a33c-7a49d787bd0b	Palhais	\N	6	87	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1703	46d3c409-a27f-4c69-944a-a2516692ce91	Cumeada	\N	6	87	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1704	10089220-5127-438a-bf75-b864cdcf721f	Marmeleiro	\N	6	87	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1705	0c48d1bf-9b7b-444c-ac51-e7b72a57faed	Ermida	\N	6	87	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1706	3ca87a77-597e-4486-84f4-233d21ad3bf5	Figueiredo	\N	6	87	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1707	29d5d4d5-cb01-4b49-afc5-3f61c007cae1	Fundada	\N	6	88	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1708	91d55c18-464e-4e3a-bab8-1d1baf37159b	São João do Peso	\N	6	88	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1709	4d3ad4a9-84ac-4d0e-819b-9ef08868bc9e	Vila de Rei	\N	6	88	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1710	7f51e5c7-5c29-4ef0-97f2-5d77dc7d2371	Fratel	\N	6	89	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1711	9b97abcc-24d8-4bfc-b8f0-c9c024da63fd	Perais	\N	6	89	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1712	a6f3b8af-f8ff-4382-9055-4f480be72ed9	Sarnadas de Ródão	\N	6	89	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1713	0fa1a874-24cd-48bd-be28-bce91be9c929	Vila Velha de Ródão	\N	6	89	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1714	7397ac58-0d27-4612-aae8-f1241c7c50ea	Arganil	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1715	06f2a985-c98c-49fb-a066-54ab38c01282	Benfeita	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1716	023c2b27-2779-4bcc-ac67-d42e907d9fc7	Celavisa	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1717	de7f1477-0feb-4215-8199-685226005b5a	Cepos e Teixeira	\N	7	90	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1718	f70511e9-6a3b-4300-b8a7-e73f8d37b2db	Cerdeira e Moura da Serra	\N	7	90	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1719	45ff9960-d9f3-4cff-af1a-5afe717afead	Côja e Barril de Alva	\N	7	90	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1720	3d0d083b-283b-457a-a10e-267ef3cc4edf	Folques	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1721	3490fd0c-5a7b-4ce5-a2fe-52ff1388cbb9	Piódão	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1722	c4be215b-a945-4f9b-868d-8f53e964df04	Pomares	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1723	c66d2cf7-9168-4b36-98aa-98638f7481c3	Pombeiro da Beira	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1724	b0f48f3f-5dcf-4d54-9a94-d9bd969af306	São Martinho da Cortiça	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1725	47979cac-20db-40eb-97cf-797304f02534	Sarzedo	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1726	f2f964e5-bada-43aa-b1bf-acc8c77c2eeb	Secarias	\N	7	90	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1727	0120886c-7b90-447e-908a-0c03c7ec3b87	Vila Cova de Alva e Anseriz	\N	7	90	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1728	2f3028ba-0c77-411e-baa0-2ffe46546e56	Anceriz	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1729	dcbbde94-63a9-4c23-926a-cbe5e3446278	Vila Cova de Alva	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1730	73a9eefa-d5d9-41f0-a9e2-69048498ec94	Côja	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1731	eb46d820-9d57-47d4-9e2c-e1ff07966ebf	Barril de Alva	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1732	efc43193-d801-4549-81b8-5ec7df968c23	Cepos	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1733	60062b65-2a27-467a-bac0-bfccc8b529b8	Teixeira	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1734	d72ba9b5-4850-4292-84c3-f3971751aa1f	Cerdeira	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1735	e11a777c-a8d7-4963-9bae-254336d0f63e	Moura da Serra	\N	7	90	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1736	8e1dfb89-d258-414d-a9d1-c002f92e9e23	Ança	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1737	d7d847f5-4d55-405a-9f39-0736afd51e50	Cadima	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1738	6c69db72-5a63-49f1-8b2e-618e3b41390a	Cantanhede e Pocariça	\N	7	91	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1739	eb7c7d4a-3791-476b-b59f-c32a73ce9495	Cordinhã	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1740	260d893e-1896-4bf6-898f-27d60660b99b	Covões e Camarneira	\N	7	91	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1741	1f402a8e-1bf4-417f-9931-4162dbc64e8d	Febres	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1742	fb6e142d-d90d-4a21-8b7d-3fd41918cbd5	Murtede	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1743	49cea32c-bef6-4928-8c02-9558da7661a5	Ourentã	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1744	bf667c39-584c-4941-9f9a-d8ce9c7f0eec	Portunhos e Outil	\N	7	91	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1745	d926573c-9db9-4ef1-8663-3e73f51cd5e8	Sanguinheira	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1746	8eceb50b-4640-4b5d-83b8-66f2e778719e	São Caetano	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1747	7a9c2cec-bc6e-4016-ac13-7fd4d7b55fe5	Sepins e Bolho	\N	7	91	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1748	e8cb6cb8-008c-4130-83c9-80de73e3da6c	Tocha	\N	7	91	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1749	f7b180d3-700a-4dc5-a946-def9539c3216	Vilamar e Corticeiro de Cima	\N	7	91	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1750	c19ba6f2-bdca-4c98-b27f-2c3232d90150	Pocariça	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1751	2c423da3-86aa-453d-9bce-a04c591c4fd2	Cantanhede	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1752	129b0aca-f0a8-438b-bf2a-e9dff8c0c99f	Sepins	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1753	4cc60e8e-dfbd-4933-b964-8ec659fabf9a	Bolho	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1754	1d6a4ae3-bd2a-4211-8dd5-d4e4465c7c59	Covões	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1755	5f487916-7214-458a-971e-1ab5f183b19c	Camarneira	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1756	c9881a04-e05e-426b-9bdf-1e9df1ae7afb	Outil	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1757	ef7781fd-f19e-435a-9caa-2dc9dfd6188a	Portunhos	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1758	365030cc-f7d1-4a09-b53c-0ab2f8c36e6d	Corticeiro de Cima	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1759	1df105d8-f227-487a-adb1-5a5797d80238	Vilamar	\N	7	91	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1760	f2643bfa-4dee-452a-9769-ec7a14561352	Almalaguês	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1761	e9d42299-1cfd-4089-8ae0-04d2afa18868	Antuzede e Vil de Matos	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1762	b8e5c53c-5e00-4ccf-a95b-3929372e2da1	Assafarge e Antanhol	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1763	745a8026-fc25-40e8-9be8-b4de25375bbf	Brasfemes	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1764	139e9672-12a1-4ad7-8a44-a94d45bada5a	Ceira	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1765	d5623955-8c9d-483b-96f3-2189a5ee9b9b	Cernache	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1766	13d7cb13-62b7-4f2b-b86b-c4e2daedfbdb	Coimbra - Sé Nova, Santa Cruz, Almedina e São Bartolomeu	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1767	a0c1da90-2be6-494c-8ab0-9ca0aecf4036	Eiras e São Paulo de Frades	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1768	7cc941d3-83ad-4a30-8de4-6825bc3118a4	Santa Clara e Castelo Viegas	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1769	284b5486-e44d-4495-adfa-eff75d27a2dc	Santo António dos Olivais	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1770	8e036aec-2235-4440-afac-a82efa429b77	São João do Campo	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1771	cabfde26-7206-4733-8989-6207bf636534	São Martinho de Árvore e Lamarosa	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1772	4383a80d-6ee3-4ba5-8dbf-e83ab03165aa	São Martinho do Bispo e Ribeira de Frades	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1773	62927b9b-458d-4bb6-b48e-3d4b3cf57726	São Silvestre	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1774	370749b4-2ca6-4197-98b3-73cc5ff6ea76	Souselas e Botão	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1775	a646fd07-4853-4d05-987f-2b73155c425c	Taveiro, Ameal e Arzila	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1776	deb2574c-c216-4043-aabd-fc86e4ba1c71	Torres do Mondego	\N	7	92	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1777	a6f34cc4-0c2f-4057-b7fc-577b82d2440c	Trouxemil e Torre de Vilela	\N	7	92	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1778	1f95ed83-5a76-47c4-8283-c5dfaab981dc	Coimbra - Almedina	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1779	47fd7c2c-278d-4890-891e-16a064bc07e8	Coimbra - Santa Cruz	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1780	5a86e334-ae62-4de7-a8af-28ed1271c52f	Coimbra - São Bartolomeu	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1781	e3d3be88-5242-40fc-9544-d099e99c84db	Coimbra - Sé Nova	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1782	83529a51-af73-4624-8a1e-b7cb9b7efdcc	Ameal	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1783	6a6c5ff2-c994-4034-ac30-c7d88d16f8fd	Antuzede	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1784	1279eeef-721c-4cb3-bd6b-1f3deda10438	Assafarge	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1785	ab14b222-bc7f-4781-8c13-26dbe7d172de	Arzila	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1786	a89ce3f3-a10f-4682-b86e-31ed4fa5cec1	Taveiro	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1787	607bdd34-0408-497f-9f30-230e78b21455	Antanhol	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1788	afd74fb2-4aaa-43bc-b7c1-636e95c3d575	Vil de Matos	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1789	9238a156-483e-47ad-9504-51992e0df87a	Botão	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1790	efb75cd5-cbbc-4dfc-9369-3a0a7bed29e0	Souselas	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1791	996a92bd-90f6-4ea3-838e-c16f47a2b673	Castelo Viegas	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1792	d35c3d96-a50b-4cb0-b1b2-12b3d7e7b5b7	Santa Clara	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1793	59412a50-4f8e-47bd-900e-ac5b60756743	Eiras	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1794	1c68401d-a2f4-43a7-baf7-180d45cf139a	São Paulo de Frades	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1795	14309f16-f765-4635-bb09-af631da6f10a	Lamarosa	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1796	4163bebc-cf8c-4371-a207-987a7385000a	São Martinho de Árvore	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1797	5432b5f2-642a-4fc1-8de5-af03c938ea0c	São Martinho do Bispo	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1798	0e5ece47-5042-4d0e-a904-f6e38bf9662c	Ribeira de Frades	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1799	e24cbb79-6b23-4506-b591-04b7fdafba83	Torre de Vilela	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1800	35bc6c63-57b9-4732-84b2-18b5bae6bf39	Trouxemil	\N	7	92	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1801	dd19d105-43fb-4dd7-af4b-2584ac4f8b35	Anobra	\N	7	93	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1802	695b6dd8-3a80-4233-9c68-f06c9721ca5d	Condeixa-a-Velha e Condeixa-a-Nova	\N	7	93	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1803	565cc64a-1da4-401c-95b2-d94156c4697c	Ega	\N	7	93	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1804	6bb264a8-1463-4e0b-99f0-fc7b1ca5c5ff	Furadouro	\N	7	93	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1805	61178417-a5f2-41fc-b36d-0524463609ba	Sebal e Belide	\N	7	93	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1806	da961b77-3c23-439b-9608-2a82a5104afe	Vila Seca e Bem da Fé	\N	7	93	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1807	8e44b0b1-b607-4810-93c7-a98445d4bbec	Zambujal	\N	7	93	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1808	5a913ece-fae8-49fa-bd7a-494d4750b027	Condeixa-a-Nova	\N	7	93	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1809	6f09e82e-4c38-4caf-bcf1-f8c28e21ab6b	Condeixa-a-Nova	\N	7	93	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1810	bd91d737-658e-41b6-9315-a6bfae843cd9	Belide	\N	7	93	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1811	9b1ad4fa-78ad-4970-8375-2c2fb324206f	Sebal	\N	7	93	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1812	e3873853-7c2c-4e3c-af32-e030e91e740c	Bem da Fé	\N	7	93	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1813	016a0ed3-a364-4790-a0b9-2ca5315d7acd	Vila Seca	\N	7	93	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1814	47754b6b-e055-4c5a-b753-98ad5c45f7c9	Alhadas	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1815	42a23db7-4c10-439f-bfdd-e6fc2b15572b	Alqueidão	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1816	481f5848-0039-4ad6-b2b4-d5788c3ba595	Bom Sucesso	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1817	09af61ce-95b7-4f92-bd50-968b1c1cf7e9	Buarcos e São Julião	\N	7	94	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1818	7c505cb9-74c4-4cf4-8607-813d40e7f058	Ferreira-a-Nova	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1819	4c8abedd-fd36-4e60-bf7b-1de8fe36b8b3	Lavos	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1820	4eadc7d9-c94a-45c5-9418-13f8cb3d1166	Maiorca	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1821	d4984f00-7073-4118-abdc-a2d9a54b15f3	Marinha das Ondas	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1822	8ae7fe7a-e03f-430d-bb22-1ac3bd4a9ab4	Moinhos da Gândara	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1823	6511d90d-044c-4262-8c23-918644b39acb	Paião	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1824	b4eaf3a8-1683-40fc-aa3c-be17aa584817	Quiaios	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1825	9f92c26a-df9b-42d2-9447-d6d325365cbd	São Pedro	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1826	fa91b76c-bb04-41a2-84f0-de9c05d82e62	Vila Verde	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1827	b639804e-7e5a-466f-8e4d-2997626f9341	Tavarede	\N	7	94	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1828	85f09c41-f441-4892-ac3c-d64cb382989a	Brenha	\N	7	94	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1829	ad8f913b-f4c8-4d13-a94b-a929a2ef3a24	Buarcos	\N	7	94	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1830	e00fcac1-6f7c-4890-922e-21dcbd12e47a	São Julião da Figueira da Foz	\N	7	94	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1831	ee13f891-e4f2-4f35-bed0-f67f08975403	Santana	\N	7	94	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1832	d844a856-3574-4ddb-bf1a-c258a276438a	Borda do Campo	\N	7	94	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1833	1838563d-d25d-4927-a726-b42b21db898a	Alvares	\N	7	95	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1834	41f53325-f06f-4bfb-9329-2849c61e5077	Cadafaz e Colmeal	\N	7	95	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1835	78d8699a-0094-4afc-ac7a-ba96d49e32eb	Góis	\N	7	95	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1836	70cddd68-6aaf-44d0-a8cd-4a2cfd9ee24d	Vila Nova do Ceira	\N	7	95	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1837	cd5b20cc-62c4-47fe-9506-0fd496d1faed	Cadafaz	\N	7	95	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1838	1aaf54b7-bef6-433b-986a-6b61d444a117	Colmeal	\N	7	95	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1839	f08a35e2-fcdd-405e-98c4-b80e0c67579c	Foz de Arouce e Casal de Ermio	\N	7	96	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1840	29515c32-ab8b-447b-8e03-5b24e310d7db	Gândaras	\N	7	96	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1841	a40f90e9-3363-483b-b295-dd60ba694748	Lousã e Vilarinho	\N	7	96	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1842	373d56e4-4839-45f2-8c5a-7d38e9975215	Serpins	\N	7	96	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1843	da8d8034-3cbc-4e60-a36c-ee7269a657b8	Casal de Ermio	\N	7	96	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1844	43ea5853-69b9-45de-8875-4887b3743e8f	Foz de Arouce	\N	7	96	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1845	c012a0f4-91f5-4776-a0d2-ca2ffd76b42f	Lousã	\N	7	96	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1846	ea69fdea-3b39-4a15-ba92-2e4d4fcb7aaa	Vilarinho	\N	7	96	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1847	f25b901e-fa36-426e-a267-6b76b38e8b92	Carapelhos	\N	7	97	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1848	6c0c84d7-a50b-4c30-b4cd-197fac20a9ee	Mira	\N	7	97	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1849	6e0c1bce-067d-4ec9-8f88-02d38d3a85b4	Praia de Mira	\N	7	97	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1850	02b584ce-2062-409a-bf8a-a03f462ebbaf	Seixo	\N	7	97	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1851	2ab1d42c-a151-4999-aaf4-fc90cf2003d2	Lamas	\N	7	98	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1852	6994e53e-c63f-4617-aae7-feffa47556df	Miranda do Corvo	\N	7	98	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1853	763b940a-f44d-4ead-ae31-8480a4b9f989	Semide e Rio Vide	\N	7	98	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1854	8089b4b6-ae54-4f48-b4d6-6007db759d15	Vila Nova	\N	7	98	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1855	7972d089-9ad4-4fa2-8257-26546e8a5a91	Rio Vide	\N	7	98	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1856	47d26696-925c-42f9-8304-5d6096c91231	Semide	\N	7	98	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1857	2ba0fe89-e04d-4d23-9018-7fcd5d56462c	Abrunheira, Verride e Vila Nova da Barca	\N	7	99	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1858	04dce8af-4e79-42aa-8b5e-a0491b4dd03b	Arazede	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1859	01c52027-8362-4277-ac73-0550ab4bafe0	Carapinheira	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1860	a51aad06-d300-4a21-8b7c-f5abf7b3469f	Liceia	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1861	4a4881da-1671-41f6-baa3-1e6963a49dfc	Meãs do Campo	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1862	a9eef36c-256b-486c-a795-a7c904e911ae	Montemor-o-Velho e Gatões	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1863	bb5951d2-817c-4e16-a43b-290c6c181956	Pereira	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1864	18e761d6-df28-4f0b-81fa-27b3b3bc5334	Santo Varão	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1865	1896f9fa-994d-49a5-bfbd-22599e938f48	Seixo de Gatões	\N	7	99	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1866	d7fe5aa9-fa1a-4060-b811-a8e64daaf362	Tentúgal	\N	7	99	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1867	f77f2379-6b9d-457e-afc9-9be12ed29e72	Abrunheira	\N	7	99	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1868	400d8bab-a6ea-44cd-8398-aa86b205586d	Verride	\N	7	99	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1869	87bb0533-8054-4289-a18a-06c2560415ac	Vila Nova da Barca	\N	7	99	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1870	6ae36dd1-d932-44cb-8542-6c3d9e6012ea	Gatões	\N	7	99	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1871	7a094a37-7d62-4936-b724-34869230f856	Montemor-o-Velho	\N	7	99	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1872	1dcb8da8-8d7d-40da-b96b-0560ddc9b2d0	Aldeia das Dez	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1873	4f8e057e-fa2c-4e5c-9a6c-61bd07725e6c	Alvoco das Várzeas	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1874	02599af9-44cc-48fa-b4f0-113ad1ffdc24	Avô	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1875	da95ef6b-bfc2-4f3d-a6d7-ffbe6ed4d9c0	Bobadela	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1876	9b5714d3-ef52-4d66-b957-b860daaaa844	Ervedal e Vila Franca da Beira	\N	7	100	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1877	ef57dd98-f35a-4e61-bd2b-f51d5cea0d5f	Lagares	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1878	a400341c-720e-4e06-bc79-9fee0ef297b1	Lagos da Beira e Lajeosa	\N	7	100	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1879	ef96e0ae-6d2a-4f33-97e6-1f265a5d6755	Lourosa	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1880	e0669979-2d26-468c-83fb-b80642a1aace	Meruge	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1881	3baaefcd-a666-41db-a065-2232045958c6	Nogueira do Cravo	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1882	80f81e7d-4998-4deb-ad2c-83fc6031d287	Oliveira do Hospital e São Paio de Gramados	\N	7	100	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1883	398f27ac-91d8-4fca-8663-289d2a158fc3	Penalva de Alva e São Sebastião da Feira	\N	7	100	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1884	8e4df955-606e-4a86-92ce-7a460020c1f9	Santa Ovaia e Vila Pouca da Beira	\N	7	100	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1885	3ac2b2f6-7036-4009-b52c-59dd6cadaf02	São Gião	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1886	780b2026-c23c-48f1-8494-f966349eab01	Seixo da Beira	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1887	1bfa7820-a2f1-42ea-be48-a970fa7bf659	Travanca de Lagos	\N	7	100	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1888	b972624c-e817-4032-906f-62881f9bf89e	Ervedal	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1889	1da00e8b-d3a7-4b74-8178-0a27b54be948	Vila Franca da Beira	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1890	09e47d5f-b9fe-465e-b928-d75258ef8943	Lagos da Beira	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1891	b7b0fc3c-625c-47de-a6b1-d62bd4c85102	Lajeosa	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1892	a205cd90-85a9-4c15-a159-7a159a86de63	Oliveira do Hospital	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1893	5935fc4b-9e16-424b-8ed9-483f20023ecb	São Paio de Gramados	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1894	28a0755f-16e1-497d-8658-a035542afce4	Penalva de Alva	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1895	e08190b3-e984-43af-bbe9-14f00db9d093	São Sebastião da Feira	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1896	e44ee041-ca75-44bb-bb50-433fb6deed57	Santa Ovaia	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1897	eda4928a-bf4d-4cda-bf34-a3584b35f839	Vila Pouca da Beira	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1898	9cf2d9a0-a5dd-4c5f-9cf0-ac417d17466c	São Paio de Gramaços	\N	7	100	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1899	35f69f9f-a76b-4d61-97b6-05793c250939	Cabril	\N	7	101	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1900	05dcc86e-3c83-4b5c-987b-d4a7c7a073cf	Dornelas do Zêzere	\N	7	101	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1901	c6cc22b8-f930-4489-be06-95004e85c522	Fajão-Vidual	\N	7	101	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1902	e403e421-ac0d-4909-8292-cacb04b37744	Janeiro de Baixo	\N	7	101	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1903	8a9ffe36-330f-410d-945f-443d2e18d4a6	Pampilhosa da Serra	\N	7	101	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1904	846bbd24-2ad8-4237-9426-38c1604820f9	Pessegueiro	\N	7	101	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1905	6a610d85-9269-4f7c-9ecd-8002c87069f3	Portela do Fojo-Machio	\N	7	101	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1906	68902047-9aea-496b-88aa-f0e59652f354	Unhais-o-Velho	\N	7	101	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1907	5cdd224b-a604-4aa3-b1ec-8ee2f204abd2	Fajão	\N	7	101	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1908	ca40490b-e0e9-4eff-a0de-ad083a2f2c57	Vidual	\N	7	101	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1909	f799c4f6-62f6-413e-99af-95c6b7b6d634	Portela do Fojo	\N	7	101	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1910	3008740a-a5cf-4913-abd2-8391a4237bd0	Machio	\N	7	101	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1911	4773fd7c-6ea1-49f6-899b-1fe7ac7a0fb3	Carvalho	\N	7	102	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1912	31a11fa6-377c-4d3a-b454-f4cf95112618	Figueira de Lorvão	\N	7	102	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1913	22df992f-1574-410e-ac05-dfa39f9d1ac4	Friúmes e Paradela	\N	7	102	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1914	cb42a8a0-6a67-4f37-98e5-a12f8ec28c84	Lorvão	\N	7	102	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1915	fd93bbf0-d6bb-48ae-a023-bb3dde428588	Oliveira do Mondego e Travanca do Mondego	\N	7	102	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1916	f6b42056-ea0b-4a1d-8b18-e81f2254f677	Penacova	\N	7	102	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1917	05a18cfe-df67-4d20-a757-d3ab1a8cc8b5	São Pedro de Alva e São Paio de Mondego	\N	7	102	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1918	15d66b98-7692-4cc8-a065-363391e33129	Sazes do Lorvão	\N	7	102	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1919	9a599bf5-0af1-4e60-8982-a392814bda74	Friúmes	\N	7	102	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1920	139be7f1-383d-4058-aa97-a4cfca431264	Paradela	\N	7	102	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1921	b989b483-f2ae-401a-a63b-6ba6b9c42c5d	São Pedro de Alva	\N	7	102	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1922	3b49765c-3f4d-4f58-b29d-54e25c6de0d7	São Paio de Mondego	\N	7	102	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1923	8f79dbb5-a8fd-4702-80c3-9f83f8ffb565	Oliveira do Mondego	\N	7	102	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1924	57da8e57-aced-41b4-abc2-2c7802ce64dc	Travanca do Mondego	\N	7	102	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1925	1328ca6a-a11f-43fd-bcae-c0d208d896bd	Cumeeira	\N	7	103	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1926	0db88895-547f-4190-8385-6c360883eabf	Espinhal	\N	7	103	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1927	6d6845d1-2310-4eba-952f-da0726ce3a9e	Podentes	\N	7	103	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1928	2702e78b-61cc-4cc6-8209-7c590d9a11a3	São Miguel, Santa Eufémia e Rabaçal	\N	7	103	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1929	5cbc0b5e-01ff-4998-a67d-b2d43274cf88	São Miguel	\N	7	103	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1930	108c7156-cc25-4826-9cbf-ce3e7b940c27	Santa Eufémia	\N	7	103	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1931	ee515ec7-94a2-4d07-90a0-13da81d92cae	Rabaçal	\N	7	103	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1932	f0d92460-da3d-4101-b355-d3aafbc7dbb5	Alfarelos	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1933	f27b791d-4797-451a-a288-d1b1a7e15f2d	Degracias e Pombalinho	\N	7	104	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1934	d2f72e22-764a-47c5-90da-421be8ce3626	Figueiró do Campo	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1935	95c5bb0a-8820-40af-b355-e3bbd461e15f	Gesteira e Brunhós	\N	7	104	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1936	3c17d413-b3df-4eb9-986b-439ee3ea5de2	Granja do Ulmeiro	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1937	8226d1ab-13c9-4cbc-8ba6-4ac194ef2639	Samuel	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1938	189f49f3-fe12-44cf-8c2a-57b1e66bde54	Soure	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1939	b5499d51-4dca-4534-8207-3fb48123961f	Tapéus	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1940	dc23ead0-4770-4a9d-b3fb-5857d4da1660	Vila Nova de Anços	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1941	6dad1d2b-0178-411a-bdf0-41c7b3d15cba	Vinha da Rainha	\N	7	104	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1942	e331d291-c660-4db6-9090-8b782d1d1b4f	Brunhós	\N	7	104	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1943	ec20919a-3209-42d0-916b-a2f34cdcbe44	Gesteira	\N	7	104	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1944	2766a60f-3b38-410f-be7b-7389ac177970	Degracias	\N	7	104	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1945	90fe7abc-6248-4aec-8449-b4998b0eea0c	Pombalinho	\N	7	104	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1946	5b17c1fe-4ab3-4e09-b5af-9e8923aa973c	Ázere e Covelo	\N	7	105	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1947	10f8bb76-9866-4a1e-96b6-df531426266d	Candosa	\N	7	105	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1948	0317fec0-8dae-48b3-8721-db22dbdca722	Carapinha	\N	7	105	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1949	dd41861e-5a96-4063-98b8-12cc7b9d29b6	Covas e Vila Nova de Oliveirinha	\N	7	105	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1950	5ca81a88-f3b6-468d-b2c2-e6778aae2297	Espariz e Sinde	\N	7	105	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1951	e8254b08-7956-4057-b00b-5032f037fe58	Midões	\N	7	105	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1952	9d33255c-aeb6-4a27-bc02-4421e40831e6	Mouronho	\N	7	105	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1953	cf334db0-c0cb-4908-86b1-db239850a89d	Pinheiro de Coja e Meda de Mouros	\N	7	105	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1954	3b48a6d1-dadf-4d01-aee8-ad31b596b3aa	Póvoa de Midões	\N	7	105	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1955	f6a22252-7d9e-4f6e-ae69-dc9130d252c6	São João da Boa Vista	\N	7	105	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1956	c9acbc40-e705-4cef-9960-feffcb8d6575	Tábua	\N	7	105	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1957	fe61672e-6cbd-4d68-b3e6-f640d86401d9	Ázere	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1958	6c4de109-6809-4575-a602-36852830a867	Covelo	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1959	67b3d54c-4e60-47ff-9880-4dd7eb87d811	Covas	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1960	ff09c81b-de58-4de6-a8eb-c82bd6240d25	Vila Nova de Oliveirinha	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1961	0f015683-340f-48b8-b936-27b55cf801a0	Espariz	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1962	1a96b091-b390-429b-a11e-c1844159c67a	Sinde	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1963	71a17c81-4fe8-4c7c-bfc6-91d72645de2d	Pinheiro de Coja	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1964	45c5d72b-0d98-4049-8d41-ad7f9104c45e	Meda de Mouros	\N	7	105	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1965	03078a6a-0225-433b-829a-cdbcd4b7482d	Arrifana	\N	7	106	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1966	3134073a-7af8-4ece-84ea-efc604771e06	Labegadas	\N	7	106	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1967	8c376169-15e1-478f-ab38-034f91510fb7	Poiares - Santo André	\N	7	106	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1968	20d4657c-03d2-437e-95d0-2e3c7edfb314	São Miguel de Poiares	\N	7	106	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1969	afed1e79-9ed5-4ed2-a7b2-295bcc6842a1	Santiago Maior	\N	8	107	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1970	69dab8c0-2d6f-4a5b-8d95-4dd53011450b	Capelins - Santo António	\N	8	107	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1971	e4700d5f-1484-4a1c-a5c5-2d69cfabb744	Terena - São Pedro	\N	8	107	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1972	876555bd-1e04-4d2f-889b-55127a550ff2	Alandroal - N.S. da Conceição, São Brás dos Matos-Mina do Bugalho e Juromenha - N.S. do Loreto	\N	8	107	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1973	136f862f-7777-4122-97e3-238e3771015a	Alandroal - Nossa Senhora da Conceição	\N	8	107	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1974	9f97eb23-f5d0-4944-b683-d50ffd74a760	Juromenha - Nossa Senhora do Loreto	\N	8	107	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1975	2ad84179-e844-4d5d-9f90-b77975c9b79e	São Brás dos Matos - Mina do Bugalho	\N	8	107	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1976	896cc7f7-a281-472b-8ce9-e27530ea48f7	Arraiolos	\N	8	108	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1977	58996a00-42f1-4525-935e-7e62a0441e4a	Gafanhoeira - São Pedro e Sabugueiro	\N	8	108	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1978	adc23097-2eee-4d96-a790-57113f727aee	Igrejinha	\N	8	108	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1979	12e0faf5-f69e-4c40-906b-d39a045e5faf	São Gregorio e Santa Justa	\N	8	108	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1980	72116ffc-93b0-44ae-837b-eafda7efa7be	Vimieiro	\N	8	108	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1981	fd3f3ae6-7c48-4761-9a8c-5b9970949946	São Gregorio	\N	8	108	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1982	8df8a8e2-f4be-4457-bb9b-4704a80e0e2a	Santa Justa	\N	8	108	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1983	5ff3a28c-3cfd-4fe3-aa1b-a934432c997b	Gafanhoeira - São Pedro	\N	8	108	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1984	f46264db-51f9-43fb-872d-ed27f05fc4f4	Sabugueiro	\N	8	108	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1985	bf46e58e-62c8-4d78-a16b-c9c6f215a9ad	Borba - Matriz	\N	8	109	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1986	48ef0ca5-c52e-4bfb-9581-a4f610febaa6	Borba - São Bartolomeu	\N	8	109	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1987	0f33b9dc-68ab-4d03-b1cf-426499576e27	Orada	\N	8	109	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1988	2e2eb2ff-fac5-4670-b74a-f7333295d2ab	Rio de Moinhos	\N	8	109	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1989	cbb64120-5304-4580-bc91-7063dc02a884	Ameixial - Santa Vitoria e São Bento	\N	8	110	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1990	21bd4704-0563-4c8b-b4be-d97bcef18317	Arcos	\N	8	110	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1991	2627dff6-b167-47c5-b87c-76099cb83fe9	Estremoz - Santa Maria e Santo André	\N	8	110	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1992	14dd9e18-c17c-43b8-b948-d22cb0624db0	Évora Monte - Santa Maria	\N	8	110	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1993	7db5a08a-8ce7-413b-9daf-34663e13a1ea	Glória	\N	8	110	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1994	93a85a73-e359-424b-8d7d-fc3ccbe4c179	São Bento do Cortiço e Santo Estêvão	\N	8	110	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1995	b7d5a771-ba71-485d-aba9-7caf8a14a281	São Domingos de Ana Loura	\N	8	110	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1996	bafea083-19d0-4e68-85d9-66c6e6b0734e	São Lourenço de Mamporcão e São Bento de Ana Loura	\N	8	110	1	2025-03-23 11:47:10	2025-03-23 11:47:10
1997	b3dfd563-ef4d-4e43-aab4-892b790394d6	Veiros	\N	8	110	2	2025-03-23 11:47:10	2025-03-23 11:47:10
1998	74c4ad9e-271e-4967-9e52-c7fb632f63e7	Estremoz - Santo André	\N	8	110	3	2025-03-23 11:47:10	2025-03-23 11:47:10
1999	91752db6-1f27-4710-a53a-ed38766ce923	Estremoz - Santa Maria	\N	8	110	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2000	764453de-5cc0-4e02-97a4-e055cae25aa7	Santa Vitoria do Ameixial	\N	8	110	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2001	a777150b-f66e-48c6-88b6-650dd727eff0	São Bento do Ameixial	\N	8	110	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2002	ce0fd8ec-19c2-45a4-8f92-3792ba655ad6	São Bento do Cortiço	\N	8	110	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2003	512621a3-b0bf-46ef-a1ce-4209056658e2	Santo Estêvão	\N	8	110	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2004	598751f0-a4cc-4228-872c-69f992425d5c	São Bento de Ana Loura	\N	8	110	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2005	7f6cf8cf-6e1a-4f8e-96a7-21ce62e2b970	São Lourenço de Mamporcão	\N	8	110	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2006	82d9e9a8-ef35-4720-bda0-dcc141b90b6a	Bacelo e Senhora da Saúde	\N	8	111	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2007	9658812c-0873-4c42-a01f-6c5f3797750a	Canaviais	\N	8	111	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2008	ab4f3257-01c9-4d8b-982b-aa6cee88acc8	Évora - São Mamede, Sé, São Pedro e Santo Antão	\N	8	111	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2009	725db018-04ac-4a86-b329-5a5facad1e2d	Malagueira e Horta das Figueiras	\N	8	111	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2010	6607304c-6995-4945-8930-19d5071b2692	Nossa Senhora da Graça do Divor	\N	8	111	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2011	9afd5917-05fc-450d-8b79-51558c98e91b	Nossa Senhora da Tourega e Nossa Senhora da Guadalupe	\N	8	111	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2012	4201b6bf-4b39-4ba4-879c-4fc7b3d99939	Nossa Senhora de Machede	\N	8	111	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2013	0141e678-5e61-4332-845a-69490c7c5b8c	São Bento do Mato	\N	8	111	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2014	6734a772-503e-4404-b31c-417dfa3a5466	São Manços e São Vicente do Pigeiro	\N	8	111	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2015	fcce8b36-7d6f-42fc-9b38-bdc7009a6a46	São Miguel de Machede	\N	8	111	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2016	6b220b85-5636-478d-b7d3-70e1469fc1a1	São Sebastião da Giesteira e Nossa Senhora da Boa Fé	\N	8	111	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2017	85041ead-2523-4140-a300-d02f6e9d4c6f	Torre de Coelheiros	\N	8	111	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2018	54292d79-8fb9-4853-8065-39a43fc0ecdb	Nossa Senhora da Boa Fé	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2019	19010965-5f72-404d-ad70-475e56cfb957	São Sebastião da Giesteira	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2020	8be862cf-566c-48f5-9d33-8f92e971f82c	Nossa Senhora da Guadalupe	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2021	557a2cd7-b857-43a3-a30a-24e268e38cd7	Nossa Senhora da Tourega	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2022	82c754de-b938-4dd5-b34f-654eb1753139	Évora - São Mamede	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2023	6d4c0f1e-24a2-4b49-bfab-f9446cf21ece	Évora - Sé	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2024	5d2b7a3b-3eca-49b9-bd5a-8fa63638ff1a	Évora - São Pedro	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2025	1b91394f-cc15-4be5-9b9e-cff6eb28661d	Évora - Santo Antão	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2026	bd31c955-51e0-442c-a620-8e6b7c8f3a0c	São Manços	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2027	6bc7885b-ca90-42c6-9e64-cc41cd9aa8e5	São Vicente do Pigeiro	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2028	a9d14cb7-dd8e-4336-bf4d-f27b5c1f13c9	Bacelo	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2029	c8233f89-1a1d-42f1-97b5-3a9161c531dd	Senhora da Saúde	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2030	ed678d28-3304-449c-92b1-1034915d01fc	Malagueira	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2031	03768b5e-6047-42b3-b5c8-725a4e39e465	Horta das Figueiras	\N	8	111	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2032	3e9e862e-2447-419f-a188-b355d4b1741f	Cabrela	\N	8	112	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2033	96bd2cb7-0c19-4bbb-a662-7dde81cdbe4d	Ciborro	\N	8	112	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2034	f6eb8d0c-6fb3-4c84-a87b-6f574bc71ec4	Cortiçadas de Lavre e Lavre	\N	8	112	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2035	c5d8986c-a40c-4780-b5a6-74d4999333a5	Foros de Vale de Figueira	\N	8	112	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2036	947ad769-1fec-4a98-8451-dc04a3a44e92	Nossa Senhora da Vila, Nossa Senhora do Bispo e Silveiras	\N	8	112	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2037	13266ae0-6dd7-4ae2-8ddc-96bded844667	Santiago do Escoural	\N	8	112	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2038	740d9301-2530-4e5c-baa7-1cdab58b902a	São Cristovão	\N	8	112	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2039	9e9d9a9e-fb57-4f9b-addd-69337ab26fbe	Cortiçadas	\N	8	112	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2040	c89962b9-712d-4f8e-97ee-ac4f111de6c7	Lavre	\N	8	112	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2041	0579d954-b1a3-4815-95d3-3021811733d4	Nossa Senhora da Vila	\N	8	112	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2042	0d1e4df9-f329-4442-910b-79266eb8a9a6	Nossa Senhora do Bispo	\N	8	112	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2043	17dcab98-5bd0-4c49-970f-f2fb6c4eb2f0	Silveiras	\N	8	112	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2044	4da73e00-6c05-4992-9f0d-3b51c744120d	Brotas	\N	8	113	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2045	da7a6404-caf8-40ef-aa95-5916b24d9ecc	Cabeção	\N	8	113	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2046	d1c38fb5-8dee-4700-a153-c073d2ac0770	Mora	\N	8	113	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2047	992ee5b9-c5d0-4ced-8126-209054a29fd6	Pavia	\N	8	113	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2048	26657066-c3c5-48ec-985e-9107e799e802	Granja	\N	8	114	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2049	00e166d6-fb05-4dd7-adb8-c66f47aa35af	Luz	\N	8	114	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2050	c16d9fc0-6126-46d2-8eb9-e25f45a15917	Mourão	\N	8	114	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2051	5d596545-c009-4af3-b698-7d79c1ecd72c	Amieira e Alqueva	\N	8	115	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2052	206c5b7c-a1a6-4bbf-affe-d727eaa7ec8a	Monte do Trigo	\N	8	115	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2053	c4851134-8dd6-4fee-834d-9549b0c38ae1	Portel	\N	8	115	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2054	f9598b50-878b-45a6-86aa-ec4f326a7c50	Santana	\N	8	115	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2055	651931b8-bb4a-4a04-9dd4-acf8dea34fb0	São Bartolomeu do Outeiro e Oriola	\N	8	115	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2056	e6247290-d635-40f8-bf07-8e1cd80a922a	Vera Cruz	\N	8	115	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2057	a03832fa-1bec-4e87-b6d5-4fd342c225fc	Amieira	\N	8	115	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2058	285a3237-65bb-4ca0-afb8-6dc4e353a364	Alqueva	\N	8	115	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2059	3f493c34-8abf-431a-bd1c-19ae3511897d	Oriola	\N	8	115	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2060	06165268-a377-416b-ac90-7bbfbd6171ea	São Bartolomeu do Outeiro	\N	8	115	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2061	76332b31-7380-4243-a6e7-479f7f346501	Montoito	\N	8	116	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2062	044f6149-2d74-40ed-af59-9c170df128bd	Redondo	\N	8	116	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2063	d6c4cfa5-a5db-40ee-9f7d-a740209b8523	Campo e Campinho	\N	8	117	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2064	18fd6345-5882-4e14-9353-ac67e7f3d96f	Corval	\N	8	117	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2065	b6d009a6-4796-4dad-a825-cdb4ad368d4a	Monsaraz	\N	8	117	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2066	bf978817-7162-45fd-a2b9-b0faa2b78457	Reguengos de Monsaraz	\N	8	117	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2067	a46099fe-16e5-4f40-b7c7-3beb7579f6c5	Campinho	\N	8	117	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2068	b85d9ff5-06b0-439a-8412-514e51c9e894	Campo	\N	8	117	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2069	a0f0551b-6f9d-4548-85b2-e69dad437590	Landeira	\N	8	118	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2070	1cbb1502-88ad-440a-95c0-712976f16a9f	Vendas Novas	\N	8	118	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2071	9b387bf6-2045-4d2c-81b9-2cc79340c1d9	Aguiar	\N	8	119	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2072	bdbdfd70-c267-467b-873b-442efae432ae	Alcáçovas	\N	8	119	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2073	0578fb8c-843a-449e-8c42-fb3b61b8f2db	Viana do Alentejo	\N	8	119	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2074	d8629d1b-cf85-4a5d-b543-a4b18e055fbb	Bencatel	\N	8	120	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2075	cdf35f4e-12b5-41b5-a0f1-b9be94f3251b	Ciladas	\N	8	120	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2076	b9d16621-4f7e-4c53-b513-4d0541af6ec1	Nossa Senhora da Conceição e São Bartolomeu	\N	8	120	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2077	9a63930b-6a39-46e1-8730-50ce14eb0eed	Pardais	\N	8	120	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2078	25af82b7-161b-42ea-be43-e1b2c4b513c2	São Bartolomeu	\N	8	120	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2079	966af003-6c96-45f9-b992-c26135371215	Nossa Senhora da Conceição	\N	8	120	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2080	fc20b274-5709-426c-8924-1c3a1aba5e53	Albufeira e Olhos de Água	\N	9	121	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2081	1241bb9e-3acf-4305-8a45-088e190f75be	Ferreiras	\N	9	121	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2082	77b655ee-f4b0-4d8b-ae31-95204ccf84ba	Guia	\N	9	121	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2083	7d833630-5873-4539-a0a2-4168a670ada6	Paderne	\N	9	121	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2084	e41eaf9e-1a23-47cf-b0cc-aaaa85f089e6	Albufeira	\N	9	121	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2085	f90e8cf5-d864-4a6c-9319-4dd2840ea35d	Olhos de Água	\N	9	121	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2086	37d4a059-1585-4c67-aee3-693cfc9cda18	Alcoutim e Pereiro	\N	9	122	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2087	33c1c1bb-45b9-41cb-b91c-e9bf037ca05d	Giões	\N	9	122	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2088	266d1cd0-0761-4ad8-a07f-c148ab1e911b	Martin Longo	\N	9	122	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2089	71ce63cf-f661-42fa-b0ca-537ffd41c519	Vaqueiros	\N	9	122	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2090	9d7f68e5-f7ce-4f6c-8691-026e0ceb69e4	Alcoutim	\N	9	122	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2091	5f3d44e1-11e4-48c4-bcdc-5f3f3ef893d8	Pereiro	\N	9	122	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2092	a0703d94-dc42-425a-b18c-c20e9db2661f	Aljezur	\N	9	123	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2093	0351d0cd-7bd2-4631-9b8b-3aac27b63449	Bordeira	\N	9	123	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2094	62a50682-50f8-4288-8c3a-451f5cd637d9	Odeceixe	\N	9	123	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2095	65a6a15d-3985-498e-9de2-0002308b2dab	Rogil	\N	9	123	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2096	d2e3d0ee-9aca-489c-84f1-b4559034dce3	Altura	\N	9	124	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2097	6a593e44-e8b1-4760-9182-52124a7486a1	Azinhal	\N	9	124	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2098	c5ca9bf2-3b58-40ac-b90d-2275cbffa68e	Castro Marim	\N	9	124	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2099	eb175ad0-9a81-4d10-ae0d-ab1fbae6728b	Odeleite	\N	9	124	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2100	8168c6a8-1e17-4d4b-9808-18fd3ee88a08	Conceição e Estoi	\N	9	125	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2101	51a1112e-8427-4886-91f2-0e4f44f94d48	Faro - Sé e São Pedro	\N	9	125	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2102	49059b1b-7651-4224-b26e-67d13d419aa9	Montenegro	\N	9	125	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2103	7f9073ad-eace-464a-949a-2aeeb9c81559	Santa Bárbara de Nexe	\N	9	125	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2104	f15fcade-9f7f-4764-a6cf-807633f0b872	Conceição	\N	9	125	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2105	2b0dafb6-cdd2-4edc-a42d-1242e6d6fa25	Estoi	\N	9	125	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2106	b4ab8101-b58d-49be-acef-9a32b23358ec	Faro - Sé	\N	9	125	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2107	05821b69-e1aa-4439-8329-4fd70988c83a	Faro - São Pedro	\N	9	125	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2108	3034c1b0-87a2-44a9-9460-7599cb880159	Estômbar e Parchal	\N	9	126	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2109	ffa76515-eab8-4fa1-9052-b1f592439751	Ferragudo	\N	9	126	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2110	37ef8e94-0afa-4ccb-99b6-6743bda6656b	Lagoa e Carvoeiro	\N	9	126	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2111	b7479fb1-ccd5-4d18-abcf-d5f68e5b63ab	Porches	\N	9	126	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2112	d81f3f78-6ebe-4112-93a9-e08a3574b085	Estômbar	\N	9	126	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2113	f5c69815-bba6-4f11-8c34-30815b721541	Parchal	\N	9	126	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2114	bf89b5aa-2b19-47ea-9114-e59ba7d081cb	Carvoeiro	\N	9	126	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2115	1aa94fce-4497-4d0c-9c8b-3a438ce33f9e	Lagoa	\N	9	126	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2116	af75f306-69c5-48d7-b1e9-2ee8e6ad9387	Bensafrim e Barão de São João	\N	9	127	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2117	1763df00-c5d7-4e44-a73f-dce4e109d44a	Luz	\N	9	127	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2118	ff9878fc-c2e3-4fa0-b124-148359dc42dd	Odiáxere	\N	9	127	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2119	5f7b51ab-5209-4c5f-8d20-649b912243d8	Lagos - São Sebastiao e Santa Maria	\N	9	127	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2120	46731dff-7f34-44bd-9893-dad6a46d1d4d	Bensafrim	\N	9	127	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2121	aed1a227-1a3b-4bc7-a908-37abb6a9fb27	Barão de São João	\N	9	127	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2122	d5ac6005-dc98-42d6-974e-372d971ecfa7	Lagos - Santa Maria	\N	9	127	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2123	50d0ebf7-9121-4462-97bd-1e87dd9a85c7	Lagos - São Sebastiao	\N	9	127	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2124	e4caf086-478f-4828-bddc-8d76463d9e8f	Almancil	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2125	daa39ad0-118e-449c-bfee-f2ad5a418bd6	Alte	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2126	cb70e60a-9f34-4809-977c-e35a1fa02268	Ameixial	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2127	49f3db84-1da6-44ca-a630-0336bd741eb3	Boliqueime	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2128	321f0cee-b78e-4d69-9886-2fe76381a686	Loulé - São Clemente	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2129	19bbfcdb-d686-432a-8b98-697f034c4c25	Loulé - São Sebastião	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2130	8df02c35-6fb3-40b6-9222-aef9d170f40b	Quarteira	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2131	6199a63f-019d-4568-be86-dc7af1d71057	Querença, Tôr e Benafim	\N	9	128	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2132	b7a00412-707d-4e09-b1cb-0058cf433094	Salir	\N	9	128	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2133	31ab42da-4beb-462b-abca-5603e1ad9395	Querença	\N	9	128	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2134	7edbd0ec-fb8d-4cf7-ac2c-4138afc5c2fd	Tôr	\N	9	128	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2135	324bfc3a-15fc-4110-8e13-534fe1637d46	Benafim	\N	9	128	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2136	436a2fd7-8d31-4b08-b47b-c9a6385b4079	Alferce	\N	9	129	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2137	901cac13-a93a-4c55-81e8-4d43c127e3e5	Marmelete	\N	9	129	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2138	df4820a7-f56e-4db1-a4b2-119a41f1b68a	Monchique	\N	9	129	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2139	1c0c2706-9989-4677-923d-639a5bb8bf02	Moncarapacho e Fuseta	\N	9	130	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2140	ac2422a9-c15a-450a-8178-6a2dec610711	Olhão	\N	9	130	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2141	3d4c7f3d-4780-4118-93f4-ea0c3880b331	Pechão	\N	9	130	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2142	f0baedd4-bf2e-4565-ba78-a19f14fe7555	Quelfes	\N	9	130	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2143	1a3316b2-81b8-4048-a3fd-7a46b8713cad	Fuseta	\N	9	130	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2144	91c90b21-c44b-4eaa-b6a6-2d64a94ee70a	Moncarapacho	\N	9	130	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2145	e49defc3-fe96-4055-9405-522957aef666	Alvor	\N	9	131	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2146	52405e19-731e-4023-9db7-4c2ba3a4d66d	Mexilhoeira Grande	\N	9	131	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2147	f0dc0eab-d27f-48a8-bd7f-1ea75e674985	Portimão	\N	9	131	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2148	c7f71327-6851-4d6a-846d-e44677841241	São Brás de Alportel	\N	9	132	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2149	04d716a7-f13b-4818-b694-eb1bdbec9286	Alcantarilha e Pêra	\N	9	133	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2150	20ac8fc1-4fde-4885-955f-79031145f8f6	Algoz e Tunes	\N	9	133	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2151	8c3abcc0-532e-43a9-8cfb-999eff8aa60a	Armação de Pêra	\N	9	133	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2152	33da2515-66a5-4b1e-a02f-d0c18e205518	São Bartolomeu de Messines	\N	9	133	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2153	aa8866db-24d5-47ee-84f8-96902f24bb6b	São Marcos da Serra	\N	9	133	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2154	36da8ea0-c557-464c-a624-3e83891ef7cc	Silves	\N	9	133	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2155	45057004-d3d1-4de9-b401-ceb1816c6349	Alcantarilha	\N	9	133	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2156	05c7f0db-4e84-4f7c-9b94-f4e23def3ead	Pêra	\N	9	133	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2157	23ebafef-a25b-4f0a-a3c0-ecc1237a1e8e	Algoz	\N	9	133	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2158	8c3dac9c-0702-495f-a9f4-298e8248d87a	Tunes	\N	9	133	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2159	ef60fa4c-1b13-4ec4-881d-e30b5b3b99b3	Cachopo	\N	9	134	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2160	539137e2-346a-438e-b529-0c9053230694	Conceição e Cabanas de Tavira	\N	9	134	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2161	05e34c74-81a1-4962-ada8-b92b132c1efa	Luz de Tavira e Santo Estêvão	\N	9	134	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2162	3ec67976-2f9f-4263-8b10-28ac37767432	Santa Catarina da Fonte do Bispo	\N	9	134	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2163	79f11dfb-80c9-43f8-898e-9fe7c83f5aa3	Santa Luzia	\N	9	134	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2164	36af7273-ba22-4e1f-99bb-8580e1446172	Tavira - Santa Maria e Santiago	\N	9	134	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2165	55894e59-0d1c-4318-a84c-6866f9d1d854	Tavira - Santa Maria	\N	9	134	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2166	64b66e98-ea9c-4f8f-9897-0cac9bf980ca	Tavira - Santiago	\N	9	134	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2167	25a10a48-09b0-4ba9-9860-a1175a1e4d3c	Luz	\N	9	134	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2168	7eba1884-715b-4a7c-ad48-07f41e7a991b	Santo Estêvão	\N	9	134	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2169	6c275f81-40b7-4db7-9ea2-18b0fb0f3521	Cabanas de Tavira	\N	9	134	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2170	197b0e3e-9caf-4b40-bf7c-bc8b0cde7ab9	Conceição	\N	9	134	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2171	854f08b0-743e-4751-9a3a-0eb9199cdc51	Barão de São Miguel	\N	9	135	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2172	25a72d25-a4b6-4f0d-86c9-79763a632288	Budens	\N	9	135	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2173	834cb085-cced-4f74-b59b-e3ddf88eb0a5	Vila de Sagres	\N	9	135	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2174	7662b07b-8658-43bf-9870-4b16ad26793a	Vila do Bispo e Raposeira	\N	9	135	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2175	9e7c8a57-2cd0-4474-b705-ec5a0d757bb1	Vila do Bispo	\N	9	135	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2176	cb7f3e15-15c2-41c8-848a-2c01ae47e25c	Raposeira	\N	9	135	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2177	f0dfcafa-1e27-4937-a932-4da75beebd79	Monte Gordo	\N	9	136	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2178	c32886ad-5232-4924-8aee-6a0651e7bef0	Vila Nova de Cacela	\N	9	136	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2179	7d55a6f1-a477-4d97-8cc3-d5f6488c5328	Vila Real de Santo António	\N	9	136	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2180	0b4c06f2-0833-4e40-ab46-96b06383dcc7	Aguiar da Beira e Coruche	\N	10	137	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2181	92f8f2c8-d369-4628-b1fb-30b55f18fec8	Carapito	\N	10	137	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2182	d322d73d-44f4-40a7-926f-dad9e69dcdbd	Cortiçada	\N	10	137	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2183	4e510138-c447-4241-813e-e6ec9f611971	Dornelas	\N	10	137	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2184	a397ae36-8e93-4bf4-9b59-9f8dc98b32ed	Eirado	\N	10	137	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2185	d9cb5da2-3218-4675-b0bb-43634724c09a	Forninhos	\N	10	137	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2186	0d90aa98-50ee-4452-a773-b9c35a33419e	Pena Verde	\N	10	137	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2187	442ce2f8-a848-4432-964d-3d20c4758ee5	Pinheiro	\N	10	137	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2188	5b4ace2b-7a80-4a2d-80da-2491884c1fbe	Sequeiros e Gradiz	\N	10	137	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2189	307c0f0c-271b-4c53-b0d3-69ab0abde733	Souto de Aguiar da Beira e Valverde	\N	10	137	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2190	d9b98088-04e2-4e24-a134-f387d9d57586	Aguiar da Beira	\N	10	137	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2191	40aeec2b-112b-49f3-a650-c0f6b394a38f	Coruche	\N	10	137	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2192	44f60b98-d754-4b4b-badd-2676b0e35db5	Sequeiros	\N	10	137	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2193	9e52b22e-9a90-47e8-ab24-dff3943f140a	Gradiz	\N	10	137	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2194	795ac1a8-15d3-4ad2-81c1-eed4373cd3c6	Souto de Aguiar da Beira	\N	10	137	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2195	a32c6e80-67db-4de3-a063-c6b1c47cf4c5	Valverde	\N	10	137	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2196	2dfdad53-2ad4-4a54-9088-8d4228858ed2	Almeida	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2197	a5d59c76-63e4-4f5f-95d8-2f5e1e04ee38	Amoreira, Parada e Cabreira	\N	10	138	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2198	e491437f-84b8-41e3-b167-40b464fb06fd	Azinhal, Peva e Valverde	\N	10	138	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2199	c15607ae-2dcf-4227-b149-95e0d8f43c4f	Castelo Bom	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2200	86dbe3e3-7ae1-4ce9-82dd-aa431d724fa0	Castelo Mendo, Ade, Monteperobolso e Mesquitela	\N	10	138	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2201	ecbe7d92-9dcb-40d4-914f-b15cdd6bcc17	Freineda	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2202	adf9c908-1bed-477f-a12f-1cacf8ec32e7	Freixo	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2203	01895890-52d4-4274-930f-495f4baef7b3	Junça e Naves	\N	10	138	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2204	dc5ebbc8-e09f-4df6-8662-7cd4c81f0d5e	Malhada Sorda	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2205	dad677c9-10bb-4359-ad9c-a5891e2e54d8	Malpartida e Vale de Coelha	\N	10	138	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2206	3ef01cb1-6824-4e00-85bb-1716cc00d6c6	Miuzela e Porto de Ovelha	\N	10	138	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2207	56987f41-78c5-49d3-8aea-f0aadd3d953d	Nave de Haver	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2208	1141e7e9-c0d4-4fb3-9af4-f9d5a28a457a	Leomil, Mido, Senouras e Aldeia Nova	\N	10	138	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2209	c8ab684a-91a9-4fb3-b628-1b60dfd28487	São Pedro de Rio Seco	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2210	a9f47a97-fe85-4353-8869-d0ea23724b5b	Vale da Mula	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2211	51a5ba67-641f-4667-b2fd-93f2a1432917	Vilar Formoso	\N	10	138	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2212	b11e19b8-1a98-44e4-8a6b-5e91e414bbd6	Ade	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2213	35cbfc07-75ee-40aa-bbf5-bf39c604969c	Castelo Mendo	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2214	fae62a7a-67cd-4224-9ef6-2804ecf08594	Mesquitela	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2215	ceeb4cd8-fa9f-4e99-966e-bf5d0c147c6a	Monteperobolso	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2216	5805eda5-774a-4ee9-b830-3f92ced68234	Aldeia Nova	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2217	8582518e-18e3-4438-becd-4735da47b3aa	Leomil	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2218	ce73eb11-cb43-4120-8ac5-c1ccf37bc3eb	Mido	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2219	11dddb55-c681-4733-9b50-0b1ec1a6551d	Senouras	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2220	18605f85-aa48-4b6b-84ee-dd40ecdb683e	Amoreira	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2221	0291ebf9-e522-4830-af4a-7e7ac97e6017	Parada	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2222	f0bc4784-e094-4de4-8ad4-bd01b5bdf612	Cabreira	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2223	451e1854-9c53-49f4-a98e-9726a9ff5016	Azinhal	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2224	4b6be96c-d29d-4df7-a98a-2b1450209864	Peva	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2225	65d321fd-2a52-432e-83fc-d2a18ee84635	Valverde	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2226	f6269f28-b524-4c65-8998-60d90fe3c8c9	Junça	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2227	e9e9f031-43d8-44e5-86a0-323962680f39	Naves	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2228	a1ebd152-44f3-44e5-bea9-3fd6cb52800e	Malpartida	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2229	90b84f66-a3ab-4810-a45f-d707fef76449	Vale de Coelha	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2230	97c6c78a-9d7c-413c-86ef-9146b1dd49c8	Miuzela	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2231	6b1d0171-859d-4560-b728-2adb3a11d010	Porto de Ovelha	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2232	a24b1f89-5b53-43c8-b67d-e5387910dfd1	Monte Perobolço	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2233	b7ad39e3-6a61-4534-8e92-07e0a52bb153	Vale Verde	\N	10	138	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2234	2ad8e98d-d933-46a9-b91c-12ffdd4e47e0	Açores e Velosa	\N	10	139	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2235	c4d635bd-b2bb-4a9f-8f80-db7d7a81c3be	Baraçal	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2236	0927a7ce-7ec6-4c4f-8fa8-c9da258b3816	Carrapichana	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2237	e73ce878-d46d-40f0-bfe3-a3027d99325a	Casas do Soeiro	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2238	8ae2069f-580b-496b-9b91-3d9c4b0cc048	Celorico - São Pedro e Santa Maria e Vila Boa do Mondego	\N	10	139	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2239	dfdb0d5f-1aa1-412d-891c-a34d49726e8e	Cortiçô da Serra, Vide Entre Vinhas e Salgueirais	\N	10	139	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2240	27ec6a61-2fa1-43ac-95f9-018d10707656	Forno Telheiro	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2241	5e369c10-6c58-4c43-8a84-d8828dc589e2	Lajeosa do Mondego	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2242	dc625de0-b0a9-4740-be76-ed21a0b0aefa	Linhares	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2243	4653713d-d76e-4b91-aedb-b50a82fc9f13	Maçal do Chão	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2244	f11e18fe-d2ab-4bf9-a43a-cbbed8f6cdf8	Mesquitela	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2245	b5137392-1b03-4d60-844a-8fd01df0772f	Minhocal	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2246	2f73915a-ffa7-4fc2-a516-3bb91ccbaf49	Prados	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2247	3e7d7182-98a8-4752-a7b0-c451a4c08291	Rapa e Cadafaz	\N	10	139	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2248	a2a984aa-655f-4e97-88db-ae2fe1f232aa	Ratoeira	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2249	91d3f8a8-b8fe-4cdf-8b4f-1a77cabb04fd	Vale de Azares	\N	10	139	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2250	759ee8ed-fff0-4aca-90c9-a558f9a05502	Açores	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2251	0401da0c-fdfc-4a0f-a337-c923a0776c81	Velosa	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2252	e050844a-ff96-4cde-9a6c-087ea02d3944	Cadafaz	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2253	0b5b4a22-60e3-4ce1-aca8-086f2e1ed802	Rapa	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2254	f494939d-2946-43cf-aa88-6368cc775ee8	Cortiçô da Serra	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2255	706b518c-c1cb-4eec-83b7-3a779ce01200	Salgueirais	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2256	f13459d7-b453-48b3-becc-cb7aa9cbcf3e	Vide Entre Vinhas	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2257	e14ce779-678f-4256-bc46-d4d389f0b87c	Celorico - Santa Maria	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2258	5ad4663c-5d45-4aef-92cf-0c0dce452930	Celorico - São Pedro	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2259	71017034-d41f-4c30-adf9-5fec786c1b58	Vila Boa do Mondego	\N	10	139	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2260	eb7f56d9-80d1-410a-8054-1d4d271bb890	Algodres, Vale de Afonsinho e Vilar de Amargo	\N	10	140	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2261	0bf78e73-26ea-4346-ba5d-da9b8093fb1a	Almofala e Escarigo	\N	10	140	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2262	03448b23-2008-473d-9c85-be222457bd5e	Castelo Rodrigo	\N	10	140	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2263	9fe6b658-e247-41c7-a091-45ff4f4c2c98	Cinco Vilas e Reigada	\N	10	140	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2264	7c81c6bf-4723-4248-987d-d6734c18d6e1	Colmeal e Vilar Torpim	\N	10	140	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2265	15e32016-8190-4794-90ca-1943667aceb2	Escalhão	\N	10	140	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2266	5304e4ca-3de5-43ce-ab94-8368ca485cfc	Figueira de Castelo Rodrigo	\N	10	140	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2267	10ec3974-364f-46fd-94a5-c25b80550610	Freixeda Torrão, Quintã do Pero Martins, Penha de Águia	\N	10	140	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2268	83ae1ad5-8456-44de-89d8-8b7dc3c7a8e6	Mata de Lobos	\N	10	140	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2269	4c8c76ef-3a2e-4fe6-8e72-3c8a931a0207	Vermiosa	\N	10	140	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2270	be23a1c6-4e9d-4d47-b699-0108373cad89	Algodres	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2271	0e98a7d3-6f9c-411d-8c17-086ce1872486	Vale de Afonsinho	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2272	84e1c188-cf44-4360-9d5e-bd9ce3e88da9	Vilar de Amargo	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2273	7756307b-07ef-4ad7-b060-a774faf7df60	Almofala	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2274	662f5a20-4415-4ce5-89df-5dfc8d123ada	Escarigo	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2275	a0ffa1bd-96c1-4687-aa80-14550b7c5480	Cinco Vilas	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2276	8f59e7a6-f99b-4295-9f5d-1b45dbb8ccf2	Reigada	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2277	b614beea-5f56-4e3a-aae1-53faa0dd2be5	Colmeal	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2278	6ab33b5a-e365-41f5-be10-a732bf4c35e5	Vilar Torpim	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2279	19582e56-21ea-4c59-a96d-ccdc96e280d2	Freixeda Torrão	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2280	0bb9a794-c550-48bb-b09b-e52dca96cd6f	Quintã do Pero Martins	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2281	8bc8b589-0424-462d-9abe-b964a7cfd407	Penha de Águia	\N	10	140	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2282	21d3557b-a832-44c1-bf3e-1835e006eae6	Algodres	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2283	332af2b1-8fb2-4c27-8646-6651c70435c8	Casal Vasco	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2284	42a8a240-2d94-46a9-bbac-2287dba22c9f	Cortiçô e Vila Chã	\N	10	141	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2285	c4d67ba7-9741-4e39-9cbc-a42098a9c62c	Figueiró da Granja	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2286	c188a9b7-6a48-470c-b970-67659502b1da	Fornos de Algodres	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2287	6f4c1de9-1cc9-4fea-907b-873026f9b54c	Infias	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2288	259018f8-8e93-404f-bb87-79f18affbb0c	Juncais, Vila Ruiva e Vila Soeiro do Chão	\N	10	141	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2289	b3270400-47cd-46e4-a918-52963ef4a422	Macieira	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2290	0460dd33-96fe-4488-a171-d24130066ca0	Matança	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2291	65e53913-2485-4e7b-9a04-2cb68f5a9f40	Muxagata	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2292	d12956be-bd92-4cab-9df8-b459c0187d3c	Queiriz	\N	10	141	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2293	38a16f2b-b943-49bb-b1ca-0f7ddd1a8521	Sobral Pichorro e Fuinhas	\N	10	141	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2294	712d122c-4f2b-41e7-8069-f51fea3e4758	Cortiçô	\N	10	141	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2295	ae21c216-5ab5-4e93-8063-3925ee99a750	Vila Chã	\N	10	141	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2296	052162d0-71f9-4fda-8c42-ae4121c7b223	Fuinhas	\N	10	141	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2297	64000af4-13a5-4609-a9e1-54161b70dfa2	Sobral Pichorro	\N	10	141	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2298	de6b7b53-b7cb-45a3-a48f-3f49424d9ce4	Juncais	\N	10	141	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2299	6a0faf04-105b-40fe-a841-911849148d9a	Vila Ruiva	\N	10	141	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2300	2b10151f-0b34-4471-b966-f7b74237e4ce	Vila Soeiro do Chão	\N	10	141	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2301	ca4ff402-0492-48eb-8dcd-0f9c08595b18	Aldeias e Mangualde da Serra	\N	10	142	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2302	e8534459-f6c0-43f8-8512-ef9073c56157	Arcozelo	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2303	c2e311d1-ea1d-4df3-9b2d-4fb24dce8017	Cativelos	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2304	6449f753-540c-4660-87b0-e9ad5c789d2a	Figueiró da Serra e Freixo da Serra	\N	10	142	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2305	7b520e75-5cba-49be-9c74-6755aeb7c517	Folgosinho	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2306	da9638cf-0017-4d08-ad98-ff106b7b7740	Gouveia - São Pedro e São Julião	\N	10	142	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2307	ae167d86-5865-47bd-b3f1-2169d61f42e8	Melo e Nabais	\N	10	142	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2308	90a3fef0-b662-4308-827a-a97df0895e9a	Moimenta da Serra e Vinhó	\N	10	142	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2309	23e94b91-d86d-456c-900c-6dd14b7a191b	Nespereira	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2310	e8d15f6e-e784-4c08-8c9b-4d76b7199b34	Paços da Serra	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2311	c0794f0d-95a9-4e16-a964-5af6564ddbe9	Ribamondego	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2312	e4b481a9-4533-49b4-991f-9d524b2413fa	Rio Torto e Lagarinhos	\N	10	142	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2313	88866287-462d-4205-9d04-042e05c4c842	São Paio	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2314	88b495c5-d9ab-48db-b38f-f4ee99213d70	Vila Cortês da Serra	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2315	0180f1ad-a6b0-4515-ace2-938d45c33667	Vila Franca da Serra	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2316	8fbed09c-5af9-433d-a88d-79358de3fccd	Vila Nova de Tazem	\N	10	142	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2317	18bd41d3-6664-413f-b04d-f0100e33ab8f	Aldeias	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2318	0534c48b-d93a-4046-aaa9-0624348f5233	Mangualde da Serra	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2319	83b045e2-9aa0-4efd-af21-ff9ba26080f4	Figueiró da Serra	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2320	c3c2ce0f-6a13-48d8-b5b6-96d9c4308470	Freixo da Serra	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2321	56faa534-a4db-4c13-93a8-9eed61fa3e55	Rio Torto	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2322	3dcd41b0-0c38-4f67-ab3c-3fce566a2265	Lagarinhos	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2323	2684c8a4-5b39-40ab-a72c-4c2409fc41ca	Melo	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2324	cf4b570e-1aae-4dca-ab3c-1d522df96a54	Nabais	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2325	c285bcd5-bbd5-4252-beac-44e12a908774	Moimenta da Serra	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2326	8b1a74c0-c5a5-43f1-b353-46a256468058	Vinhó	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2327	7b654366-f5d0-46a0-b769-9b42f8859ee0	Gouveia - São Pedro	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2328	45a6a55c-e2eb-4f0f-acb8-a7099be4fa94	Gouveia - São Julião	\N	10	142	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2329	7e8bc3a8-1170-4612-a5bc-6dc269341bf0	Adão	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2330	333e52da-0c55-48f4-ae67-e6356ba2a6b0	Aldeia do Bispo	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2331	de3ed2fd-fe84-48ac-a430-a34248df422a	Aldeia Viçosa	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2332	1df43a0e-5535-4aca-ae7d-dc836669b3db	Alvendre	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2333	57cb4a43-405d-4671-a6b7-175d80de5a92	Avelãs de Ambom e Rocamondo	\N	10	143	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2334	8b1a5a85-b797-4b8a-8e6e-8432d588f25a	Arrifana	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2335	892e9cf7-f735-4dea-8ecb-452986d8b062	Avelãs da Ribeira	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2336	6c72a500-4677-4c61-aa1b-e862cb6a3997	Benespera	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2337	28a39955-5eff-4856-888e-fbe2893925da	Casal de Cinza	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2338	fb2d9b57-a4d1-4879-9b12-6c8bcde561f1	Castanheira	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2339	eda24023-eeb7-4184-914d-08e33b22bf4e	Cavadoude	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2340	79426ed1-e669-4e2b-90fc-63d508035e4f	Codesseiro	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2341	0244e348-12de-4e83-aef9-e7c22c6eb7f6	Corujeira e Trinta	\N	10	143	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2342	5df0ec01-5265-48c3-90ee-0dcb3a7bbb6b	Faia	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2343	63cc7887-2161-44c8-8b35-919e89e3294a	Famalicão	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2344	472ed40e-fa8e-4d01-845d-c66323338aed	Fernão Joanes	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2345	12ae451e-6bfc-44bd-a782-0f483ed2d644	Gonçalo	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2346	e3d6e5aa-1241-40c2-9307-9e5d83fde04f	Gonçalo Bocas	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2347	784d241a-ae0a-412a-838f-4df1c531c35b	Guarda	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2348	b5cd0271-f2e4-4657-94ee-96f11a76f896	Jarmelo São Pedro	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2349	b07e2463-125c-412c-a35d-4a5c74eabfe7	Jarmelo São Miguel	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2350	1b5bcf41-ef05-403a-b6b8-3e88bddd1866	João Antão	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2351	2bef18a7-3999-41fe-a35b-d229769c9aac	Maçainhas	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2352	fe30f463-7423-4d56-a294-dbf858bbb723	Marmeleiro	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2353	d0c32daf-9cf9-4dc6-b7e4-4a9218d30132	Meios	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2354	6ec0290e-52e8-4717-bf64-3efe867e5d72	Mizarela, Pêro Soares e Vila Soeiro	\N	10	143	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2355	a795cf31-e636-4cc7-9312-6ee3200e5e7d	Panoias de Cima	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2356	0c8f5c61-a62f-42e5-90dc-c339d56ae7b2	Pega	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2357	7a8a73d2-6e6a-4ee5-8933-dd33b2f5722e	Pera do Moço	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2358	8a74d902-476b-4e0b-8bd8-3599575be00c	Porto da Carne	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2359	784dac2c-c4c9-445d-bdb9-570ae6cd6421	Pousade e Albardo	\N	10	143	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2360	4a77a86f-6fb7-4c3f-996f-29d18680dc6c	Ramela	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2361	3462598e-dca4-4a15-b606-85d1052ea483	Rochoso e Monte Margarida	\N	10	143	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2362	4b80ecba-3528-4bac-94b6-2c129543ff41	Santana da Azinha	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2363	c1b0ce1e-3089-4f80-915f-8b2398d27bec	Sobral da Serra	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2364	964ce16d-9258-4379-9898-df7670ae8e40	Vale de Estrela	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2365	ed9b017c-c93e-433f-b6d9-6c3f153435d4	Valhelhas	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2366	6d048d15-507d-4f2a-8275-6948dd3ede7b	Vela	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2367	1f7ed042-1558-4a0d-9061-5cbd83fd442b	Videmonte	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2368	043e7a85-15cc-4b42-b6bb-90246bb1cb0c	Vila Cortês do Mondego	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2369	f820ced2-fb77-4e67-b264-c7190328d31f	Vila Fernando	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2370	100db463-0a26-4013-b750-045cf6c60fe0	Vila Franca do Deão	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2371	3dbd2fb1-b7a4-4d13-946f-0f812a1c751a	Vila Garcia	\N	10	143	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2372	93404634-8127-43f0-a3e0-ed816cc5ca44	Albardo	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2373	bc014231-45d2-4b57-85b2-b5ef91fafd90	Pousade	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2374	fcafe85f-dff7-4ed6-8ec4-fdbfcfe79696	Avelãs de Ambom	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2375	c3de148d-d68b-4ffd-a8ac-4ee4920c2f9c	Rocamondo	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2376	6b1f6515-8874-4b47-b0c3-30329eed210a	Carvalhal Meão	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2377	74116227-5a3a-4a0f-b87c-80e239ab27b9	Corujeira	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2378	19fb5328-a669-4959-8ae8-4c9f1aa29ff9	Trinta	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2379	1bc19e97-7c9c-49c1-b148-2b0455e54fa4	Gagos	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2380	2d6e5571-abdd-44e4-a674-efeefc7ccf38	Mizarela	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2381	70e4e21a-b988-48b5-ba7f-39c105f856aa	Pêro Soares	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2382	4142355f-52fd-4878-9f95-8a3588103f77	Vila Soeiro	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2383	d2f9ee3d-2e7f-4c30-aa11-9b77f6dbb615	Rochoso	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2384	18d0a28e-e61b-45b6-8dd3-182b1b0fc911	Monte Margarida	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2385	e1e7f0b7-452c-43bb-bbea-40d31203cc31	Ribeira dos Carinhos	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2386	70e07a76-69ec-4ce7-bc18-8b9253af70af	Guarda - Sé	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2387	6b6eda9d-d84f-43c9-b378-6b4c2cca5410	Guarda - São Vicente	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2388	32dc066b-19d0-4dea-a264-c4dab7632345	Seixo Amarelo	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2389	acbb589e-d65c-478c-a5ab-3809ddf335f4	São Miguel da Guarda	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2390	3d7a457d-c0fe-4bcd-a53c-9b783d69e59f	Vale de Amoreira	\N	10	143	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2391	131b9386-d381-4615-9013-046b7dd20ce0	Manteigas - Santa Maria	\N	10	144	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2392	02133b4e-9563-4a04-84af-0d6a52e0a7af	Manteigas - São Pedro	\N	10	144	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2393	d7f1cbb6-c968-4e86-92ef-fe0accf53cb6	Sameiro	\N	10	144	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2394	04a4aad8-fba2-4ced-819a-74a3f39a1bc5	Vale de Amoreira	\N	10	144	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2395	b99681a2-6d9c-4bfb-b9b6-92a93572e0ad	Aveloso	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2396	7212f043-352f-4c98-b029-d240d62c36f7	Barreira	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2397	426d45fa-5a53-48d0-8257-9fd4892da542	Coriscada	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2398	5b538777-53df-40c1-bede-035239040bd6	Longroiva	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2399	a6cd917c-d740-4220-9ad8-31f7c249b96e	Marialva	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2400	e72747b1-1ce0-4e59-9480-53d1c1a6e5c0	Mêda, Outeiro de Gatos e Fonte Longa	\N	10	145	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2401	229779b0-5acb-470d-99ec-0d424e5bf127	Poço do Canto	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2402	eac0dbc3-50c3-4af2-9150-d49562df1dfa	Prova e Casteição	\N	10	145	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2403	6eadc9be-b155-4ad8-8b51-874dbb8e4c5b	Rabaçal	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2404	9ee7904b-76ab-4c87-b6e5-9349fbcd7e73	Ranhados	\N	10	145	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2405	de2aba3d-3e3b-4637-8761-8f73925118ed	Vale Flor, Carvalhal e Pai Penela	\N	10	145	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2406	8244b64b-b7ab-4e86-b83f-69c7ee724abf	Carvalhal	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2407	5a3727d1-ebf8-4f76-ae7d-3f41da04624d	Pai Penela	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2408	abffd98c-0bcd-4a6e-90ea-69f43f2917c4	Vale Flor	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2409	b67efe77-9e7e-4f40-baca-9d8b59ac7410	Casteição	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2410	fd814ec7-0ed2-44f5-bb42-e9235c890172	Prova	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2411	780e1e7d-10c9-42a8-8b1e-a34e27db7faa	Fonte Longa	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2412	df56b6c9-eaba-4790-b96b-ebbe369848e7	Mêda	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2413	4290f98c-da08-4227-b21b-d47340fed4c2	Outeiro de Gatos	\N	10	145	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2414	892f26fc-365f-4209-8515-6f0003c95ab4	Alto do Palurdo	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2415	34303368-0f87-4ec5-81ea-345e31b75db9	Alverca da Beira/Bouça Cova	\N	10	146	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2416	cbe4a6af-b9a7-46b3-9101-acaa8c360ec8	Atalaia e Safurdão	\N	10	146	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2417	dd1867bc-f55d-4c5a-9008-59db68113442	Ervedosa	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2418	3a523228-e919-4f38-b68f-73793c5c22dd	Freixedas	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2419	d9540c8d-afa1-474c-93aa-4716fdda0291	Lamegal	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2420	375bbd8b-27d7-4a36-a2ff-e7ac0dc3f510	Lameiras	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2421	d29edf46-166b-487f-9727-a79c99db046b	Manigoto	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2422	efb37eae-3f5d-4f2e-a1f3-078127a96bf1	Pala	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2423	7f13d5fd-37af-4648-8335-9078bc78f9b6	Pinhel	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2424	471ef815-ea30-44d5-8093-542694983890	Pínzio	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2425	8847ee40-8869-4197-ac62-b898b10bdb7b	Souro Pires	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2426	c7dd39ef-8e2d-4650-84fa-7beed7c2bacf	Terras de Massueime	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2427	45eb2584-c270-48a0-84b8-e8e3c59f2978	União das Freguesias Sul de Pinhel	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2428	ce759166-14ec-49ed-8a7e-1f94d88a52e5	Valbom/Bogalhal	\N	10	146	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2429	07f939fe-24ce-47b4-a6b1-4527406fdfac	Vale do Coa	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2430	5688096c-9877-47b8-9558-fc2e2ca42921	Vale do Massueime	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2431	6f7731dc-8de1-425b-9c1b-e234606f0bb4	Vascoveiro	\N	10	146	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2432	c534cbc2-6b6e-4b3f-b9e8-2462da035f72	Alverca da Beira	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2433	734305f5-d567-44c4-8531-0111dd04e594	Bouça Cova	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2434	4c4f8596-61cd-41d4-9167-6b1e8a1ca22f	Atalaia	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2435	71b69dc6-abd9-4d6a-96f4-5a02efa9c7ee	Safurdão	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2436	e0695663-3f4c-496e-b7ae-eaa0d483ac32	Azuvo	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2437	0cfc2112-d075-4b21-8a8c-61bda89eac3d	Bogalhal	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2438	1c2ba392-d987-489d-9661-6f414c5b1fde	Valbom	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2439	6e0d47b4-3e94-42b2-bfb8-c80c18ee19a1	Cerejo	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2440	f2ea466a-4901-41b2-b25c-dd89544dab4d	Cidadelhe	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2441	e1c3dc0b-b461-45d7-b55f-68666ae5d03f	Ervas Tenras	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2442	bf12d791-209f-4693-8177-337dec141c68	Gouveias	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2443	d756e90b-d710-461c-9663-bd87a4c777a4	Pereiro	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2444	5d10c232-30d2-4b52-812b-8d41739fb697	Pomares	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2445	8cd0160b-2130-4ccb-97e3-d9b78c55be59	Póvoas D'el-Rei	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2446	dd0fbe3c-8a03-47a8-a4ed-fdb7aaa7a9ee	Santa Eufémia	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2447	83b63a34-aa53-48ac-b20d-81c634a44ae3	Sorval	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2448	e01b7a0d-2435-4501-aedf-43ad25e5a81a	Vale de Madeira	\N	10	146	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2449	4176a76e-0da9-4d30-b3c0-7397f74571fe	Águas Belas	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2450	e523fa9c-c6ae-4e56-8681-e0bf3953aa66	Aldeia da Ponte	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2451	d7213453-9fa2-4074-9ef9-0235d60856fa	Aldeia da Ribeira, Vilar Maior e Badamalos	\N	10	147	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2452	3184be9e-60ff-44b4-9bc9-8c95c913c0de	Aldeia do Bispo	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2453	c9983688-64e8-4c48-992b-52089617a764	Aldeia Velha	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2454	5e0c17dd-be28-4eb3-9207-e2366e190de2	Alfaiates	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2455	9229d27b-e6ae-49f6-b2bc-830ef8d81ee4	Baraçal	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2456	4d0b219b-128b-4f09-8251-4d7288bc7985	Bendada	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2457	cf573ab7-1812-4848-bd4a-6565416b8902	Bismula	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2458	ab47a489-c1d9-4231-ad71-7959db791d73	Casteiro	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2459	446a3a7f-611d-45e6-97b5-0c0c528b02f2	Cerdeira	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2460	010ebd49-c6a1-4730-b93c-e3089c40dc61	Fóios	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2461	fc0ec843-1bf2-4c5a-bb2a-bf1382b8216a	Lajeosa e Forcalhos	\N	10	147	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2462	aa68b06d-34fe-4734-9317-a6fa15d1e5b3	Malcata	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2463	840a6054-97dc-449b-a3a0-fb9ff4112306	Nave	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2464	85e6dbaa-5240-4226-bf53-52d11b2a26a8	Pausafoles do Bispo, Pena Lobo e Lomba	\N	10	147	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2465	f9b7c7ae-0165-4fc7-b573-432681996a16	Quadrazais	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2466	7660132c-019c-49e6-8bab-9a9ae16ab3be	Quintas de São Bartolomeu	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2467	ec61e73a-1dcd-4308-ad58-f6639b06570a	Rapoula do Coa	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2468	7e0fcf42-ac1b-477c-80be-4813d57a7dbb	Rebolosa	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2469	76481ead-b0a4-48c3-ab3b-4236957c46c6	Rendo	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2470	8d9dbc11-acc9-400c-bc78-c01609a5b6fe	Ruvina, Ruivós e Vale das Éguas	\N	10	147	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2471	16052634-ed9c-4199-8708-4b46ba3e30b3	Sabugal e Aldeia de Santo António	\N	10	147	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2472	b4c2ec49-f175-4766-aa2c-0b4757ca7b49	Santo Estevão e Moita	\N	10	147	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2473	c9a3fec7-e525-4708-8308-e156e544e7e3	Seixo do Coa e Vale Longo	\N	10	147	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2474	f1bc0678-8c10-41e3-903e-3581f09f4ab8	Sortelha	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2475	016099e9-466c-42e3-81c8-726f56cea549	Souto	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2476	bb619185-9835-4580-92bf-18195a49cd26	Vale De Espinho	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2477	a6c55f71-961f-4806-9639-8c67b1774dd4	Vila Boa	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2478	a8f186b7-79a0-4281-9ed7-4761e3c1c972	Vila Do Touro	\N	10	147	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2479	549760ee-b176-4909-9379-ada2de5629f8	Aldeia da Ribeira	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2480	1df8f468-c1c3-4799-a7b9-bf204db6321f	Badamalos	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2481	6f140e72-83b3-4540-a566-156c116c16c1	Vilar Maior	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2482	8c8f22db-ae5d-4323-8e78-9e5aacaf81b1	Sabugal	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2483	edee677b-0e1c-4dab-80c4-8b56dc5f8a0f	Aldeia de Santo António	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2484	4f21c5e3-dc93-4421-bd76-264d56e7f90e	Forcalhos	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2485	945b262f-85ed-47e6-85d0-5b33a0bf5408	Lajeosa	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2486	ec445d70-5e5d-4e00-9da6-3b9637d187b4	Pausafoles do Bispo	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2487	a64c57aa-a356-49fc-a0e0-dadf87a8d834	Pena Lobo	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2488	818456ee-1c49-43fe-9deb-a2debdf0ffe7	Lomba	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2489	271a5997-1db7-476d-aaa8-5d900429487f	Santo Estevão	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2490	d4101bfe-33d9-46b1-874f-49449d21c1e0	Moita	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2491	b5837050-83d6-417b-9bee-9ec2e56341e1	Ruivós	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2492	f0cc7a92-db1e-4505-9a42-5e464236240e	Ruvina	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2493	7c32ceb4-e4e0-49cb-ac7e-bc49ec6e930a	Vale das Éguas	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2494	9069c921-1dff-4bc4-a8ff-74d4f1273529	Seixo do Coa	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2495	65d540fa-e023-411a-ac44-49ed15a2526e	Vale Longo	\N	10	147	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2496	10b0888b-73b8-4bd2-8a4c-b141f3bd31c1	Alvoco da Serra	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2497	cbb39520-a9c3-45de-a905-c0062d4d13f9	Carragozela e Várzea de Meruge	\N	10	148	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2498	2ceab4f4-d417-4a47-ac62-1383f2c107bd	Girabolhos	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2499	df513534-40ea-4eef-accc-358e8c02f3b4	Loriga	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2500	2e1154b3-cc9f-4f18-9060-8635195a71c2	Paranhos	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2501	0c0bbde5-2676-442d-96ef-6fa8658bdf9e	Pinhanços	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2502	8691c864-6e2d-492f-97b4-462393d6039b	Sabugueiro	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2503	754bc370-98f6-4b6b-8ab0-7cf716a68175	Sameice e Santa Eulália	\N	10	148	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2504	655e360e-e029-4fad-b590-66ff0011a349	Sandomil	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2505	a25934e4-124a-4d47-b77c-45e8394ef098	Santa Comba	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2506	d00ea31b-8a28-483f-97af-16f706142740	Santa Marinha e São Martinho	\N	10	148	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2507	fdeb1de7-8b0e-4797-a1a9-10fe9d1602fa	Santiago	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2508	e922ab1c-5c09-47c6-a3dd-a4ee7ae16bfe	Sazes da Beira	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2509	ec7b74c7-9265-49dd-bbc5-7342c3468dd3	Seia, São Romão e Lajes dos Dinheiros	\N	10	148	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2510	0a21b360-76cb-4150-88af-05ecb1a2966d	Teixeira	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2511	cb60fad6-5048-46d1-83a3-f699d7739272	Torrozelo e Folhadosa	\N	10	148	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2512	32b688c2-d4a3-4820-80a9-7572f153bbb7	Tourais e Lajes	\N	10	148	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2513	a3078a48-2b69-468a-82b6-cd04139d7de0	Travancinha	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2514	0cd92ce3-0c45-4ead-96f3-fea5f033160c	Valezim	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2515	a3cb8064-01b9-4ba1-8c51-28139cdae85b	Vide e Cabeça	\N	10	148	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2516	cde2fb8e-b525-438c-b51a-9cbbaf61f8ad	Vila Cova à Coelheira	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2517	aecbb1a2-f33d-4bbc-8ba5-96929b43d48b	Vide	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2518	e1340690-b8b3-40dc-b977-b4fbacd16a62	Cabeça	\N	10	148	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2519	b763f8d7-c63d-44e6-9296-034d1dd51035	Carragozela	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2520	b9fcd28b-a30d-4a58-8caa-729820841c4a	Várzea de Meruge	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2521	b16681ff-7829-421c-864a-4c58127ce4fb	Torrozelo	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2522	79b1b124-3ba3-4b19-aefb-5cb4b35073c5	Folhadosa	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2523	d1632571-d2a5-4d33-9224-07580b284e1b	Tourais	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2524	4e23d906-6238-44be-8e87-2d6c2e7229e5	Lajes	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2525	750869e7-6be9-4cea-8e01-ae04103a94c8	Sameice	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2526	dd7225d7-006f-4f28-a327-326265215561	Santa Eulália	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2527	59416ff2-891a-42d6-affc-12b04e7b0048	Santa Marinha	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2528	5bae8deb-32ba-43dd-abfb-2e0a508b8478	São Martinho	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2529	b8f8fbe7-d009-44ff-8d04-8d1da8e4252b	Lajes dos Dinheiros	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2530	187044b7-41e2-48f6-8cd5-fc0ea09ddfb3	São Romão	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2531	6cd895b4-4513-4906-aabb-026955532a77	Seia	\N	10	148	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2532	a9b333c8-8b95-47e4-9d73-6f4638b672c2	Aldeia Nova	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2533	6da9ea43-be7f-4f7d-9dc7-e5fa4d4aff95	Castanheira	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2534	704b756b-2182-4d0d-bc88-817e97f1f58f	Cogula	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2535	1314a83b-d4c8-4840-86f4-27f9590151a9	Cótimos	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2536	132bd1d8-f2ed-4a5e-8822-e1189aa12ece	Fiães	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2537	39cc2002-144f-42cb-b96a-ba7b05016ca6	Freches e Torres	\N	10	149	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2538	f17ffa44-c7c4-4775-867c-4dcaadf49c13	Granja	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2539	e9422465-67e9-45e3-8f3e-7acbdcde60ef	Guilheiro	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2540	cca7e344-85e0-485e-9774-f3e0a9ad436f	Moimentinha	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2541	daaf4b8a-dbd5-4c8c-bfd8-650270045db8	Moreira de Rei	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2542	e34d7153-6c75-4ad6-8a9d-3c5e083d2d33	Palhais	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2543	cd8fe904-8f42-434d-be7d-67b789f6083b	Póvoa do Concelho	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2544	c802b397-7811-42f1-82d9-b23891a166aa	Reboleiro	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2545	e0fd263e-582a-4a57-b957-1ea08873834d	Rio de Mel	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2546	402d623f-2913-4227-af85-2a9ef9739bec	Tamanhos	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2547	4f818325-55b7-4299-82b0-1389b791931e	Valdujo	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2548	dfda493d-0f49-40a3-a572-2b54a1aa9bc2	Torre do Terrenho, Sebadelhe da Serra e Terrenho	\N	10	149	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2549	f3301740-d776-43e6-8411-f0e9cae7f173	Trancoso - São Pedro e Santa Maria e Souto Maior	\N	10	149	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2550	07f108d3-d96c-4e03-86fc-53fdfbf1fbce	Valdujo	\N	10	149	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2551	289294fb-50d9-457a-9634-6564409a9839	Vale do Seixo e Vila Garcia	\N	10	149	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2552	583e8a5c-8b69-4c59-8e8b-b31d702adede	Vila Franca das Naves e Feital	\N	10	149	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2553	bcafc054-e027-46f9-a2f3-059a06255850	Vilares e Carnicães	\N	10	149	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2554	a7ddad19-67e6-46b3-ad80-7f77c4632c6f	Carnicães	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2555	6217c78e-6498-49e3-bc79-0012e5c09973	Vilares	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2556	b7b33058-8d14-462b-9c5b-809e7e688b9c	Vila Franca das Naves	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2557	50a3428a-c34f-48ef-a685-9c96dd0f11e7	Feital	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2558	fafe0ab2-19cf-46df-ac64-174eff10938e	Freches	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2559	41fd45f1-e53f-4daf-8729-e2c71790cc1d	Torres	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2560	b4218b48-efc9-457b-8b2a-347e603d2ad1	Trancoso - São Pedro	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2561	77a8d7bd-e70e-4510-9b84-9ef028a7d0cc	Trancoso - Santa Maria	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2562	cca66b77-aab7-4df7-b756-a888bf0a63e0	Torre do Terrenho	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2563	bb57c2b6-591a-4112-aec7-d08213015695	Sebadelhe da Serra	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2564	6a5b46dc-8d09-44aa-ad0c-bffb844a7e07	Terrenho	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2565	0fff50d6-ecc1-41de-abfe-461bfbd7497f	Souto Maior	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2566	855dafd5-d15f-4fe1-bec7-9356344b20d6	Vale do Seixo	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2567	32b3d41e-557d-46ea-9ee4-539c5ab34f55	Vila Garcia	\N	10	149	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2568	2700986f-148d-453c-b03c-8549714a156a	Almendra	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2569	5388e6ea-a9c9-410a-a43e-be09ec9cd29d	Castelo Melhor	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2570	bade25f6-39ac-478d-99e8-b5524cbb89a7	Cedovim	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2571	d577a3e8-e623-4883-ac63-4b40d9231370	Chãs	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2572	55063a83-1baf-434d-b0dd-ab485b491479	Custóias	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2573	d17a71fe-02ec-44cb-a2b3-85fbac0dc1d3	Freixo de Numão	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2574	951c5455-2775-4c8d-8049-204ec90d7271	Horta	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2575	d4e0edf7-f05c-47cd-b43d-78e29455aa3e	Muxagata	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2576	b837b962-1e5a-46bf-9537-0fadffc72999	Numão	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2577	fa314bd8-1442-4770-a751-c8588c918825	Santa Comba	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2578	bc5aac0b-c63e-46d7-8edf-d42e1bbde235	Sebadelhe	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2579	8b658519-0c6a-4d53-b70b-6efaedec9820	Seixas	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2580	d0fa8e77-2600-494c-81f4-90c21e634f80	Touça	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2581	96debc0b-1db2-497e-80a6-f51e761eb211	Vila Nova de Foz Côa	\N	10	150	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2582	f94aa61b-ae80-450f-af79-81c85de4c248	Mós	\N	10	150	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2583	644cee9e-0286-4d10-9863-a64377cea513	Murça	\N	10	150	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2584	c515e77a-6974-42bb-8f7d-95ff493cc38f	Santo Amaro	\N	10	150	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2585	3fd058ee-6e00-4aa2-95f2-4ce02020058f	Alcobaça e Vestiaria	\N	11	151	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2586	1ddf6ffb-ef9b-4245-83cf-d8b335d97d44	Alfeizerão	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2587	dd83e404-66a1-4ac9-9eed-d0a6b16e5f1a	Aljubarrota	\N	11	151	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2588	cf022532-5b5f-4f11-b0b3-0449ea084fc6	Bárrio	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2589	0f6f0d68-dbb5-426e-a1a4-8963deff1061	Benedita	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2590	9d610273-1d68-44fb-83a3-8c2675095f32	Cela	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2591	815362a3-f944-4a1c-94f9-85e7a7182b38	Coz, Alpedriz e Montes	\N	11	151	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2592	7d6a7c05-2038-4a5d-8b41-095cff76c55b	Évora de Alcobaça	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2593	22a16363-2458-43fe-b070-81c90579f45a	Maiorga	\N	10	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2594	6957194b-4551-4137-892e-f5732854d971	Pataias e Martingança	\N	11	151	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2595	92ca90f0-5160-4f64-83db-30e326fda10b	São Martinho do Porto	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2596	481565f0-77b2-4a30-af22-0516cddf53e6	Turquel	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2597	3655fdfa-959e-49f4-b892-6f14f70b75fc	Vimeiro	\N	11	151	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2598	445c1603-e55d-434c-80fd-bf966bc7e4c7	Alcobaça	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2599	a306c750-8a3a-4e21-83d5-d0944d7e55ee	Vestiaria	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2600	46d1726a-0721-498b-be23-49dc40a6d25d	Alpedriz	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2601	b8c73f00-cf32-46cb-8257-5e5f42e1f8b2	Coz	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2602	e1aeb08d-c1f3-4fd5-baaf-c91bc8794069	Montes	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2603	6d82c7b4-9dc2-4e39-a589-fa00cca44c4c	Martingança	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2604	062b626c-4d69-46c9-8544-aa6e9c29ad96	Pataias	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2605	d685636f-b376-4b16-92c6-11537da18704	Aljubarrota - Prazeres	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2606	2c60d5d9-56f7-4d77-997c-f681c8ef126c	Aljubarrota - São Vicente	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2607	f24357cb-b74b-49e2-a641-27685fc7cef4	Moita	\N	11	151	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2608	64508f61-cb2c-49c1-ac66-435189e30845	Almoster	\N	11	152	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2609	db1cadb6-fae4-4a4a-8719-33245692f22e	Alvaiázere	\N	11	152	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2610	3404ec64-8472-4693-bc62-89169ff03b35	Maçãs de D. Maria	\N	11	152	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2611	1197674f-4bb4-4a3b-bb18-2683b5e66acd	Pelmá	\N	11	152	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2612	9190ca70-d339-4330-a2ce-c3adefd6b2f2	Pussos São Pedro	\N	11	152	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2613	8cd64ef6-04e5-4f96-beca-471e93871294	Maçãs de Caminho	\N	11	152	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2614	a5eb05ab-ce19-4793-9440-ddb420ac9aba	Pussos	\N	11	152	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2615	70ad1ed3-9ef7-4438-9d69-d4fb62a516c2	Rego da Murta	\N	11	152	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2616	4eaca7b6-9b0e-456d-a79d-588d8ffcaf6c	Alvorge	\N	11	153	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2617	6c7c9c2a-8e5e-475c-8ee3-96710de24aed	Ansião	\N	11	153	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2618	9ed11c14-f6da-4d35-8fe1-93fb00942d52	Avelar	\N	11	153	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2619	3613ebcb-435a-4fb6-8e0e-cf8da103da90	Chão de Couce	\N	11	153	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2620	d8aff0bf-651b-4148-afd3-b93cb232a215	Pousaflores	\N	11	153	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2621	8299437a-5fd0-498d-aade-fb4c62b4681e	Santiago da Guarda	\N	11	153	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2622	d4aacb27-9e30-4fa5-b426-6ed1d8736d5b	Lagarteira	\N	11	153	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2623	19ea72df-b3b3-4633-a2f6-2e878261bd63	Torre de Vale de Todos	\N	11	153	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2624	99262f98-92c0-4dc4-8090-a4a9509c78b9	Batalha	\N	11	154	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2625	01208f7b-d2a4-4872-8615-42a3d8e148a5	Golpilheira	\N	11	154	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2626	603bcadc-4c24-4797-afbc-d334bc76e75d	São Mamede	\N	11	154	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2627	e2bfd8fd-1d77-402c-988d-767c0391b0cf	Reguengo do Fetal	\N	11	154	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2628	a802d37c-da40-46c5-9c87-0b81e2a8003e	Bombarral e Vale Covo	\N	11	155	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2629	d3cf193f-8b73-435e-9586-04f1833150df	Carvalhal	\N	11	155	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2630	3f909353-4351-4e01-95a6-9f1a6255925c	Pó	\N	11	155	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2631	bfe3cd4d-90eb-4e21-8b0e-0003428a1472	Roliça	\N	11	155	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2632	178fec5b-5ee3-40b1-954c-bce4c2fc2aa5	Bombarral	\N	11	155	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2633	d3c1a11e-8de0-440d-ba1c-ec2eba6d21a9	Vale Covo	\N	11	155	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2634	b3c88f00-e105-402e-9f9f-ac1d04cc1316	A dos Francos	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2635	6cdfc5ae-c45e-4cd0-9286-bfe0842cad40	Alvorninha	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2636	32394982-535a-4fd2-9558-818b35213a53	Caldas da Rainha - Nossa Senhora do Pópulo, Coto e São Gregório	\N	11	156	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2637	e4229049-a2ce-4ed9-921e-7a5df58762d7	Caldas da Rainha - Santo Onofre e Serra do Bouro	\N	11	156	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2638	4567265e-e1df-412c-adea-e905b9786d97	Carvalhal Benfeito	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2639	0e6ca491-6b15-4978-b8c9-e8e490173987	Foz do Arelho	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2640	4f3fed9d-8e26-46d1-a80a-aa0ea8945f99	Landal	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2641	f9c85523-a6dd-4ece-bec7-6d11ababf6fe	Nadadouro	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2642	b10ab333-1a2d-4f53-b2d7-32e6c1ff5aa6	Salir de Matos	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2643	264ba9a0-fcf1-4fb7-aaaa-4bacbfc1bfe8	Santa Catarina	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2644	dfb7bec7-5145-47c8-aaca-96497962f0e9	Vidais	\N	11	156	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2645	dafcf787-bf4e-43be-a078-2be677d00df8	Tornada e Salir do Porto	\N	11	156	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2646	f3a212ad-f5a0-4f59-8a2a-0c263282b984	Caldas da Rainha - Nossa Senhora do Pópulo	\N	11	156	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2647	f091d58f-a383-4a69-8846-8020814a9e84	Coto	\N	11	156	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2648	2bb3abcd-a30e-4d12-9244-a49efedfb4e6	São Gregório	\N	11	156	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2649	58fa37c5-87a5-4c8b-b5d6-db1875d2db09	Salir do Porto	\N	11	156	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2650	958ff596-b7f0-4f9b-a404-7ff4b56fa4da	Tornada	\N	11	156	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2651	3a97c01f-d146-4ffa-af1a-84534b7c0738	Caldas da Rainha - Santo Onofre	\N	11	156	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2652	551299c1-e310-438f-86b5-7c3e68b8afcf	Serra do Bouro	\N	11	156	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2653	e60be2d7-9e87-4239-b084-0d0347ab6493	Castanheira de Pêra e Coentral	\N	11	157	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2654	1054163d-a54c-4f37-97cd-cbe9420b9ee9	Castanheira de Pêra	\N	11	157	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2655	98289bae-3b5e-4ca3-80ce-c87d0a47e938	Coentral	\N	11	157	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2656	7a1dc13e-7919-4850-a054-82acfd8c9713	Aguda	\N	11	158	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2657	fadfcb98-f334-4d0d-ab64-f1f9724283ed	Arega	\N	11	158	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2658	68a0b072-ce7c-4ac4-8b13-6a6043d4f3c5	Campelo	\N	11	158	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2659	6c3cd194-a545-49fb-8166-b17c8918e05e	Figueiró dos Vinhos e Bairradas	\N	11	158	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2660	58cc9606-cbbd-4a6e-8922-4d72aab50dbe	Bairradas	\N	11	158	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2661	8718f08c-a037-46b9-8d68-4aa9ea19f6d3	Figueiró dos Vinhos	\N	11	158	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2662	6e0e3f3d-6d30-41f1-ad15-79fab13becb7	Amor	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2663	8c38cae6-090f-4384-b4c0-ba292c260081	Arrabal	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2664	c72f68e6-c3f6-4bb4-8acf-0f84a842ade2	Bajouca	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2665	5dd36b80-f602-465c-b7e8-8bc4668f015d	Bidoeira de Cima	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2666	82640812-8226-454e-bcf9-1c9e48879439	Caranguejeira	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2667	2b8c9616-a01d-48e3-b776-74dcbdc9f22f	Coimbrão	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2668	e0c57a4b-061f-4c6c-b5a1-828c894530ca	Colmeias e Memória	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2669	36793f00-55eb-44a0-bcc3-a46b9f60d892	Leiria, Pousos, Barreira e Cortes	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2670	4439feb1-dc21-422d-b4b1-caefbe8c837c	Maceira	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2671	a34610ea-643d-4d0d-8e67-d5a48abf048e	Marrazes e Barosa	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2672	d2e6157c-0bd6-482f-adb5-b5912bc8dede	Milagres	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2673	9ef7bd2f-6aa8-40e3-9e9a-4442c2090965	Monte Real e Carvide	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2674	c516b3ff-d19e-4698-b321-35a361bb4f12	Monte Redondo e Carreira	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2675	39453769-d446-427e-990f-c945882cb773	Parceiros e Azoia	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2676	7ebd9e90-7896-4172-9f38-52526a71ec04	Regueira de Pontes	\N	11	159	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2677	b96444ea-cfa7-4256-a92d-1ceca36918c2	Santa Catarina da Serra e Chainça	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2678	285a2f91-0647-4e5d-bce0-47aef65674fa	Santa Eufémia e Boa Vista	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2679	3e307834-3340-4636-b96b-e8a3a62c228f	Souto da Carpalhosa e Ortigosa	\N	11	159	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2680	58de7930-a602-406a-9075-6139188752b9	Azoia	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2681	df85bec0-a5d6-49f2-b9cb-5fe529177dae	Parceiros	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2682	fbf1e201-4989-403c-a700-ae2f5d350adb	Barosa	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2683	da42f29f-4a54-4114-b381-32bc5a86f086	Marrazes	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2684	6799420c-bab1-4a88-ae75-25dc61cd652e	Barreira	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2685	78c53210-d40f-46cd-a2cb-b0c6929c4e48	Leiria	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2686	57ab7b77-c8f8-4535-9c36-09857c48ee38	Pousos	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2687	4199bccc-cd53-4c9e-9b38-7661fbda0515	Cortes	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2688	955bfca2-3b69-431b-822c-a18b8924a8ba	Boa Vista	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2689	d88919db-78df-4cc8-acb2-08d11401fde2	Santa Eufémia	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2690	b694f243-6530-4a57-9264-bc27a7b92890	Carvide	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2691	683a1536-211b-4de8-afc3-fe750846efb2	Monte Real	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2692	cccb3793-1407-437c-83f6-014605e6c919	Colmeias	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2693	e7d81561-581f-4996-87fa-4d356c3c5e47	Memória	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2694	50e4f690-70ca-4572-9a85-beb53aa8cfc0	Carreira	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2695	17d49685-d984-443d-8582-73ba151647ac	Monte Redondo	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2696	4ac62646-da21-443a-85f3-484c1d724298	Ortigosa	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2697	5e843901-197b-4dfc-a0d5-ed55a72fbbfc	Souto da Carpalhosa	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2698	1f2e40f1-0b36-4697-989b-28480ea01b7a	Chainça	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2699	e175f4e1-783a-4549-a9c9-81e83efcbce9	Santa Catarina da Serra	\N	11	159	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2700	9ff01706-ccc8-4349-bf26-178c4046cc2d	Marinha Grande	\N	11	160	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2701	603c4932-a13b-45bd-9bd8-7aef0228245d	Moita	\N	11	160	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2702	8816f321-5cdf-47ad-ab17-df9d47f5378e	Vieira de Leiria	\N	11	160	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2703	0cd0745c-be81-4766-b14b-eba012233609	Famalição	\N	11	161	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2704	da985e88-1f3d-4baf-886f-2756aeaee411	Nazaré	\N	11	161	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2705	11e26ba1-aedb-489e-83e6-08ab18a89fa4	Valado dos Frades	\N	11	161	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2706	ed84fbf2-b997-40a8-9bf3-df98564025fd	A dos Negros	\N	11	162	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2707	1ee9383d-8122-498f-951f-515c55791eff	Amoreira	\N	11	162	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2708	3abdf8c2-e963-4b51-8f1a-aeaa3ca4efb1	Gaeiras	\N	11	162	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2709	07fe70c5-0d61-4938-991e-9211078086c1	Olho Marinho	\N	11	162	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2710	817a2049-0abd-49b4-8450-f7e7b1e86f0b	Santa Maria, São Pedro e Sobral da Lagoa	\N	11	162	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2711	5b8b5f86-2b70-4ae4-8533-afa6357e2134	Usseira	\N	11	162	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2712	35490273-1e4e-4659-b194-4fac6172061b	Vau	\N	11	162	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2713	e060ee96-ae5b-4075-bfb0-272467b2965e	Óbidos - Santa Maria	\N	11	162	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2714	fb6abdf7-893b-440a-8e21-fb63e304a935	Óbidos - São Pedro	\N	11	162	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2715	8eaf5a7a-5588-4bb9-8d2a-558def0cc404	Sobral da Lagoa	\N	11	162	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2716	4d03177a-0e10-449b-9ae0-c1524630c1b6	Graça	\N	11	163	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2717	610d5e79-ad5e-4f2a-867a-0717005d1e9f	Pedrógão Grande	\N	11	163	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2718	338ba481-4bd4-4e19-9b1e-902f13feb2db	Vila Facaia	\N	11	163	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2719	0a9d4a2b-9e6a-4e81-9805-6e11b400c2e7	Atouguia da Baleia	\N	11	164	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2720	c5d5b083-fcc6-41f9-8953-eaa66c5ea708	Ferrel	\N	11	164	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2721	9e1ada80-2b7b-48de-8d95-42ea58e2a188	Peniche	\N	11	164	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2722	90169324-a8cd-46bd-854a-284002af004c	Serra D'El-Rei	\N	11	164	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2723	dc92fa12-1c43-47a0-abce-a654c03b9f09	Peniche - Ajuda	\N	11	164	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2724	68f7ab08-070e-498e-b75c-64792516ad46	Peniche - Conceição	\N	11	164	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2725	2d150229-3a4c-41a3-b2d1-0b27f0160106	Peniche - São Pedro	\N	11	164	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2726	699cf949-4c10-4e59-bef3-c8d492ff797d	Abiul	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2727	1267d9d6-ca79-42af-a440-01f4f3e354a1	Almagreira	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2728	cf1f6211-c2f7-4b8b-8547-055177fc092b	Carnide	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2729	5c921b71-3383-40c7-8bbf-bf3b08ec90f2	Carriço	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2730	94230d29-e15e-4ddc-ae0a-ce5d71927037	Guia, Ilha e Mata Mourisca	\N	11	165	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2731	8f6cc51e-d37c-4f52-badd-bf137db119a6	Louriçal	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2732	31306220-0c60-44ba-a886-9591fc319c1c	Meirinhas	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2733	ce04dfdb-c5d6-4efd-908c-04eccaaa5b2a	Pelariga	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2734	6f519ba3-5cd4-4c63-8954-951ba59fe924	Pombal	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2735	b160c839-3b62-4d20-ab3e-f8ef64906172	Redinha	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2736	b65ab9e4-270e-434b-8641-4f4ce0f50514	Santiago e São Simão de Litém e Albergaria dos Doze	\N	11	165	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2737	eef98532-7add-404f-a343-49ecf5cb53e3	Vermoil	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2738	7fa35ebc-136f-477a-ae7b-6e6400b3a450	Vila Cã	\N	11	165	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2739	c00c14f5-3075-4b46-9fe2-d1f490faa3f9	Albergaria dos Doze	\N	11	165	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2740	6e03e021-3037-4faf-a47d-eda23a485d78	São Simão de Litém	\N	11	165	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2741	26be6c24-ca76-49b3-96b1-adb1dafb2efa	Santiago de Litém	\N	11	165	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2742	49b1178a-6871-4cfe-b059-974cba41eb4f	Guia	\N	11	165	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2743	f4e39e69-3e29-4692-bb85-f78afe202eaf	Ilha	\N	11	165	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2744	bac6e0a3-4297-4a9e-972c-a5576de4326e	Mata Mourisca	\N	11	165	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2745	815bac47-f195-40a2-ba9f-0dfda0fcebe9	Alqueidão da Serra	\N	11	166	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2746	208206ac-567e-4446-b47f-bbc8528ef8ba	Alvados e Alcaria	\N	11	166	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2747	c66c11ed-81e7-4ff9-871f-59b1228d6a5b	Arrimal e Mendiga	\N	11	166	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2748	69536233-3bb6-4fbf-95b4-bc81062bb0c0	Calvaria de Cima	\N	11	166	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2749	e90c2dfe-2e97-4cfe-bfd8-e5054abf489b	Juncal	\N	11	166	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2750	8b3ffcd2-8711-43be-aeec-b421890b1d39	Mira de Aire	\N	11	166	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2751	943510e8-57e6-49e5-87d2-f6aee16f76d0	Pedreiras	\N	11	166	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2752	beccf9a1-69f7-46b4-a56a-78918aee39bb	Porto de Mós - São João Baptista e São Pedro	\N	11	166	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2753	c0ff0577-b4f9-4261-99f7-7f24102f34cd	São Bento	\N	11	166	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2754	ab9f30a9-c035-41ea-97d1-4cf6ddb3ab04	Serro Ventoso	\N	11	166	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2755	7c7f0b75-c215-425b-8b84-6a7cb809daa8	Alvados	\N	11	166	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2756	14465766-db76-4a8e-8232-d10174ab75ca	Alcaria	\N	11	166	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2757	d2fd1475-6f9d-4199-b1f8-8571eacc43bf	Arrimal	\N	11	166	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2758	bed28342-abcb-4816-af77-b62f95ad3618	Mendiga	\N	11	166	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2759	4250374d-eaad-4927-8953-44ab68445e2f	Porto de Mós - São João Baptista	\N	11	166	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2760	25b56602-53eb-4a10-a5e4-5f6d3e1d7cc6	Porto de Mós - São Pedro	\N	11	166	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2761	3e28029e-413d-47ae-95cb-a5331cccadf4	Abrigada e Cabanas de Torres	\N	12	167	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2762	1eb2722f-fd8a-417c-9bb0-c67d3243e309	Aldeia Galega da Merceana e Aldeia Gavinha	\N	12	167	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2763	e53cd537-8e43-4084-abee-d4eded8f18cc	Alenquer - Santo Estevão e Triana	\N	12	167	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2764	6a7c01a6-9a46-4ab5-ba75-e10a68952c82	Carnota	\N	12	167	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2765	6310d08d-730c-4a6c-a6f7-48bc7beee89b	Carregado e Cadafais	\N	12	167	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2766	86b35ad0-022e-4127-9eba-2293cb7957fa	Meca	\N	12	167	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2767	126de9a8-3c09-4af0-afd7-e630e4d95e0a	Olhalvo	\N	12	167	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2768	a70b3bd1-367c-4cd5-988e-cd3b18940b55	Ota	\N	12	167	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2769	f18febea-e28c-4925-8c46-42d4a11a42ba	Ribafria e Pereiro de Palhacana	\N	12	167	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2770	bfdd0269-14bb-4e51-8dc5-360fdb4b89c3	Ventosa	\N	12	167	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2771	b7a34fd5-d28a-4f6d-849a-2370d5f8201b	Vila Verde dos Francos	\N	12	167	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2772	f0dd53fd-1125-47ec-b907-5456bbd6b50a	Abrigada	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2773	b69e27ac-d13b-4549-a1cb-a3c82567e36e	Cabanas de Torres	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2774	8ca82eab-0d50-46f8-b055-858218f13ebd	Aldeia Galega da Merceana	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2775	3ff2121e-6031-4a3b-8753-e4a8746b9e88	Aldeia Gavinha	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2776	c0d8f944-e8e7-4c8a-af1b-828d3a9c005e	Carregado	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2777	65471288-a1f9-4815-a9ef-9f35e28da739	Cadafais	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2778	d709780f-bac1-4858-b26d-192a5d36543f	Pereiro de Palhacana	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2779	d8ab798d-b62c-40a7-a308-d17892cc401c	Ribafria	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2780	a919a7c9-f09c-40d3-86df-856dbe213b45	Alenquer - Santo Estevão	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2781	1569681e-4dd4-4d59-953a-69f944534b9e	Alenquer - Triana	\N	12	167	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2782	52332793-23e1-4723-bac3-7521c0d04fed	Águas Livres	\N	12	168	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2783	57f64c53-c687-48fe-aef2-40ed70c33618	Alfragide	\N	12	168	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2784	b8c91cc7-aa18-4fab-8b18-e9e58adbec32	Encosta do Sol	\N	12	168	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2785	6ab997ef-25d7-45c5-b262-96a070421c76	Falagueira-Venda Nova	\N	12	168	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2786	0ad454b6-dd19-44ef-8290-922d9822166f	Mina de Água	\N	12	168	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2787	0b9880d7-8b00-4601-b497-f15e1ddc0c76	Venteira	\N	12	168	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2788	f2109eb0-df33-42f8-a41b-a73bdeb31f82	Brandoa	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2789	225dade3-ec15-4ebf-84c1-0ce0013f1b66	Buraca	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2790	81b9e063-50c4-45bf-bec7-bf9b0ddaa4fb	Damaia	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2791	9979861a-a108-41cd-a698-9601a3637a68	Falagueira	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2792	8a661158-7c17-48cf-b162-439b3ea3dddb	Mina	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2793	81e9c729-e59e-45ee-aca6-59e6217cdc7f	Reboleira	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2794	74c44f02-e4b3-4c24-8cbe-32c678e81214	Venteira	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2795	e5208c27-a106-4c60-8b2a-2b065505a412	Alfornelos	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2796	6d244efd-c138-42a7-96bb-ebec6b555ce7	São Brás	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2797	cda7d5ce-c9de-4fcc-a99d-1f1a654ff262	Venda Nova	\N	12	168	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2798	2aeb1e4a-c780-4de7-aec2-7aa6853a462b	Arranhó	\N	12	169	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2799	88f1a271-62a2-4f25-bc63-f411a80967a9	Arruda dos Vinhos	\N	12	169	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2800	8d9e83e9-df47-40b5-8bf2-d8d2f1016212	Cardosas	\N	12	169	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2801	d26f6f6f-4ae4-4c42-9ccb-d6a6691ce98e	Santiago dos Velhos	\N	12	169	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2802	0b481424-c01a-4650-a55e-c2de04d504ca	Alcoentre	\N	12	170	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2803	1b81639e-3674-4342-95b7-f373ff1206cf	Aveiras de Baixo	\N	12	170	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2804	416f5acc-21bd-47e3-b913-053d9068a43a	Aveiras de Cima	\N	12	170	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2805	e124b1ad-3f53-417e-b926-659266553209	Azambuja	\N	12	170	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2806	27913760-8f49-4bbd-9df2-4cf05c952e76	Manique do Intendente, Vila Nova de São Pedro e Maçussa	\N	12	170	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2807	9fc7a28d-e710-4da7-b10c-e832a2eeff0b	Vale do Paraíso	\N	12	170	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2808	5ed9d011-6850-49f4-9be8-a650535ffe1e	Vila Nova da Rainha	\N	12	170	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2809	769e6115-6b0e-46d4-a338-7e999210ec5b	Manique do Intendente	\N	12	170	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2810	e751f60b-1a93-4c40-9f92-a310759861cf	Maçussa	\N	12	170	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2811	76d08e6d-ce27-4df7-959d-f4f24b77bf4e	Vila Nova de São Pedro	\N	12	170	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2812	04b840f1-c3f3-4d8d-b446-696c9e3dd3dc	Alguber	\N	12	171	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2813	890dfc5e-1706-4c42-a2fa-3774f997b64e	Cadaval e Pêro Moniz	\N	12	171	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2814	d81468a3-15a7-45ef-bf5f-ee55175caffe	Lamas e Cercal	\N	12	171	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2815	740127e3-265c-478c-9b2c-da5dfe737cbf	Painho e Figueiros	\N	12	171	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2816	44284f2b-1796-4e0e-b7c5-5a905953970c	Peral	\N	12	171	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2817	af609403-7e6b-466f-bb9d-4ab0e5fc1eb6	Vermelha	\N	12	171	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2818	4abaa120-6da6-4554-9722-bbd8009a5dcd	Vilar	\N	12	171	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2819	839a93ea-ff35-4db7-a4ab-48eef53abf55	Cadaval	\N	12	171	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2820	361d3d71-113e-4b69-aaa0-ed456cf417e1	Cercal	\N	12	171	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2821	9985a6db-663f-46d7-9c9d-a06302eda431	Figueiros	\N	12	171	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2822	6ececdb3-1f81-4e6c-a691-ed9ef4dbac2d	Pêro Moniz	\N	12	171	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2823	7189048e-0e79-4943-9feb-68e4b70a0bc0	Lamas	\N	12	171	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2824	d9a6d5ea-4281-4834-b923-a1480a9d2e73	Painho	\N	12	171	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2825	46cdf86d-6a73-4f40-ab13-c21d38960573	Alcabideche	\N	12	172	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2826	79d353dd-8395-483f-8bee-6925afb30221	Carcavelos e Parede	\N	12	172	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2827	17d0cb79-4625-4d9c-b2af-c63c2c932344	Cascais e Estoril	\N	12	172	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2828	ed143311-9130-41eb-bef0-af80420d6674	São Domingos de Rana	\N	12	172	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2829	f78c0b5d-0e9d-45a6-bddf-429da481e86b	Carcavelos	\N	12	172	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2830	f751aec7-2a9e-43f3-9b2e-7ffcb0928110	Parede	\N	12	172	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2831	57de6947-9ae5-4332-b8f8-5126a84da00c	Cascais	\N	12	172	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2832	ffe6288b-1e88-4645-8b8c-9dba43b5151e	Estoril	\N	12	172	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2833	ebc171c7-e046-477c-86af-34ce1a593a2a	Ajuda	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2834	ea8f8aa4-3cc9-4c13-b721-458e65c9e9b2	Alcântara	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2835	74ee61ad-f0de-42e1-b565-ea003494f050	Alvalade	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2836	8014d0d4-e7e2-4b45-9cd6-698f287c6849	Areeiro	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2837	0bfd76f3-dce6-44c6-ab79-1149efb448c2	Arroios	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2838	6c08130d-fcd9-481c-97de-cde4f68a36d1	Avenidas Novas	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2839	967497b3-1a51-4dd9-bc71-8a0e875152f9	Beato	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2840	b946130d-29fa-40e1-b755-4170b268ac4c	Belém	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2841	16687281-58c0-4c54-9edb-82f1d63df65c	Benfica	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2842	5dfa50c8-3575-4bd6-a6d6-3670d4342f7c	Campo de Ourique	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2843	322928f4-eac8-4a23-be8a-23b29d6bb4a5	Campolide	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2844	a28df25f-9d8f-4137-adb0-9e40f62ce74e	Carnide	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2845	967c5dec-daf4-435e-bc73-8604ba040ff7	Estrela	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2846	a752f583-590b-493a-a855-502a6266e889	Lumiar	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2847	1d5bfcdc-3021-48fd-a87d-61f6578207c3	Marvila	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2848	5c0ea81e-3ed0-4aa4-8781-a32d02d3227a	Misericórdia	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2849	6452727f-f007-4e2b-9574-bd2b1f447575	Olivais	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2850	7b86e47a-fa40-4c09-863c-36194932a7f8	Parque das Nações	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2851	8debd35a-8889-427e-b2f3-ce7dfbf97b40	Penha de França	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2852	3da49452-8b84-4cd5-8400-0af101477883	Santa Clara	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2853	330c2278-9256-45e0-baed-b832defb5015	Santa Maria Maior	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2854	488f63a3-6fb2-4555-9ffb-e82491baa61b	Santo António	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2855	2968f980-285f-4169-a10d-a67bb08c02ec	São Domingos de Benfica	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2856	bb9166af-d0e0-4d84-a22c-9832c12fc233	São Vicente	\N	12	173	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2857	90e1856e-31f0-4d23-b9b6-864006b50cf2	Alto do Pina	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2858	9898eb98-97e0-4351-9fa1-43c3903db6a5	Alvalade	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2859	4fe106bf-fdea-4c3f-8d49-197c63ca2163	Ameixoeira	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2860	1f6a0ff2-369e-4836-a0c6-7d36fd0ceff7	Anjos	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2861	8f52d679-5e1d-4bba-b5cb-1c784a5247b9	Campo Grande	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2862	d6ed5c44-163b-4bf9-adea-aa8699d07bc8	Castelo	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2863	ae8a0db8-6e4e-4e90-8327-c6b7ff97ce70	Charneca	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2864	63a6451b-5b54-4a78-bdd7-0176e406486f	Coração de Jesus	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2865	0b1ada36-d919-4e7c-8cb8-0541ec76b753	Encarnação	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2866	f8f127fa-0624-424e-a90e-01de36f70125	Graça	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2867	1519fc0a-66ac-4ec5-aa43-740b70d5fdfd	Lapa	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2868	a8b998e9-0e07-4c69-8baa-d37f22d789b4	Madalena	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2869	a53f0a6c-deaf-4414-8cfa-5804e3c121f7	Mártires	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2870	b974af91-b339-454d-bd37-79810ce8ee1e	Mercês	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2871	cbd67e57-a69d-4fe7-8b84-89f588b7d8ff	Nossa Senhora de Fátima	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2872	6a2017f5-16e4-4d9a-90d5-835a197840b6	Pena	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2873	7e7a6daa-737a-491b-9fe7-d92c707a1793	Penha de França	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2874	d33ca4fe-6e60-4cf5-887a-f21134da2bb6	Prazeres	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2875	cbf1f482-4232-432e-858d-47400d556235	Sacramento	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2876	c8fb5d64-e274-46f3-a8d0-769bb2a8ecc2	Santa Catarina	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2877	a0047a87-61fd-4053-bf8c-a5174700b27e	Santa Engrácia	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2878	2d05f41b-d934-46c6-99f3-ccc444188fab	Santa Isabel	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2879	4faa3933-1811-445d-870d-988cf320f456	Santa Justa	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2880	7c9c1a7e-34c7-49e7-93ec-9932330fb417	Santa Maria de Belém	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2881	0a03d763-290f-406b-a971-5b882561ddf4	Santiago	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2882	9b57c53c-6d38-44e7-beab-a80329c250f8	Santo Condestável	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2883	466ee9ba-2b1f-467e-a287-7e0f65537095	Santo Estevão	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2884	7ed10adb-d04f-462e-9f8d-e143bcfc7549	Santos-o-Velho	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2885	d72dfe6c-52ad-4d11-bfe6-b9119da6032a	São Cristóvão	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2886	10002867-6e73-44f5-99f6-7b8fb25846d6	São Domingos de Benfica	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2887	633e50f6-083e-4690-a4b5-062f5b30fa8e	São Francisco Xavier	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2888	d15e9a4b-e659-4e3e-a53f-044c56abcff8	São João	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2889	e7f2af5b-fde3-4e31-b5f3-11fb3c204b33	São João de Brito	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2890	202ed4ed-7ceb-43c3-b8ef-7a24a3abd622	São João de Deus	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2891	aece89cc-385f-49ac-a80c-6157ce08575b	São Jorge de Arroios	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2892	dbc0d5ca-934a-4a05-8142-9556fedc055c	São José	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2893	a381060b-a177-4385-8df9-3d738b321e77	São Mamede	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2894	0f49a490-5128-413e-a8ec-b21b4e35bec2	São Miguel	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2895	44438512-fb47-4fa1-bc16-43b157805ac4	São Nicolau	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2896	34dd57ce-7c2c-4109-9093-ba8fc4982cad	São Paulo	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2897	24bd6105-9742-4934-b9eb-21b04c012450	São Sebastião da Pedreira	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2898	5aeb230b-f35e-49db-9ef7-926223ecaf20	São Vicente de Fora	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2899	8cb196ae-817b-474c-86d3-4b0815afb68c	Sé	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2900	23e1569b-ce47-4d00-8d55-1ca045b8ef71	Socorro	\N	12	173	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2901	aad7472e-bb33-45b9-b682-f1943e0de4de	Bucelas	\N	12	174	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2902	ac674294-86ee-4ece-ab32-1399ad6b7883	Camarate, Unhos e Apelação	\N	12	174	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2903	213ba944-d10b-4ecd-8e46-02445aae1c13	Fanhões	\N	12	174	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2904	8adc2728-62cb-48be-9211-b9a97586cdad	Loures	\N	12	174	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2905	36fe105b-f110-4e91-8449-01174661d695	Lousa	\N	12	174	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2906	07a9473b-23e4-451e-b670-9f5e5381861d	Moscavide e Portela	\N	12	174	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2907	ac7baed0-5a39-4190-81c8-6e41ab226543	Sacavém e Prior Velho	\N	12	174	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2908	052f46bd-2ad5-4527-8649-4c9819a909bc	Santa Iria de Azoia, São João da Talha e Bobadela	\N	12	174	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2909	a8c05914-2474-4e9c-99f1-cc0ac3b8a2be	Santo Antão e São Julião do Tojal	\N	12	174	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2910	90a97e1b-3f36-47ce-8d2a-6a28057b249d	Santo António dos Cavaleiros e Frielas	\N	12	174	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2911	7fd0f0cf-4a21-4344-ae85-484268040754	Apelação	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2912	de04ab40-755e-42db-a12e-eab66eb2d4d4	Camarate	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2913	5d009eb9-ab9a-42e7-bba7-a83a67793132	Unhos	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2914	792abe71-1ea3-4a51-8604-93e0f117f493	Caneças	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2915	ce6e949d-3486-4b6b-b239-c4906c0bfb3a	Frielas	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2916	47c56906-e622-4119-bcbe-95be08f7dc84	Santo António dos Cavaleiros	\N	12	174	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2917	e4cd636b-6d90-44e0-893f-b36259aa1b40	Moscavide	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2918	df318032-7ae4-486e-a952-0f88a5776473	Portela	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2919	4f6495af-7f17-48d6-a3f5-9451e1de4ade	Odivelas	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2920	97491067-a6de-4fb5-96d1-3ac6b305ffc6	Póvoa de Santo Adrião	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2921	3c9f9360-ac7e-445b-8be5-4e7911fa09ac	Sacavém	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2922	d4a5a6c8-0617-4215-8911-88f70cfa5994	Prior Velho	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2923	18d94e58-4479-4c66-9144-784ac52309ad	Bobadela	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2924	15471aa2-6fc5-4682-a78a-b3f39c407e79	Santa Iria de Azoia	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2925	9ac0d570-6d66-466c-94c8-9f73abe9f1f9	São João da Talha	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2926	1d534309-57fb-4612-abf7-3af06a768879	Santo Antão	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2927	8c39e87a-70d2-4e63-b610-530b26882568	São Julião do Tojal	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2928	bfaae1cd-cadf-47ab-a4eb-f322d2c4a233	Pontinha	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2929	e8e7c461-ad19-4d19-8ae4-b54f074f747a	Famões	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2930	9b8fb0bc-77af-4071-aa42-7df4b8d9f54b	Ramada	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2931	70fccb42-6f5f-41a3-8ef1-a043f35eba55	Olival de Basto	\N	12	174	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2932	8cb40c86-d65d-4afa-963f-9fa7654d65dd	Lourinhã e Atalaia	\N	12	175	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2933	5cdac840-bd18-4090-9c6f-91b63ed5800e	Miragaia e Marteleira	\N	12	175	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2934	4e262846-902c-4b8f-8628-f8de93a05373	Moita dos Ferreiros	\N	12	175	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2935	bd163efd-eeb0-4b03-ab50-448c75d228ac	Reguengo Grande	\N	12	175	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2936	ee7100de-90cd-4a1a-b929-eb796b53c70f	Ribamar	\N	12	175	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2937	a0c2d105-cbb5-47a6-9041-7b3d13a2a3bc	Santa Bárbara	\N	12	175	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2938	f3724402-ecac-4ea7-8b38-e8cef69df8a7	São Bartolomeu dos Galegos e Moledo	\N	12	175	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2939	ab46a87f-17f1-48db-8c5f-57cedb26ed86	Vimeiro	\N	12	175	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2940	8a2e6cca-4d56-4568-a6f6-80ed82adc4ab	Atalaia	\N	12	175	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2941	3d126f85-c536-4478-936c-d3a515e35233	Lourinhã	\N	12	175	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2942	00d6c75c-b0d1-4f05-a661-c0866ad6799c	Marteleira	\N	12	175	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2943	4bc4f7a1-4e69-4500-9e34-46c7530bea27	Miragaia	\N	12	175	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2944	83d98a76-3afd-4bbc-8aae-b235a0c3aff4	Moledo	\N	12	175	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2945	63ea9ae4-39cc-4e73-b768-edaf409bfc3f	São Bartolomeu dos Galegos	\N	12	175	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2946	c94558c0-9f3a-4bc5-9d4b-611ff5267c1e	Azueira e Sobral da Abelheira	\N	12	176	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2947	4d34d957-84e4-4661-acf9-e41a0b0ed0d8	Carvoeira	\N	12	176	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2948	cbfad090-e852-40aa-b57e-9201baaa62d5	Encarnação	\N	12	176	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2949	44b919c2-068c-4e7a-a6aa-977529628f80	Enxara do Bispo, Gradil e Vila França do Rosário	\N	12	176	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2950	79d426e9-c1d0-4036-aa89-866913f2fdf7	Ericeira	\N	12	176	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2951	fd772cd0-2fb8-4c1c-bc8d-973296423cad	Igreja Nova e Cheleiros	\N	12	176	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2952	d3b47dd0-67fd-46f5-b20f-2c23a6432f27	Mafra	\N	12	176	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2953	a3576edc-4500-482f-ab7a-6afeff2472f5	Milharado	\N	12	176	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2954	108f34e2-ec3d-405c-8dea-45d18272e34c	Santo Isidoro	\N	12	176	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2955	03b6d257-ea1f-49c4-b886-7f10d13f20e0	Venda do Pinheiro e Santo Estêvão das Galés	\N	12	176	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2956	ea1fc864-9913-4cb3-b926-20eb86ea621b	Malveira e São Miguel de Alcainça	\N	12	176	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2957	66100464-34c5-4678-9da8-aea5ae5aa3a1	Cheleiros	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2958	c4524159-9886-4b43-9c01-debd1361903a	Igreja Nova	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2959	1598e601-55bf-41b2-97a2-a2dfb4bff491	Enxara do Bispo	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2960	ab3553a0-1b5f-4324-b3ea-fbebe9a47feb	Gradil	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2961	904f537c-cddf-4751-b977-5c8853cb30d5	Vila França do Rosário	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2962	a2cd7fa7-9263-4cca-a406-0c2e6b8d4d0b	Malveira	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2963	e171ac5a-b14a-4c75-b7a6-f60a35e60bb8	São Miguel de Alcainça	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2964	e23690c5-fea2-4027-9dac-a44c614e09b5	Venda do Pinheiro	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2965	dd422ba0-e3ef-466a-9dcd-35116cb4139d	Santo Estêvão das Galés	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2966	13c1db46-0959-4912-9058-c9180b89bf61	Azueira	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2967	5bd0dba4-535e-430e-9854-165a16fb4b75	Sobral da Abelheira	\N	12	176	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2968	a1794a0c-6da8-44b3-bc12-5fda9065f118	Odivelas	\N	12	177	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2969	701cb130-84f8-4ed8-9e1d-7e5b32da80f1	Pontinha e Famões	\N	12	177	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2970	9d9815d8-745e-47df-8f94-43e6e41ea5d9	Póvoa de Santo Adrião e Olival Basto	\N	12	177	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2971	776678c9-8cc4-441f-90ae-f037ce642b59	Ramada e Caneças	\N	12	177	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2972	82520dba-9068-43fc-b1be-1d87db9d65d9	Caneças	\N	12	177	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2973	0842018a-82c7-4f01-a3e1-e87a42bcd671	Ramada	\N	12	177	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2974	4eea815a-0386-463f-a817-1f33cdb37fc3	Pontinha	\N	12	177	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2975	53dd73eb-5fb4-48b9-b92a-6d50f3da1f2c	Famões	\N	12	177	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2976	fc752213-b830-4ff3-9785-3efc6e682c06	Póvoa de Santo Adrião	\N	12	177	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2977	2dc20b42-2266-4d58-b91b-ca9b30766e4d	Olival Basto	\N	12	177	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2978	812b7695-d19e-4bcf-a23c-6d7807d3f921	Algés, Linda-a-Velha e Cruz Quebrada-Dafundo	\N	12	178	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2979	b6dea9b9-e238-44f6-a960-3a6c297d8cb7	Barcarena	\N	12	178	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2980	f3d0ea81-c43c-4ef9-b168-29d7dfe96b59	Carnaxide e Queijas	\N	12	178	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2981	1fe630b8-4798-4c39-ac14-ecca7ea3a929	Oeiras e São Julião da Barra, Paço de Arcos e Caxias	\N	12	178	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2982	b0912789-fb8b-4d71-a006-cf5ca585444a	Porto Salvo	\N	12	178	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2983	bd0d5957-c888-41c1-86b5-221c805deb49	Amadora	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2984	c1c5de74-5eea-4104-932e-0bb282f5e1e7	Carnaxide	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2985	316d77d4-1c1f-4ccb-9790-0536d34c2ac4	Queijas	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2986	3d6a4508-51c5-431f-b757-fd93a836eb07	Caxias	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2987	74665b8f-f6a9-4bf2-b382-5793c30a43bc	Oeiras e São Julião da Barra	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2988	ec781e38-b989-48aa-a2cb-ee49106835b9	Paço de Arcos	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2989	24516d6a-8235-4191-a1e8-806b614ea1bf	Algés	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2990	7946cbe2-117a-47ab-95f2-5fd5bacc6256	Linda-a-Velha	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2991	9dd70d81-2c7a-4d45-be58-6fdcab16df5b	Cruz Quebrada-Dafundo	\N	12	178	3	2025-03-23 11:47:10	2025-03-23 11:47:10
2992	e75e58f5-2034-43c7-bee8-7530969faaea	Agualva e Mira-Sintra	\N	12	179	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2993	fdd6c98f-c072-454c-8e91-564a721cb19f	Algueirão-Mem Martins	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2994	ff6943a9-beef-43c5-aeb1-caa533255390	Almargem do Bispo, Pero Pinheiro e Montelavar	\N	12	179	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2995	0d58902e-5084-41a9-bfc1-903e6265c0a4	Cacém e São Marcos	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2996	2130cbab-7555-452e-8b9c-465149fd4512	Casal de Cambra	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2997	481e67bf-21a8-4ee5-ba3b-d12436188e56	Colares	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
2998	f2a75fba-aa68-4a5d-9e93-4632021cd9fc	Massamá e Monte Abraão	\N	12	179	1	2025-03-23 11:47:10	2025-03-23 11:47:10
2999	5c25a9af-4160-4295-a543-89e0fe16f290	Queluz e Belas	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3000	75cf199d-6ad7-43a7-ac48-06d45d8ac72c	Rio de Moura	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3001	4508e210-5edf-4a86-9d50-2be002e7ec3e	São João das Lampas e Terrugem	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3002	218f1cc9-ae73-4679-ac4d-0a73958c545a	Sintra - Santa Maria e São Miguel, São Martinho, São Pedro Penaferrim	\N	12	179	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3003	16cf6e64-c2a6-48a2-bc03-b78b07016e58	Algualva-Cacém	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3004	33f19397-ebb6-4bfe-8b99-23bb55da1774	Almargem do Bispo	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3005	f37e75e8-8094-43f9-8bf3-193becb3dda1	Pero Pinheiro	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3006	6acac814-7c51-469b-adac-66fafc1eae68	Montelavar	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3007	caf85f9d-c686-4234-b42a-d42e6511a5dc	Belas	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3008	813cdd1d-1273-49e6-8ffd-c407db3729fb	Queluz	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3009	ab57df98-19de-416b-8982-a41d04b32422	Sintra - Santa Maria e São Miguel	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3010	b65536b1-b535-4ad5-9c17-c4af7736a327	Sintra - São Martinho	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3011	9934a3c3-8737-4d3b-982a-ba4ff496d707	Sintra - São Pedro de Penaferrim	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3012	b8d2ac25-0147-4f6f-8cbd-d7f0bc2f6505	São João das Lampas	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3013	0a87fd44-0f8b-4b4f-a6d0-7adaedd65fef	Terrugem	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3014	ecb21b83-cf4d-4679-9651-a50a4f22bbe4	Massamá	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3015	47cd3ba8-97c0-4f4c-9a73-5ebd8a4c278e	Monte Abraão	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3016	51b7b48b-16ae-4f34-aeca-5d0a2ee125b8	Agualva	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3017	8b0ddedb-906d-450a-9999-25ff007c92df	Cacém	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3018	23ba1442-c573-4892-b541-aa8e230d2531	Mira-Sintra	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3019	69d85fd7-df37-43cc-b5ec-7bc92a505265	São Marcos	\N	12	179	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3020	85cdbb06-7ac9-4947-a092-ab72d184c9d6	Santo Quintino	\N	12	180	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3021	e352aead-13a2-4dfb-9522-638c1b0eadec	Sapataria	\N	12	180	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3022	35b0b4aa-bcf3-4e1a-899e-8f577b4dd0aa	Sobral de Monte Agraço	\N	12	180	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3023	517bc79d-1f1c-4cf8-8fd0-d3b683bb763e	A dos Cunhados e Maceira	\N	12	181	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3024	1adb9ada-2a0f-4b02-a995-01049fc621e9	Campelos e Outeiro da Cabeça	\N	12	181	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3025	03c11dae-d3fd-439a-b654-845daeea5407	Carvoeira e Carmões	\N	12	181	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3026	73512e6e-66f6-4307-bf56-eeb531b0fca1	Dois Portos e Runa	\N	12	181	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3027	2b51b3ed-170c-474c-ba09-15bb4c474f80	Freiria	\N	12	181	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3028	afb5e79f-c555-4d92-9bcc-851da303e543	Maxial e Monte Redondo	\N	12	181	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3029	66fe0b90-8f6c-465c-b149-40e46a5e5d10	Ponte do Rol	\N	12	181	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3030	fb7373fc-af4c-40f8-86b2-1f25e0702ee9	Ramalhal	\N	12	181	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3031	4c6c81b6-c96d-4b38-af60-8b370bf88ebc	S.P., Santiafo, S.M. Castelo e S.Miguel, Matacães	\N	12	181	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3032	1cb8adba-1281-4709-ab77-706f98e6a4f2	São Pedro da Cadeira	\N	12	181	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3033	7cba2bd3-3589-4ce2-b4e9-a6952dfb3be6	Silveira	\N	12	181	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3034	1774eb70-1647-4496-be91-ccc293f5573e	Turcifal	\N	12	181	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3035	e7c06342-497c-4a8e-b7a9-1b928e2bb68a	Ventosas	\N	12	181	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3036	d33d23a9-f985-489a-beb1-ea37a5e9fd2d	A dos Cunhados	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3037	d229431e-03f9-4eb3-bb51-1f4e60cc0033	Maceira	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3038	167ae3c2-331c-4a0d-8cdb-b10dc8aee5d4	Campelos	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3039	fe294238-a9b5-46eb-b2dc-ad654ef063bf	Outeiro da Cabeça	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3040	d6bb5741-0a77-4217-9f87-514eea8386a6	Carvoeira	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3041	af5c8089-5de6-4db1-8d03-eb43bd71a01c	Carmões	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3042	4a2f2863-cedd-4c8f-a8a4-5aa895b8a5de	Dois Portos	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3043	e35a091b-7fcc-48d9-bd80-6269bd00d5fc	Runa	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3044	ce205868-a484-4fd9-b3ed-54fa21d87855	Santa Maria	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3045	7135dace-91e4-4b90-afb2-8c69e233fa90	São Pedro	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3046	36251c18-3ec4-48e2-91b5-c3fa20e03045	Matacães	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3047	e140a497-035c-4918-b2d5-2dfa1f2fb3ca	Maxial	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3048	e44f6483-5dbe-4903-8624-7f5ae01f63e2	Monte Redondo	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3049	f9f3daea-a680-4863-9db4-271e9820a8d7	Torres Vedras - Santa M.Castelo e São Miguel	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3050	6a57268a-851c-4f41-a40a-a12611e6b679	Torres Vedras - São Pedro e Santiago	\N	12	181	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3051	14529ce0-bf6d-4687-b645-1cbfe467b936	Alhandra, São João dos Montes e Calhandriz	\N	12	182	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3052	75047900-c218-4ddd-b92e-e79944452973	Alverca do Ribatejo e Sobralinho	\N	12	182	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3053	799e00c5-5a0e-4d72-9146-7be382e324b0	Castanheira do Ribatejo e Cachoeiras	\N	12	182	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3054	f09c7be2-c1a5-4ac2-853b-792209c8b1f9	Póvoa de Santa Iria e Forte da Casa	\N	12	182	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3055	66b451fb-140a-4718-a623-d84df80a9887	Vialonga	\N	12	182	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3056	3d1645a1-5572-4791-bbfe-9fb2173a7b64	Vila França de Xira	\N	12	182	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3057	c6063fdb-668b-407d-a038-9d937ce6a634	Alhandra	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3058	162f8e9a-c077-48aa-ade7-19129391450b	Calhandriz	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3059	f8720251-1554-4c12-b2bf-88d8475a9a68	São João dos Montes	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3060	1a3a849b-a304-47ea-afb0-1801a7576a6f	Alverca do Ribatejo	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3061	145f3b24-8009-48cd-b05a-7bc2f7cbc728	Sobralinho	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3062	a1f97874-8cd0-4266-93c5-19f018a56a70	Cachoeiras	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3063	ff5d2160-17e2-47eb-b11d-eca3d4522afe	Castanheira do Ribatejo	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3064	3a120c70-e689-43b0-8faf-70781a0c8d83	Póvoa de Santa Iria	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3065	ef1c45d1-24fd-4859-96a0-150b2caf2ed0	Forte da Casa	\N	12	182	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3066	180a202e-5fa6-442b-ab8b-7e207bdc9d19	Arco da Calheta	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3067	0317a6a6-8606-4a3c-a15c-007dda877284	Calheta	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3068	79a305bf-6fa8-4a61-9cc4-4a0db7c45a6b	Estreito da Calheta	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3069	2ff9bb80-67df-4a63-b7d4-eadbecd9e4e1	Fajã da Ovelha	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3070	c05c93c0-3658-4c69-b1d1-1b5eb8944dca	Jardim do Mar	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3071	69b1cb49-5fa2-4bd5-8078-5054c1ebee30	Paul do Mar	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3072	21c14fce-878a-45fc-bc50-e02a676002ce	Ponta do Pargo	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3073	8a676969-2496-4cb4-b25d-96c506aa2a57	Prazeres	\N	13	183	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3074	0ece4cf9-3f2e-49b4-a5cb-b7b395b1e016	Câmara de Lobos	\N	13	184	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3075	37262504-70f1-4019-b20c-fe8f2429d739	Curral das Freiras	\N	13	184	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3076	44b36d01-36f1-456e-8081-60028a07f376	Estreito de Câmara de Lobos	\N	13	184	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3077	f6680e0f-bf93-451c-96ae-56fd7d2c4f3d	Jardim da Serra	\N	13	184	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3078	08332677-362e-469f-85b2-965538a70b03	Quinta Grande	\N	13	184	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3079	5f21dd5b-9e69-4583-8a9f-095320272e3e	Funchal - Santa Luzia	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3080	8aef2a24-2bb8-42e0-9a0e-0af093cac0ac	Funchal - Santa Maria Maior	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3081	345faea4-f8d5-4f8f-aad9-f642c0e7ea16	Funchal - São Pedro	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3082	03b9475f-bda3-4625-86b0-486a95152f6e	Funchal - Sé	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3083	77298838-9286-42f7-ab24-77c6c584a8cf	Imaculado Coração de Maria	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3084	7001ad87-409d-4dbe-b0ad-f20f29113ca8	Monte	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3085	ec24c583-f4ae-4756-a4fa-3abdf0189f79	Santo António	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3086	e61f5d86-0eb0-4893-a534-1692161fa638	São Gonçalo	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3087	46310db4-e473-4d70-91a4-59b44d823a21	São Martinho	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3088	1c696565-9c29-4eeb-b8e2-7bc822c386d8	São Roque	\N	13	185	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3089	a3f7a759-7bb0-4efb-88ab-ffafed9237b6	Água de Pena	\N	13	186	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3090	e6990e41-ac84-4726-9946-91edc799711e	Caniçal	\N	13	186	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3091	09ec7a43-ca75-455c-98dc-ef8b389f4938	Machico	\N	13	186	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3092	95c2abcd-b52c-4d03-9e6f-6f42d660d61a	Porto da Cruz	\N	13	186	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3093	19f3cf84-2e1a-4755-be81-c7d271dc5cb8	Santo António da Serra	\N	13	186	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3094	7a64f752-d3dd-4d94-a64d-e6c9571c228a	Canhas	\N	13	187	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3095	b1c4f50c-3296-411c-8454-2cad14a3739a	Madalena do Mar	\N	13	187	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3096	444fad7c-59d1-4152-ac46-6b750e7f67f2	Ponta do Sol	\N	13	187	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3097	b9efb826-f5ca-4410-ae0c-40742e2c16b5	Achadas da Cruz	\N	13	188	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3098	4f1b7ddd-42d8-4981-a6d0-3b148adafdce	Porto Moniz	\N	13	188	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3099	a1c4b5b7-796b-4172-95fa-1b6d11b9dc78	Ribeira da Janela	\N	13	188	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3100	75693697-e776-4705-bd10-66f8b36a78dc	Seixal	\N	13	188	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3101	76c25801-0253-427c-b226-b5f10756171d	Porto Santo	\N	13	189	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3102	a47f3145-c6d8-4a36-abe0-71e35ceff2f1	Campanário	\N	13	190	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3103	4bcd31fe-c989-466f-b525-0b6e05ed6f8f	Ribeira Brava	\N	13	190	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3104	62ae90ec-4e44-4f1e-9288-7d1deded3497	Serra de Água	\N	13	190	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3105	1e37dfdb-8263-4815-9ef0-0bd55b0c4758	Tábua	\N	13	190	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3106	bc265639-6f22-4de8-8a4b-4c1533350cc6	Água de Pena	\N	13	190	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3107	7252cf8f-e100-456a-b94f-10f237391d12	Camacha	\N	13	191	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3108	556fedac-f8db-47df-8dc7-dc0aee028533	Caniço	\N	13	191	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3109	3f8e334e-c370-406d-96ce-4fa77d50fec7	Gaula	\N	13	191	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3110	75ab8ed2-8f48-4fef-95c4-af82c5e3d406	Santa Cruz	\N	13	191	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3111	27d521f9-3bb1-4a35-887f-6297b08d9804	Santo António da Serra	\N	13	191	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3112	cbac5d9f-08a5-4396-a982-9d5c2380a3c1	Arco de São Jorge	\N	13	192	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3113	405ea578-ce12-485b-a9db-6b5fef550361	Faial	\N	13	192	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3114	12f26d86-a988-4bd4-8df8-bdccc9a0c3ca	Ilha	\N	13	192	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3115	02b18775-98e5-40f9-81d4-a6736e344a8c	Santana	\N	13	192	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3116	11b0eb32-77c6-4418-a84a-45c4786bbfb6	São Jorge	\N	13	192	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3117	3eea6afa-5e55-4763-83f8-fca519380a1c	São Roque do Faial	\N	13	192	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3118	afd58aa3-720d-4482-9c42-61afb3eee255	Boa Ventura	\N	13	193	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3119	62215855-7920-46fd-9a2c-efa29229200f	Ponta Delgada	\N	13	193	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3120	0eb3593c-05f0-44ea-a0b0-13d1eb081492	São Vicente	\N	13	193	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3121	51e8de88-7539-4406-b588-d0a56e308ae5	Alter do Chão	\N	14	194	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3122	92b89885-6796-4814-a835-bfbe9cc79baa	Chancelaria	\N	14	194	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3123	26170bf5-76f9-4799-b012-ba57f8064c50	Cunheira	\N	14	194	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3124	fff32a8f-f684-45de-9480-4073a43020a9	Seda	\N	14	194	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3125	48318f9d-5aa1-4bda-afbd-8ff4af144238	Assunção	\N	14	195	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3126	c67e2811-da03-46d4-8b96-094cc429ecf7	Esperança	\N	14	195	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3127	1fa19f3b-b737-41b5-858d-42589d94ef26	Mosteiros	\N	14	195	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3128	1aed6d00-180c-4486-bce1-9e29edea7ebc	Alcórrego e Maranhão	\N	14	196	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3129	aebc18c1-21eb-43f3-b756-713d4c639426	Aldeia Velha	\N	14	196	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3130	786724e2-1155-46a8-835c-1df0c388cf95	Avis	\N	14	196	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3131	ba27af4a-41b7-49ab-830d-21ef2b8506a2	Benavila e Valongo	\N	14	196	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3132	8d7093d0-a635-4ef9-bbe5-cf19344d0e93	Ervedal	\N	14	196	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3133	dc3493ae-19b3-4667-a14a-d2b1efa1b407	Figueira e Barros	\N	14	196	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3134	15eacc90-2568-4505-9797-fe446d2c6c4c	Alcórrego	\N	14	196	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3135	7a055ed2-9d53-446b-9564-62b1e6390ebf	Maranhão	\N	14	196	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3136	cb30e1c2-d9d3-4478-b24f-165f7c044392	Benavila	\N	14	196	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3137	280de569-ab36-4611-b2d9-744d42f4dc10	Valongo	\N	14	196	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3138	f84df7b9-1ea3-40a7-92c0-70f000645220	Nossa Senhora da Expectação	\N	14	197	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3139	d69216c1-e640-4761-b72f-c576eb865fe4	Nossa Senhora da Graça dos Degolados	\N	14	197	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3140	ef108472-edf6-4cb4-955e-08363f69b4cd	São João Baptista	\N	14	197	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3141	40ee4b23-4838-4588-9e96-bf66822adf67	Nossa Senhora da Graça de Póvoa e Meadas	\N	14	198	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3142	de780341-3d3c-4192-93a5-8605adc3f477	Santa Maria da Devesa	\N	14	198	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3260	ecfdd663-b994-4c48-8d15-ae9028b2aa9a	Cepelos	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3143	e72e92ff-95e9-4423-86b5-e3065f19b45f	Santiago Maior	\N	14	198	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3144	0d9be786-c6e9-45b9-8f05-63df6755fdfe	São João Baptista	\N	14	198	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3145	2fe013be-7164-4ce9-8173-61b656d58e26	Aldeia da Mata	\N	14	199	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3146	3ab5550a-61fa-46c3-aad0-fa43177c6b8b	Crato e Martíres, Flor da Rosa e Vale do Peso	\N	14	199	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3147	af85deb4-8b29-429a-af50-6c8f43ea72a0	Gáfete	\N	14	199	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3148	dbb28d5b-9c41-4ed6-9e8e-d05ba92088e6	Monte da Pedra	\N	14	199	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3149	3e39c589-1908-4ed3-8935-01afcb045ca7	Crato e Martíres	\N	14	199	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3150	f5088033-b20f-4594-829c-d2b451357c94	Flor da Rosa	\N	14	199	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3151	2ca842f8-7e94-4188-9420-52c81c53e023	Vale do Peso	\N	14	199	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3152	afd379a3-942c-4c3f-8195-5d5290d1d683	Assunção, Ajuda, Salvador e Santo Ildefonso	\N	14	200	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3153	8a2a5941-dcaa-4a5f-9f2e-c4ba6fba76f1	Barbacena e Vila Fernando	\N	14	200	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3154	d90ef408-e577-4325-8e85-37ce9fa0daf9	Caia, São Pedro e Alcaçova	\N	14	200	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3155	850dd91d-62e4-4f2e-aaa8-bbe49e64f47d	Santa Eulália	\N	14	200	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3156	a9d17da8-b3d2-448b-9ffd-f0dbc2418a96	São Brás e São Lourenço	\N	14	200	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3157	9309bed8-0f06-42e0-b460-47533ab6fb6d	São Vicente e Ventosa	\N	14	200	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3158	b9402fb7-ad71-4f73-9504-1096f4cecb32	Terra Nova e Vila Boim	\N	14	200	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3159	15a255b6-2635-4bbd-9069-6c991d9e5867	Ajuda, Salvador e Santo Ildefonso	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3160	36179421-22b1-4293-a41b-805475f2e127	Alcaçova	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3161	b735c0c1-7bb9-4a52-bf6f-f16de0b6947b	Caia e São Pedro	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3162	61bb8cab-69b5-43b0-8ed5-8f0167ef4b0a	Assunção	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3163	a88dd5e1-f427-49bf-92b0-f9ec25029026	Barbacena	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3164	8c9b930e-f514-4bd8-98b2-41158fc208bc	Vila Fernando	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3165	3015417b-f2eb-4d1a-99f2-24a6d804cdf5	Terrugem	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3166	291ee6ca-2dc7-4f4c-8ad9-05392bd23ac2	Terra Nova	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3167	e13c6582-fb4c-4981-aca8-7c04af01a3f9	Vila Boim	\N	14	200	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3168	9d3e642e-6570-458c-9328-808bfc729cf7	Cabeço de Vide	\N	14	201	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3169	1f8987ea-1264-4707-9cb2-d2e3b4183848	Fronteira	\N	14	201	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3170	a5a7e50f-c66d-4cc9-9152-125b09b28a93	São Saturninho	\N	14	201	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3171	38e9a3de-f39d-449b-9b95-31b01ef8ca04	Belvel	\N	14	202	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3172	26ed6523-d698-4eb7-9044-013fd6346db3	Comenda	\N	14	202	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3173	c313da68-fd99-4041-9115-561b3d86e687	Gavião e Atalaia	\N	14	202	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3174	ce8c31ef-9eaf-434f-a527-2352242a7f1f	Margem	\N	14	202	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3175	0b11563c-9b3d-468f-9de4-dbdadc09d9fe	Atalaia	\N	14	202	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3176	bfd40cfe-8ba7-477e-a90c-db1ee04e9ed8	Gavião	\N	14	202	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3177	f8b29bfb-06d0-4091-9256-0c5d781532bd	Beirã	\N	14	203	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3178	73ed8326-eba5-4ebe-bfd2-ada5c32b8654	Santa Maria de Marvão	\N	14	203	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3179	ea501a48-ea54-440c-9b8e-fc27c173cba7	Santo António das Areias	\N	14	203	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3180	0b724ef1-71a4-4657-aeac-013005893bbf	São Salvador da Aramenha	\N	14	203	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3181	961a5c7e-3c48-49c5-8e94-7a1031509811	Assumar	\N	14	204	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3182	3c643485-9d0f-4f28-a6fd-e8c77c190c31	Monforte	\N	14	204	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3183	58e75034-1f17-455d-91be-acb7dcf64292	Santo Aleixo	\N	14	204	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3184	66c131b0-9b32-4f1f-ba4e-c330af51b99f	Vaiamonte	\N	14	204	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3185	679e8b01-5bb7-4e81-9958-32e2a3afdf85	Alpalhão	\N	14	205	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3186	f26fc768-ebee-4640-bb29-ca0d6df41bd7	Arez e Amieira do Tejo	\N	14	205	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3187	81ac6691-a9ee-45d4-b150-0590d378c54e	Espírito Santo, Nossa Senhora da Graça e São Simão	\N	14	205	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3188	4ebf933a-658e-44bd-b6f3-a38a2d919df9	Montalvão	\N	14	205	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3189	9a11beaf-b5ae-4d43-b29b-7a50215d0185	Santana	\N	14	205	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3190	9ec7c43c-a2f7-4f6f-a095-613fa7c70267	São Matias	\N	14	205	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3191	d79d4781-e40d-469e-a210-7c47f5d55f42	Tolosa	\N	14	205	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3192	9d2e7749-0b9d-4eee-ad21-ca9b9fc367b7	Arez	\N	14	205	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3193	a56677a7-090e-4d0c-9d38-20983450dcb6	Amieira do Tejo	\N	14	205	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3194	934d9840-c170-47ad-9fbd-baf1fca7392c	Espírito Santo	\N	14	205	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3195	0a20a30f-b5ad-4af1-9439-ac4344e6c7c7	Nossa Senhora da Graça	\N	14	205	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3196	96046c39-245a-4ce0-b7ff-26f6928e6eaa	São Simão	\N	14	205	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3197	d993419b-6dc9-42dc-81e3-7dca1daecc81	Foros de Arrão	\N	14	206	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3198	2951ab31-ac32-4311-a0ff-62e3966b6fa1	Galveias	\N	14	206	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3199	42e2f93e-41e7-404c-a954-fbfa58e1261a	Longomel	\N	14	206	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3200	4109e597-9219-4784-99e5-2785594f2a9b	Montargil	\N	14	206	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3201	2f515247-3c21-4964-96c9-7f0d91a8fda8	Ponte de Sôr, Tramagão e Vale de Açor	\N	14	206	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3202	27654346-3daf-48a8-9a3a-d9d63c27f22b	Ponte de Sôr	\N	14	206	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3203	24b683cd-8869-4093-a662-0abad104ff83	Tramagão	\N	14	206	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3204	96b177fd-d0d3-4469-8fc3-95a659f04186	Vale de Açor	\N	14	206	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3205	a3b9ced3-ce93-4939-8222-49f514cda3b0	Alagoa	\N	14	207	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3206	36f7c0f4-8908-4f0f-8f57-a9c55a375758	Alegrete	\N	14	207	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3207	0186e00a-036b-486b-bc28-eceebed01965	Fortios	\N	14	207	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3208	42d361d6-5a1b-4a36-baa7-ab1b11df7ceb	Reguengo e São Julião	\N	14	207	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3209	e3f96431-8caf-48a8-a28e-1e758a1a25b1	Ribeira de Nisa e Carreiras	\N	14	207	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3210	b5f4c18c-4608-40ea-b4e5-fa617a5c43c6	Sé e São Lourenço	\N	14	207	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3211	990b6697-c70b-4cc1-9b75-1a918fb6b85e	Urra	\N	14	207	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3212	cf7073f6-dc1e-4c30-81b7-4a2b58abb952	Ribeira de Nisa	\N	14	207	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3213	d7dc0466-e3e5-489f-9476-33de2f52e398	Carreiras	\N	14	207	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3214	c44210cf-88fa-4090-84d5-40958dc86a89	Reguengo	\N	14	207	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3215	829ac232-814d-41fc-99b7-0f4f9101df6f	São Julião	\N	14	207	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3216	a91deaec-9761-42e9-a428-305e8cc7bc38	Sé	\N	14	207	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3217	3a6cbeeb-53ba-4448-8f82-4f80ff2c0c54	São Lourenço	\N	14	207	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3218	41d5b838-887d-4c2e-afbc-10d6585e76e1	Cano	\N	14	208	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3219	a39f107d-ae34-4db0-abbc-40119a0ed312	Casa Branca	\N	14	208	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3220	a927f725-5e94-4712-91f0-c09b6f481d91	Santo Amaro	\N	14	208	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3221	8aab99bf-d45e-4854-85f2-4cc79f87939c	Sousel	\N	14	208	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3222	ec274248-6424-4c06-89e9-e2bb98350396	Aboadela, Sanche e Várzea	\N	15	209	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3223	88a99641-f8dd-48fd-9bca-fabdffc67ba5	Amarante - São Gonçalo, Madalena, Cepelos e Gatão	\N	14	209	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3224	522427b1-1fe6-4c76-b67d-ce4cc8d80155	Ansiães	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3225	42c5d737-5cf8-41c2-b3fd-0cd34e1d243e	Bustelo, Carneiro e Carvalho de Rei	\N	15	209	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3226	3ec46c43-dfd5-4a0a-b77e-953b4bb07287	Candemil	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3227	cbeff96c-0d6b-4d36-8739-a5c451aa190f	Figueiro - Santiago e Santa Cristina	\N	15	209	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3228	c59579e8-6821-4d98-906f-1416eabc7680	Fregim	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3229	0a59078f-2f63-4c71-92ea-36dfe03201dc	Freixo de Cima e de Baixo	\N	15	209	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3230	05d30d64-9f4d-4c91-9c68-632187c473a3	Fridão	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3231	c4386c31-cc7a-4712-a0ec-e99277bc2313	Gondar	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3232	d8bd3ece-317c-4949-aa0b-bfb9987b7781	Gouveia - São Simão	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3233	ac168db5-554d-4799-983a-442076fb18a3	Jazente	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3234	7e455de1-0efb-423b-b2f7-f3b65ee40c1a	Lomba	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3235	c8a9a0db-a703-4e35-9803-5fa0c691e8c2	Louredo	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3236	04230f7e-c86c-47d9-b3e5-53fc37960f55	Lufrei	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3237	407d14c6-4325-484b-9289-28836936ac54	Mancelos	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3238	861fb138-fb59-4006-bd99-00632e76fb4b	Olo e Canadelo	\N	15	209	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3239	0990626e-76d8-47c2-a46f-5d9b5324e61c	Padronelo	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3240	3de1c7e0-beb4-4ef0-92e3-33e11e96542a	Rebordelo	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3241	e594f2ce-0587-4e7a-b3e8-83168c189ab0	Salvador do Monte	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3242	5c5c2147-52f8-46ed-a8a8-608f46141801	Telões	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3243	ed068302-7046-4322-b324-556f9934ccbc	Travanca	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3244	a18dd5b8-cafb-4179-99a0-e7c6ea9d7b04	Vila Caiz	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3245	6c36a734-ff7c-4c3f-890a-a79aef1f4bc8	Vila Chã do Marão	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3246	0f8d7380-8679-49c3-a1c3-cb51ce412a3e	Vila Garcia, Aboim e Chapa	\N	15	209	1	2025-03-23 11:47:10	2025-03-23 11:47:10
3247	9f793e07-6486-4844-a3cf-b0dcaa9b9508	Vila Meã	\N	15	209	2	2025-03-23 11:47:10	2025-03-23 11:47:10
3248	0e827b7b-bc58-4ec8-89e6-2a7ff0cbc3f7	Aboadela	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3249	9d3b4439-55fc-4098-b447-00fd44dcbb23	Sanche	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3250	e41cf317-5b45-4edd-a408-eeb93f00a1df	Várzea	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3251	33387640-5470-4e0b-aa0c-af4f04875cb0	Aboim	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3252	e8292107-4fa6-4db9-9316-4d6d249599e2	Chapa	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3253	0bc52402-967a-4ea7-a957-7fcfe5a51cee	Vila Garcia	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3254	64a26c4d-efaf-42d2-9de1-bd91262284ec	Ataide	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3255	1c875687-3646-4bac-87cc-78ec9dce98a4	Bustelo	\N	15	209	3	2025-03-23 11:47:10	2025-03-23 11:47:10
3256	b4ce8f48-63d6-4181-bb7b-5ac5dd45e512	Carneiro	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3257	bef1d157-52c3-4061-a44e-b1b2483ba2ad	Carvalho de Rei	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3258	333742ee-2218-4ab1-b1aa-2b772d6bf02c	Canadelo	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3259	5bc90c97-077e-4d4a-8268-9e8721eb719d	Olo	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3261	b1f5890b-961b-4ec6-ab53-7a48f4a6464a	Freixo de Cima	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3262	c7309492-a73f-4393-8873-9fbee835932d	Freixo de Baixo	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3263	3ab8516a-e561-4b51-be92-a30100e9b540	Gatão	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3264	62bdb1a7-1ad3-4106-b9d2-46772af76ce8	Madalena	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3265	a59108dd-9326-45a7-b725-2fb2cb6962e1	Oliveira	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3266	40e87fd0-6a09-4190-bdda-5eb598e41710	Real	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3267	aa9b143e-40fa-4469-9d68-1ade79477597	Figueiro - Santiago	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3268	62d3d246-9357-4f70-8edf-e8638905c2b3	Figueiro - Santa Cristina	\N	15	209	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3269	4f09dfd3-4d00-4762-8e77-d319f2ecf2ba	Ancede e Ribadouro	\N	15	210	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3270	e244bdbe-fac0-44c7-bde0-1bd535137afd	Baião - Santa Léocadia e Mesquinhata	\N	15	210	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3271	dd124d8b-f252-4422-b5b9-8846502e5768	Campelo e Ovil	\N	15	210	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3272	77e5ed81-dddd-480d-b58d-99a2ce5ee42e	Frende	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3273	cc7ffb27-dc72-4e95-8801-1a49c980aab1	Gestaço	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3274	1a75f950-8c34-499f-9cbf-1065c2d0b6c9	Gove	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3275	5f449c96-35b5-4402-bd41-ff5491e1f77e	Grilo	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3276	079e1136-5ee2-4060-ac2d-cf0dd46115e6	Loivos da Ribeira e Tresouras	\N	15	210	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3277	c7e41324-a416-4164-92f4-acb882114436	Loivos do Monte	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3278	64099caa-67fb-430d-af5e-58eaf1035b7b	Santa Cruz do Douro e São Tomé de Covelas	\N	15	210	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3279	db924c1e-4f9e-423d-9a36-edffeb621251	Santa Marinha do Zêzere	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3280	0a2b0298-ef48-4870-8cad-3f36be54e5eb	Teixeira e Teixeiro	\N	15	210	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3281	d4370cc8-9b0c-4199-aded-650c7eb75d38	Valadares	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3282	38ccd673-a3be-4c50-8e07-573754424b68	Viariz	\N	15	210	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3283	d5415ec6-3e36-4dcb-8b4f-a5a5c6565f78	Ancede	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3284	0a707986-32ff-41e4-b667-3e5d18f60f15	Ribadouro	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3285	430684bd-b463-45a6-98ce-1da4e447d260	Campelo	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3286	e74badd9-9358-4f1f-b338-f0fd868f07e6	Ovil	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3287	c749bac6-6c05-4042-99d1-db4534f2c3fa	Loivos da Ribeira	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3288	024e4066-53e8-4d9a-9205-c45be5ca249e	Tresouras	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3289	575b1257-a6b2-438d-acde-13b214e04b5d	Baião - Santa Léocadia	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3290	7085d590-bf49-4484-9015-3058d793b57d	Mesquinhata	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3291	ca5151e5-eaf9-40e4-ba9c-40bc25134730	Santa Cruz do Douro	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3292	253b7a4b-246e-4243-8c21-14f501141ff1	São Tomé de Covelas	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3293	757cbffa-3725-4bb5-926a-48e0eff0392c	Teixeira	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3294	a2c4b14c-1a58-491a-8bfc-0e4f6608fa59	Teixeiro	\N	15	210	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3295	03d25279-0514-4a43-9d42-9b41a4fba09f	Aião	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3296	cd1a2e59-0bf4-4885-b87c-2d025e493f1f	Airães	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3297	e31310c6-2405-492c-8048-7ff39a824e2f	Friande	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3298	dc58f34c-e5c8-4d93-b7f9-d11bdb05531b	Idães	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3299	54e5304a-cc5e-45c8-a5ae-1e27b3e168ed	Jugueiros	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3300	d4da2283-86e3-4ecc-8f06-c458538462de	Macieira da Lixa e Caramos	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3301	8dbe5243-334d-4aff-ba41-79b871765f1e	Margaride, Várzea, Lagares, Varziela, Moure	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3302	8d452bdf-2ff8-4f42-aa6d-d56d8eabf310	Pedreira, Rande e Sernande	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3303	a4b16036-3c0a-4d1b-bf40-4cbe5d7a2477	Penacova	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3304	c102517b-825f-4075-86c5-4ef1aa760b92	Pinheiro	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3305	3c4e0ff1-fc58-455a-a706-46610f9af5aa	Pombeiro de Ribavizela	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3306	bdb47b67-84f6-46be-bfe1-80601ae018f3	Refontoura	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3307	f6fa53a9-771e-45fc-80cf-68e7af6e74b8	Regilde	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3308	372b0cf2-8b39-4ad2-a5ee-274880319ecf	Revinhade	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3309	809e8e20-571b-4d94-95c7-aa9f0f8418d8	Sendim	\N	15	211	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3310	791c0460-bc31-4dfd-9646-efde2d431d3f	Torrados e Sousa	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3311	09a27d78-e461-4e03-8367-938bb7dd865e	Unhão e Lordelo	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3312	e992b60a-b65b-4203-adff-60a34e670f9f	Vila Cova da Lixa e Borba de Godim	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3313	0b8c34b1-d861-4b62-9264-419eebf9b5c0	Vila Fria e Vizela - São Jorge	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3314	084d6f00-9652-4728-8517-0ae2a86ff711	Vila Verde e Santão	\N	15	211	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3315	8ad0eae0-562a-4a69-85c6-5bed25139af0	Borba de Godim	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3316	61790f4d-b020-4024-b34c-7bf53d49a2b6	Vila Cova da Lixa	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3317	2ee71ac5-edce-4846-9c8a-0745a8a25463	Caramos	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3318	3c86ec2a-0cc4-40f1-83f4-5df6fc773cb2	Macieira da Lixa	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3319	f318fde8-b1e7-4c74-a33e-92df2512bd65	Margaride - Santa Eulalia	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3320	0a84c666-2c9c-4078-9211-2262f624e0cd	Várzea	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3321	16b7e304-5e08-4fb2-8dce-50dab17c86b6	Lagares	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3322	7b8f2c99-e262-4d2e-b0f5-4a0544a31dc5	Varziela	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3323	9cef0b46-ff96-49db-90bf-70a974ac61ee	Moure	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3324	b1e817af-1b34-40f8-bea7-f50faea8cd59	Unhão	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3325	5e9d52b9-ec41-4b44-b385-27be5ab3d40e	Lordelo	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3326	348bd599-2ddd-43ca-a7dd-138f5ee6f383	Pedreira	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3327	5e45f116-de50-47b4-8d85-7a8fe0cf7e85	Rande	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3328	73e2c401-6cfd-4f5e-a855-262f0401e747	Sernande	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3329	f96f824a-90ab-4e03-ad22-8031dde3e4fc	Vizela - Santo Adrião	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3330	ee35e64f-85a6-4446-b015-06a52596017f	Vizela - São Jorge	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3331	c8508aca-f553-4ff8-a080-441feed94321	Torrados	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3332	44c5a956-31cc-4f7d-9527-546b6ec8866a	Sousa	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3333	de37c8c0-682f-4fb2-8817-6eceac8ae969	Vila Fria	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3334	e80e0e22-85dc-416b-b669-1b1a1d411e2a	Vila Verde	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3335	113ba364-980d-40f0-be90-4ffb1a9bbb22	Santão	\N	15	211	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3336	07a7d2ad-ec1b-4c51-9b42-554c839c7fd5	Baguim do Monte - Rio Tinto	\N	15	212	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3337	448c789a-9985-4a1e-b2ee-d06d1eab1267	Fânzeres e São Pedro da Cova	\N	15	212	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3338	cecf03d1-24db-4a6c-926d-3c66d936332c	Foz do Sousa e Covelo	\N	15	212	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3339	150fc9b1-8332-45d2-a1ef-830130ba9e22	Gondomar - São Cosme, Valbom e Jovim	\N	15	212	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3340	332285f5-3335-4fd9-9442-b388a76a13b7	Lomba	\N	15	212	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3341	dc793336-1999-4b5e-a26f-47b4201dabed	Melres e Medas	\N	15	212	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3342	1eb46270-2ac3-415b-b59e-4df088021ea4	Rio Tinto	\N	15	212	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3343	bd99eeec-492b-40c4-befb-d705479d2e97	Covelo	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3344	701887db-ea3c-41fb-8d39-1871412dc0c0	Foz do Sousa	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3345	93153eaf-7f98-4b0d-a8bc-82ccb79b7d2f	Fânzeres	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3346	332f49e7-6f3d-45e0-9efc-dc2c693fb2bd	São Pedro da Cova	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3347	c70aef34-a9f5-4a69-a682-fef152e8bc59	Jovim	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3348	9bebd9a0-434d-4e87-89a8-73a8f88a1bcc	Medas	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3349	21800efd-b9e6-4750-9ad9-3293b78a1079	Melres	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3350	e314f07f-2f6e-4efe-a096-718c1f0d4c30	Gondomar - São Cosme	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3351	8d591aa2-2c73-4345-9bce-679f5736fbb2	Valbom	\N	15	212	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3352	baa7fb58-4d52-4a53-b489-a9ebe1f42a4b	Aveleda	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3353	7e476194-db58-40fd-a680-8b2ba771f7f8	Caíde de Rei	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3354	ac0d5186-33ef-4a19-9fd6-78c2c153eba9	Cernadelo e Lousada - São Miguel e Santa Margarida	\N	15	213	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3355	f9035e6b-84e6-4478-857a-19e7ffe70617	Cristelos, Boim e Ordem	\N	15	213	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3356	01a6abc9-d8b4-4db2-adca-e644f088a23b	Figueiras e Covas	\N	15	213	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3357	70572444-1ef8-4644-8181-ea56d6d0e9d4	Lodares	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3358	93f1efab-176d-46e8-a892-cdeba7632774	Lustosa e Barrosas - Santo Estêvão	\N	15	213	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3359	b097a0e8-76fe-429f-8e6b-d6c5fc20444c	Macieira	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3360	cdacc0bf-f783-4fe5-965f-13474835501f	Meinido	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3361	81724d9b-b8bb-4803-ab63-5457f3c2b967	Nespereira e Casais	\N	15	213	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3362	b0fe2649-0e66-4960-b2f7-22020bd7d4c2	Nevogilde	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3363	2d481a47-99fc-4f92-a3e2-351a2b921e18	Silvares, Pias, Nogueira e Alvarenga	\N	15	213	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3364	9f524863-9e77-4697-8f38-4e8eba3d6b75	Sousela	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3365	a01556d7-69bd-4dcd-993e-2f230ddb78db	Torno	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3366	527f40e5-d747-4281-97b2-a827b5a8aedf	Vilar do Torno e Alentém	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3367	6a901567-bab6-4d13-b11e-4a4ce8c4b7fb	Alvarenga	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3368	a934eae9-3875-4b22-ae1d-f5be4e148d87	Nogueira	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3369	106d656c-1525-4524-98f7-3d123f77f2c9	Pias	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3370	38e2b389-1994-4b74-a243-3ac975814b34	Silvares	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3371	6d4f0f59-fc36-43b6-b14b-0f0464cc845c	Boim	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3372	4cfb5fee-a1d9-4ce0-a832-26563d13133d	Cristelos	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3373	aaa7b261-7027-45d7-8263-ac172f6ecce4	Ordem	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3374	f0532c99-6c49-4176-9be5-27d5a4b3be12	Nespereira	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3375	fc887325-c4f1-4dfe-922d-0901e31cca0a	Casais	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3376	2b8223df-1a98-48f4-9c61-2121b1cbba79	Cernadelo	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3377	822cee11-baea-4d19-a6af-300ed648df4c	Lousada - São Miguel	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3378	2e426159-588e-4205-ad89-3c94dece2eeb	Lousada - Santa Margarida	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3379	599b3a73-5e88-49a7-82d7-4c422ff2425c	Figueiras	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3380	d182b38d-4aa1-4fd0-af24-7def826a4b5e	Covas	\N	15	213	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3381	d6722e25-c224-42a9-8f40-153f65fcb21f	Lustosa	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3382	f371fa65-3f29-4c9c-88a3-ce1e901b0794	Barrosas - Santo Estêvão	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3383	8c1943b1-2bc8-4dca-b523-14aae818842d	Barrosas - Santa Eulália	\N	15	213	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3384	80322764-2766-432e-b22e-cb21a53c97b9	Águas Santas	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3385	cd85ece1-c4ea-40b4-b130-5fc23c16c520	Castêlo da Maia	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3386	c3105b75-cfb3-46d7-88f4-98efa39556af	Cidade da Maia	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3387	08ab99e4-de6a-462d-bdd9-b5069ab7bf64	Folgosa	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3388	4732a82f-71e3-4ec8-852a-81cba9c2dc3f	Milheirós	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3389	96c0ec77-e9e7-4381-b92f-6eaccfa2af3b	Moreira	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3390	5c153614-a102-4a97-b07b-87490903d0d5	Nogueira e Silva Escura	\N	15	214	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3391	c7885c56-8eb1-4a6d-97d6-44b881210bae	Pedrouços	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3392	bcf7afcc-b52c-4408-9321-b37bb41b01b7	São Pedro Fins	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3393	e8d0a72e-7fcf-4980-b2df-d3eb808d682c	Vila Nova da Telha	\N	15	214	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3394	3dfc9b2d-b317-4277-bfb5-ca39637ddb7f	Barca	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3395	ff7e76fa-97dd-4038-a201-83860d532389	Gemunde	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3396	6ce366aa-97a7-4ca6-9f4a-48ca90fabffc	Gondim	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3397	4d767c9b-514a-4a4d-8051-c52f31bac0ef	Gueifães	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3398	db2b2c15-fd9f-42c0-a940-bc4104100860	Maia	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3399	5a9257f7-97a2-4ca1-b05b-90e1ea72229d	Nogueira	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3400	90ee0f75-6ded-4de7-945c-0be39cd6af7f	Silva Escura	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3401	ebd17d4a-4863-43ff-96ea-781426821d44	Avioso - Santa Maria	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3402	3617491d-fda0-4dd2-9032-12457d6be30d	Avioso - São Pedro	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3403	d7cde33d-229b-4b5c-aec0-e7fe6f04e070	Vermoim	\N	15	214	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3404	c69bade6-a4a7-4e8c-9b08-62aebf0ac39e	Alpendorada, Várzea e Torrão	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3405	713e7e19-6ecc-428d-a78a-b4374ad702c9	Avessadas e Rosém	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3406	fa9f5889-15df-4482-a454-861aad6da439	Banho e Carvalhosa	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3407	d5654075-4011-4249-84b1-cf857739b8ca	Bem Viver	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3408	0e25cd10-d5c2-4ebd-b1c6-947ff82510c1	Constance	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3409	847b64d4-d857-4287-8971-6355fb115987	Livração e Santo Isidoro	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3410	14b99048-e04f-4d8e-a8fb-b14b9c6a792f	Marco	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3411	31d94f07-8279-4d34-b6a8-cfb26d82b260	Paredes de Viadores e Manhuncelos	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3412	28f2ef13-53b8-4516-bcf1-7a6214c708ec	Penhalonga e Paços de Gaiolo	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3413	a96a7d6e-25a2-4d2c-bb70-ecf8de19b8e7	Sande e São Lourenço	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3414	5245655f-6379-45dd-bee3-dbfd383fda64	Soalhães	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3415	de241990-e741-43e3-a5e5-887a9da02eda	Sobretâmega	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3416	e98c7081-d97d-4adb-a85a-53b6acbae80e	Tabuado	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3417	6ce27256-98b7-4a44-a790-34ab481d6876	Várzea, Aliviada e Folhada	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3418	951c5575-dc8c-4e94-834a-f44926dacf57	Vila Boa de Quires e Maureles	\N	15	215	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3419	08d2db7f-fa64-4994-b52a-0cb988efcf03	Vila Boa do Bispo	\N	15	215	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3420	22e32f99-4a8c-41b3-997a-1e8a02f10aee	Alpendurada e Matos	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3421	67ed8461-4ec1-479e-ba9b-a8366891126c	Ariz	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3422	2cfb8a1d-7978-423c-84a8-3ae788d952f4	Avessadas	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3423	e16712bf-05eb-44e5-972d-ea75bd44c20b	Várzea do Douro	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3424	f0f95aad-bd69-4d6c-96e6-919f39985691	Várzea da Ovelha e Aliviada	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3425	f993f07b-9eb6-4873-a12c-3f1e57ab46f2	Torrão	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3426	a80f2aed-a925-4c09-a36c-b4769cb8a700	Rosém	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3427	213fba0b-5dd7-4113-8683-cd44314f1288	Aliviada	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3428	9f6229f1-2a40-4283-8f9b-3b1ae4de5e10	Folhada	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3429	aff66d6b-0094-4202-9de4-f0b909cf33da	Fornos	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3430	743c9b68-7a64-4642-8313-44fda757cce2	Freixo	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3431	3e02df8e-996a-40fd-b96f-97c79cc0a69d	Magrelos	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3432	dcff8426-98e6-4480-ae56-cbdb1c03f7b4	Manhuncelos	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3433	c5abc148-9d55-46ce-85d1-509be82e166e	Paredes de Viadores	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3434	c47dd631-7fbf-4858-96bd-07ae3eebd2ff	Penha Longa	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3435	e3ab3467-ab52-4dd3-9d91-87eff432c274	Paços de Gaiolo	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3436	82d46068-11c7-4675-ac8a-fc46fd64d14b	Rio de Galinhas	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3437	8462542c-9558-4de3-ac8e-33075975c21c	São Lourenço do Douro	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3438	f57c0633-8709-45ba-a227-64bfebda0022	Sande	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3439	50627eeb-f578-4cec-9b8e-3018fec7dd24	Santo Isidoro	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3440	80e0f078-633e-4cd7-8564-2c777ee28b4e	Livração	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3441	ec6c4a4f-d6ce-4046-8365-59eb6f1a85fd	São Nicolau	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3442	4a3ac7e0-0497-4ca9-89f4-3cddd8d96f1b	Toutosa	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3443	84a3a164-a139-48d6-8bab-9695fe4fd502	Tuias	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3444	6541ab79-d3a1-4609-88ed-687f7a4dd28f	Vila Boa de Quires	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3445	84cf83e7-2671-470c-a504-2712e3b17ab2	Maureles	\N	15	215	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3446	131846ec-97f0-413e-88a3-abd01109f358	Custóias, Leça do Balio e Guifões	\N	15	216	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3447	f9b43efd-a5d1-498a-990a-12d9017efca2	Matosinhos e Leça da Palmeira	\N	15	216	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3448	79fdc236-9873-4768-a017-122422a2a46b	Perafita, Lavra e Santa Cruz do Bispo	\N	15	216	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3449	5c26b234-a96e-4c34-8d34-7e2fe99112bb	São Mamede de Infestas e Senhora da Hora	\N	15	216	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3450	9c1e580d-2dd9-40ad-b796-36babb1322c4	Custóias	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3451	cd018773-9c0f-4f3c-99c0-8d1ee053813c	Guifões	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3452	803aded5-e992-48eb-a0a5-4a21a810bf68	Leça do Balio	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3453	cfa6bf3f-73ca-4105-8d49-13ec1ca526d0	Perafita	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3454	865930e1-98de-455c-8bf2-440a487009f9	Lavra	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3455	e78152b2-d356-42e1-84fd-a9216a472818	Santa Cruz do Bispo	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3456	9d86568f-da73-492d-9865-1afe400a739a	Leça da Palmeira	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3457	3716e722-b126-4bea-b524-0c3c2b0fbf3e	Matosinhos	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3458	2966b4e6-093e-4956-8e2f-2438c74fc6c7	São Mamede de Infestas	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3459	795c4b6a-64ff-43ec-af8a-be53b2ac68d0	Senhora da Hora	\N	15	216	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3460	12784c46-76fd-4bb0-ba1c-b21d65602f3d	Carvalhosa	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3461	67d31ca5-1ffc-4dff-8b1c-169cc25bfeeb	Eiriz	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3462	ec050685-1770-493c-aa2f-2a1de78822b1	Ferreira	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3463	3067583b-d43a-4390-b936-97f9df6c615f	Figueiró	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3464	88317d6d-57ae-4556-9ed3-971c49760349	Frazão Arreigada	\N	15	217	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3465	9df60388-e11d-4677-915a-2cc3546aeef4	Freamunde	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3466	46362867-dae7-47fc-a758-faaf56f13676	Meixomil	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3467	211ae3aa-aa4c-42c0-9be6-4340d687d09b	Paços de Ferreira	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3468	5987125d-ecff-4388-a2ce-6173e3b744d0	Penamaior	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3469	2a981fa7-86f9-4909-99f9-168494517ea2	Raimonda	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3470	5df1e450-722e-49bf-8c18-6f2f8f053c43	Sanfins Lamoso Codessos	\N	15	217	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3471	bac12738-320a-45f1-acac-e9f7250f1a09	Seroa	\N	15	217	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3472	eca90cef-afd8-4e11-8598-f8a97b305e49	Frazão	\N	15	217	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3473	632af643-6c2b-4c4a-914d-54271ccb85a3	Arreigada	\N	15	217	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3474	b191bda2-420d-4422-a2f1-b0c38adcf90b	Codessos	\N	15	217	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3475	b0e225c1-729d-42e8-ab32-24312e0b43b9	Lamoso	\N	15	217	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3476	fc65c8e2-e1fa-4be0-840f-a86a8be79ff8	Sanfins de Ferreira	\N	15	217	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3477	9da25336-3311-48b7-80c2-8354c3aa28a2	Modelos	\N	15	217	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3478	f541727e-88fc-4017-a8db-dd3fa330b9aa	Aguiar de Sousa	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3479	9ca30459-8da7-4660-a1f4-630adf18acbf	Astromil	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3480	a374e650-a050-4aac-9b4d-1f53ae86bebd	Baltar	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3481	343b7029-dc5e-499a-8b47-63233a8df78c	Beire	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3482	68f681b7-2c1c-4a6e-b102-b2b43efe686d	Cete	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3483	f17f72a7-5983-4779-9678-0b63b0700c04	Cristelo	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3484	9e9bb459-dec4-4920-9e3c-584c93a29887	Duas Igrejas	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3485	69f8bd27-daaa-43ef-bf9e-009d48d66ab1	Gandra	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3486	e5d37458-c34d-4ea9-931f-e4604605169c	Lordelo	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3487	4b385b51-e219-4805-be30-a56032879cef	Louredo	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3488	913f195f-8d3d-4afa-a1d1-815e2b359b2e	Parada de Todeia	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3489	a5bd4f88-4e0c-467f-b9b2-81bf833eb42c	Paredes	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3490	677bf2ec-dfee-451e-8382-e52080df5a58	Rebordosa	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3491	cc4b87f9-83fd-47f5-985c-7a628c919e72	Recarei	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3492	210196a9-6ef6-4e91-9eb1-c6bf8c5ece99	Sobreira	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3493	7bd4461c-aa72-43ef-ad5c-754ef7440b8b	Sobrosa	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3494	c5797539-904e-4189-8c64-9471c301e39c	Vandoma	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3495	0ddeab55-94fd-47c7-970e-a2ae4010c45d	Vilela	\N	15	218	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3496	26fbab24-54ea-4cc7-aad1-5402f301198f	Besteiros	\N	15	218	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3497	967c0007-b18b-4a58-adbf-9938663ed38e	Bitarães	\N	15	218	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3498	1bec9c87-3f33-42d2-917e-036e1c277de8	Castelões de Cepeda	\N	15	218	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3499	9e0b9b55-8e31-4178-bdf6-358d90898317	Gondalães	\N	15	218	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3500	10b7c412-359c-4039-990c-586c7154b687	Madalena	\N	15	218	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3501	9cf0ea9e-977c-4928-82ba-821117f5b030	Mouriz	\N	15	218	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3502	0ddeb3e8-7bc5-4af7-ae43-0c2b8897a299	Vila de Cova de Carros	\N	15	218	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3503	801be67f-f476-4098-94dd-b2ad69578968	Abragão	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3504	fc0f8dd0-8fa8-42a3-be89-f15966587ec8	Boelhe	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3505	73f4a806-05cc-4a38-8ec1-0baf26ae9b64	Bustelo	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3506	636e57a0-170c-4b67-a11c-0f6193dff0c4	Cabeça Santa	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3507	62dd436b-ede5-4add-89fa-d92b8b0ec814	Canelas	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3508	9be6dd75-1714-468f-8199-db53bbebd818	Capela	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3509	95268628-ac0f-40f8-8b6e-ba9413f2784d	Castelões	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3510	32c07515-d016-4c5d-9625-6c2e17961369	Croca	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3511	407707b4-aa06-49aa-86a0-0bfc88499234	Duas Igrejas	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3512	be065fae-bebc-438d-b3ec-e932ac462ed4	Eja	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3513	e7e0b600-4422-4e17-96f6-7d8c72647cd7	Fonte Arcada	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3514	c456b200-d765-484b-b6f1-61ddd4a7dd92	Galegos	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3515	e1b56cb8-60cb-496d-80ce-be8f0c4bde01	Guilhufe e Urrô	\N	15	219	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3516	d819be9c-fe10-472f-8390-f9169717ba52	Irivo	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3517	c6f896fb-2188-4e01-b84d-ff6b6358a646	Lagares e Figueira	\N	15	219	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3518	e1689378-ee21-4fec-bf34-81911f7a6c11	Luzim e Vila Cova	\N	15	219	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3519	e028f7fa-e921-4a59-9faf-d777bc64aa06	Oldrões	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3520	c460a442-140e-4b54-b220-6e1751d38d8f	Paço de Souza	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3521	01d4ba6c-d34a-4469-9b09-899c9f19ed27	Penafiel	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3522	1fe1ded9-8b13-439f-97f0-b63c58f357be	Perozelo	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3523	09e0fa82-9fdf-457f-86d5-eb4f37d42d64	Rans	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3524	a6425a3e-7164-492c-b6ff-a35b0d389bf7	Recezinhos - São Mamede	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3525	03445d9d-ea59-4fde-9528-0f8ae0f0ce85	Recezinhos - São Martinho	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3526	48fe38b6-f486-4cca-9e0e-e59f72834682	Rio de Moinhos	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3527	8cba4c65-414d-428b-ad2f-1f5f47fdc376	Rio Mau	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3528	9698fb57-1409-44e2-85c2-3cb681cfc922	Sebolido	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3529	1e012e64-2a92-4b5d-9554-2e4cf5378ce1	Termas de São Vicente	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3530	8eccc1d5-12ff-4cfd-85b8-a3678db2a8f2	Valpedre	\N	15	219	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3531	d7f75c42-dd05-45a0-b56b-66ae0d349fe7	Figueira	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3532	7f5db3fc-ba1b-4144-8591-3c93fd39c6c0	Guilhufe	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3533	390c60d0-bc91-4caa-b529-f75a70b41c11	Lagares	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3534	815d4204-9436-4858-982a-96e4ab72b218	Luzim	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3535	fcffc365-1126-4dcf-9316-a3aa5a0eb2d2	Marecos	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3536	a01a0d92-77a9-4d58-8561-c112dc6ae45e	Milhundos	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3537	de01b6d9-a2b9-4dd2-87e3-745195106fd2	Urrô	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3538	2575f441-221c-480b-b390-2316f046b94f	Novelas	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3539	ff1b12b2-b490-4f49-95fe-28fb01ea375e	Paredes	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3540	dc8dd98b-3aab-4c44-9bca-e16f2643d51b	Pinheiro	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3541	37afe2a5-d4e1-427f-860c-640f0df037fd	Portela	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3542	97d016df-29ec-4469-9236-df57aa779067	Santa Marta	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3543	dcec062b-4e86-49e2-989a-fee4ea8c6d4d	Santiado de Subarrifana	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3544	ffd6e41d-b847-41b7-bf7f-b6e385a54393	Vila Cova	\N	15	219	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3545	823fd924-4ecd-4ca3-ae82-ad998737cd51	Aldoar, Foz do Douro e Nevogilde	\N	15	220	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3546	547d8933-91fb-41d9-95f4-744a9f759974	Bonfim	\N	15	220	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3547	203b1e04-0f4b-47fb-bf3c-fccc545c98ea	Campanhã	\N	15	220	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3548	d26d6e17-837d-4967-a084-bf953ffbc8e8	Cedofeita, Santo Ildefonso, Sé, Miragaia, São Nicolau e Vitória	\N	15	220	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3549	9f251c8a-962b-4de1-bada-d48112eabb9d	Lordelo do Ouro e Massarelos	\N	15	220	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3550	fb446ade-c4eb-4e31-a690-6a6aec397a95	Paranhos	\N	15	220	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3551	8eea169c-b26e-4e16-a85b-20932f4c5d4f	Ramalde	\N	15	220	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3552	c0c01a63-bb4c-4d95-8d56-f9f333bcb3ed	Aldoar	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3553	28e91f45-a123-4e04-a4e3-a10a478a3648	Foz do Douro	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3554	20df40de-2c5e-4353-baff-90a4e8388303	Nevogilde	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3555	2c127338-2ab7-49fc-85a8-9ff323b5cd38	Cedofeita	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3556	59194655-ef55-468f-9428-cc3b3d681fcf	Santo Ildefonso	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3557	c6521437-d465-4ba5-b7f5-48c3874420a1	Sé	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3558	1e6cbb1e-bc34-45ff-aee3-6943ed93f73f	Miragaia	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3559	624bde16-103f-481c-8c7d-9759d6eae4b1	São Nicolau	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3560	eaf9258c-363c-4b96-9770-6ec7906a4e10	Vitória	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3561	fab49211-43b0-4f39-9015-91c5d6688d75	Lordelo do Ouro	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3562	509612a0-d62d-4875-ba19-df2a0597e144	Massarelos	\N	15	220	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3563	17364d4b-4acd-4af0-b868-328cbedd0b67	Aguçadoura e Navais	\N	15	221	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3564	f4ac83a1-3644-40a8-b4d0-2759bbcaf37d	A ver-O-Mar, Amorim e Terroso	\N	15	221	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3565	c62e8f2a-14b0-4dea-a3ea-fadec7c0495c	Balazar	\N	15	221	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3566	3816bc34-735b-4c4b-a399-c828b1a223ee	Estela	\N	15	221	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3567	d126fb04-282c-4249-840d-933a7877dacc	Laundos	\N	15	221	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3568	4c474ada-c196-4726-b273-25839e198a6d	Póvoa de Varzim, Beiriz e Argivai	\N	15	221	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3569	ec0d108f-b581-4f65-8783-2583e023a8b7	Rates	\N	15	221	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3570	7be9abe7-8cec-45ec-a836-cffbffe3797b	Aver-O-Mar	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3571	60b0e257-cfa6-424a-9eb1-4be28ccedd84	Amorim	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3572	941d1491-a985-43f3-8c75-e0669c9f287a	Terroso	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3573	4853c8b2-a9bd-46a0-b450-7447aab70498	Aguçadoura	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3574	33d30699-e46e-44e2-94b4-f2114db6bf79	Navais	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3575	644edb61-3019-4b47-9993-b7228a2da577	Argivai	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3576	e84baad0-f3e0-4a6b-9b28-ec16de2d4311	Beiriz	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3577	2444d0ef-5f18-4826-a560-124ed28e7cbd	Póvoa de Varzim	\N	15	221	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3578	fa06c83c-017c-4d94-a900-a818ca4e08c9	Agrela	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3579	22529e11-ada5-411c-a395-694a5315d397	Água Longa	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3580	20085be5-1d2a-4dda-a86b-698de0ad2a1b	Areias, Sequeiró, Lama e Palmeira	\N	15	222	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3581	046bb21f-96ee-442c-998b-1422c4e5523d	Aves	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3582	289ab451-8745-4815-9db5-3b94f64b2976	Carreira e Refojos e Riba de Ave	\N	15	222	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3583	4b1e4af9-be5c-40d5-8d26-698527b41634	Lamelas e Guimarei	\N	15	222	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3584	3cb16035-fe00-4008-98ef-559b38968dbe	Monte Córdova	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3585	7443efa5-4c48-40e5-aee2-5da9e7b39bde	Negrelos - São Tomé	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3586	69cc9e14-4296-4a6f-905b-3d7ffaab43b0	Rebordões	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3587	31e5df3d-e385-46a6-b81f-9549f3db1bf5	Reguenga	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3588	bf6aab1f-466e-49c2-af56-3e60163eda31	Roriz	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3589	480544fc-1bdc-4adb-bd62-667fa236e87f	Santo Tirso, Couto - Santa Cristina e São Miguel, e Burgães	\N	15	222	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3590	8b060e5f-344c-4c9a-bbfe-b64f395f8da2	Vila Nova do Campo - Campo, São Salvador Campo, Negrelos	\N	15	222	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3591	1d2cad2d-f610-4efc-a81b-483f0cb55e30	Vilarinho	\N	15	222	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3592	6c547a50-d855-41f1-8679-f6fb362225d0	Alvarelhos	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3593	dd1e9355-23b0-43c5-acb1-c18d5e738fb4	Areias	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3594	e03d7b9b-c3c0-4412-91c7-f82b86c39e66	Lama	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3595	f4393818-cd56-4070-b5f6-5d0a45a8febf	Palmeira	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3596	da2bc050-e8cd-457f-8fad-e2e69265dd38	Sequeiró	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3597	48357d9e-7660-4683-b616-c62d64167115	Santo Tirso	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3598	523fd77a-f02d-41e1-a6c1-704b3db8e1d2	Couto - Santa Cristina	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3599	390b02c2-5e38-4ec5-95df-9c5d0d5e86dc	Couto - São Miguel	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3600	267ffac6-f3f5-49f3-80af-6d01c84e708b	Burgães	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3601	26c53686-e506-4505-9d3a-374056a1615d	Carreira	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3602	a090bd0b-8205-445f-9085-4b88d82f24c2	Refojos e Riba de Ave	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3603	4af73b0e-bad7-47e2-b759-be6ff4dfad9b	Covelas	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3604	8a958b01-b385-4b05-a133-d71897baf8cf	Guidões	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3605	e2cecb33-fa4b-4317-974e-9fefb255f3d0	Lamelas	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3606	63a0fa64-b8e8-4c5c-8574-85a670c0f4ad	Guimarei	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3607	dce8ddf6-6d6f-4ec4-9b8c-f5d087645694	Muro	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3608	aa64a4aa-f957-47e4-a757-01e8b48e23f8	Bougado - São Martinho	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3609	7ed6f370-0b6b-42a0-9fd7-7930e4ca2f57	Bougado - Santiago	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3610	5d040a82-3369-410d-a130-c63e718222e3	Coronado - São Romão	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3611	74c7aa63-558a-4f37-9f2e-1069c0c2bb30	Coronado - São Mamede	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3612	8414f15f-db4d-4e0a-be9a-61201a250a58	Negrelos - São Mamede	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3613	6e689ca9-666c-4b72-b930-cf0e081b1d10	Campo - São Martinho	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3614	8dd13474-40dc-4883-8b93-a4da7da033dd	São Salvador do Campo	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3615	86b5b452-a4a5-4da8-b0b4-a75ee9d33170	Sequeiro	\N	15	222	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3616	de9f69ff-8e56-4690-bf86-ee87c06d20c3	Alvarelhos e Guidões	\N	15	223	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3617	748ad54b-0919-4138-b22a-4d06a4ece701	Bougado - São Martinho e Santiago	\N	15	223	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3618	066b4b59-e768-4b10-9aee-008ceba9ea29	Coronado - São Romão e São Mamede	\N	15	223	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3619	49560b29-76b1-4c9e-b58e-abe5ce674b9b	Covelas	\N	15	223	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3620	c2531dca-cb3f-4368-ac66-6147ea644f93	Muro	\N	15	223	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3621	97a1cec8-b722-49ba-b0bf-2f3b4b991653	Guidões	\N	15	223	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3622	6dda7d99-9ada-49b5-9aec-58971ece6865	Alvarelhos	\N	15	223	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3623	67bdc9d3-479c-4904-9d93-a7dcf06a8287	Bougado - São Martinho	\N	15	223	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3624	01beffed-9737-417f-a3c4-79d763c628b7	Bougado - Santiago	\N	15	223	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3625	eb65f2d3-d78d-4f5f-a5f8-3cc45079a122	Coronado - São Mamede	\N	15	223	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3626	ad7d94ca-09d2-46b4-b3f3-eff6e59cab3a	Coronado - São Romão	\N	15	223	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3627	033de062-b693-4b75-811d-fa7da79139b6	Alfena	\N	15	224	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3628	0c0ea14e-c4a0-4b89-91e6-2664f3cc7145	Ermesinde	\N	15	224	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3629	0911aaed-787c-41b2-a396-517ef5ef734d	Valongo	\N	15	224	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3630	5332d923-2207-4f2f-9c6f-9288d67e81a7	Campo e Sobrado	\N	15	224	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3631	d9a84f76-1626-4aa9-a9ca-c0fe8c6113b2	Campo	\N	15	224	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3632	ef634807-ca2b-4439-bf70-2426e464faae	Sobrado	\N	15	224	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3633	adb336b5-5736-444f-849b-bfca313f4687	Árvore	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3634	38cd4af9-caa8-434b-b245-a1bd2d522202	Aveleda	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3635	27ad0d2d-61d6-4056-9972-ed2676742442	Azurara	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3636	044224a6-e801-4d30-96e1-fd83b32fbdb8	Bagunte, Ferreiró, Outeiro Maior e Parada	\N	15	225	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3637	aa6924ed-da56-40a1-a91d-762378d21345	Fajozes	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3638	17e347dd-0c96-4b26-8850-501ec321895d	Fornelo e Vairão	\N	15	225	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3639	e4e78eb6-3f50-4a54-bae6-349011a226d6	Gião	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3640	bb583748-a3d9-4884-b8bf-dbafed9c0bf0	Guilhabreu	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3641	14c4b1cd-fdc4-4d9a-a882-a3e7fa9681dd	Junqueira	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3642	9822de14-972c-4c2f-b967-a570dba63b3f	Labruge	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3643	3fa8e478-959d-42d3-b457-ead3340e9454	Macieira da Maia	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3644	47cfa458-f53c-4eff-8914-54c7b9e913a0	Malta e Canidelo	\N	15	225	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3645	5f18bb60-b5a5-43b4-b750-aaffab7ad782	Mindelo	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3646	32ff99ee-60a7-4112-8978-fc4e6a385664	Modivas	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3647	d61bfcb7-c8a7-45db-bb19-5c849ab20f73	Retorta e Tougues	\N	15	225	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3648	a071347d-83c0-45f5-bf6c-021585724129	Rio Mau e Arcos	\N	15	225	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3649	0032d37f-25f9-43ff-a581-377733308f3a	Touguinha e Touguinhó	\N	15	225	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3650	bf1f1cbe-5a92-44da-b9ca-47ad3fc69556	Vila Chã	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3651	19063df1-0061-484f-882e-ad3bc621aae3	Vila do Conde	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3652	8abc213a-97a6-4d9c-a8f9-09eaea10e6f7	Vilar de Pinheiro	\N	15	225	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3653	e073172a-29f7-4485-923d-291316e5b286	Vilar e Mosteiró	\N	15	225	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3654	92d216f9-6a51-47fa-ae4a-ac9aef5a603d	Arcos	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3655	88e8ef5e-c7c8-4a48-9b9c-3c53c9b45bdd	Rio Mau	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3656	10003b52-aa50-496e-8344-d505ee62342d	Bagunte	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3657	8a67e1bf-728f-446a-a0e8-010f27dc93ef	Ferreiró	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3658	f09513ba-5ec8-4390-aab9-33989caed782	Outeiro Maior	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3659	1ef3bb9c-3a99-4bd5-bad3-67314c987f8b	Parada	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3660	a17f5891-c40b-4c18-95b0-3076232a968c	Canidelo	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3661	92030ad6-9cc7-463c-9800-98944a03fbe8	Malta	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3662	0158e155-e8eb-4f53-a274-471cc834586b	Ferreiro	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3663	514e1180-2513-4528-a857-7a5f99bc94af	Fornelo	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3664	73700615-7653-43c8-a912-c56af80c9df5	Vairão	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3665	b2be5eab-0bf1-4d7a-a4a7-f0c2a05a7c6e	Outeiro Maior	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3666	75de0609-b084-4af3-beae-1c8cdc7d1f74	Retorta	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3667	6c226b34-6182-4b2f-be40-1959cad42539	Tougues	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3668	f225ac2b-c721-42d7-8117-41dce2f32a1c	Touguinha	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3669	6530cdd5-172a-43fc-9171-4aa7ad6c8401	Touguinhó	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3670	a1ad2dbd-2ac6-4f20-8355-775cde02ca96	Vilar	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3671	4472c0fd-67e3-48f1-943e-813e33f2e17e	Mosteiró	\N	15	225	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3672	76f9fcff-3281-4e29-86e0-745efefe7ef9	Arcozelo	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3673	8601c245-ddc9-4bc3-900f-e8d4cf6f3594	Avintes	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3674	a090a086-d194-4539-9424-fbec9716d193	Canelas	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3675	e7734c90-1d84-4f11-9f52-8ff51d1da8e2	Canídelo	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3676	d5d06b4c-3c26-4252-9398-21481ccd0d20	Grijó e Sermonde	\N	15	226	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3677	26922937-fa78-42fb-80cd-996d5f06ab7b	Gulpilhares e Valdares	\N	15	226	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3678	5d12c0f7-4fbd-40a2-aa86-58750de45fa8	Madalena	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3679	cb20b8c7-83a2-4a5e-ac2b-5c397eefd7ca	Mafamude e Vilar do Paraíso	\N	15	226	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3680	16f2c147-a7d0-4b56-ab31-4c1f3c3a8f99	Oliveira do Douro	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3681	9e7b698c-47d5-456a-a39c-14348aa60f3a	Pedroso e Seixezelo	\N	15	226	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3682	256abb0f-6193-4178-a4c5-ab8c8517941c	Sandim, Olival, Lever e Crestuma	\N	15	226	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3683	5c91a3b5-9eb0-4211-8973-4ba9517b1c3b	Santa Marinha e São Pedro da Afurada	\N	15	226	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3684	59bcd380-03db-4356-8da9-580c487eaad5	São Félix da Marinha	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3685	4c4a300f-1bcc-4d31-8425-21afa5ccd8b8	Serzeso e Perosinho	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3686	d52a9fe9-514d-4a38-a748-0afe42b91668	Vilar de Andorinho	\N	15	226	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3687	2335608a-f9ca-4be2-aa40-cedff8aa7da6	Crestuma	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3688	881e2380-025d-4493-a74c-4748757d070e	Lever	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3689	b77272c6-e186-433e-8be5-5bbb00b1a4b4	Olival	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3690	1d198683-3050-4a1f-801b-d6a2ec56ce59	Sandim	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3691	7d7ce56f-8e3d-4887-9c1e-d03af78150ed	Grijó	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3692	ab1e0e0c-2c77-4c6b-bd7c-0e2202775819	Sermonde	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3693	0528ca11-4693-4fa8-8d39-c45f50a8299c	Gulpilhares	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3694	1d372d1c-9002-4509-a839-8be0306c0b94	Valdares	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3695	d8c5c147-4db1-4a71-baf1-7c77e1b377be	Mafamude	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3696	f3efdb69-0e60-4a28-a27a-097e62398cd8	Vilar do Paraíso	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3697	28316870-e76b-4655-8582-c8d232ad8063	Pedroso	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3698	d6f31ae0-ed75-4ee5-83eb-031169683554	Seixezelo	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3699	dae7437e-5ce1-448b-8712-c0002ac0c530	Vila Nova de Gaia - Sanra Marinha	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3700	285eec18-e03b-4509-9b57-fc673468ffd2	Santa Marinha	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3701	1d97b298-ee59-4518-8b01-6cd3ffbf9eda	São Pedro da Afurada	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3702	1d73ebfe-d1cd-4d6b-a49a-12c10b0206cb	Serzedo	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3703	38961d38-ebe0-48ff-80fa-b38ca5adcb98	Valadares	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3704	5dfcd640-00e0-415c-8bb9-357817044101	Vilar do Paraiso	\N	15	226	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3705	cb126d72-c023-4c0c-a4b6-d72a7d87bc4d	Abrantes - São Vicente e São João, e Alferrarede	\N	16	227	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3706	d4b9d412-7fc8-4692-9550-9dd3a5e3c140	Aldeia do Mato e Souto	\N	16	227	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3707	d6b6bab5-f86b-4cb1-9635-8976915c6086	Alvega e Concavada	\N	16	227	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3708	e3aa69a0-ca41-48e6-8f44-5989b0e953b1	Bemposta	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3709	30bdfb60-d6e2-4d44-887b-a7b77a3496bc	Carvalhal	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3710	125a137d-56b8-4439-b827-d4f722d5545e	Fontes	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3711	1317c0b5-fb0a-4f1f-a938-3f9f92dadd07	Martinchel	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3712	38313fee-b78e-47d5-924f-68fc7dbb9c6a	Mouriscas	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3713	64af03db-9c26-4244-a41d-f388c003084a	Pego	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3714	1860b186-fbfc-417e-9653-ca6c28711d59	Rio de Moinhos	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3715	f3cbbc00-a5a4-4991-bf0f-75029cf5a25e	São Facundo e Vale das Mós	\N	16	227	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3716	d6224b8e-2b89-4099-92ac-f18ef4940b2e	São Miguel do Rio Torto e Rossio ao Sul do Tejo	\N	16	227	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3717	7ff0512b-6f6b-4ccf-8de4-47018d2222fd	Tramagal	\N	16	227	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3718	03b89dbd-bb45-41fb-89ad-3ebe423eb9e6	Aldeia do Mato	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3719	2b86cd9a-e6ac-4a07-bdb1-5c52b39be0a0	Souto	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3720	42d0d153-26d4-4959-8e15-0b7dabc66962	Alferrarede	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3721	579e01fa-622d-411a-af80-266c966ef426	Abrantes - São Vicente	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3722	5033cd17-3334-4abc-8d3a-a7e207577c90	Abrantes - São João	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3723	d5f95f8a-02d5-4ba6-82cf-acb52d5b315a	Alvega	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3724	88bc8e32-9382-4424-8e95-1673302badb9	Concavada	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3725	1f9e8b6e-bea0-4b99-9076-f7df99bae963	Rossio ao Sul do Tejo	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3726	8a6c6f20-f3b8-4971-a862-43a472404db3	São Miguel do Rio Torto	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3727	e6740471-bde0-4610-9d36-80a07d31af3c	Vale das Mós	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3728	7b7f4682-ba6a-45ce-a6e1-efb2349bf1f7	São Facundo	\N	16	227	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3729	70cf1862-fb9d-46a6-b0e8-d68c6afb77f8	Alcanena e Vila Moreira	\N	16	228	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3730	e39161f0-a022-4215-af27-cd79c61d70f0	Bugalhos	\N	16	228	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3731	02ae0163-766f-4b70-9876-91479e3000c8	Malhou, Loureiro e Espinheiro	\N	16	228	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3732	34e43b7b-8680-4026-a4ee-dfb6b47aab5c	Minde	\N	16	228	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3733	c7714e7e-aa52-46b0-be37-611a2c516e58	Moitas Venda	\N	16	228	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3734	0a9c39b9-b652-4307-80f8-ab6e318dacce	Monsanto	\N	16	228	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3735	dcf26323-aeca-41ce-8d46-a06a81680fab	Serra de Santo Antonio	\N	16	228	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3736	aef2d47b-f983-4092-9142-bcff99cc1edd	Alcanena	\N	16	228	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3737	8be41aea-d1c1-4733-bbba-dac04310213b	Vila Moreira	\N	16	228	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3738	76dc5e5a-56dd-4753-8f37-31af1ad4e626	Malhou	\N	16	228	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3739	e2aaef09-df27-48a3-83f0-f5a4becf66f4	Loureiro	\N	16	228	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3740	436d2ae1-7cd9-4085-a7f7-72a1ead3212f	Espinheiro	\N	16	228	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3741	1a9aa17c-685a-4f3b-a404-14688164b02a	Louriceira	\N	16	228	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3742	ea406578-d91b-4a3b-b51b-b943aea7279c	Almeirim	\N	16	229	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3743	92a6d934-72e8-49df-b9e8-4b7b5df23311	Benfica do Ribatejo	\N	16	229	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3744	16f8e869-b9c2-4c43-ab4c-e41edf81caeb	Fazendas de Almeirim	\N	16	229	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3745	82268a2e-96ef-47f7-9510-83659ac1029e	Raposa	\N	16	229	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3746	aed13874-310c-4776-a8ef-f13d41dde3d5	Alpiarça	\N	16	230	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3747	533f481b-0d8b-4237-a0e3-705f08cf210c	Barrosa	\N	16	231	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3748	193da1fd-f8e8-413c-b478-45e6ab08dbbd	Benavente	\N	16	231	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3749	114bb026-ce1a-4774-a07b-b124d97c3dd2	Samora Correia	\N	16	231	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3750	a61a930e-a6d1-4f88-bb36-88ffbab65874	Santo Estevão	\N	16	231	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3751	ab1c1066-576c-4e54-a093-982245dc8e0e	Cartaxo e Vale da Pinta	\N	16	232	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3752	73013e13-9b81-4acc-bc21-929c5f46c260	Ereira e Lapa	\N	16	232	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3753	40bb9b30-1ab7-42c7-895b-de703579f0f7	Pontével	\N	16	232	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3754	31bd5d2c-eb9b-4b67-9211-1d372d127356	Valada	\N	16	232	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3755	a7673bc0-01a6-4b18-b6b8-d8ec57313aa8	Vila Chã de Ourique	\N	16	232	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3756	2d6c4334-d638-492e-801d-e4d089602728	Vale da Pedra	\N	16	232	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3757	8107d58f-c408-437a-82b8-07884eb92c4b	Cartaxo	\N	16	232	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3758	23727ad5-aeb8-4ff0-aa4f-99ae9eca0a1f	Vale da Pinta	\N	16	232	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3759	515356c8-0f3c-48e1-baa6-14d4c84d7aea	Ereira	\N	16	232	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3760	8c8ea4fc-a26e-4660-b8da-fa0b732dfaf0	Lapa	\N	16	232	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3761	674ccb83-23f8-45d5-b8df-33de9aae243a	Carregueira	\N	16	233	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3762	7e15841c-bfee-46ab-b7c1-9eb6c06a8b70	Chamusca e Pinheiro Grande	\N	16	233	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3763	2b354329-1fa9-4723-83e7-32df7aac0348	Parreira e Chouto	\N	16	233	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3764	09be5be2-2300-4678-a174-1f85c74098f8	Ulme	\N	16	233	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3765	cd0a7404-706d-47b5-818a-259587d37840	Vale de Cavalos	\N	16	233	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3766	8afc3ba9-ced5-4e7c-bd65-1b2fe2d1d6a4	Chamusca	\N	16	233	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3767	4c3bf60f-380a-4d18-b5e1-c439c2d9003d	Pinheiro Grande	\N	16	233	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3768	9abf9d85-4f35-49c2-836c-34250b560a01	Chouto	\N	16	233	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3769	b44a9561-1eed-456f-9583-9cda214bb043	Parreira	\N	16	233	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3770	639ecec3-77e1-4800-9dff-e03f23b41626	Constância	\N	16	234	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3771	59464445-92b1-414b-bf15-feb7516b89ee	Montalvo	\N	16	234	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3772	0384f283-ba5d-45d8-ad0b-fe5c59f0e629	Santa Margarida da Coutada	\N	16	234	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3773	b7b93d2b-d241-4cdd-8c4e-695c13bad2f5	Biscainho	\N	16	235	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3774	b0736fb4-3026-42d0-ba32-5014c57537d6	Branca	\N	16	235	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3775	ad8bb493-f241-4fc7-a673-5bb527e79db9	Couço	\N	16	235	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3776	0f728df4-699d-4380-acd9-c9abb52ddcf0	Coruche, Fajarda e Erra	\N	16	235	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3777	91cd02af-226d-4a60-aff5-dc490d31e8a2	Santana do Mato	\N	16	235	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3778	6d043fb8-08a8-42fa-a0ca-57163a24a064	São José da Lamarosa	\N	16	235	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3779	7a6b3dce-94f5-4475-a4e1-f05039d5d173	Coruche	\N	16	235	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3780	f8c1c3a4-428b-42ef-a57a-b9fe25f563cd	Erra	\N	16	235	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3781	a4d8e6aa-18ff-403e-b112-7fa1a2c8779b	Fajarda	\N	16	235	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3782	c0c2386e-6f9d-4703-88ff-b1d86d4c801b	Nossa Senhora de Fátima	\N	16	236	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3783	d5ea58cd-3c34-413b-9d48-86698b1a1bbe	São João Baptista	\N	16	236	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3784	a36bd163-aaff-42f8-8a64-bf901db4b4b9	Entroncamento	\N	16	236	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3785	dc2bbb24-fc49-4a63-862e-c67604c4ef7e	Águas Belas	\N	16	237	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3786	54ace9f9-3d29-4573-ac91-4dcdf6c7108f	Areias e Pias	\N	16	237	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3787	7fb5d5f8-a10f-4e7e-841c-ca082d1ebd80	Beco	\N	16	237	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3788	c17fa1a6-0788-4f61-8af1-a44786c48672	Chãos	\N	16	237	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3789	6f0b51c8-7b5e-4f0f-984a-99dd66c415ff	Ferreira do Zêzere	\N	16	237	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3790	8eabd583-06a9-4286-87de-747f28ff38a3	Igreja Nova do Sobral	\N	16	237	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3791	87f7db87-57de-4a2d-bd0b-b4849cc75279	Nossa Senhora do Pranto	\N	16	237	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3792	577efe49-2f25-46ee-825a-693c25ac8d80	Areias	\N	16	237	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3793	09cbcc06-249a-41f0-9faa-200f7face179	Pias	\N	16	237	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3794	58fa6631-4536-4ba9-b0c2-c1013cda07bb	Dornes	\N	16	237	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3795	d5a4abd3-3762-4aed-87ab-80d875be8827	Paio Mendes	\N	16	237	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3796	2d5e751e-d2cb-4c82-811f-6c89a6770959	Azinhaga	\N	16	238	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3797	b24f6b73-7921-4686-861c-6436842cd5ba	Golegã	\N	16	238	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3798	78692cdd-e924-49d3-ae1e-150dc7c6aebc	Pombalinho	\N	16	238	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3799	eea468f4-184c-40d2-b25f-a7b5208132f3	Amêndoa	\N	16	239	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3800	58808112-1fce-4d75-99ee-6cc64af6464f	Cardigos	\N	16	239	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3801	3842f729-d2a8-4336-8bcf-e5beec6a3cdb	Carvoeiro	\N	16	239	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3802	f640074b-7feb-4f4b-b33e-6d4d8a4cdaa6	Envendos	\N	16	239	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3803	d8f2c77c-2175-4d44-8ec9-e0bf14da1b9d	Mação, Penhascoso e Aboboreira	\N	16	239	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3804	ff01129e-a600-449f-b818-94e3792b1fe2	Ortiga	\N	16	239	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3805	c7b49b4d-2179-4c50-85ee-75835aea1642	Aboboreira	\N	16	239	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3806	340de040-d6ec-43eb-a0eb-504ca679ce84	Mação	\N	16	239	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3807	ab51b0d9-cef0-4d82-8ecd-6c9fa2686e22	Penhascoso	\N	16	239	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3808	b8ab16a9-4b42-433e-98c5-c6efe31d103c	Alburitel	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3809	b78b4ce0-caa8-499a-b203-f922c78a369e	Atouguia	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3810	31f0ec2a-e109-4699-8d07-42c886aeecac	Caxarias	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3811	8b9adf15-cd2b-43bb-b974-bf0e50b9307b	Espite	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3812	3e7e5a46-2309-4345-bc46-fb4f59a056bc	Fátima	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3813	a11d3f50-0a9f-4a62-915f-2705a3833ebf	Freixianda, Ribeira do Fárrio e Formigais	\N	16	240	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3814	bacaf144-2c3b-42a3-b549-5f829f5d5d13	Gondemaria e Olival	\N	16	240	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3815	ec1615ae-0c29-42b7-9641-9ce280a403dd	Matas e Cercal	\N	16	240	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3816	edd74566-9455-4551-aab9-688ed0af16a9	Nossa Senhora da Piedade	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3817	a7474f06-5e9b-42db-ab45-13a88f9517fb	Nossa Senhora das Misericórdias	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3818	7e4351b8-9773-4004-bb3d-b05ad50ee40c	Rio de Couros e Casal dos Bernardos	\N	16	240	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3819	1af5cb7b-2282-40c5-ac4e-3835c49d7074	Seiça	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3820	c564ce24-55f6-4a4d-a4dc-d151f790a273	Urqueira	\N	16	240	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3821	28c0ee2c-50cb-4661-9219-cdb63708a10d	Casal dos Bernardos	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3822	5bf5bb68-396b-44af-9bf9-d86c78e2ee31	Rio de Couros	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3823	7534ace8-913b-4135-9a14-cf751a246662	Formigais	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3824	551f20a8-7be3-447e-8927-d82debaaaba6	Freixianda	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3825	dab973cc-bf44-4a4b-b383-2bf4e7005cce	Ribeira do Fárrio	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3826	ca48e82e-9e14-4cfe-8c72-56e333f03697	Gondemaria	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3827	c9df3d40-020f-4977-9c52-a25ebc0539f1	Olival	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3828	ba261820-b1a5-4e69-a4a8-a6d9dc9bfcd9	Matas	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3829	407ad1db-08d7-4d02-97c0-deaa98fecf34	Cercal	\N	16	240	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3830	5f8e91f3-903d-44cc-b4bb-e745a9c38019	Alcobertas	\N	16	241	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3831	292d0ab6-7b2c-4a3f-865c-7226be0a339a	Arrouquelas	\N	16	241	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3832	8a137291-b64f-4ace-8ff1-c33b268488b7	Asseiceira	\N	16	241	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3833	87033820-a86c-4418-b4ab-247fdef08cd5	Azambuja e Malaqueijo	\N	16	241	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3834	0510a6e9-c813-4087-a454-4e394202c228	Fráguas	\N	16	241	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3835	e247cf0a-eec2-4700-9807-54c49bbe62d1	Marmeleira e Assentiz	\N	16	241	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3836	d785817b-4572-4b9f-a9a3-a6f540aac9a2	Outeiro da Cortiçada e Arruda dos Pisões	\N	16	241	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3837	ecac1981-c0a3-4df9-a09d-9d3b0b17cefc	Rio Maior	\N	16	241	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3838	5f6a5c02-f486-4446-9632-eb309af73f93	São João da Ribeira e Ribeira de São João	\N	16	241	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3839	a611d375-b831-4a46-8b3b-cb11a4f39bfa	São Sebastião	\N	16	241	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3840	ee5a6627-49a9-4b6f-b990-1bf747513f96	Arruda dos Pisões	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3841	5c1288c1-5f1d-4d4b-b4b3-bdcd28780dda	Outeiro da Cortiçada	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3842	f0ee5ee1-83c6-4204-b0af-25cf3baa4075	Azambuja	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3843	97f5d6d9-5397-40bb-a983-b8e36088210d	Malaqueijo	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3844	af1f0224-483a-4d97-a625-c98bb9c91f7e	Assentiz	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3845	28d41be9-69ef-4a85-869d-8bb84f8404dd	Marmeleira	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3846	b4a730c7-3ee3-4a11-b824-60f1325311a3	Ribeira de São João	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3847	54daabac-abc9-428d-a38c-ff47d9fd334e	São João da Ribeira	\N	16	241	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3848	7bda72a2-3c68-4da8-ad04-b54bcba2d999	Marinhais	\N	16	242	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3849	6df3319e-ac4e-441f-a2cb-b286d38ff7ae	Muge	\N	16	242	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3850	2037a6dc-2a54-4131-a965-87fca29b21ef	Glória do Ribatejo e Granho	\N	16	242	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3851	04107d71-0577-4a42-ace5-49b1bd5ac534	Salvaterra de Magos e Foros de Salvaterra	\N	16	242	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3852	c893cda4-a638-467b-bdfb-c1531e45c459	Glória do Ribatejo	\N	16	242	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3853	e883c83e-024b-4f9f-b638-d35962e64bdd	Granho	\N	16	242	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3854	ffc0f848-6efb-49ba-8be7-8a6431e1ee0e	Salvaterra de Magos	\N	16	242	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3855	0bd630f9-23e3-4826-8bd7-6bdcf9ae88c9	Foros de Salvaterra	\N	16	242	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3856	acae2932-0c77-42c2-bee3-33f3e00e9860	Abitureiras	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3857	cf5260a0-6ed0-4091-984f-40d1d99325a7	Abrã	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3858	4158c019-6a41-4c6e-b238-af696413dd8a	Achete, Azóia de Baixo e Póvoa de Santarém	\N	16	243	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3859	24345a40-aa1f-4c29-9291-14969d1cd552	Alcanede	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3860	9a19d80c-a7ba-4944-96a1-e4245aef951e	Alcanhões	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3861	02d10980-41ef-4106-9b79-9b2572679ad4	Almoster	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3862	414b4bd5-b65e-4c58-960d-10af9f78e837	Amiais de Baixo	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3863	9274e540-d5ac-4898-906f-9f19ce0ac4c1	Arneiro das Milhariças	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3864	8ec7a7fe-8600-4af9-adf5-3b49ddeaf54b	Azóia de Cima e Tremes	\N	16	243	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3865	705f6b91-caab-4d5b-ada2-7717cb08f262	Casével e Vaqueiros	\N	16	243	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3866	4d2ef31b-07e9-400d-b488-510bbfe75b1c	Gançaria	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3867	cbcd1afd-42c1-4143-910f-c384b6df1472	Moçarria	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3868	e8caa14c-b6c0-47ce-8ddf-b819e662ac28	Pernes	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3869	1ed9b49d-fd7e-462d-bb42-3cc08ef8c2a2	Póvoa da Isenta	\N	16	243	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3870	88d69364-e0c0-4b80-9eb0-5715869dad50	Romeira e Várzea	\N	16	243	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3871	63db2ff5-3a9a-441e-a62b-ac0b992b2edf	Santarém - Marvila, São Salvador, São Nicolau e Santa Iria da Ribeira de Santarém	\N	16	243	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3872	33cdbf69-1189-417e-b96c-649363e9140f	São Vicente do Paul e Vale de Figueira	\N	16	243	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3873	15769a9f-cc3f-4bf9-93bf-0fb2ff9a3f20	Vale de Santarém	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3874	fea515e3-66ba-403e-bf6c-708822bb4fb3	Achete	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3875	a3be78d1-1451-4cb4-95de-bbefa658263b	Azóia de Baixo	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3876	2de49d30-5226-48df-841b-f304ba5341d5	Azóia de Cima	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3877	e71a4031-a52a-4b50-beb8-ad4a01d025eb	Casével	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3878	1f250aa0-d079-421b-b62b-a63dcf75ffc0	Vaqueiros	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3879	4eb97ace-8cad-4671-96e8-508d94e27f02	Santarém - Marvila	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3880	3ab7b0e3-fff6-4611-9670-ef128b6d7e71	Pombalinho	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3881	00607cb8-1a9b-4fe2-9b61-86bc4195b346	Póvoa de Santarém	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3882	fa7e8d01-6e26-4806-a441-ecead5e5753e	Romeira	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3883	0471ab87-9e48-454c-a2da-3dcb06b666d4	Várzea	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3884	f672c867-4eca-4c1f-a737-d6f8159dbaec	Santa Iria da Ribeira de Santarém	\N	16	243	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3885	8b392421-8e72-43a1-81fd-03e171ebe6f8	Santarém - São Nicolau	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3886	04388751-954c-4fb7-a336-96420a8d5939	Santarém - São Salvador	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3887	ecb8b583-8b1b-45b8-a677-101983a81bf7	São Vicente do Paul	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3888	a0398d0c-9a62-47e0-9042-8faa8bc0f945	Vale de Figueira	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3889	f35e3350-7fb7-4fff-86ba-da03e3063fda	Tremes	\N	16	243	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3890	e4a93de2-404b-487c-a192-5a12bf3c179f	Alcaravela	\N	16	244	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3891	9e5c6bd7-0919-4331-8115-55c0be9d418a	Santiago de Montalegre	\N	16	244	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3892	6314af9b-2ccd-4484-8805-faf33049143c	Sardoal	\N	16	244	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3893	5688818a-3ca3-4af6-a7b4-9eec76576924	Valhascos	\N	16	244	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3894	f470eded-a8c5-4160-8cc1-a9f2cfc6d545	Além da Ribeira e Pedreira	\N	16	245	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3895	c4e1a503-50d2-4dda-b1d1-c11b478b54f2	Asseiceira	\N	16	245	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3896	89d26478-6183-4c63-84b2-23adbd6960b2	Carregueiros	\N	16	245	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3897	43667749-334a-498a-8f81-3c8e1455a534	Casais e Alviobeira	\N	16	245	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3898	9d4234a7-a0ad-41a3-8f3a-018fc4c21979	Madalena e Beselga	\N	16	245	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3899	e7d2c6a1-3d74-43b8-b459-e1a688e70121	Olalhas	\N	16	245	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3900	8587b42b-4fdf-44ce-bb75-42adddccea80	Paialvo	\N	16	245	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3901	d737a203-0a5d-4a8c-9d75-ee22caeebd58	Sabacheira	\N	16	245	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3902	3dbc2f70-2ac9-45d1-b83d-6b0d8b8411e2	São de Pedro de Tomar	\N	16	245	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3903	3d0b1699-7d54-4646-b00c-f0814d5a9b38	Serra e Junceira	\N	16	245	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3904	4f2466ce-8d06-454e-8edf-910b478ca3da	Tomar - São João Baptista e Santa Maria dos Olivais	\N	16	245	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3905	16b8d3d2-d304-4452-9204-ed3710104717	Alviobeira	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3906	27f9c922-0a24-4e7e-8fe8-96056f0247dc	Casais	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3907	f9181062-3ec6-4518-91a6-f3f7ab6fa078	Beselga	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3908	69387a68-33cc-4c6a-bcd1-f13d5c0e75be	Madalena	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3909	67595eba-2131-41a0-82e7-1f2ef27552a1	Serra	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3910	68f34321-7a92-4ec3-a97c-1a788405d1e2	Junceira	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3911	101a9f7c-a62a-4ec8-afd4-bbcf6b189e5b	Além da Ribeira	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3912	a51edb87-f55f-4300-8c51-8e3c2cf57e5f	Pedreira	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3913	c045db8f-e024-4c80-9997-c652d8ae8a46	Tomar - São João Baptista	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3914	e33c73b9-0237-4a12-9564-e287c2d00d52	Santa Maria dos Olivais	\N	16	245	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3915	3a71762a-093d-4c6c-85d7-fa3e3ef59922	Assentiz	\N	16	246	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3916	d0dd5094-da6e-4840-b83a-ed6b076ae264	Brogueira, Parceiros de Igreja e Alcorochel	\N	16	246	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3917	62e298df-6868-4d00-bbff-fa795961f61a	Chancelaria	\N	16	246	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3918	3954cf25-dac5-44fc-ad8f-87839f2ce968	Meia Via	\N	16	246	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3919	a104490c-269f-4969-b034-04eff6a91ab4	Olaia e Paço	\N	16	246	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3920	575eafa9-afa8-4e66-9871-941b9918ed3f	Pedrógão	\N	16	246	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3921	34dfbc04-cfdb-400d-9e5e-2935262ea8f9	Riachos	\N	16	246	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3922	405d5692-4c14-4163-a4a6-d0ed7862d4b2	Torres Novas - Santa Maria, Salvador e Santiago	\N	16	246	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3923	3fb927b1-52d7-4bb9-8862-00a4fd499181	Torres Novas - São Pedro, Lapas e Ribeira Branca	\N	16	246	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3924	9cc9f18c-b6e2-404b-abd9-aa099a23b73c	Zibreira	\N	16	246	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3925	09732f73-cf41-4d1a-914c-fb90841b0ab7	Alcorochel	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3926	ef875172-3f9a-425a-839f-2b4d7c1f3d41	Brogueira	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3927	e1c39356-ee60-40c1-a975-0f167ec70583	Parceiros de Igreja	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3928	3309aa33-4bfa-42ef-9040-cf7324703d30	Lapas	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3929	45a33ccf-ad56-4093-96ad-08a8ee3cfc44	Ribeira Branca	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3930	1402c733-b939-4e69-a649-834fc34c2dfb	Olaia	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3931	f0accb05-dabe-410b-84fd-a5f375f35c26	Paço	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3932	b49d9a37-3d4f-41c7-a98d-a4034d1d7809	Torres Novas - São Pedro	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3933	c0590010-989e-4fe9-b066-562f7ba832d6	Torres Novas - Salvador	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3934	94f94efd-205c-46d1-afdb-197af36cb699	Torres Novas - Santa Maria	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3935	f1c35c37-3a7c-4769-8610-acc34965de43	Torres Novas - São Pedro	\N	16	246	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3936	2999f07b-1bc5-4537-98ea-bd7e2c408c3d	Atalaia	\N	16	247	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3937	2028bf4e-0b04-465e-b44e-b1f23676f7a2	Praia do Ribatejo	\N	16	247	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3938	93c9c82d-b9d4-4085-88db-183d48f81fa5	Tancos	\N	16	247	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3939	d24edc4a-88c6-43eb-9515-b81bfd08a134	Vila Nova da Barquinha	\N	16	247	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3940	d5228007-099c-4af7-acdf-220e4769b478	Moita do Norte	\N	16	247	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3941	34c9e66c-5268-4418-985f-ea672393118b	Santa Maria do Castelo, Santiago e Santa Susana	\N	17	248	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3942	aae3e4c0-c3ed-48e6-94a4-45e9448bcf72	Comporta	\N	17	248	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3943	b17c7809-862b-4a1b-a424-fc22bd327203	São Martinho	\N	17	248	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3944	edac895d-f665-4c3a-affc-650cb5446d98	Torrão	\N	17	248	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3945	0d3053a4-e7b1-42e4-971b-86abb0e606fc	Alcácer do Sal - Santa Maria do Castelo	\N	17	248	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3946	0bc86cec-c09a-48fa-8324-3a7a6557ca75	Alcácer do Sal - Santiago	\N	17	248	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3947	f6cd9819-465f-4f1c-8565-9090b96508c9	Santa Susana	\N	17	248	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3948	68af3ae4-0f3c-4e0b-b79b-26d3f3998c8b	Alcochete	\N	17	249	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3949	ac447793-323c-41cc-8c05-e321f1cdb90a	Samouco	\N	17	249	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3950	309bfbd8-47a0-4ba0-a4ab-6f9c0617f4d4	São Francisco	\N	17	249	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3951	95cdea53-6083-4c6a-8ba4-e4a5ad54185f	Almada, Cova da Piedade, Pragal e Cacilhas	\N	17	250	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3952	ecab80d8-8161-4307-9223-693a9f059395	Caparica e Trafaria	\N	17	250	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3953	cb90d66d-27cf-4e49-be2c-ed73d8c219a5	Charneca de Caparica e Sobreda	\N	17	250	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3954	fee20dcd-14f6-4961-9e09-292ceea29a4e	Costa da Caparica	\N	17	250	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3955	f73b51af-6684-45ba-8a5c-8edf0657b0ef	Laranjeiro e Feijó	\N	17	250	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3956	e9f02c03-c53e-42a7-a4a2-8986f42142d4	Almada	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3957	4ebc8bd5-269b-4e66-af17-27a8537affb6	Cova da Piedade	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3958	521c46a1-a7ad-4c1a-a0fd-39f5bf3221d8	Pragal	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3959	c5930439-f02e-41c0-962c-d72ee58471ad	Cacilhas	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3960	0a9951ee-c0b6-4f3e-bc51-6b12fefc8afe	Caparica	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3961	99281c59-a580-499e-8b5b-12ed0a2a6ebb	Trafaria	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3962	6c25855e-68c8-45d0-b8f0-54a2df8c2df9	Charneca de Caparica	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3963	485fe080-112a-45f1-8d22-b22447e77a42	Sobreda	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3964	4943860e-c110-431d-80f6-0ba3d5b32778	Feijó	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3965	d6f77a13-9bf3-403b-b391-d64121cae307	Laranjeiro	\N	17	250	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3966	71516372-73d8-4cec-96eb-2707affda80e	Alto do Seixalinho, Santo André e Verderena	\N	17	251	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3967	c6c5714a-3318-45fc-a269-8ca959c3b8f9	Barreiro e Lavradio	\N	17	251	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3968	ff0e958a-bd6c-415f-80b9-935271d4d42e	Palhais e Coina	\N	17	251	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3969	39964c85-8ce7-4399-96a7-dfc699034c9a	Santo António da Charneca	\N	17	251	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3970	a6492808-0b60-4631-9174-0d7281d7f5f5	Barreiro	\N	17	251	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3971	9f1ab40c-7d8f-4a51-8aaa-152c6b013c26	Lavradio	\N	17	251	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3972	8744a3b4-ff22-4b60-a97b-ba4f4da8e81c	Palhais	\N	17	251	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3973	eb883aca-b568-4bad-be0f-1729c6783084	Coina	\N	17	251	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3974	4fcafd35-0a85-47db-af0e-e0b361bd337c	Azinheira dos Barros e São Mamede do Sadão	\N	17	252	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3975	e89be680-895d-4906-9450-ed35b58e9560	Carvalhal	\N	17	252	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3976	30c02f78-d288-4d80-a325-7149b52bdb38	Grândola e Santa Margarida da Serra	\N	17	252	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3977	93b2176a-cd5a-4519-922e-97cb20296afc	Melides	\N	17	252	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3978	6c143c41-fe4b-40f7-9120-4d74078bc9e5	Grândola	\N	17	252	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3979	a8d78176-c50e-402f-99ab-135a7a423589	Santa Margarida da Serra	\N	17	252	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3980	c898fe29-e473-470c-adf6-97d24f97d7d3	Alhos Vedros	\N	17	253	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3981	f42bcb8e-2f74-41ee-bf3c-0e16782c139f	Baixa da Banheira e Vale da Amoreira	\N	17	253	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3982	07eb9935-22fc-40b7-a67e-78deb5f57d45	Gaio-Rosário e Sarilhos Pequenos	\N	17	253	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3983	513a4032-128d-408e-ac3c-c9718c19b229	Moita	\N	17	253	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3984	083d4e83-3f86-43ee-a712-1f03dccae5b2	Baixa da Banheira	\N	17	253	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3985	04b088ea-57e6-4ae7-827d-5fd26499b330	Vale da Amoreira	\N	17	253	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3986	862964e5-adc7-49a8-9eb6-3e4eb512aaa6	Gaio-Rosário	\N	17	253	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3987	e82aff56-fcde-4438-8c99-0b4e4abe5864	Sarilhos Pequenos	\N	17	253	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3988	ffd7fad9-7036-4483-b716-42a105595755	Atalaia e Alto Estanqueiro-Jardia	\N	17	254	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3989	77585b05-adac-490c-9c0e-d88445e71e95	Canha	\N	17	254	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3990	17a38e70-e2ce-4ac3-8f37-7b6ea40fd901	Montijo e Afonsoeiro	\N	17	254	1	2025-03-23 11:47:11	2025-03-23 11:47:11
3991	9fd3b83b-70ae-46b2-bf37-a7e46dff5f55	Pegões	\N	17	254	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3992	cac5d9c0-1fe8-4aa1-af10-11f14fe65c3a	Sarilhos Grandes	\N	17	254	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3993	acacbb60-89d1-4f67-80dd-d0189649d04b	Afonsoeiro	\N	17	254	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3994	aaf18ff2-763d-4dbb-81d3-d7be88ae5366	Montijo	\N	17	254	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3995	ded40a50-b146-4cfd-a95d-6d6b528125a7	Santo Isidro de Pegões	\N	17	254	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3996	ec2825f7-dea7-4700-82f2-fb1aa324ac33	Atalaia	\N	17	254	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3997	b2f36c85-f4a1-4372-a6cf-f47b5780c34d	Alto-Estanqueiro-Jardia	\N	17	254	3	2025-03-23 11:47:11	2025-03-23 11:47:11
3998	ef7ac2ef-65c0-4c65-b266-771cf77cecee	Palmela	\N	17	255	2	2025-03-23 11:47:11	2025-03-23 11:47:11
3999	8f882144-fd52-42d0-aaba-509a192ad533	Pinhal Novo	\N	17	255	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4000	76a1af5b-846e-46b5-b86b-5562f62c27c4	Quinta do Anjo	\N	17	255	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4001	39b65f8a-f5f8-4b64-809e-05264dde2876	Poceirão e Marateca	\N	17	255	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4002	01bd2ac9-7fe7-41d5-ba17-300825580dd9	Marateca	\N	17	255	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4003	3cf186d4-d6ae-4ca0-92f5-66d7da87fbf3	Poceirão	\N	17	255	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4004	bd1f027b-068a-4ed8-ae34-569b23bf848f	Abela	\N	17	256	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4005	aee16b79-9572-48e7-9a68-0fdcc2d4ef3a	Alvalade	\N	17	256	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4006	1887dbc4-3857-424e-af97-d1a9cd7c39dc	Cercal	\N	17	256	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4007	64765bbf-224f-4add-9b8c-8b5a32d187c3	Ermidas-Sado	\N	17	256	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4008	18330bbe-9176-4006-9c41-a2ae135b1018	Santiago do Cacém, Santa Cruz e Santo Bartolomeu da Serra	\N	17	256	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4009	3e3424aa-1a2e-493c-b2e3-3b15f26b2acd	Santo André	\N	17	256	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4010	56ef1ef1-3b78-4033-b2be-29da38ceeb20	São Domingos e Vale de Água	\N	17	256	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4011	bdd54595-8043-44c6-b05a-2ca23bb49400	São Francisco da Serra	\N	17	256	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4012	c94eac71-11b0-47b2-af37-a73b4c836ea6	Santa Cruz	\N	17	256	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4013	9c61b19f-5761-418e-8005-a69320039620	Santiago do Cacém	\N	17	256	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4014	f8ce8b9e-4104-4ce3-8a09-9fbbcd0be7e7	Santo Bartolomeu da Serra	\N	17	256	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4015	8a673b68-3194-4a00-84ee-8bacd8ecacdf	São Domingos	\N	17	256	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4016	7ee92b0a-f80c-4f7f-93c1-2c900bce213c	Vale de Água	\N	17	256	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4017	78d8ef79-62c4-4385-858e-5353c6afe829	Amora	\N	17	257	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4018	207d3c5d-2730-405e-ad60-131aa04bec41	Corroios	\N	17	257	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4019	2cb5043b-824a-4a9e-a70b-7ee56ade88f1	Fernão Ferro	\N	17	257	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4020	e01fdc6a-f7fe-4154-bb2e-deafa2f8b927	Seixal, Arrentela e Aldeia de Paio Pires	\N	17	257	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4021	ff923531-207b-40c6-baae-35658e2b29ee	Aldeia de Paio Pires	\N	17	257	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4022	54afca93-0709-46a4-b410-31c1d48e27e0	Arrentela	\N	17	257	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4023	30b49e61-c0ab-4f19-82fe-525a36f1a305	Seixal	\N	17	257	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4024	a161e867-cfb2-46cd-923e-b61e1c38ce54	Quinta do Conde	\N	17	258	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4025	26de6ddc-e85f-4777-8c15-d8d9fa70c05e	Sesimbra - Castelo	\N	17	258	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4026	0a0be975-d5c8-4554-bda4-b292902ec1db	Sesimbra - Santiago	\N	17	258	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4027	c4019f9d-1250-4417-a483-6b4642e5d039	Azeitão - São Lourenço e São Simão	\N	17	259	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4028	35798618-0cb7-4c60-b096-2ae2031503b6	Gâmbia-Pontes-Alto da Guerra	\N	17	259	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4029	cf3f0b69-cfd4-4043-87c1-ad4393abb629	Sado	\N	17	259	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4030	635b3260-4d11-4263-9f7a-6d4879158cf1	Setúbal - São Julião, Nossa Senhora da Anunciada e Santa Maria da Graça	\N	17	259	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4031	f1e2c0d4-cfea-4ede-8e27-336577110487	Setúbal - São Sebastião	\N	17	259	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4032	3c3c5c82-1bf9-47e3-8944-4736052bdb2e	Setúbal - São Julião	\N	17	259	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4033	e2411dc8-de65-4342-a56d-e261412796d0	Setúbal - Nossa Senhora da Anunciada	\N	17	259	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4034	e9d285d6-b3ed-4fdb-98e1-ff5f9d4d6bff	Setúbal - Santa Maria da Graça	\N	17	259	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4035	a55196a5-731f-40e1-95e7-e6a754e43eb6	São Lourenço	\N	17	259	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4036	8cdddca6-7f3e-4f86-99c7-aa4e9b6bf86d	São Simão	\N	17	259	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4037	13975fc8-50df-46d4-8f86-6af4acfc20ed	Porto Covo	\N	17	260	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4038	b4d3efbb-62f8-4770-81b1-a43f0c15075a	Sines	\N	17	260	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4039	07702018-3491-43bd-b118-33ecb15d9d9d	Aboim das Choças	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4040	7770c3bc-b5a2-4886-a176-cde3cd3a63e4	Aguiã	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4041	37d0a3e8-63b0-445e-af8d-0df5c32c4cfc	Alvora e Loureda	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4042	4bd44457-62ad-456b-a550-233aea2eb1ec	Arcos de Valdevez - Salvador, Vila Fonche e Parada	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4043	08f257d0-ae0e-4e4d-9ac0-1b3bcbdcf87e	Arcos de Valdevez - São Paio e Giela	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4044	cafc0dd6-3890-4c15-9def-c187a7d0292b	Ázere	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4045	68c67a55-2664-42b3-a820-9a93ea4c3e26	Cabana Maior	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4046	5c6c74ea-db0d-4a73-b008-22a4407d4277	Cabreiro	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4047	8f2aa417-c614-40d5-98d1-3493dd0e02c4	Cendufe	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4048	54599596-a0b5-47f9-acec-5a52c7dffe5d	Couto	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4049	da3444d9-1e39-4e32-b81b-a1e35850f644	Eiras e Mei	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4050	59586f90-57b9-4165-8b35-cdbe90e02e49	Gavieira	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4051	b87fd36c-61e9-4227-a449-4a3903952fd3	Gondoriz	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4052	1c1da8fc-417a-417e-a52b-467648f6cff2	Grade e Carralcova	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4053	4dbc57c3-7f32-46e4-a88b-2f688f5dd299	Guilhadeses e Santar	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4054	c4fd9b1d-9514-49f7-9069-8743f6325d4d	Jolda - Madalena e Rio Cabrão	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4055	99b9ce94-3df3-456c-9575-ae143172558e	Jolda - São Paio	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4056	4198beed-21cd-43bc-811e-2de2ac5f0b12	Miranda	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4057	734b873c-76d6-40b2-b96c-9c4a12ae84a3	Monte Redondo	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4058	76f6dd5c-82f3-44c4-9d1a-3121b7210c47	Oliveira	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4059	5072ab3f-86c5-4ac7-9fc8-253eee64ad40	Paçô	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4060	b4dd7551-3110-4eca-8696-c0c94fc95618	Padreiro - Salvador e Santa Cristina	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4061	5e4ad157-4743-4158-afd8-b79e97f00ad6	Padroso	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4062	2f74e240-4f4a-494e-ba1e-9ee32ee521ec	Portela e Extremo	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4063	8a2a8f6c-3c07-4779-bc13-a02c96acfe12	Prozelo	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4064	bda0a5d9-0b44-47f0-b535-3ef78f29dcb7	Rio de Moinhos	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4065	846b5937-cc05-41cc-a8b9-d6288f72e786	Rio Frio	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4066	d21be2f6-e2c3-480c-958b-dec3a93d2a8b	Sabadim	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4067	b66cd1f2-e3d1-44cd-80d1-65ce4fe17b40	São Jorge e Ermelo	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4068	35489b86-69d9-417b-819a-43537bcb21f0	Senharei	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4069	bf03705c-2de7-49d6-8741-723a7e65294c	Sistelo	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4070	a8294fb0-0005-496e-addd-0267e9c99221	Souto e Tabaçô	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4071	b5bc787f-d02d-4490-98ba-f0f9a4e5c909	Soajo	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4072	c091eae9-35d5-4503-9f03-33dbdc874ad4	Távora - Santa Maria e São Vicente	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4073	073e5374-0a05-40b9-8e64-6d0972e87029	Salvador, Vila Fonche e Parada	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4074	df8df388-970d-4cff-bab2-cd2818544c89	Vale	\N	18	261	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4075	2ef5e0c1-3fdc-4cb6-8a55-7b508faf145d	Vilela, São Cosme e São Damião e Sá	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4076	fde03655-86da-4dbf-9efc-97e312531c38	Alvora	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4077	d5cbc411-159f-4151-bed6-a87cac3c7172	Loureda	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4078	d70ac7d4-c31c-47e6-80b1-7f9a7e72b106	Carralcova	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4079	759d41ed-3200-4e1f-9968-1acce4474fd5	Grade	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4080	c8c2dfff-3bbe-4542-810c-6757f4ffef38	Eiras	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4081	5f98fd81-eed9-4482-8db2-15dda66e2823	Mei	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4082	7e18169a-e7f1-4d45-9d3f-5ee7088497db	São Jorge	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4083	9086e0d3-5d58-4cdc-b136-aa2de712883f	Ermelo	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4084	516e52d4-2b9e-44af-b13a-c512eee6e650	Extremo	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4085	91a7da12-2f90-4550-af1b-6bcf4b4155eb	Portela	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4086	1e10c02f-1e01-429e-8edd-f43fdc19ba77	Arcos de Valdevez - São Paio	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4087	a92bf64b-90d1-4730-9a24-c9bbf6ff7890	Giela	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4088	fe55aa7f-0d21-422f-a3bc-b23f874f85dc	Guilhadeses	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4089	c5d72141-3a7e-4f91-94a3-3ffb5fdcd135	Santar	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4090	1e8bdc91-3858-4597-9302-e201e49dea97	Jolda - Madalena	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4091	e17ca4db-e869-4e90-8a9b-18c8dfe7f7d0	Rio Cabrão	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4092	4b6bb840-d0fa-4e3d-8114-ce042f2d3bfa	Parada	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4093	e1c585c4-c936-432c-9435-7eae1245394c	Portela	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4094	4ef879e0-40fb-4812-8715-faa92536ef0a	Sá	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4095	b2c5ada5-d3d1-4d1f-848f-5c7a061b11d0	Arcos de Valdevez - Salvador	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4096	a3f5f293-4667-423e-bff1-fbfd3ba3c36a	Padreiro - Salvador	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4097	040cc39a-e2a8-4f6f-8abb-85845d56f531	Padreiro - Santa Cristina	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4098	e3beaf5a-23b7-4ed6-a491-bc98ef568969	Távora - Santa Maria	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4099	70a39014-2371-40fc-8092-3c7b2fd47f54	Távora - São Vicente	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4100	4a47f4c3-91aa-49e3-8996-3b6fb8ba47f2	São Cosme e São Damião	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4101	1e6519be-9d4d-4104-85bc-dbc5b39f0411	Souto	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4102	b5ba6738-7c6c-47be-949b-65f0546fcd0e	Tabaçô	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4103	bd91648a-00d5-49b6-ae5b-d3c79772bb97	Vila Fonche	\N	18	261	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4104	949425f0-0687-4b79-84ba-cf4471f0263c	Vilela	\N	18	261	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4105	6f5e3703-1490-45d9-a009-1090a46f1e1d	Âncora	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4106	c2ff1573-e233-4552-8697-e828869edd3d	Arga - Baixo, Cima e São João	\N	18	262	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4107	e24f1578-45a3-4c26-9495-de3261d73094	Argela	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4108	f048def5-42d3-4c51-aa1b-c967a22244fc	Caminha - Matriz e Vilarelho	\N	18	262	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4109	5ece2071-9a19-48cd-9ae5-69a05ba36a2f	Dem	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4110	29a4118d-fc33-4936-bd70-721f35db7368	Gondar e Orbacém	\N	18	262	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4111	f0724df6-664d-4e94-9a85-e68eeec05b8a	Lanhelas	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4112	5c5d757c-c7b9-4a2a-bcb9-9ea5c1c71726	Moledo e Cristelo	\N	18	262	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4113	61b48b99-159c-456f-82ea-683fa5e9fffd	Riba de Âncora	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4114	9eca0d9a-ceb2-454d-b8c8-7ec8ec599b88	Seixas	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4115	5d815a1c-ef80-4473-97e8-e833866b293b	Venade e Azevedo	\N	18	262	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4116	25bcae9e-adce-4748-87b2-0283d38d8c83	Vila Praia de Âncora	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4117	57241885-ed98-4e27-b5d0-3c7b7abe5218	Vilar de Mouros	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4118	5358fd2b-d12b-4fe2-a69f-fe36ec88fb65	Vile	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4119	2c9aed03-c744-4ea0-9d08-9ca12bc3e557	Arga de Baixo	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4120	1d18159d-d288-452a-8c67-0dbb2f89c3ff	Arga de Cima	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4121	f0f59157-2439-411f-939e-c7d142be2a07	Arga de São João	\N	18	262	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4122	adc54ce8-d404-409f-a1ea-a0fa6e0f3182	Venade	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4123	f9948ecb-7093-4e98-98e1-fba16403c1f3	Azevedo	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4124	329afd8c-bf34-4d56-b931-05f3bb5766d9	Caminha - Matriz	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4125	e591deda-19b6-4a6c-b8be-d44e4a05ca5e	Cristelo	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4126	01e832fb-8fb4-4053-8d34-8cfc8e446e43	Moledo	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4127	1aeb29cc-1cbc-479d-9c33-e66a378bd3f5	Gondar	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4128	5a65bb61-6e0e-4927-bbe5-46c45a2708b4	Orbacém	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4129	e6e630d6-8915-4074-a6ac-d5e2a31aaa16	Vilarelho	\N	18	262	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4130	461b4f3f-457b-4ee8-94ff-e97fbf7ef561	Alvaredo	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4131	7f23626e-59bb-4433-ad88-40397316e1a4	Castro Laboreiro e Lamas de Mouro	\N	18	263	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4132	39b8c0bf-2908-438f-a31c-effdda7cf953	Chaviães e Paços	\N	18	263	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4133	2d90e997-6495-4720-bdb5-f0ed57c844f7	Cousso	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4134	5f59f94a-e662-403c-bd67-84d3cf79fe4e	Cristóval	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4135	1f6f21ad-9746-4887-8127-3741ac4328f3	Fiães	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4136	0bd851b5-fe1a-4b92-9600-4e94fe8fbe69	Gave	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4137	22c90ed4-7c07-40f7-886d-a65f3d9a5362	Paderne	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4138	b37178db-3cd4-446e-b33b-282abdfaf2d8	Parada do Monte e Cubalhão	\N	18	263	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4139	4b409bc0-1764-41a5-b23d-6f356bad7606	Penso	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4140	8e52fb0f-b3ac-4d8d-b423-48586bbd337c	Prado e Remoães	\N	18	263	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4141	b49889ad-2cc2-4c28-870d-6f22e342a528	São Paio	\N	18	263	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4142	220bedbc-fce7-408d-b9a1-21022a059c60	Vila e Roussas	\N	18	263	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4143	14bbd4a8-1c6d-4c9e-be26-f64aa4d6c9b6	Castro Laboreiro	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4144	18c1c53b-8774-43df-a0e4-cc264e0ebe73	Lamas de Mouro	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4145	d9c3ae40-77b7-46b7-89de-1eb04394fdd3	Chaviães	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4146	abc71b82-0198-49aa-a5ea-7c87921b8e73	Paços	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4147	11778654-1627-4d3c-a3a8-2cd40b0f308a	Cubalhão	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4148	1a86dd0f-ecac-44e2-9e1b-a0c8cbb94df2	Parada do Monte	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4149	d7eeacec-27d4-420a-8d54-df301009b49a	Prado	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4150	529b587c-7c7a-441f-b179-8f810185e946	Remoães	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4151	4fd3f128-fc3e-4cbf-a9fd-632e74ff710b	Vila	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4152	61201dd9-fe61-4424-904d-f4f030f64138	Roussas	\N	18	263	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4153	03ebf1bc-3742-494b-b6cf-20fd108df8fc	Abedim	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4154	26ea97bd-1ea9-4c98-8f31-923c6bc9ed1e	Anhões e Luzio	\N	18	264	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4155	998a6b55-3b50-4acb-a21e-095ab08c29d4	Barbeita	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4156	ee14a808-8ff1-4cfc-bbb4-7846f24c4c1f	Barroças e Taias	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4157	f5b4dfda-221d-477d-b531-1aa386c57866	Bela	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4158	042bddde-b719-46b0-a468-63329efa1eab	Cambeses	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4159	5e983373-aee7-4044-bbdd-354c84b1049c	Ceivães e Badim	\N	18	264	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4160	7daa514b-858a-455b-b078-36e67f168d46	Lara	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4161	3bdeac35-de36-401e-b49d-7a6410a19888	Longos Vales	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4162	84daf1d6-e3e2-418f-ac35-d0d274f41ed1	Mazedo e Cortes	\N	18	264	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4163	d9ab0ab6-ec72-4ddf-a5ae-12d716d8ef54	Merufe	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4164	1b7bd1b6-f914-403c-9864-641328690d93	Messegães, Valadares e Sá	\N	18	264	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4165	6bc6b37c-8b3b-4f38-bf8b-dd570f0c2b5c	Monção e Troviscoso	\N	18	264	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4166	f2acc506-931c-4269-af10-6ae2419865b1	Moreira	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4167	9655a563-e62d-4363-b1ec-ebc829603edc	Pias	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4168	69e44401-a8a3-458e-906d-6cba2d62b9f9	Pinheiros	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4169	179f3d5f-2135-43c0-9dbc-995cb8a90d91	Podame	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4170	007a83f3-a6fb-4481-b57b-cecfa197492a	Portela	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4171	ceb19d00-c545-4252-aa9e-d33c78c79741	Riba de Mouro	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4172	c36e2cb7-e668-449d-8305-22b8a7de8129	Sago, Lordelo e Parada	\N	18	264	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4173	4cffb71b-38e8-4a01-b2a8-bfb72bcc4e28	Segude	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4174	96a5e77f-78ec-45c5-b45d-e031d38106a1	Tangil	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4175	b9f80255-a271-420c-89b1-96e92c12e255	Troporiz e Lapela	\N	18	264	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4176	dec28cbe-c390-4e45-9805-75412ede47b0	Trute	\N	18	264	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4177	3b654f3a-e5c4-4a60-99bd-38f9429e4478	Anhões	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4178	b88df975-a606-4969-a37e-305e6ced301c	Luzio	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4179	e669ca4b-7169-4029-9dc9-7eacfefad672	Badim	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4180	75ba8401-eebc-4270-9022-edbd94725618	Ceivães	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4181	2a75ed0e-1ce9-410e-98ed-c1dea7b44b8a	Troporiz	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4182	093c35ec-0b58-4b66-9298-b6c491f41dc4	Lapela	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4183	fadcc5cc-09ce-47e6-a766-7d6349889d5c	Lordelo	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4184	e2fa1919-701d-4711-a367-8a153b491361	Parada	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4185	2363d0a6-d618-4147-b0f8-db95280a7276	Sago	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4186	31fe9514-a32f-46ba-865d-28e09f7c293f	Cortes	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4187	3077978e-b9a9-402c-9e14-fd11d0741474	Mazedo	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4188	1ed4e828-e076-4d89-8177-ce679087addf	Messegães	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4189	8d2e1534-b98c-425b-a93e-9dc26719730b	Valadares	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4190	8f01ad10-36f5-4dc7-a683-782763d05703	Sá	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4191	024e5054-700a-47ef-8965-0524e99d7518	Monção	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4192	fa094bdc-96fb-413d-9356-fd7df2ca8f38	Troviscoso	\N	18	264	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4193	3ae50b35-cc42-45a8-9a98-0082dc6dead7	Agualonga	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4194	d8b451da-8ad1-4970-9e40-003fdb0e5000	Bico e Cristelo	\N	18	265	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4195	1bd2795e-d4ac-4842-bbef-322b68c36316	Castanheira	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4196	b566b5f1-19e4-47e8-9aa2-b858f7b382e7	Cossourado e Linhares	\N	18	265	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4197	918fb563-082f-45d6-aaca-ec0898e7f2e6	Coura	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4198	c72f38cf-1734-4854-99f9-d38480fdec53	Cunha	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4199	6b883329-2cc3-4b37-a511-8c670e01a3d9	Formariz e Ferreira	\N	18	265	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4200	4374240a-8e39-4a2e-b692-e3816bc0b44f	Infesta	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4201	ad680d8c-6830-4a2f-9c9e-2dcafdff34d7	Insalde e Porreiras	\N	18	265	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4202	b825996a-8a90-46ab-869f-c362ef18e155	Mozelos	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4203	c72b4ee1-8e0c-4d37-b727-60061322bc10	Padornelo	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4204	34651077-f955-49ad-85ff-bc1fb36fbf7b	Parada	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4205	f8501351-afba-4852-847c-8af22ef84f0e	Paredes de Coura e Resende	\N	18	265	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4206	4e31ec69-09a0-4e0e-b3b7-13c3a86f8e20	Romarigães	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4207	bd1145c1-ece1-4f5e-abaa-11f477b3fcf5	Rubiães	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4208	c2a17df6-be9e-4109-91d8-45f0f29a4d54	Vascões	\N	18	265	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4209	5b996e42-2aa1-45b2-a973-bd9eb67f7541	Bico	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4210	137f994e-d0f0-4ab0-85c3-d79a461d9716	Cristelo	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4211	7699882b-8656-47a8-95cd-32789239b47d	Cossourado	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4212	28b0ebaf-308a-41fc-ba16-3f8525938764	Linhares	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4213	01fd5133-68ac-464a-a1f6-66112e914d0a	Ferreira	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4214	2e3742be-b1c9-4472-a1d9-3035020e991d	Formariz	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4215	00e3a04b-f1f7-4563-9162-b448a915f5d4	Insalde	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4216	a2ffe13d-943c-40ff-80d8-c7d329c3ec37	Porreiras	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4217	463326eb-fa6c-406b-b78a-d4b437f207a3	Paredes de Coura	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4218	13f9a592-b3fa-41c9-b4d0-8a806096242a	Resende	\N	18	265	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4219	8f3291de-771c-42ad-a2fb-358417b43313	Azias	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4220	164a0afb-437e-4aa7-9862-9a30f5da5bf6	Boivães	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4221	9b40853e-5623-46dd-86ca-3ebe19b4db0e	Bravães	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4222	54081a4b-9d92-4512-9a28-d4b1c8e9390e	Britelo	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4223	6b60c42d-e726-4593-8f47-12103a04e2ba	Crasto, Ruivos e Grovelas	\N	18	266	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4224	35f727d0-ce5a-4c5f-88b3-6fb5ae3a664b	Cuide de Vila Verde	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4225	ceb293bb-a465-41bb-b0ef-0ae21b9ace8e	Entre Ambos-os-Rios, Ermida e Germil	\N	18	266	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4226	d340fdf0-c03c-4138-b869-ae6eb0574eec	Lavradas	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4227	32a536cb-235b-483f-b01d-8783c8dc9657	Lindoso	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4228	40cf219f-8645-4319-8ff7-d1c11ae5d971	Nogueira	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4229	b50a7831-f8d4-49eb-bdbf-4f118f83f919	Oleiros	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4230	a253c17f-4d8d-4d40-836d-65f07aee656e	Ponte da Barca, Vila Nova Muia, Paço Vedro Magalhães	\N	18	266	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4231	91135e21-0174-455d-858b-9cb2da1a298d	Sampriz	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4232	368bb9dc-99bc-41e2-843f-2019b1a40954	Touvedo - São Lourenço e Salvador	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4233	2f729798-5421-47f5-b3a7-8cd7e4367b40	Vade - S. Pedro	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4234	10d1eb13-18bb-4d0d-915c-e514594e2264	Vade - S. Tome	\N	18	266	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4235	1144374a-c3c2-49d9-a25c-ab489b013a19	Vila Chã - São João Baptista e Santiago	\N	18	266	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4236	7f994632-5ce8-4139-8da4-41ddf920aa20	Crasto	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4237	05fca616-2a54-4af4-b748-d43b2055bb6c	Grovelas	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4238	ea4c4cea-e753-479e-8e7c-a434d20093f0	Ruivos	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4239	5e3c53bf-979b-4422-b222-88bc6a9f3255	Entre Ambos-os-Rios	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4240	e6a4bcd4-80ba-4553-8fa2-a3617b650bdd	Ermida	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4241	327ba901-1cda-41f4-a1e8-91226b03997e	Germil	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4242	7d3d79d0-fb6d-4ff2-bc44-cff50b561d58	Ponte da Barca	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4243	a4a0561f-5e6b-4835-a614-c7abea8f2162	Paço Vedro Magalhães	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4244	6990c3e4-ff0b-49da-b3e8-ea0a56e0b1fb	Vila Nova Muia	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4245	88651c8c-15c4-46b0-a636-a1765f550c6b	Touvedo - São Lourenço	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4246	740150af-1406-49dc-afec-c52a92a247a4	Touvedo - Salvador	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4247	d97a8e0c-a414-4555-a8c7-9711507e0acf	Vila Chã - São João Baptista	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4248	e6f4b63c-27af-4834-86b6-480f608aefe6	Vila Chã - Santiago	\N	18	266	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4249	392d320f-4cfe-40c9-a97b-701a126f842c	Anais	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4250	c82e7654-8860-41eb-a76a-8561effb19cc	Arca e Ponte de Lima	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4251	0737844b-c10a-4b13-baa8-988f25e40912	Arcozelo	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4252	e89078b8-cb31-43f2-bdfb-5119370a8972	Ardegão, Freixo e Mato	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4253	dcefefd4-b4f7-4713-9132-7bfb424dc959	Associação de Freguesias do Vale do Neiva	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4254	9c2e8780-b4ac-4db0-8f70-5554788406f6	Bárrio e Cepões	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4255	526789b3-f63b-46e4-836c-d60c3df23041	Beiral do Lima	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4256	ed0f517c-f262-41ac-b67c-61af025d3f7a	Bertiandos	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4257	11a87a71-4e7e-45b5-bf36-82cbe37ab90d	Boalhosa	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4258	9925cb99-574c-4a02-9b65-ed91d1ac7645	Brandara	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4259	f01a5d37-4bb1-423d-83b1-c4253d9bfe70	Cabaços e Fojo Lobal	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4260	2faa7f11-baaa-4e0f-8078-83199b845020	Cabração e Moreira do Lima	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4261	48ca873b-bded-47d9-856c-8cbb3630cdfb	Calheiros	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4262	815b86ac-a441-4b80-bf54-eb4809165e49	Calvelo	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4263	07e5f0fa-2505-48bf-bc68-45ece13366e0	Correlhã	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4264	2bfe99ac-dabe-4371-9eb7-5176acee5570	Estorãos	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4265	d5ba569c-17cf-460b-b741-ebee785884c5	Facha	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4266	4ed4c1d4-b27d-4e82-a140-5362b3182d3e	Feitosa	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4267	9d64df1a-ba68-4cb0-9866-71c337aa7918	Fontão	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4268	47bd11c9-fb9d-4470-aad8-ae408059b05b	Fornelos e Queijada	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4269	56f778f5-896c-4d5a-b570-9aea2af8707b	Friastelas	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4270	3aac88e0-f6ec-4d82-b43f-c6bcc746ddab	Gandra	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4271	e2753148-bf6d-4272-bc18-c0d17ab4328b	Gemieira	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4272	2479696f-28cb-40c5-9e1a-25977321ddfe	Gondufe	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4273	38dc2824-a28f-4549-9688-8df7138b69a9	Labruja	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4274	9d59a567-c49b-478d-bdbf-71caa87bd34d	Labrujó, Rendufe e Vilar do Monte	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4275	54225142-9d5d-48a9-b9f9-e30c0bf6a456	Navió e Vitorino dos Piães	\N	18	267	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4276	c670e046-4e38-4f16-82f7-a86f41636af2	Poiares	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4277	2a2a0924-2dc2-4dcc-8c09-e6e9df656389	Rebordões - Santa Maria	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4278	46f4e1c4-74e4-4bc4-a7a8-d3f4bbbdc39b	Rebordões - Souto	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4279	73d333a7-3e82-4a8f-958c-dd4e6ce8de6e	Refoios do Lima	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4280	71475b57-0fde-4620-be94-12dcbcc7b2c9	Ribeira	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4281	4af22e03-361d-4a8a-8e95-2c8597a8d3ba	Sá	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4282	a2f55906-3514-46d2-9c26-baf2ee3eea35	Santa Comba	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4283	168a717b-f73e-452b-bf62-8ed8683042e8	Santa Cruz do Lima	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4284	e98dfdb9-29fe-40e8-b893-cc7dea3f3c88	São Pedro d'Arcos	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4285	4a2ef845-d294-4bdc-9b58-1321f7edacf6	Seara	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4286	b3152369-615d-475e-9c68-08ef20b129db	Serdedelo	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4287	8f6bcd3b-439c-4e83-9fc0-4f936fdd69c6	Vitorino das Donas	\N	18	267	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4288	aabba80a-429b-42f1-bf15-e80170d1cf57	Arca	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4289	ae04e11d-1bd6-4657-949d-48eb9f95087a	Ponte de Lima	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4290	8088afd2-8e63-4064-bfb5-1c04bc53d2ff	Ardegão	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4291	e611adc0-38f7-425a-a0cc-d67dbfc2436f	Freixo	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4292	a80741a6-7ca8-4e6e-98d6-938a50aeb74f	Mato	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4293	812a22f4-de12-489e-9f63-2addd822ca37	Bárrio	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4294	4bcac043-1901-4901-804f-2ecb7b622b70	Cepões	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4295	6f2b5ebb-679b-4219-9584-09c0ff37e6c0	Cabaços	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4296	b97e8bfb-9249-48e1-b446-7278777b9222	Fojo Lobal	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4297	87d1a42d-63d3-4727-a4a5-3a903cbf2906	Cabração	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4298	9ce85c99-73b4-4ddb-b4d6-348288be1071	Moreira do Lima	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4299	386f2379-e965-4b79-ae42-95785b7fab46	Fornelos	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4300	b502c6c7-c635-46f5-9acc-25f4f35a0027	Queijada	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4301	55958bb6-905b-4924-911a-83da9b9fb4fe	Gaifar	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4302	a2841dc0-4e1a-4d80-85fc-4d8c308c33d1	Labrujó	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4303	1bc9efe2-80bf-4033-9a18-bab496927387	Rendufe	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4304	2071fa9a-089b-4bc4-b25e-bc9dd8d5838b	Vilar do Monte	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4305	51d6ad02-039b-4883-8147-da781503470b	Navió	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4306	efb8409b-a41a-4e54-96b8-224f93048a1f	Vitorino dos Piães	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4307	27944044-f354-421a-9ca7-a2c5ca79c300	Sandiães	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4308	57ca1793-1f62-465e-a56d-22a6d08f13eb	Vilar das Almas	\N	18	267	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4309	0cf610d5-c4cf-415b-b2ab-e1af2fb6e193	Boivão	\N	18	268	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4310	c6de4384-2157-4f93-ac77-e10322758092	Cerdal	\N	18	268	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4311	ea2a720d-7894-446b-b329-4f3c51651d36	Fontoura	\N	18	268	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4312	3074b352-0239-40c7-bc8f-9c028343f6c7	Friestas	\N	18	268	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4313	80ed4145-7f40-40be-9176-437ef064b1ed	Gandra e Taião	\N	18	268	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4314	f4f290fa-fbec-4773-b434-7c37f5a22399	Ganfei	\N	18	268	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4315	64ec2029-0802-40e9-8cae-eca35474e3ad	Gondomil e Sanfins	\N	18	268	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4316	3d076538-7571-4df1-9fc0-69045fe574d2	São Julião e Silva	\N	18	268	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4317	bb97a8fa-dade-4701-a1e6-52d0daccd3ae	São Pedro da Torre	\N	18	268	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4318	6926b19f-a0b5-4606-9cb4-c89192a4514e	Valença, Cristelo Covo e Arão	\N	18	268	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4319	9d3c7b58-88dc-47a8-b108-48d285814107	Verdoejo	\N	18	268	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4320	c361e428-21f7-4d93-b96d-52a79ef74fff	Arão	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4321	fdb7e65d-8780-4a88-8c1d-1c58cbcbcb43	Cristelo Covo	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4322	656a343d-992a-46c8-aba8-e7f0481fd2db	Valença	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4323	d75bf4df-d0b3-4cdc-abd7-f78c9b73f12c	Gandra	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4324	5942afe4-e409-4679-8488-cb2d87cf38a6	Taião	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4325	f0b26a16-d34a-43ae-a749-63ca98ac4867	Gondomil	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4326	94b7e833-e152-4170-bfda-ed5cf7a046ef	Sanfins	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4327	92a9ea72-3de6-4c61-a1ca-ab9aec5388b1	São Julião	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4328	e76dc257-336a-4cb6-bee4-ff0ef690b955	Silva	\N	18	268	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4329	960037b6-5bf9-4559-97af-297d73f7fff3	Afife	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4330	db65b467-3af6-4beb-a9c1-c62f75fc6b6c	Alvarães	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4331	7a71828f-2eed-4fd3-8dbf-306ab897fd4b	Amonde	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4332	59c3de08-3053-403c-b3e9-a389b546d573	Anha	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4333	33dfcc15-2884-4bb4-b55f-eba88408f0d8	Areosa	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4334	21bd10da-bf34-449d-a264-016875be3fcd	Barroselas e Carvoeiro	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4335	888fc7b5-c64e-47b1-a713-0b58a3d7f909	Cardielos e Serreleis	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4336	ec55885c-7856-4d76-9d2d-f20513413990	Carreço	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4337	ab0c6477-07ab-4ddb-b8b8-b55f0e793814	Castelo do Neiva	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4338	9740374c-fc6a-460a-ae35-b04e9b1b9e09	Chafé	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4339	70c9d122-fa01-4600-8abd-67558c9f1e9d	Darque	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4340	640d790f-776b-42da-b5ed-4f490aeaf16c	Freixieiro de Soutelo	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4341	8edb8867-9f6e-4402-a895-819d9475ccc7	Geraz do Lima - Santa Maria, Santa Leocadia, Moreira, Deón	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4342	bc068047-06f8-4bba-a9db-74b1ffd0a5a2	Lanheses	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4343	0fece74d-c1b5-4a86-8cad-bdf421464f9a	Mazarefes e Vila Fria	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4344	0575028d-e180-4780-97b9-4766ebe0360e	Montaria	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4345	a082eb4a-068f-4142-b6e4-3a77517f6207	Mujães	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4346	2f6b8609-330d-4d22-b037-7903a22d1cf9	Nogueira, Meixedo e Vilar de Murteda	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4347	df48beb2-6e07-4ab9-b4d2-e86a226d0dcc	Outeiro	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4348	57f3d9d8-aa26-4425-9571-f6aaedea9dfe	Perre	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4349	81c571f9-8689-436d-927b-c618eb44d5b4	Torre e Vila Mou	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4350	44d088df-b341-40cc-b846-1494ff44c626	Santa Marta de Portuzelo	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4351	fa99cc28-120a-4af5-a9fd-c5dbab3934af	São Romão de Neiva	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4352	d5e6aa57-57fe-478e-b496-3fa61ec30701	Viana do Castelo - Santa Maria Maior e Monserrate e Meadela	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4353	2414087b-8175-4f30-9b72-3e850de0542d	Subportela, Deocriste e Portela Susã	\N	18	269	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4354	0e44b8e8-ac92-43c8-89ff-43106a80b2a4	Vila de Punhe	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4355	8d1c118a-85e4-458e-a471-912e88b4516c	Vila Franca	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4356	fef98b4f-9328-41a2-b746-414df613a5a9	Vila Nova de Anha	\N	18	269	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4357	092e8600-fe4e-4309-9f91-8fbe668d16f9	Barroselas	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4358	8b469520-5aac-4514-8525-be30b8c16e4c	Carvoeiro	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4359	be4ebf12-763b-49c9-af12-33c4d3c7626a	Cardielos	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4360	49a585d2-38f0-4506-94b0-f1ec153c9e86	Serreleis	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4361	f8af8951-87b8-40c5-a9d1-00251cc27863	Deão	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4362	d719be79-e60f-4c1b-88ad-8fda36640680	Deocriste	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4363	332688d2-f6c3-489e-80ea-e6f98ea5fa1a	Mazarefes	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4364	e1862a2e-29e8-442f-b497-aadc75e56b35	Vila Fria	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4365	4e530e0b-52ce-4483-bf04-8f063240faad	Meadela	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4366	69352a44-ccbf-48cc-9ef7-e19173881764	Nogueira	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4367	6a679d13-547d-433f-a81c-a53e104ca324	Meixedo	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4368	6444d474-2370-4eb6-b3b5-ad790dfff2ec	Vilar de Murteda	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4369	fd46b9c3-ac73-42fb-901b-587ad15c8424	Viana do Castelo - Monserrate	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4370	7dec25f8-ea9c-4253-985d-41967cae15fe	Viana do Castelo - Santa Maria Maior	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4371	14bfdfac-72e8-4574-8bdd-c16e94914c9b	Moreira de Geraz do Lima	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4372	ac7d12a4-b775-45dc-ab3f-9e7cedc0068a	Portela Susã	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4373	05a10c91-4bed-46ae-9661-43200a2003fb	Subportela	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4374	e15bc56b-71c7-4456-a4d8-61c4e664362c	Geraz do Lima - Santa Leocadia	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4375	2958e2ab-bc61-44ec-946e-6dceda27191b	Geraz do Lima - Santa Maria	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4376	b55e91f0-9a1a-479d-b960-b3e37ed3e5f0	Torre	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4377	f7cf6bf0-205a-483f-aa0a-cf41c9b9c1fe	Vila Mou	\N	18	269	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4378	d943803c-6c57-43be-93ec-91198d683cca	Campos e Vila Meã	\N	18	270	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4379	b2d17cb0-4f07-4c10-9d7c-b66b16f6343f	Candemil e Gondar	\N	18	270	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4380	99aa1884-6cbd-4a6c-bcc4-1302a21f3206	Cornes	\N	18	270	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4381	e186ff1f-a62e-410b-ae87-6dff360b69cb	Covas	\N	18	270	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4382	0e01abbd-b56d-4bce-8fc5-edf5a24c61ad	Gondarém	\N	18	270	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4383	2cc2016e-a620-4473-8884-441e78839c7e	Loivo	\N	18	270	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4384	61a5b92c-392d-4cda-93bd-a197845f593c	Mentrestido	\N	18	270	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4385	c5c27554-6e41-4bde-abcb-0a5948fb025e	Revoreda e Nogueira	\N	18	270	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4386	ea738973-044e-412c-a2e5-6211e0e795b4	Sapardos	\N	18	270	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4387	0c482cbb-278a-4244-9c07-48ad14b55df7	Sopo	\N	18	270	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4388	590d5e28-7d6b-4590-b977-8e5aeb83fd7b	Vila Nova de Cerveira e Lovelhe	\N	18	270	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4389	d686079e-87cc-4a97-9dd2-bfe29beaa8a4	Campos	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4390	63e3d67e-8eb6-45cd-b4a2-6919afcaf037	Vila Meã	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4391	14860f77-e5d6-421f-b4b6-fae3ec1cdcb0	Candemil	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4392	adaa10a4-da03-4fe5-b2f8-b7508bfd59ce	Gondar	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4393	43ae4dba-8625-4359-968b-ff93c8164263	Lovelhe	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4394	dc9b56cd-5084-4646-868a-8bb2d238a6a3	Vila Nova de Cerveira	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4395	52dee33c-511a-41aa-bf3a-65231d16158b	Revoreda	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4396	3e8386e8-9808-4fac-96ec-b3e70fa6c73b	Nogueira	\N	18	270	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4397	c3d83996-d231-4c89-8978-25bc094ab34f	Alijó	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4398	66bbed2e-1180-4ef0-b71d-1f34d4f5212b	Carlão e Amieiro	\N	19	271	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4399	575070a9-6074-43da-91b7-62df6745852f	Castedo e Cotas	\N	19	271	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4400	738eda64-d9c9-49dd-b4f3-c3c757b9ade2	Favaios	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4401	90a0e4f9-8d1e-41f1-a217-77e41521778c	Pegarinhos	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4402	c849b680-b53f-47e3-be0e-f3e5aab47618	Pinhão	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4403	04d3391f-6c45-4e73-b1a6-0a5357d77a60	Pópulo e Ribalonga	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4404	90069b35-78d3-4453-b3ac-72d9046a977d	Sanfins do Douro	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4405	971bacd0-08d4-48f5-887a-c5ff49756932	Santa Eugenia	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4406	0667bcf5-bf41-46b8-9fff-acefb5c05b66	São Mamede de Ribatua	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4407	141b7eec-3d34-457a-bc45-3f12d4790793	Vale Mendiz, Casal Loivos, Vilarinho Cotas	\N	19	271	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4408	28deb6c5-2029-4a89-85db-0000916cc881	Vila Chã	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4409	e25fb150-a70d-4e67-ad49-9ebe4383dee0	Vila Verde	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4410	621db079-c5db-4db0-902c-bd8c5a790690	Vilar de Maçada	\N	19	271	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4411	05ba6b12-712b-425c-9943-96cf44c3a4d5	Amieiro	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4412	89f393ed-7436-4477-aa2b-6943e326e895	Carlão	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4413	74a5511f-f4f2-497d-8362-aed233d21052	Casal Loivos	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4414	ee328ad1-e31d-4204-881c-2db2af7894b2	Vilarinho Cotas	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4415	4abeaca6-dff2-43e2-a845-05af5123bb0e	Castedo	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4416	da18f29a-d3e3-4934-8eb3-0df89d08659c	Cotas	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4417	f3e2723e-ef5d-498d-9611-94118033d8a6	Pópulo	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4418	8a99f78a-f748-44e3-9dc7-e02afb201cd9	Ribalonga	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4419	ab5687c4-eb5a-4d53-9935-597a440ff775	Vale de Mendiz	\N	19	271	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4420	12e942cf-df26-422c-ba5a-d4644b8008e9	Alturas do Barroso e Cerdedo	\N	19	272	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4421	57e68dfe-eb51-47a1-9ecb-f0860b47b665	Ardãos e Bobadela	\N	19	272	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4422	a6c78d22-df30-4ac3-9e80-68a9af30479b	Beça	\N	19	272	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4423	d49d1fed-3921-4f1d-849c-7c50456ae0bb	Boticas e Granja	\N	19	272	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4424	e8c7f75a-2da8-4203-ad7f-81597caff379	Codessoso, Curros e Fiães do Tâmega	\N	19	272	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4425	77f8b854-f5c8-4f31-a480-3daa3eb8273f	Covas do Barroso	\N	19	272	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4426	dd8cda41-06e8-42af-a5cf-cbe184d8ca1b	Dornelas	\N	19	272	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4427	73f5de1b-3de1-498c-b7b3-28ac4afec8fa	Pinho	\N	19	272	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4428	52dfce05-07b4-4763-8969-a0cf694b162d	Sapiãos	\N	19	272	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4429	6d89fb51-4285-4e84-8ada-c8899e314f54	Vilar e Viveiro	\N	19	272	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4430	c930ccf8-75a9-47c5-a204-6e181df20eb1	Alturas do Barroso	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4431	8d0f738b-6d5e-46fb-98d0-29f739efd28d	Cerdedo	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4432	89c7175e-5a2a-4722-ba1b-851e8677689f	Ardãos	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4433	cddb6130-24a4-4735-abfa-279f2fa0f446	Bobadela	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4434	b666deb8-c5ec-409d-bd25-ba0a9f060fea	Boticas	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4435	15241f72-b459-4988-9972-196d2363469e	Granja	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4436	df9cd678-ff83-4695-a241-6178d024907c	Fiães do Tâmega	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4437	a45761e8-da57-4757-9b07-46163dba1108	Codessoso	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4438	91b119b5-4518-4269-9d86-744c157c60d8	Curros	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4439	252d31a6-91f1-4f81-a1db-87db3dab5ec7	São Salvador de Viveiro	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4440	8ddeecd8-cfa2-4b48-ae3f-bbe1f57d8f19	Vilar	\N	19	272	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4441	3ee2b7a6-4f97-4ae7-b401-fda7447d3725	Águas Frias	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4442	46b38db1-90aa-492c-a3bc-f9255d8fc479	Anelhe	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4443	b079490a-05d0-48d5-9ed4-44445aef60b6	Bustelo	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4444	cfc6359d-5aab-4803-a010-797d769ab345	Calvão e Soutelinho da Raia	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4445	06d27a53-b250-4541-b0a5-efe76d64f5db	Cimo de Vila da Castanheira	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4446	60624733-1f0a-4073-8749-27781c49952e	Curalha	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4447	846b8f0d-2371-49ba-8659-ed525fd6f6ea	Eiras, São Julião de Montenegro e Cela	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4448	1c81c753-793e-4457-824c-b0e18aae4379	Ervededo	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4449	9a3dcd6e-3703-4260-af9f-a39253b9ce12	Faiões	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4450	bf43c328-125a-45eb-b0b2-7b0b94382f75	Lama de Arcos	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4451	5f8a85b0-bd7a-41e8-acc1-430ff9ed2d49	Loivos e Póvoa de Agrações	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4452	437ad6e6-77ce-43b4-a651-7f9585ae370c	Madalena e Samaiões	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4453	e942bedc-ed1a-4f8e-81ad-3658254e4a14	Mairos	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4454	e126de60-c975-40cc-a896-dbfc4eedaf18	Moreiras	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4455	697fb85a-f03a-4770-a01c-03eb0e1ff405	Nogueira da Montanha	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4456	b2f87ad3-795f-4184-8d3c-3755b0b0f10c	Oura	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4457	b622b9c9-fec8-41b2-85f9-8e54536cde07	Outeiro Seco	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4458	e8ba038f-11ab-4d08-8fa0-ea0796539eb9	Paradela	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4459	99f7d9ee-de58-4bde-8412-cad1a9af7e58	Planalto de Monforte - Oucidres e Bobadela	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4460	704fcd26-905b-4c18-9baa-8a6c95da34e9	Redondego	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4461	fe3cb03d-bc10-4644-9c60-0dee982ed4e3	Sanfins	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4462	75fe2206-e96b-4749-8c08-776ff6fd6334	Santa Cruz/Trindade e Sanjurge	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4463	3a535503-903b-467f-9198-09e8969660a1	Santa Leocádia	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4464	999ce3fb-d471-4e3b-b1fd-ccc837682a45	Santa Maria Maior	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4465	cfe69813-1f7e-4dbf-ad1a-36cd314c9457	Santo António de Monforte	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4466	63a85e28-4e6b-4360-af92-379dfed5e506	Santo Estêvão	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4467	0b6ceb9c-d897-42fa-92f3-ede4a38c1521	São Pedro de Agostém	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4468	95815e0f-513d-42c8-9004-b159c699b105	São Vicente	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4469	29b7e77b-2792-469a-902d-9b359a8ef0a3	Soutelo e Seara Velha	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4470	60b45dfc-dee7-491a-b2d3-eea96ab51c4f	Travancas e Roriz	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4471	8fe20712-c09e-4b48-9609-8fab581e4818	Tronco	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4472	b788df26-de4a-4be2-b003-e071ab774a87	Vale de Anta	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4473	98fe1950-38f3-41d2-8add-806b0155dee0	Vidago, Arcosso, Selhariz, Vilarinho Paranheiras	\N	19	273	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4474	7183122a-439f-448f-adce-38a840499e16	Vila Verde da Raia	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4475	4b5356bf-5ee8-4e82-a3b2-c4b9cf502818	Vilar de Nantes	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4476	d02a2016-a2e9-4fab-a713-23335e1fabf5	Vilarelho da Raia	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4477	1cf5b8ce-3899-4a62-993d-b9a6dc249d81	Vilas Boas	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4478	a97b1abe-b3fb-4042-aeda-df903650ba46	Vilela Seca	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4479	7bf8de01-e135-43d3-b014-5f459d3f0876	Vilela do Tâmega	\N	19	273	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4480	fec88bc3-9ce0-4225-8d10-2f771514304a	Arcosso	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4481	645bc695-568e-4f5d-8144-648a72a0e890	Selhariz	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4482	0953a170-63df-40d9-92f5-ab03945c3ec9	Vidago	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4483	541e3a5f-8eb9-4139-b1bd-af58635bec12	Vilarinho Paranheiras	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4484	82be9550-7a31-4c6c-80ac-642add6f50ac	Bobadela	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4485	8f359ab6-8604-4dac-95d8-0e69a5918396	Calvão	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4486	8260291a-a455-45de-847e-43a5e02e45f8	Cela	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4487	1f6e5900-37ac-44e9-a97b-67f797f74b9d	Chaves	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4488	99d57db1-48b8-46af-ade4-4004bc466424	Eiras	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4489	7bf0a663-73c6-4aff-aa10-94be3da2cc7d	Loivos	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4490	190923f3-33ea-40a0-8f10-ee8de94d3106	Oucidres	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4491	fa3821a6-86c7-4022-95a1-86e49f4fa2c5	Póvoa de Agrações	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4492	e2dd5f60-8775-44b7-98f5-9f73e3953422	Roriz	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4493	9a57a76f-5110-463b-986a-f9340f93a00d	Samaiões	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4494	c0624aa3-2456-4b2c-a64f-eb662caeb774	Sanjurge	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4495	be03ed8c-013b-4447-bf15-ac92b51add8a	São Julião de Montenegro	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4496	1cfd4f21-5b92-4c65-9ba1-6d6cb783b67c	Soutelo	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4497	9c18359c-77a4-42a7-9b57-b72004795b32	Seara Velha	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4498	bc8af861-0613-47a0-8a21-77759fc00cbb	Soutelinho da Raia	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4499	f9fc982b-a530-42df-9442-0f73185b0a70	Travancas	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4500	541e71c4-236c-4069-819d-2af9b20e979b	Madalena	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4501	bd62333c-49ab-498b-9fbc-a31f3b5514bf	Santa Cruz/Trindade	\N	19	273	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4502	5699e9a1-3093-4ea9-8586-dbd2e20a3bba	Barqueiros	\N	19	274	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4503	8f8f7cbd-661d-45fd-a926-09be2d36afb6	Cidadelhe	\N	19	274	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4504	d73580b5-cfe6-42a6-8cbe-704b2d10f34b	Mesão Frio - Santo André	\N	19	274	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4505	e9540517-f86e-4904-b036-011e5baa9847	Oliveira	\N	19	274	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4506	d25ebbb0-f47e-43cf-a60b-f263faacdd70	Vila Marim	\N	19	274	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4507	f27518ae-019a-46c9-8eed-7b2d9f04b920	Mesão Frio - Santa Cristina	\N	19	274	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4508	5672ab82-03ba-4c61-9605-a26f426e52d4	Mesão Frio - São Nicolau	\N	19	274	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4509	200d6a5b-b558-47d4-8bb5-b336c23bcd70	Vila Jusã	\N	19	274	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4510	5ac6676f-890e-46f2-a697-90d3fb9c823a	Atei	\N	19	275	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4511	71f86573-391b-4a8c-b027-95abb1224d11	Bilhó	\N	19	275	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4512	d1a3cb3b-8cda-4f36-9de7-e1fd597e19c9	Campanhó e Paradança	\N	19	275	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4513	1e326322-5d70-4d34-b32f-3306e05d22ef	Ermelo e Parelhas	\N	19	275	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4514	c2cfc1be-035d-46bf-8e58-a2119f0b2aab	São Cristovão de Mondim de Basto	\N	19	275	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4515	9ac2fe7a-91ca-49e9-85ae-8ea6c3cc2616	Vilar de Ferreiros	\N	19	275	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4516	b0f31017-fcaa-4f8b-929a-07aea0023b23	Campanhó	\N	19	275	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4517	bb6673e4-da8c-4b60-ba30-49b1a2f1d9d6	Paradança	\N	19	275	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4518	188d3436-13bc-4160-b1af-ead2eaf6208d	Parelhas	\N	19	275	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4519	1466cd64-0d3f-43f3-bcce-a5c2272378df	Ermelo	\N	19	275	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4520	262f0652-a9be-4956-bb56-24d2a85d233d	Cabril	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4521	c69080dc-8cda-4377-bb74-2ee992e5b96f	Cambeses do Rio, Donões e Mourilhe	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4522	341ea133-0382-4a6c-852d-512acdc24e82	Cervos	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4523	4b7383b6-a158-4fa1-886d-071340772a94	Chã	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4524	63313206-e3b0-400c-a08c-8e2748ce5aa2	Covelo do Gerês	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4525	0c601ca6-5902-4bb8-b956-af240cc3b124	Ferral	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4526	5e28e45f-e8be-499e-a62e-f13f6fd303cb	Gralhas	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4527	410f8d3a-2777-4530-b6cf-7158af60adf3	Meixedo e Padornelos	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4528	f64d6e38-b96d-47f3-81be-f4eee1d86dbe	Montalegre e Padroso	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4529	4225bae9-0104-42f8-ae68-8da40240f7af	Morgade	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4530	3e3215e5-ade5-4120-ae6f-0ccebf0f8c1d	Negrões	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4531	4b6998c5-58e7-4b05-8eff-71bb40533eb0	Outeiro	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4532	78166d7a-6271-46b4-9a16-fe84a7c4b351	Paradela, Contim e Fivães	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4533	17fc63ea-bed7-4a34-93ea-4f3a20d90aaf	Pitões das Junias	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4534	2f786916-5145-4040-9e54-aa7f30683475	Reigoso	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4535	60172c4c-62ea-4ab2-92f5-e119c3462294	Salto	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4536	8e3b6ec6-0b86-442b-adb0-e8967b1016ca	Santo André	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4537	d3bfc5f9-1189-4711-af3d-f43dfb822aa7	Sarraquinhos	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4538	a6a124d9-756c-4e5c-8cb9-e6359b797be7	Sezelhe e Covelães	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4539	4c41dadc-f04e-462f-8701-5e192def9c20	Solveira	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4540	59fbd160-0edd-4024-b4b6-5850e6a4813e	Tourém	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4541	7d26d336-fb10-4304-a80d-ea1c955b107d	Vila da Ponte	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4542	f99ce838-9392-41a1-a0c9-2079fb985195	Venda Nova e Pondras	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4543	752c2d5a-dc78-4e02-8973-30dc52df7883	Viade de Baixo e Fervidelas	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4544	d55e7eb0-1ec5-46ff-acef-f1a625c6565f	Vila da Ponte	\N	19	276	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4545	95ad5a83-d618-423f-83b3-665d273b790d	Vilar de Perdizes e Meixide	\N	19	276	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4546	21847b24-46d6-44c2-96d6-10cb3a4fb63b	Cambeses do Rio	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4547	328b2536-1149-4fd0-9437-6b80c4b32ac3	Donões	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4548	5caf6cf2-e541-4900-9a28-4847e3800fb5	Mourilhe	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4549	02441288-e9f5-4931-b00f-430b1eebe6b0	Contim	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4550	fda2d88d-cfa5-4b4e-8e33-7e766be33174	Paradela	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4551	9a0b4151-8f51-4be7-8824-234ba3b75a1a	Fivães do Rio	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4552	23c2b0dc-000d-4d97-bc89-6e8d9056a77e	Covelães	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4553	134de2c7-58c6-4d7e-b453-138abbb1c217	Sezelhe	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4554	ecc42d93-86de-4162-9be8-fdf6a0ae8431	Fervidelas	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4555	2ccf4a4d-b7d3-4e06-a854-3ae63e6c37c4	Viade de Baixo	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4556	a57257a5-9655-4e85-b286-82204ac0ebcd	Meixedo	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4557	6578971a-df4a-4ae7-840b-06c159ba3718	Padornelos	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4558	65725432-4d5f-433b-98bc-44c55cd67938	Meixide	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4559	77c241ce-3047-436d-951e-8e7fca57e2e9	Vilar de Perdizes - São Miguel	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4560	b1997019-98d6-4b24-9a51-2aa61a210d19	Montalegre	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4561	9141fa5c-7e08-49db-becb-836c7992037a	Padroso	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4562	29d26b47-5a28-41eb-af72-e115a067764f	Pondras	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4563	997cf81c-5705-4fba-b183-24b52a2de42d	Venda Nova	\N	19	276	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4564	27e14cfe-030d-4675-9eec-b37bd29e16b9	Candedo	\N	19	277	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4565	feb44fc6-cbb3-44d4-bb55-8679c5036ef7	Carva e Vilares	\N	19	277	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4566	b7f84d9e-0c0f-45df-b636-762fb09c47ac	Fiolhoso	\N	19	277	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4567	362297a1-80c7-442d-aedb-a1273237bb17	Jou	\N	19	277	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4568	12ed155e-d6c0-4b49-906f-2dda797b404b	Murça	\N	19	277	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4569	5cdc1733-944c-4044-a297-591d813b7b79	Noura e Palheiros	\N	19	277	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4570	8beb9894-5cc4-4302-bdb6-27a5b90b54b0	Valongo de Milhais	\N	19	277	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4571	1dadbba2-059d-4b00-8866-dd2b98fbbed7	Carva	\N	19	277	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4572	f4fedfe0-28dc-40bf-b79c-f21a3ee4cf65	Vilares	\N	19	277	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4573	8c6ca83c-927c-454d-bb74-e598d1c7e933	Noura	\N	19	277	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4574	62ab6445-4ba1-40f6-9010-bc8cd7513fbe	Palheiros	\N	19	277	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4575	3a33b193-449c-4653-b62b-b1843dd4c5ae	Fontelas	\N	19	278	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4576	c3382422-c508-4dff-b1ab-b766777a3abe	Galafura e Covelinhas	\N	19	278	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4577	2ccb0454-8d66-47c6-bdc0-5e592c8af43b	Loureiro	\N	19	278	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4578	8ba3dd3c-f0b1-4b67-a18d-2bbfbbe7dbdf	Moura Morta e Vinhós	\N	19	278	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4579	1a416860-4276-4ea4-a514-f952e1d8572b	Peso da Régua e Godim	\N	19	278	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4580	9b9077bc-0409-4852-94cc-840981ee79dd	Poiares e Canelas	\N	19	278	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4581	56db8e80-5cf9-4e27-a9a9-96a5cecaf018	Sedielos	\N	19	278	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4582	8f06c249-64f4-457a-809e-0db7a2cd6a5c	Vilarinho dos Freires	\N	19	278	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4583	b7c6b61c-ca58-4def-b042-5d519c0f287e	Covelinhas	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4584	1fa05090-3122-4dcc-a364-2b0ae85496e6	Galafura	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4585	32fa01f2-c151-4812-9848-6444b27628a4	Godim	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4586	5d7d3086-7dae-4ee2-aff2-d69e197b2aab	Peso da Régua	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4587	fe030006-37fa-4795-a801-73f11d068be5	Moura Morta	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4588	6c62ab48-32d0-4c47-bf24-68a3e3189723	Vinhós	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4589	6590ac4f-1ae2-4bf6-a419-d1e5cdda582b	Canelas	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4590	01104a8f-641e-447d-ae6a-9311065acb5d	Poiares	\N	19	278	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4591	9c7e8358-1f2b-4d10-86cc-2ac0e26002b2	Alvadia	\N	19	279	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4592	55bc88c0-bb3c-4ce1-a075-8f76a869a7dc	Canedo	\N	19	279	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4593	1ef2e5e9-8fc2-4871-9ca4-30b8d919236d	Cerva e Limões	\N	19	279	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4594	54ac965f-f3ba-4c09-9ae2-64c391cba801	Ribeira de Pena - Salvador e Santo Aleixo de Além-Tâmega	\N	19	279	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4595	9803424c-718b-4789-8273-681ab5de1f0e	Santa Marinha	\N	19	279	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4596	e5af63e2-44bd-4123-9065-70ca6a1969b1	Cerva	\N	19	279	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4597	bc4f5a86-3fb9-463d-8a80-7763d75db54a	Limões	\N	19	279	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4598	49b8ed12-650e-42c3-9c8e-e08d7fdf87a1	Ribeira de Pena - Salvador	\N	19	279	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4599	86c5c939-1e0c-48b7-9d7f-c158225953c4	Santo Aleixo de Além-Tâmega	\N	19	279	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4600	e778fb2f-917a-4fe7-92f3-4056307f346c	Celeirós	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4601	9a836f36-868c-4e39-a5f7-750c2cfeb469	Covas do Douro	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4602	098e3399-bf2e-4f06-9dca-982043383c59	Gouvinhas	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4603	a8b5d468-d9dc-426d-a035-047afec5358d	Paços	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4604	2f564aa2-e6e3-4605-a2af-6f8fe816bea7	Parada de Pinhão	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4605	1a2075c9-2c7d-45d4-9834-e90a974ed89a	Provesende, Gouvães Douro, São Cristovão Douro	\N	19	280	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4606	29f675d8-0424-4ef5-b9a5-19750bf29567	Sabrosa	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4607	e1c1f5c1-0e40-42dc-8f06-30598132d6eb	São Lourenço de Ribapinhão	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4608	1e868b7f-44cb-4900-8e77-b0e8687f8f16	São Martinho de Antas e Paradela de Guiães	\N	19	280	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4609	626dcf66-0387-4ccb-8a88-9d6bc1f9c1ca	Souto Maior	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4610	966b2ce2-e3b6-4c31-914b-38168f16d8e7	Torre do Pinhão	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4611	37f8799b-4155-4b55-bbef-adcb7af85f1e	Vilarinho de São Romão	\N	19	280	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4612	966b9fdc-f58b-4ddf-9e4d-272bd0f9ef10	Gouvães Douro	\N	19	280	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4613	58ec4084-c6fc-493d-87d6-6870bc4ed1d8	Paradela de Guiães	\N	19	280	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4614	2991eb7f-6206-4ccb-9044-4af042f51ac3	Provesende	\N	19	280	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4615	83e41c51-4617-4bdb-84d7-2dc599f9e86b	São Cristovão Douro	\N	19	280	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4616	db814e58-b7c1-43cb-bb09-2c8214ca50be	São Martinho de Antas	\N	19	280	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4617	9de92cae-7bec-4892-9e33-ee0c83bbe126	Alvações do Corgo	\N	19	281	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4618	0bfafa81-4f07-4a43-b152-f83b540ebdab	Cumieira	\N	19	281	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4619	e28929d8-d1d5-4f68-939e-1baab6008349	Fontes	\N	19	281	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4620	0ebea2c8-196c-45bd-b74b-0b3c85cd3e9b	Lobrigos - São Miguel e São José Baptista e Sanhoane	\N	19	281	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4621	ef68648f-797e-48bc-8697-f1f4c2a405b6	Louredo e Fornelos	\N	19	281	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4622	ab623ddd-ad41-4264-90b7-4bfd27f0f3a7	Medrões	\N	19	281	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4623	f6a581b5-45b4-4622-a73f-13792f33efd1	Sever	\N	19	281	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4624	ecc835aa-3855-41f7-b234-105392e29fa4	Louredo	\N	19	281	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4625	b9cd1d4e-66ad-4dc7-b7cd-96c1fd498adb	Fornelos	\N	19	281	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4626	66b6bb7d-6177-4540-89a1-abb9e372b688	Sanhoane	\N	19	281	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4627	52185935-d39e-44a0-8a17-4275389ad790	Lobrigos - São Miguel	\N	19	281	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4628	5147b869-0b4b-401b-a426-8f05d3aa75e1	Lobrigos - São José Baptista	\N	19	281	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4629	c401cde5-6e4a-4117-a7f8-329245aa0ae3	Água Revés e Crasto	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4630	afd76e06-7cf3-4ef2-86dd-d208c20da45f	Argeriz	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4631	c09fb81e-e869-43f6-9462-85489f43cd1d	Bouçoães	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4632	16f8778d-5b08-4b8e-a94f-1e585071c0c1	Canaveses	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4633	66bcc977-e92d-4b62-b23a-2fdcaba22ed1	Carrazedo de Montenegro e Curros	\N	19	282	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4634	30ed562e-a8d8-4d97-90a6-f306406463db	Ervões	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4635	25582330-dca5-43e1-9ccd-5a721dfacccc	Fornos do Pinhal	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4636	2ba2f666-8084-4d68-a1cb-2487c3d3b359	Friões	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4637	18d296dc-ae9f-43c4-a1bf-5e8e5e8aac33	Lebução, Fiães e Nozelos	\N	19	282	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4638	4385b5ac-6b0c-4040-b66d-30d81958e736	Padrela e Tazem	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4639	a7304e07-02d3-495a-b09a-4858f6e06051	Possacos	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4640	d550c202-e3ad-4028-80cb-e6c6f97fefd9	Rio Torto	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4641	4ca09151-1b40-4d8e-a2f1-2b4161990426	Santa Maria de Emeres	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4642	2f5578af-6c59-403d-9fc2-a40f337fb30a	Santa Valha	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4643	d189ee98-0ed1-44f9-826f-b84d83d39fd4	Santiago de Ribeira de Alhariz	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4644	0d340560-8ed9-42bc-8d91-03bd3640dd32	São João da Corveira	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4645	fd3d68dd-5828-4ed1-b410-ddfd2f98dafa	São Pedro de Veiga de Lila	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4646	36a1118d-0ea3-4137-95e9-8fa0b14dd6cc	Serapicos	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4647	103fd79b-a06b-4428-8649-4c91fd2a289f	Sonim e Barreiros	\N	19	282	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4648	034221d1-f829-40a4-a3a2-73d9471b1c10	Tinhela e Alvarelhos	\N	19	282	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4649	1a22daaf-a922-4ce2-80ca-65e2f2251f78	Vales	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4650	e7206907-2d10-4dff-b0fa-3b6d654c1354	Valpaços e Sanfins	\N	19	282	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4651	0e00bb2a-b8e7-45a3-b862-3986d727913d	Vassal	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4652	acedcdd1-8124-47b8-ab1b-5e97963a6015	Veiga de Lila	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4653	8a8e9f74-1fb4-48e7-959d-2cf480eb7ec7	Vilarandelo	\N	19	282	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4654	aa0f19a8-019c-4cc1-81e1-1610e91bb07d	Alvarelhos	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4655	7e986e4e-25e9-4084-bad9-c8452183f9d6	Tinhela	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4656	4424f3b5-58d5-44a4-ab8e-acb00e0182ea	Sonim	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4657	a54fe67e-bf77-431d-8510-ce6ae4eb5aaa	Barreiros	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4658	0a7f0f3f-9b91-4eaa-90e7-17368f706a4a	Carrazedo de Montenegro	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4659	a5f03f0b-5e7d-4273-8a1d-8ce40a5a17ac	Curros	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4660	5f356632-997c-4170-ac28-b9edd194e176	Lebução	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4661	c34c9bc1-f976-40ae-b882-91d674243904	Fiães	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4662	ca9b903b-751c-4417-add6-918abbadb6b5	Nozelos	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4663	dd4beea1-9a33-469f-913b-076ee59be3b6	Valpaços	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4664	f857f84c-0ce5-4386-8525-fc74a1fc33fc	Sanfins	\N	19	282	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4665	3e0e9ea1-4e0e-4a71-98aa-ee88bd368e15	Alfarela de Jales	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4666	a2f90c89-eb25-4d59-8184-4f3f9dc0c648	Alvão	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4667	d6ce8ac0-3b96-4352-aae7-f20079a4049e	Bornes de Aguiar	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4668	3a1a2893-610a-4fe7-a5b1-b0f7aaa1b762	Bragado	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4669	44b66b5f-962f-4623-8223-02b812a2f687	Capeludos	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4670	987285cc-1868-406a-8809-122a88ad7727	Pensalvos e Parada de Monteiros	\N	19	283	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4671	4e2a1d2a-eac1-452d-ad82-e39071ec61fc	Sabroso de Aguiar	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4672	b99487eb-530e-44fc-a882-f63ffc550e3b	Soutelo de Aguiar	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4673	f3415c30-f05e-4901-8728-96f3c0625fa1	Telões	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4674	bf03ca05-76c9-4b92-8744-b80c62aac8d4	Tresminas	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4675	6e099cf3-9c10-4985-a7f6-acc3976863e8	Valoura	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4676	77b008f9-ed4c-4e45-88b5-a474aadf3fff	Vila Pouca de Aguiar	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4677	a3bc0d58-3479-4858-ac50-37ad0f49490d	Vreia de Bornes	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4678	3284f08d-fd18-4a69-a938-70a2d6761686	Vreia de Jales	\N	19	283	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4679	ae022332-2042-4f39-aed2-2804f7da217c	Afonsim	\N	19	283	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4680	da217a0f-a107-4687-976b-ddb61594487e	Gouvães da Serra	\N	19	283	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4681	3b171b25-4f9b-473a-b9eb-a7432ab5b5c2	Parada de Monteiros	\N	19	283	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4682	5b457587-b337-4321-b089-24eda60c2781	Pensalvos	\N	19	283	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4683	2a92ac65-9d5e-46dc-a02f-4c768de56f3b	Santa Marta da Montanha	\N	19	283	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4684	2959b7f0-8b63-44cb-92ba-78a00dd1590f	Lixa do Alvão	\N	19	283	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4685	a6433d03-cb71-4e0e-8bb3-63ee6a2455dc	Abaças	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4686	0a3ed427-bf62-4881-be40-796bdd9ebb47	Adoufe e Vilarinho de Samardã	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4687	86cddfab-2e39-499b-b2db-68b1607984d8	Andrães	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4688	b052e856-4dff-4b34-8c07-0c3f8a03f6e0	Arroios	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4689	37a2506f-3294-49e5-a3bf-d97ae5641696	Borbela e Lamas de Olo	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4690	29f54e94-edfd-4fff-a9f8-67ecf6b52745	Campeã	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4691	52c89262-f1e6-4a11-9776-99001ad7be78	Constantim e Vale de Nogueiras	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4692	56d9ca84-bf6c-40f2-a205-f1ce2754cf7d	Folhadela	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4693	c64d6e94-33d0-4dad-a1e3-a12d01315cbb	Guiães	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4694	751191ee-553d-49e6-b05a-1ea74481df63	Lordelo	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4695	0346c715-efae-48a0-9b42-ee88522d71f2	Mateus	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4696	1d176724-c560-4518-9fb1-dd0e04e32057	Mondrões	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4697	a2fd0efc-1f02-4c4d-b734-d6896e628e2d	Mouçós e Lamares	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4698	2a7e2d42-5485-479b-a73f-3a24be37ed55	Nogueira e Ermida	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4699	3a74de5e-9d9c-4415-a302-2ff83d669231	Parada de Cunhos	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4700	f0260c1b-4288-4819-a2d2-650899361767	Pena, Quintã e Vila Cova	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4701	b5885fdc-edf3-4650-ac91-b2029995be19	São Tomé do Castro e Justes	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4702	6b060b65-9254-48be-ba76-ff62595f7b90	Torgueda	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4703	2b3022d8-d979-45bb-8f11-16afb9bc1052	Vila Marim	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4704	71f170d8-eaf4-4a54-993a-7eee37c7aab2	Vila Real	\N	19	284	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4705	1e824058-4d97-45a8-9217-4122e37b302b	Adoufe	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4706	977f09e4-fc53-4e39-82d2-2dbcf134a6cc	Vilarinho de Samardã	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4707	d743f28e-9f37-44e4-9a51-7832b91a9802	Borbela	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4708	26be2216-b0fc-4f26-9a7b-ae908751c8de	Constantim	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4709	49b6baa9-3fb7-40e7-b1a7-cb1e24c9f13a	Ermida	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4710	076921d1-3b32-4a39-a577-cc65d8240b5c	Justes	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4711	553f418b-0e50-4cd5-b5a9-83089434e2a0	Lamares	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4712	b050549f-3605-47ab-968a-769b8636f9c4	Lamas de Olo	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4713	e60a1879-7936-4c40-a279-4d1f4e8afd14	Mouçós	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4714	a0bd35bd-1a34-4a54-b3e7-010468dbf2ff	Nogueira	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4715	d06ca8bd-e80e-487a-be58-e43520577e4c	Vila Real - Nossa Senhora da Conceição	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4716	7e4e689e-1f51-44c0-84e7-50a3c7ca15d1	Vila Real - São Dinis	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4717	cf0ac59e-6357-44f1-9116-2c56d3099498	Vila Real - São Pedro	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4718	79c020b1-bd20-418a-9164-4298d4f68216	Pena	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4719	3280f633-c83f-4539-8a56-f9ec8024344e	Quintã	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4720	10a02187-a39b-4f1c-9720-62f53e2a8784	Vila Cova	\N	19	284	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4721	a9de2313-c2b9-465b-8984-4b69c9117818	Vale de Nogueiras	\N	19	284	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4722	df6e64f7-d85c-4006-a19b-41d681659809	Aldeias	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4723	e88b6fcd-ceee-48a5-be32-f8c52a303057	Aricera e Goujoim	\N	20	285	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4724	e65fed14-eae8-47d5-a858-43a3a8fcb849	Armamar	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4725	e2192af4-0a36-4386-841d-b8230169cc66	Cimbres	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4726	f7a4c7b1-b312-43ed-9bf5-137740ee9e82	Folgosa	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4727	4108e280-4623-4005-b29f-7ddedf301f40	Fontelo	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4728	6d25de76-a651-48ee-9249-73acd9300b5a	Queimada	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4729	91030684-ad74-4825-a02b-bec219939c95	Queimadela	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4730	de6bbbba-0bcb-4550-af89-0e6984746cc1	Santa Cruz	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4731	2207ad30-b085-478d-9a0e-401bf66670f3	São Cosmado	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4732	4fd8b78e-32ba-482c-ad46-d42330f0a03f	São Martinho das Chãs	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4733	64776e5f-0c87-46ef-afcb-9e19958c444f	São Romão e Santiago	\N	20	285	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4734	4d9e61e6-b4ea-4808-9351-b5380e1b917c	Vacalar	\N	20	285	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4735	ccd2b07d-96f9-46f5-bf4d-fbce92d1820c	Vila Seca e Santo Adrião	\N	20	285	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4736	6bdb1f90-5bf7-4b42-9f0e-906f1bb92a27	Aricera	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4737	24735382-b029-4f75-a10f-7c0df4ece085	Goujoim	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4738	58e177bb-d8d7-4d7c-ad6c-6ff28dcd29d0	Coura	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4739	ef73fe73-f74f-48c8-91c0-bc2753db8e6c	Santiago	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4740	c1946260-d8f4-403b-8ac4-5dc7133f2e8b	São Romão	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4741	26bbe999-865d-4c7e-894e-6f52b75308df	Vila Seca	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4742	f1c542ec-090b-4e6f-a484-f9d35c2a337d	Santo Adrião	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4743	db4c522e-76af-4de9-8c70-78f8fb724150	Tões	\N	20	285	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4744	470ae490-b1ea-45ed-bcdf-c35c54bf296c	Beijós	\N	20	286	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4745	9e0bac15-30b7-48b0-b104-b39f992693b5	Cabanas de Viriato	\N	20	286	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4746	75a7f4c4-016d-4a56-bfa1-a91c38db05ae	Cabanas do Sal	\N	20	286	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4747	f786c2db-a98c-4d7f-9cb3-79a0431779c8	Currelos, Papizios e Sobral	\N	20	286	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4748	dfa307cf-aff1-43d3-83f3-edd0cb03c229	Oliveira do Conde	\N	20	286	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4749	786d3b76-37d3-4f7b-bf35-f49d539864d2	Parada	\N	20	286	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4750	480bb7f3-c9b2-4859-bfa3-37caadc726ef	Currelos	\N	20	286	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4751	e7af6597-d17d-45df-bb5e-facccffaf0af	Papizios	\N	20	286	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4752	014842bb-b48b-44ee-86c9-424cc9e4f39b	Sobral	\N	20	286	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4753	b3019512-ea62-43a1-9108-9c7ca6a89f7f	Almofala	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4754	7397c00f-5f0d-4e91-8f70-f26545d6113a	Cabril	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4755	10905e1d-fed6-4d1e-b8f8-68c71bc18de6	Castro Daire	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4756	d53a7ea0-b0c9-482c-be7a-c7a2f7bfd7ff	Cujó	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4757	98dfe93a-f48f-4829-8b06-524e04555425	Gosende	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4758	7ebf3044-c61a-444a-8d3a-ffa50680459b	Mamouros, Alva e Ribolhos	\N	20	287	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4759	b118f5d8-e3ad-4682-909f-68745ca3619c	Mezio e Moura Morta	\N	20	287	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4760	a2c5fd0a-09e8-474a-a2a2-dad5618f1c4a	Mões	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4761	64765c8c-cdd6-4337-b166-9deaddefa187	Moledo	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4762	d8cf2b58-be4c-4233-a829-25fb813e044f	Monteiras	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4763	158f65ea-8cce-4d16-a859-6670076f3518	Parada de Ester e Ester	\N	20	287	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4764	3d892ba3-6730-45f8-bbd1-889a7a6b2935	Pepim	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4765	07adb331-a9ae-4373-8ca4-92ce2b7251e3	Picão e Ermida	\N	20	287	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4766	08f26671-8d2f-4e38-9fc2-98652489f008	Pinheiro	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4767	e68f6484-775f-4f45-8edb-852b318b754e	Reriz e Gafanhão	\N	20	287	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4768	f8c6dbc7-1470-4be7-bf4c-f4e2a4302ff2	São Joaninho	\N	20	287	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4769	75bee7b9-43cb-40bc-a76b-661bb145a576	Alva	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4770	43056690-1a03-4bca-ab4d-3d7f7eabfbc1	Mamouros	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4771	72418d00-667d-4e61-bf37-0c1189c835b4	Ribolhos	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4772	f97bd7f4-5c2b-48ab-8908-2a64182431df	Picão	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4773	5affa670-c13a-45dc-bd65-b83cb34c0aa0	Ermida	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4774	4fbf6578-2954-437e-b87b-8250dbb9e0d6	Parada de Ester	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4775	829f8dbc-8bd6-4fd4-8a7b-bbeedd9db1a8	Ester	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4776	40316d75-29bf-4960-a50e-1ca990f495b3	Reriz	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4777	54c2bde3-bb50-422c-9b8a-8ac4e352fd6b	Gafanhão	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4778	2f66fc3a-ed75-4415-ac6f-a0664b62196e	Mezio	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4779	6cfb3536-0244-43f9-a6b2-551a0d3b069e	Moura Morta	\N	20	287	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4780	927494ae-535b-4607-b81e-a55a17a9cb69	Alhões, Bustelo, Gralheira e Ramires	\N	20	288	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4781	9b1ca830-5553-437b-bd8c-e3763c4a314e	Cinfães	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4782	31b9663a-abd6-4a07-ae9f-2fcc25f29a65	Espadanedo	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4783	3e2a1fd3-b267-4503-8181-9cd6d698e1f2	Ferreiros de Tendais	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4784	d44f7cdb-0b2f-487a-8bc2-d0a5d7ecd773	Fornelos	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4785	7be496be-c954-4408-a00b-9f91c5941113	Moimenta	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4786	ea46eeb2-535c-493c-808b-02018a3876ad	Nespereira	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4787	26ff72ea-b350-4fbe-b0e6-c6a8c97575ef	Oliveira do Douro	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4788	6392a0d2-1a11-4f1c-9ee3-884fd36f29ec	Santiago de Piães	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4789	ad8137ed-e995-476f-a966-9f2c731bc63b	São Cristovão de Nogueira	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4790	08566882-4bb2-4e56-8f2a-7e5ec1819909	Souselo	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4791	4fcbc483-2b4d-45c0-b173-9ee216286f6a	Tarouquela	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4792	5a0b4571-9270-427e-9792-4d02ae1fee46	Tendais	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4793	0bbfe5dd-796e-42c2-af90-a5d8e250991b	Travanca	\N	20	288	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4794	a137085f-9cc3-4763-8f6c-f54a5fd373f8	Alhões	\N	20	288	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4795	8c937e34-c1f5-4ea2-8c45-ad50960da766	Bustelo	\N	20	288	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4796	e2125919-7ce4-4bfb-a52f-17231428541b	Gralheira	\N	20	288	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4797	2c89e85a-0482-4ed6-a401-5e6c2a7f5999	Ramires	\N	20	288	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4798	4287d5d9-88e3-46df-aa0b-d259bdac1d13	Avões	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4799	56c183b9-7237-45a2-84c9-23086916efce	Bigorne, Magueija e Pretarouca	\N	20	289	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4800	2ce5aa7d-7426-40a3-b290-7d7ecdc5ff98	Britiande	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4801	4e163e16-7d23-4ec6-a4f3-a94f7d9019d9	Cambres	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4802	abdd25b9-de4b-41e5-87ac-06403f7eba2d	Cepões, Meijinhos e Melcões	\N	20	289	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4803	6afad7d7-9cc8-4d36-8caf-f136d4ccd737	Ferreirim	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4804	efcda668-a4f3-4b75-9ee7-f3c292d98e64	Frerieiros de Avões	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4805	c14838e9-e931-4e33-84dd-8c35e3d3a85b	Figueira	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4806	80d181b9-8c39-4dbe-9ab3-10930398fb55	Lalim	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4807	d2c9ac29-6641-4693-9d1f-769573f3c14d	Lamego - Almacave e Sé	\N	20	289	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4808	a966e728-4833-4e44-be59-c39e47a3a59b	Lazarim	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4809	4c064b58-77f4-4a1e-930d-08fee31ffce2	Parada do Bispo e Valdigem	\N	20	289	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4810	bcc5e617-1998-4008-a632-bc48210431f3	Penajoia	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4811	d21fb871-95a8-4636-ab17-e252abb20858	Penude	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4812	041d34d4-876a-4bd4-a669-1bf87bc6aff0	Samodães	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4813	41937da4-711b-4d2c-8f32-5bbe0f66061b	Sande	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4814	7a4f2480-cdae-44a7-8c53-acbc139859f0	Várzea de Abrunhais	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4815	b85f123f-bc07-4c8f-8352-81a13bfaa42e	Vila Nova de Souto d'El-Rei	\N	20	289	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4816	1e1c7aad-02e0-4ede-91b3-004c96d6c9eb	Lamego - Sé	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4817	2be134d2-b2b0-4b3f-9d50-d6ea8629f4b4	Lamego - Almacave	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4818	daef0be1-f3c8-4e6a-ab13-d825ad9e530d	Bigorne	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4819	9b4054b8-905c-4b1d-b350-6c0a6334d6a5	Magueija	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4820	35c3a52b-a774-4eb3-a654-ddc1246e0c78	Pretarouca	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4821	5a1b2a85-50b1-4620-abbe-27ec8060a0cd	Cepões	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4822	52a9be74-29bd-4c80-8231-ce3fec788f0a	Meijinhos	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4823	f27c0f5b-07b9-42a4-b1dd-a31b07d23450	Melcões	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4824	97b92e72-71e3-4af6-a0e9-ba31f9732e5a	Parada do Bispo	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4825	b940dc2f-81e1-4d47-8a09-63cfa37ff0d3	Valdigem	\N	20	289	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4826	64adf432-0cbc-4ec0-84d4-a103b81158be	Abrunhosa-a-Velha	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4827	8c418dad-c099-43d7-b95d-60f41e0222c1	Alcafache	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4828	a0af4fc7-9304-4231-9321-84bca038c806	Cunha Baixa	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4829	f2cd114d-2b02-4aaa-be26-0769e31454cd	Espinho	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4830	ba79fcb3-340f-4a62-8bb4-f87e1c18d876	Fornos de Maceira Dão	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4831	f7adf3ab-f870-4159-a0cb-cc1090a101b2	Freixiosa	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4832	a763e095-89bf-4575-992e-d6c6f1fffb18	Mangualde, Mesquitela e Cunha Alta	\N	20	290	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4833	14e163fe-f830-4aa8-b2ec-94e3d18791f5	Moimenta de Maceira Dão e Lobelhe do Mato	\N	20	290	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4834	c73e9f0c-b9ed-479b-8a83-674fb3ecd7a0	Quintela de Azurara	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4835	0ddddd78-ee54-4fcf-8e0c-aceacb316cc3	Santiago de Cassurrães e Póvoa de Cervães	\N	20	290	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4836	f954f9c2-1a2e-45d5-ba83-8bb926511145	Tavares - Chãs, Várzea e Travanca	\N	20	290	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4837	c7abe781-d521-4e1e-9dcc-d8722eb20222	São João da Fresta	\N	20	290	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4838	49218a82-bc42-4c2a-98f8-948ad63d4797	Chãs de Tavares	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4839	fd9d1fd6-c903-4559-b962-bde239a94c8d	Cunha Alta	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4840	7a677396-f70f-4cff-a1f6-f761a9034bb0	Moimenta de Maceira Dão	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4841	a7b2ce22-b910-4d2b-a027-f916e698f057	Lobelhe do Mato	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4842	c83e4be9-6c94-4d8f-aa41-b0c63279928a	Mesquitela	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4843	bcc83fef-5166-4bba-9688-27f0d8fab373	Mangualde	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4844	7ef28fb8-d436-4085-bb0b-8d31fad535bc	Santiago de Cassurrães	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4845	f5ccdb20-f9e4-45d4-92f0-677887b8f621	Póvoa de Cervães	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4846	ff9248b4-9c7c-433f-94e4-27735058cf14	Travanca de Tavares	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4847	5c2e1115-1d77-4623-912d-03f0e593f1bd	Várzea de Tavares	\N	20	290	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4848	945c81f9-2dd0-46a6-9544-49c3f241a32c	Alvite	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4849	5a71819e-99ef-49bd-bc01-d2930480c69e	Arcozelos	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4850	ce2ceadd-654e-4820-b9a7-a326df00cb8f	Baldos	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4851	92e8f77f-c440-4e2b-8eb2-897b4eda05f1	Cabaços	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4852	e2690447-3531-4ee5-b04b-3cac77823a50	Caria	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4853	c74af015-f459-4d2a-bd13-305b3131975e	Castelo	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4854	205bd5e8-9fdc-40a5-a30a-e64fccb998a9	Leomil	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4855	bc4f4c48-0e37-421e-b4a8-054b4c96343a	Moimenta da Beira	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4856	8845b489-2958-48c9-bd36-9c9d645c57f8	Paradinha e Nagosa	\N	20	291	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4857	c9194b09-74d8-4994-bf14-8c7e87aa0c29	Passô	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4858	d4cd57e2-52d0-469d-b439-b3b9c25e9d05	Pera Velha, Aldeia de Nacomba e Ariz	\N	20	291	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4859	ae0536a0-801b-4db0-9cfe-22f843c43001	Peva e Segões	\N	20	291	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4860	a07a790b-1f66-4995-b719-a4a3db3e7714	Rua	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4861	a8d788a1-ee24-4081-90a9-b9c8f285f8a9	Sarzedo	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4862	30c41917-a8a8-4fcd-86fe-782bd8741e98	Sever	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4863	7321ba0a-750e-449e-b92c-7eebc9537fc0	Vilar	\N	20	291	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4864	41f4ec84-40d9-4a6b-9353-6fcf7c824a36	Aldeia de Nacomba	\N	20	291	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4865	1ba1f6c0-098c-48ba-a6f5-cd0fb7fd6c66	Ariz	\N	20	291	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4866	8441ae54-16e4-4392-b300-4e4dae63a25d	Pera Velha	\N	20	291	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4867	50c3cbc0-7d3c-4561-8a03-0464609038d3	Paradinha	\N	20	291	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4868	c5d791f2-177b-4988-abe8-104594160150	Nagosa	\N	20	291	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4869	78ae7609-19b4-447a-9787-fd0f2a5e057c	Segões	\N	20	291	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4870	757a830c-e6ae-4be9-b6e2-79709b445148	Peva	\N	20	291	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4871	50ba1c6a-91c3-4487-b647-3a77159be0dd	Cercosa	\N	20	292	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4872	462fc99e-dbf0-4815-8ff6-6e554f4c3fce	Espinho	\N	20	292	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4873	99d34892-8803-407c-a348-679316fa805a	Marmeleira	\N	20	292	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4874	c8e229fc-a529-4611-a050-4c98467011df	Mortágua, Vale de Remígio, Cortegaça e Almaça	\N	20	292	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4875	ca89f106-cc55-4d5e-8f92-a565fa41ef30	Pala	\N	20	292	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4876	7d718a08-cd16-41a2-8974-6d898bc5b40d	Sobral	\N	20	292	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4877	838c08b9-bdf1-43e7-8920-6cabff1e7ed7	Trezoi	\N	20	292	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4878	be4a5489-7e9b-4805-a7fc-40d2f7154dff	Almaça	\N	20	292	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4879	05841adb-fbf5-4cdd-b7bc-275784fa1eff	Cortegaça	\N	20	292	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4880	1b36751a-afe9-4d58-a426-eeb45b4d2738	Mortágua	\N	20	292	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4881	aaa67dfa-81fd-480a-8912-1073f534fcdb	Vale de Remígio	\N	20	292	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4882	8133b129-78cb-4a9f-a5a1-9fcd87772295	Canas de Senhorim	\N	20	293	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4883	52927446-3f66-4741-90c5-3f7605180352	Carvalhal Redondo e Aguieira	\N	20	293	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4884	51a1125a-585c-43b4-a731-0b86b1367f4f	Lapa do Lobo	\N	20	293	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4885	786fe5cb-a1a8-4073-abf3-47a1cbacdd46	Nelas	\N	20	293	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4886	9b6bfd0d-e88c-4e6d-92b1-6074000cdb01	Santar e Moreira	\N	20	293	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4887	a9d2b471-01fb-4993-9260-ac91395562de	Senhorim	\N	20	293	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4888	ca6c3a43-702a-42c1-ba70-405eb27cca79	Vilar Seco	\N	20	293	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4889	788d07ae-014c-4d7e-9eb6-b286e22f4aca	Carvalhal Redondo	\N	20	293	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4890	195b2e04-52d9-4d58-8e7e-e2a3365b837f	Aguieira	\N	20	293	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4891	8121f55e-1a92-4ba2-b8d0-9660a1e68ac4	Santar	\N	20	293	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4892	c019f3e1-892f-4f01-84b7-dd37f99e8830	Moreira	\N	20	293	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4893	23afa949-2b0e-4dc2-a57d-a2ee4e5f1804	Arca e Varzielas	\N	20	294	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4894	ec19e189-1de0-48c8-bbb9-5835618d791c	Arcozel das Maias	\N	20	294	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4895	c5a23cd0-7d3e-4096-9bf1-c95ed5019571	Destriz e Reigoso	\N	20	294	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4896	c760aea3-061e-4add-9daa-ddf60eb98ece	Oliveira de Frades, Souto de Lafões e Sejães	\N	20	294	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4897	7246fc95-05dd-499d-950e-12ed0ccf58e3	Pinheiro	\N	20	294	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4898	33fa890b-c8a1-4b2b-818e-084ac20d877b	Ribeiradio	\N	20	294	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4899	5f60a7b5-5cf6-49f7-8740-ceb77b87c495	São João da Serra	\N	20	294	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4900	148812a6-203d-4348-92fe-176c94ca7d87	São Vicente de Lafões	\N	20	294	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4901	adc26523-3c86-46e3-9fb3-8c301d3079a1	Varzielas	\N	20	294	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4902	e3a72831-3e6f-458e-b5f4-b476dadb30f9	Arca	\N	20	294	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4903	d3250ce3-a114-41e2-a6cb-ff75710f1738	Destriz	\N	20	294	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4904	c9c368de-25a4-442c-abf4-ecec5d5b8beb	Reigoso	\N	20	294	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4905	3191be38-0108-4cf8-a9a0-11c4bca3b23a	Sejães	\N	20	294	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4906	3f152eab-e6d7-4821-9bc1-cd7d2db0f6eb	Oliveira de Frades	\N	20	294	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4907	844a0e59-dd86-47ac-b322-4be9e079b0e5	Souto de Lafões	\N	20	294	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4908	367638cc-6ea5-4870-898b-38c1756fd4dc	Antas e Matela	\N	20	295	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4909	d5781503-9ad3-4450-920d-c5b08ea81e95	Castelo de Penalva	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4910	c7ca7475-6c60-40a3-a042-6347534dce31	Esmolfe	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4911	66279878-4f60-4bc3-900b-50d6db0316ea	Germil	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4912	0cb588ec-f4b0-407c-995c-c84e2f8f35cb	Ínsua	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4913	0c706f28-ad86-4601-a12c-9aa551494ba2	Lusinde	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4914	2fc97297-aaa9-4365-94b8-2fe36e6b66e0	Pindo	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4915	03135564-a6f7-4729-9283-1f75a574c21e	Real	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4916	fd0b1317-b85b-4b3e-9dd6-5ccee4fac037	Sezures	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4917	78dec4cd-f6fb-4a2f-88a8-e47cb89c8cdd	Trancozelos	\N	20	295	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4918	ef8a67e0-cf85-4c4c-a2c0-921f47d4870b	Vila Cova do Covelo/Mareco	\N	20	295	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4919	53736361-773f-4318-8192-bf3db4410ac0	Antas	\N	20	295	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4920	cf6c6bb6-7009-4cbb-9dd9-5a881c5e04db	Matela	\N	20	295	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4921	c99b37d5-42d3-4ad4-b203-515b5cea39ed	Mareco	\N	20	295	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4922	e41d9e8c-1f07-486b-91ae-2a8075a2816b	Vila Cova do Covelo	\N	20	295	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4923	babecc03-61df-42d6-9368-418e4b36f181	Antas e Ourozinho	\N	20	296	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4924	518040f2-7c2d-4eee-9da8-f42b8f0b32c4	Beselga	\N	20	296	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4925	ca23f2f0-3ad3-4f00-bd05-cd69c84d36c9	Castainço	\N	20	296	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4926	52033d2a-3024-41af-ab3d-9862212b0b30	Penedono e Granja	\N	20	296	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4927	f826c9e7-fb56-49f0-a060-e99d8b6b5707	Penela da Beira	\N	20	296	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4928	9e56adc9-c0b6-484b-a0ee-f9b8d6ec5f97	Póvoa de Penela	\N	20	296	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4929	d6972e0a-2215-490c-8dd7-50703b931098	Souto	\N	20	296	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4930	4c0733fe-d54e-40cd-98e5-14c6019dfe75	Antas	\N	20	296	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4931	0bd50aba-6553-48af-860f-9bbf76e48f67	Ourozinho	\N	20	296	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4932	49572b87-bfc7-40a3-9944-65cffa67cda8	Penedono	\N	20	296	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4933	2f5bbf0e-6b12-48c0-94a6-03d8c370877b	Granja	\N	20	296	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4934	3575cf6f-6cb4-44bd-af45-8942cfa86c5d	Anreade e São Romão de Aregos	\N	20	297	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4935	e5ac52ae-ff8a-4348-947d-7df8ba83a5b4	Barrô	\N	20	297	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4936	5f65d3ab-ce3b-4740-a29c-22f75c31434d	Cárquere	\N	20	297	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4937	838f866d-af2c-4362-b387-3d8af9a53eac	Felgueiras e Feirão	\N	20	297	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4938	44f963c6-8045-4c6c-a95a-8a0f13c33f9f	Freigil e Miomães	\N	20	297	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4939	c5604502-2f77-4f10-b745-ae7e06cc3f53	Ovadas e Panchorra	\N	20	297	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4940	75fc9417-5a17-4e81-a4f5-f32f9e125b5c	Paus	\N	20	297	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4941	d64073c1-0d96-41e1-8cb2-328d31978cea	Resende	\N	20	297	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4942	db2642f2-2a07-45d1-b106-1e26c91a2cd2	São Cipriano	\N	20	297	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4943	634a3af4-f332-4eac-b68b-dfc17e1c40be	São João de Fontoura	\N	20	297	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4944	2b185be1-0e3f-4a89-b2b3-0a2a2c54810e	São Martinho de Mouros	\N	20	297	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4945	f792f279-65c8-4918-a08b-b8d3bc9fff6b	Anreade	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4946	da0a25c9-82c7-4106-9b0d-2b4b9c43761b	São Romão de Aregos	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4947	4f83a33c-29cd-4b7a-8b9f-2304533ab9aa	Felgueiras	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4948	283cfb1b-2426-4357-b06d-1b77fde28420	Feirão	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4949	dde318ec-fcb6-4923-b6fe-3c900e41b304	Freigil	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4950	448acb6b-311b-461f-afc6-37a91cb81dd7	Miomães	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4951	6a412d87-b427-431d-b18f-ca6908fb2bdd	Ovadas	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4952	d54fadc0-c41d-48ab-8843-1d2af0f00682	Panchorra	\N	20	297	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4953	69903a58-21dc-468e-abbd-8aee478f8bf4	Ovoa e Vimieiro	\N	20	298	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4954	bd7806fd-bc28-4ac9-9af1-c5797b8f2b1e	Pinheiro de Azere	\N	20	298	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4955	cbe90933-7689-44e5-98d2-3dae40538a9e	Santa Comba Dão e Couto do Mosteiro	\N	20	298	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4956	0191f050-d815-40dc-9a6d-e1a375c2e93e	São Joaninho	\N	20	298	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4957	847aa79b-c438-4876-8c8d-a939b26505e5	São João de Areias	\N	20	298	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4958	1086a43b-b79e-430d-99c0-0e79241e9f70	Treixedo e Nagozela	\N	20	298	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4959	d4cc5e79-b6ec-4049-9c0e-6c1e695f1523	Ovoa	\N	20	298	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4960	d718ab5a-c821-4a51-b4d7-fce76236a430	Vimieiro	\N	20	298	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4961	9ea8e40b-fc97-416f-9abf-67344bde543c	Santa Comba Dão	\N	20	298	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4962	eea5a64f-f827-4eb7-84ac-f18e57199ecd	Couto do Mosteiro	\N	20	298	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4963	17badaee-5d66-406c-b639-fa59fca514fe	Treixedo	\N	20	298	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4964	a20f87ec-f1d6-4121-ab0d-7933969474d1	Nagozela	\N	20	298	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4965	146cd75a-ec0b-40e9-9ccf-733c252da1d8	Castanheiro do Sul	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4966	bf289ae5-a869-48ba-a3b0-051ecdebade5	Ervedosa do Douro	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4967	b6ffe20b-e8da-4a7b-aa35-9139b58e9eeb	Nagozelo do Douro	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4968	f8a84067-49f2-4dc3-bb9f-5cf60c1bd040	Paredes da Beira	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4969	254b67ae-d18e-4dc7-acf1-5da2516e3c4c	Riodades	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4970	c6c1d112-e9d2-4744-99c4-162d24ec1838	São João da Pesqueira e Várzea de Trevões	\N	20	299	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4971	12e03b46-95bd-44d7-aa0a-35601ea398ec	Soutelo do Douro	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4972	a7bcc366-7ff3-4c53-8e63-db39d8d90781	Trevões e Espinhosa	\N	20	299	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4973	40627253-a006-4dc7-a30a-253d60c02b16	Vale de Figueira	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4974	9acf52ac-7b78-48eb-a472-6d9b3d00a9be	Valongo dos Azeites	\N	20	299	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4975	1df3ddfd-e5ad-41f5-84bf-5feff3aca287	Vilarouco e Pereiros	\N	20	299	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4976	90db735c-bf18-4056-a2ea-a072725502f0	Espinhosa	\N	20	299	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4977	26e5729c-3523-4d2d-85c1-d1687b020cd3	Trevões	\N	20	299	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4978	7be32502-439c-40b3-a6e4-aa17642210b0	Pereiros	\N	20	299	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4979	b145eb90-b81a-4bbb-b7c0-ec5e788834a8	Vilarouco	\N	20	299	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4980	94167167-c89b-4652-8fc2-d1f4031bbead	São João da Pesqueira	\N	20	299	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4981	b516cf84-e4b6-4645-8910-be44d828d9e0	Várzea de Trevões	\N	20	299	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4982	c2ed4f3e-c865-4b28-b5e7-4215e4818291	Bordonhos	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4983	7a890b4b-8f14-499f-b99e-9781bf049d1f	Carvalhais e Candal	\N	20	300	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4984	b85554bb-6bdc-40b4-95fb-2b3061537e0d	Figueiredo de Alva	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4985	6b95e99a-32f5-4eab-a734-6528b5e01b28	Manhouce	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4986	d96a57c8-95f1-490a-a6dd-e0b656ba36ba	Pindelo dos Milagres	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4987	757f54b6-bd10-417d-b334-b904f4406945	Pinho	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4988	187e84ee-1aad-4844-bb05-a5dd41c63d21	Santa Cruz da Trapa e São Cristóvão de Lafões	\N	20	300	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4989	d996d9d8-c0ce-4fee-9ba3-fce3ec91616a	São Félix	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4990	e6ac2401-d313-48cf-9415-4d599f0231c2	São Martinho das Moitas e Covas do Rio	\N	20	300	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4991	021b1bf8-ca5d-4abf-808e-8effeed70737	São Pedro do Sul, Várzea e Baiões	\N	20	300	1	2025-03-23 11:47:11	2025-03-23 11:47:11
4992	f55fbb53-e160-4729-9f1c-80e79bfde84f	Serrazes	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4993	faaf9da0-2b93-45b5-8cb3-fa541674b6cd	Sul	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4994	144943c9-3432-44e7-bb1c-f3668cc5e3c1	Valadares	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4995	9048caeb-7cc0-4bdc-bca4-6c4960aab603	Vila Maior	\N	20	300	2	2025-03-23 11:47:11	2025-03-23 11:47:11
4996	2c31ebfb-7049-494b-bdb2-a8f2b19cd713	Baiões	\N	20	300	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4997	68c47d43-3aac-46f6-aba1-d52888efbf67	São Pedro do Sul	\N	20	300	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4998	c31990de-6ee4-403d-b9f9-61b29d43c19f	Várzea	\N	20	300	3	2025-03-23 11:47:11	2025-03-23 11:47:11
4999	d3ed0752-644d-4114-9519-b4cc8ad1e442	Carvalhais	\N	20	300	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5000	a558a4ab-1e3b-4e4d-ba92-1104553dba2f	Covas do Rio	\N	20	300	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5001	3a92090f-84c3-4334-bc3e-6dc9faebb062	São Cristóvão de Lafões	\N	20	300	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5002	a3185c3c-8407-4f0d-a104-15b2363bb632	Santa Cruz da Trapa	\N	20	300	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5003	9d80233a-c6fd-43a8-8b71-f6ac6963e25c	São Martinho das Moitas	\N	20	300	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5004	7949296e-d232-4985-81d2-6c7efe074de4	Águas Boas e Forles	\N	20	301	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5005	9fae212c-ad12-4afc-a207-e53685c3e482	Avelal	\N	20	301	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5006	3d85187d-0f15-4f93-8402-b2b5b0eadddd	Ferreira de Aves	\N	20	301	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5007	f1b1f1ab-5092-4714-8bb9-828d7210c213	Mioma	\N	20	301	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5008	ada6bdcf-96c8-4e35-a0ee-066e15293ba2	Rio de Moinhos	\N	20	301	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5009	df7dc901-7f36-48d4-af3b-2baabadf4ca9	Romãs, Decermilo e Vila Longa	\N	20	301	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5010	1bd5fbde-6129-4f79-8708-09e487fbbf73	São Miguel de Vila Boa	\N	20	301	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5011	f9a71f6b-6455-4d77-b570-edb03ef461ff	Sátão	\N	20	301	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5012	c7b7e5bf-0b6c-48fd-b31d-6d474ec103e0	Silvã de Cima	\N	20	301	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5013	2f9eb3de-00a9-403f-8d04-c6b6bfa2df97	Águas Boas	\N	20	301	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5014	21bf1fee-0703-4b94-b21e-d698dbdc9e83	Forles	\N	20	301	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5015	406c1a48-1cf8-4060-a40b-91bb63d209ac	Decermilo	\N	20	301	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5016	470a6eb3-d108-4523-85a4-6bc6f5fcab4a	Romãs	\N	20	301	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5017	abe53121-ce6c-47e0-9052-dac64d4c59e9	Vila Longa	\N	20	301	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5018	cbf95632-9e1e-4031-9a39-6e52d1c961e4	Arnas	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5019	fd393df9-331b-45ed-8ff7-68cd4681b740	Carregal	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5020	32f4638b-00b2-468a-a373-bd502765205f	Chosendo	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5021	f0f5253d-2f8b-4941-99b0-1fe6b07fe9d4	Cunha	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5022	2da7ec36-a420-4ebf-ad48-f4034c3625c6	Faia	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5023	2f0d8c56-b678-42ef-b752-d2f360746e8f	Ferreirim e Macieira	\N	20	302	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5024	3e703391-fede-4b4b-a8da-62697716b344	Fonte Arcada e Escurquela	\N	20	302	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5025	1312cb01-f954-4657-b9dd-a41bf8b0b1d2	Granjal	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5026	f5466d86-1caa-4f7f-af41-e56042ac353c	Lamosa	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5027	ed0fc0f4-0052-4be9-826e-04bd7a0f3cb1	Penso e Freixinho	\N	20	302	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5028	37f894ad-d259-43d9-8534-21c476757a63	Quintela	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5029	e7f1c29b-3e04-44ad-9015-620b55e3b93f	Sernancelhe e Sarzeda	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5030	dce6e397-4139-48e9-868c-8d6439d432fe	Vila da Ponte	\N	20	302	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5031	83c220f6-e422-44a8-8b1e-783acb11d8ae	Escurquela	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5032	e53d7419-231f-4c54-b48a-37ac7f1ede32	Fonte Arcada	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5033	ca893529-eb4d-4607-bb55-862d0296006b	Ferreirim	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5034	ca24f3e7-c293-4b95-8e39-1788947848aa	Macieira	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5035	93b3704c-3fb5-4221-aff1-28857bfcde86	Penso	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5036	0c624f09-4e21-4c3e-992c-a43b09b9a8a0	Freixinho	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5037	a919fdda-737d-47fa-97f3-d735200a64d1	Sernancelhe	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5038	cba70bf7-bee7-4201-ba2e-6eb325d638a2	Sarzeda	\N	20	302	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5039	dc591ccc-478e-47f9-9e73-eb848d86e383	Adorigo	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5040	6b5e244a-633f-401a-8a21-373fc84eb92e	Arcos	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5041	452021be-7ac8-443c-b875-43d91c8c3a94	Barcos e Santa Leocádia	\N	20	303	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5042	11183357-d5d0-4e4f-9813-c891dfac2474	Chavães	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5043	f6de46b3-4140-4bfc-889d-239e3b0fb529	Desejosa	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5044	854294b4-a23f-460d-b742-8a6dcd9f3eea	Granja do Tedo	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5045	77e9aacf-74ff-49d6-9b2c-39c356bbe238	Longa	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5046	ce6421ee-03d3-430d-a4f9-e4c3d47f2867	Paradela e Granjinha	\N	20	303	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5047	c27c2e19-5c4e-4a11-bda9-33c1d5abd715	Pinheiros e Vale de Figueira	\N	20	303	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5048	e6da9473-fab1-493b-a273-490885c992a4	Sendim	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5049	e44360bd-01ab-49b4-b0d7-24d31ace6b0b	Tabuaço	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5050	341feee0-79b8-42b2-b525-08a4c9ee47ac	Távora e Pereiro	\N	20	303	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5051	342eda40-8fbd-41c6-89fa-215deea3b257	Valença do Douro	\N	20	303	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5052	52004780-c121-4658-9ce2-0c0ae22c2430	Barcos	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5053	2baa07c2-a192-49bc-a0ef-ad99567f3cbc	Santa Leocádia	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5054	3c1e88a9-5294-4051-a6b8-3ce2304fb1cc	Granjinha	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5055	94f2498c-19c6-48fd-808b-93e5b671affa	Paradela	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5056	295aaef5-6cad-4a28-ae8b-037ca15fd077	Távora	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5057	c18a59cf-947f-487e-9c63-fcf78acc29f4	Pereiro	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5058	cd455c0f-1671-482c-a94b-1197a10d3a8b	Pinheiros	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5059	347e2ff6-7f65-459e-b5ce-f12df93dd97c	Vale de Figueira	\N	20	303	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5060	eab6b3e4-6491-4820-879b-8b5548cdaabe	Gouviães e Ucanha	\N	20	304	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5061	6df6b8c0-4a33-472f-bcda-052a804a688a	Granja Nova e Vila Chã da Beira	\N	20	304	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5062	6fc176c0-6cca-4cdf-834d-c1943f65f590	Mondim da Beira	\N	20	304	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5063	78a0a0a8-58fc-407a-a775-7edbd0d5f1d3	Salzedas	\N	20	304	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5064	19d2084e-9651-49b0-a0ad-4b12ddb0433a	São João de Tarouca	\N	20	304	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5065	f7cef0f9-6c8d-4873-aa6e-7d8a82b2f944	Tarouca e Dálvares	\N	20	304	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5066	44ade08c-844c-4ead-ae34-4262a715b9f6	Várzea da Serra	\N	20	304	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5067	db386c95-11eb-49c9-929f-67ae06d77e0d	Dálvares	\N	20	304	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5068	557b570d-864e-447f-bd6b-20e5ef4cb6c0	Tarouca	\N	20	304	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5069	86dd62fc-3b3a-4a81-b298-b6e56c2dcd57	Gouviães	\N	20	304	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5070	9d256b9d-d7d9-4db7-bdc6-cb975efccfa7	Ucanha	\N	20	304	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5071	3fa5dfbe-6d9f-400a-aa84-295195bf064f	Granja Nova	\N	20	304	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5072	2870d413-909d-4877-b4aa-fdde494d39e3	Vila Chã da Beira	\N	20	304	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5073	6fb52711-a52e-42de-a144-7ca870058bfe	Barreiro de Besteiros e Tourigo	\N	20	305	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5074	94b11939-7ad5-493f-8175-2e2c951dfa4e	Campo de Besteiros	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5075	32ee7733-80be-43d9-86cd-ccec67cfca0a	Canas de Santa Maria	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5076	4ee9c6dc-183a-414b-b82a-bca0b598c193	Caparrosa e Silvares	\N	20	305	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5077	90758aa8-0711-496e-9e1d-f7632a541eef	Castelões	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5078	75f7e166-0791-4b12-be19-fc08f0643777	Dardavaz	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5079	7754269d-5cc4-4a08-a06d-02a18d70783e	Ferreirós do Dão	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5080	48da1bf1-a137-4789-bde5-09eb2fa48ccf	Guardão	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5081	3c2e4900-7e54-486b-87f5-ec1091838428	Lajeosa do Dão	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5082	a08532d3-04e9-472c-864c-5248c8545740	Lobão da Beira	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5083	f3531948-9ea8-4ab5-9b2d-99a24210584e	Molelos	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5084	8237160d-5b99-49f2-b3ae-c8ce30fcf5a0	Mouraz e Vila Nova de Rainha	\N	20	305	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5085	ae7d0543-e603-4d41-b177-d025954a9db5	Parada de Gonta	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5086	d3347a27-046e-400d-b914-945081714052	Santiago de Besteiros	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5087	d21ac56a-6fd7-4fb4-af85-6de9256fd65d	São João do Monte e Mosteirinho	\N	20	305	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5088	ffeecb5c-5cf0-4c19-a8da-e16f9fa83add	São Miguel do Outeiro e Sabugosa	\N	20	305	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5089	426a6562-58ec-4020-b77e-1a5e2273adb5	Tonda	\N	20	305	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5090	25057a22-1f14-41bf-9897-5c12e90f141c	Tondela e Nandufe	\N	20	305	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5091	6f31564f-b719-4f48-9dd2-fe2959b0f717	Vilar de Besteiros e Mosteiro de Fráguas	\N	20	305	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5092	0e80b168-d33a-41ea-97f4-c84a4937d9ff	Barreiro de Besteiros	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5093	498fb072-437a-45fc-84b6-011e6134289d	Caparrosa	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5094	15689069-aebc-4e30-87f4-523f9ebeed5d	Mosteirinho	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5095	73341c8b-4358-4010-a11b-10b1283ed336	Mosteiro de Fráguas	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5096	224a130d-9563-414f-9c89-dc3e24a7a728	Mouraz	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5097	7b7a8ab8-8f3e-4c19-ad4c-d52e61a01a51	Nandufe	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5098	1536f07d-6126-40f8-8a3e-a970da9afb7c	Sabugosa	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5099	77a3878d-aeef-4392-bd91-c8da8edbcac1	São João do Monte	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5100	9036841f-ef9f-4538-8a6c-96ade1647408	São Miguel do Outeiro	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5101	fae0bac4-f561-4c42-9af9-ecb38fde8957	Silvares	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5102	92a2957d-731a-427c-b116-df1df1dd49a1	Tondela	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5103	012e9bad-0c5e-4a76-84b0-48133f657305	Vila Nova da Rainha	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5104	2da0b190-d26a-4eae-9781-7a1e7c3480ae	Vilar de Besteiros	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5105	0754fd31-bc49-42ab-a35f-f14b8c00c6dd	Tourigo	\N	20	305	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5106	f1d800aa-e5ad-4789-91fd-d8780e12c644	Pendilhe	\N	20	306	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5107	a1e69402-2e23-4c23-8626-e1c9782db680	Queiriga	\N	20	306	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5108	39d0b6c7-8bfc-40e8-9d31-6728ad90bab1	Touro	\N	20	306	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5109	6f10d533-d354-44ac-ac1f-5b12233065d0	Vila Cova à Coelheira	\N	20	306	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5110	7f368c05-8151-45ef-9800-edcaa70e63a0	Vila Nova de Paiva, Alhais e Fráguas	\N	20	306	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5111	5abfdd1c-98d4-4266-8d1b-4fce0b91ae3d	Alhais	\N	20	306	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5112	76b1e996-3746-4db7-a5b4-bac6a05d2c2e	Fráguas	\N	20	306	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5113	852d0e52-8dfb-49db-b714-df62b171d1e1	Vila Nova de Paiva	\N	20	306	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5114	9c3c3859-e220-48b9-96ea-34805f721673	Abreveses	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5115	1ace56e8-b14b-438c-ae0f-6b4b19729a59	Barreiros e Cepões	\N	20	307	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5116	b3ba550e-15e6-4ff9-b3e2-97ce8a10657c	Boa Aldeia, Farminhão e Torredeita	\N	20	307	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5117	e1acebf0-9aba-4c35-a1d5-7da146ba36ea	Bodiosa	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5118	94528302-e1c3-41ee-a329-1f5724c9d103	Calde	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5119	a31da0fc-67db-48d6-999c-845c21197b6a	Campo	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5120	ec79afe9-484a-43ce-bb19-102169ca75ac	Cavernães	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5121	0bf50da7-412d-48e3-be57-bc8ad06f8a69	Cota	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5122	cc92e894-bf48-417b-919f-1a3d4f71028d	Coutos de Viseu	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5123	4abe4eb4-f257-4d51-b022-f9c2b18320fb	Faíl e Vila Chã de Sá	\N	20	307	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5124	8489f662-19f9-4720-a519-679cb39c9ea3	Fragosela	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5125	10aa233c-5b90-4bff-8848-1aaa59fc20ba	Lordosa	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5126	fea975e9-ff32-4af9-b0e4-e14208ca4594	Mundão	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5127	36b9727b-3a15-47ed-9967-7c073a99d5b0	Orgens	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5128	e05df4c5-df9a-4117-909f-5824cd5bcff7	Povolide	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5129	795be581-7efa-47ce-91d4-1b7051083a79	Ranhados	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5130	384a78d9-3afd-4eaa-8649-8f834f7f1e5f	Repeses e São Salvador	\N	20	307	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5131	ff68ed99-f0f6-42b5-9d0c-777cc253d9e2	Ribafeita	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5132	a2857fb6-1518-410c-a85c-e976497c0c05	Rio de Loba	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5133	6d91a393-23b9-4c7e-bd88-8cf2d4bbbe56	Santos Evos	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5134	ea7d0cc4-2207-4a76-9ccf-0b1465d03f5a	São Cipriano e Vil de Souto	\N	20	307	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5135	b7b41383-2bc0-4cc2-8258-f5ae87d2779b	São João de Lourosa	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5136	3bd8b02e-36cf-4677-983b-2e684840cf50	São Pedro de France	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5137	3ab510aa-ccca-47d8-a231-483d2c9fc791	Silgueiros	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5138	df8a0dd1-407a-4457-9c4f-add6853bc817	Viseu	\N	20	307	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5139	b4d63551-eeaf-490c-ad2a-0de361280e9d	Barreiros	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5140	1294f8de-844a-4d32-ba18-142bebeca122	Cepões	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5141	2df4101b-c9f0-4b52-9ec0-f3b96b05a276	Boa Aldeia	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5142	6142b0e6-b9e3-4ecb-8283-0ae95c5c6a7d	Farminhão	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5143	80c65d41-b263-4d1a-b05b-336398b98edb	Torredeita	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5144	59811048-96c4-4fb6-a71c-43ca14ad3a47	Viseu - Coração de Jesus	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5145	b5688ae8-850e-4343-914c-09cbebefa982	Viseu - Santa Maria de Viseu	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5146	dfdb7239-0441-4822-b5e4-199a72f51a99	Viseu - São José	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5147	b38ac085-3aec-459c-85f1-ac3d947838eb	Couto de Baixo	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5148	85bb9c5f-1379-49b4-97cc-4a39653b2706	Couto de Cima	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5149	78fd1eb1-9f62-46d0-9139-0b7655a61172	Faíl	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5150	e895a011-cdd6-453e-be0a-3a501e1f9e7b	Vila Chã de Sá	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5151	1a57d082-c724-4e93-bf5d-cdaeb3aa80ef	São Cipriano	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5152	d12f2050-ee91-4eb4-a1fa-1a676ea1a6cd	Vil de Souto	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5153	9d39750c-55e2-4488-aba6-73ec5febb01e	Repeses	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5154	0442a181-137f-49fc-b0eb-bd925daabe0e	São Salvador	\N	20	307	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5155	0f33eb26-61e5-405a-9f80-14e0bd95a0c8	Alcofra	\N	20	308	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5156	3869b3d0-cb74-42b2-b081-5ca41e58d451	Cambra e Carvalhal de Vermilhas	\N	20	308	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5157	9f17105e-7770-4441-b7f9-db13c37c156e	Campia	\N	20	308	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5158	294d81ad-3438-4fb3-b3fb-8f063e7d832a	Fataunços e Figueiredo das Donas	\N	20	308	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5159	93b790ac-efc5-4260-8ceb-f868ecabefe1	Fornelo do Monte	\N	20	308	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5160	888086ef-666f-4735-91b5-ab4e48246a14	Queirã	\N	20	308	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5161	bd5a5704-ccd7-4e05-a5b5-ed7f83f12526	São Miguel do Mato	\N	20	308	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5162	6965b50b-b322-498e-a7a8-eb8d54bfb4a2	Ventosa	\N	20	308	2	2025-03-23 11:47:11	2025-03-23 11:47:11
5163	c16a3c74-0f71-44d4-86ba-fb52e2c2dba5	Vouzela e Paços de Vilharigues	\N	20	308	1	2025-03-23 11:47:11	2025-03-23 11:47:11
5164	aba73703-91ae-486c-a2bd-7e6cd93ed849	Cambra	\N	20	308	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5165	bbfa86c4-47ea-4cf2-8c89-1bf2794e7105	Carvalhal de Vermilhas	\N	20	308	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5166	50248392-6ae8-4144-8ece-c10a9c0f5e3e	Fataunços	\N	20	308	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5167	16b92426-9ac2-4d39-aa1f-255bbb48cc55	Figueiredo das Donas	\N	20	308	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5168	69c35cc2-5931-400e-a76f-0b7b8c327945	Paços de Vilharigues	\N	20	308	3	2025-03-23 11:47:11	2025-03-23 11:47:11
5169	fd6ed9f1-c984-4203-a4cc-56db1a77578e	Vouzela	\N	20	308	3	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: governo_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.governo_anexos (id, uuid, nome, governo_id, anexo_tipo_id, anexo, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: governos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.governos (id, uuid, sigla, nome, republica_id, legislatura_id, formacao, dissolucao, sinopse, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_anexos (id, uuid, nome, instituicao_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_cargo_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_cargo_anexos (id, uuid, nome, instituicao_cargo_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_cargo_leis; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_cargo_leis (id, instituicao_cargo_id, lei_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_cargos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_cargos (id, uuid, cargo, tipo, instituicao_id, cargo_responde_id, sinopse, params, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_com_tipos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_com_tipos (id, instituicao_id, instituicao_tipo_id, created_at, updated_at) FROM stdin;
1	1	26	\N	\N
2	1	2	\N	\N
3	2	26	\N	\N
4	2	2	\N	\N
5	3	26	\N	\N
6	3	2	\N	\N
7	4	26	\N	\N
8	4	2	\N	\N
9	5	26	\N	\N
10	5	2	\N	\N
11	6	26	\N	\N
12	6	2	\N	\N
13	7	26	\N	\N
14	7	2	\N	\N
15	8	26	\N	\N
16	8	2	\N	\N
17	9	26	\N	\N
18	9	2	\N	\N
19	10	26	\N	\N
20	10	2	\N	\N
21	11	26	\N	\N
22	11	2	\N	\N
23	12	26	\N	\N
24	12	2	\N	\N
25	13	26	\N	\N
26	13	2	\N	\N
27	14	26	\N	\N
28	14	2	\N	\N
29	15	26	\N	\N
30	15	2	\N	\N
31	16	26	\N	\N
32	16	2	\N	\N
33	17	26	\N	\N
34	17	2	\N	\N
35	18	26	\N	\N
36	18	2	\N	\N
37	19	26	\N	\N
38	19	2	\N	\N
39	20	26	\N	\N
40	20	2	\N	\N
41	21	26	\N	\N
42	21	2	\N	\N
43	22	26	\N	\N
44	22	2	\N	\N
45	23	26	\N	\N
46	23	2	\N	\N
47	24	26	\N	\N
48	24	2	\N	\N
49	25	26	\N	\N
50	25	2	\N	\N
51	26	26	\N	\N
52	26	2	\N	\N
53	27	26	\N	\N
54	27	2	\N	\N
55	28	26	\N	\N
56	28	2	\N	\N
57	29	26	\N	\N
58	29	2	\N	\N
59	30	26	\N	\N
60	30	2	\N	\N
61	31	26	\N	\N
62	31	2	\N	\N
63	32	26	\N	\N
64	32	2	\N	\N
65	33	26	\N	\N
66	33	2	\N	\N
67	34	26	\N	\N
68	34	2	\N	\N
69	35	26	\N	\N
70	35	2	\N	\N
71	36	26	\N	\N
72	36	2	\N	\N
73	37	26	\N	\N
74	37	2	\N	\N
75	38	26	\N	\N
76	38	2	\N	\N
77	39	26	\N	\N
78	39	2	\N	\N
79	40	26	\N	\N
80	40	2	\N	\N
81	41	26	\N	\N
82	41	2	\N	\N
83	42	26	\N	\N
84	42	2	\N	\N
85	43	26	\N	\N
86	43	2	\N	\N
87	44	26	\N	\N
88	44	2	\N	\N
89	45	26	\N	\N
90	45	2	\N	\N
91	46	26	\N	\N
92	46	2	\N	\N
93	47	26	\N	\N
94	47	2	\N	\N
95	48	26	\N	\N
96	48	2	\N	\N
97	49	26	\N	\N
98	49	2	\N	\N
99	50	26	\N	\N
100	50	2	\N	\N
101	51	26	\N	\N
102	51	2	\N	\N
103	52	26	\N	\N
104	52	2	\N	\N
105	53	26	\N	\N
106	53	2	\N	\N
107	54	26	\N	\N
108	54	2	\N	\N
109	55	26	\N	\N
110	55	2	\N	\N
111	56	26	\N	\N
112	56	2	\N	\N
113	57	26	\N	\N
114	57	2	\N	\N
\.


--
-- Data for Name: instituicao_contactos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_contactos (id, instituicao_id, contacto_tipo_id, contacto, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_dados; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_dados (id, nif, certidao_permanente, instituicao_id, sinopse, fundacao, dissolucao, created_at, updated_at) FROM stdin;
1	\N	\N	1	\N	1822-01-01	1910-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
2	\N	\N	2	\N	1910-01-01	1926-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
3	\N	\N	3	\N	1933-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
4	\N	\N	4	\N	1974-01-01	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
5	\N	\N	5	\N	1801-01-01	1822-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
6	\N	\N	6	\N	1821-01-01	1822-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
7	\N	\N	7	\N	1822-01-01	1910-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
8	\N	\N	8	\N	1822-01-01	1910-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
11	\N	\N	11	\N	1822-01-01	1910-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
12	\N	\N	12	\N	1822-01-01	1910-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
13	\N	\N	13	\N	1852-01-01	1910-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
14	\N	\N	14	\N	1890-01-01	1898-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
16	\N	\N	16	\N	1910-01-01	1911-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
22	\N	\N	22	\N	1910-01-01	1917-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
23	\N	\N	23	\N	1917-01-01	1919-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
24	\N	\N	24	\N	1919-01-01	1932-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
26	\N	\N	26	\N	1918-01-01	1919-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
27	\N	\N	27	\N	1932-01-01	1933-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
30	\N	\N	30	\N	1916-01-01	1917-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
31	\N	\N	31	\N	1917-01-01	1925-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
32	\N	\N	32	\N	1933-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
15	\N	\N	15	\N	1933-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
17	\N	\N	17	\N	1933-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
18	\N	\N	18	\N	1933-01-01	1950-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
33	\N	\N	33	\N	1950-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
9	\N	\N	9	\N	1933-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
20	\N	\N	20	\N	1933-01-01	1934-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
19	\N	\N	19	\N	1934-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
21	\N	\N	21	\N	1933-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
10	\N	\N	10	\N	1933-01-01	1950-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
34	\N	\N	34	\N	1950-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
35	\N	\N	35	\N	1950-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
36	\N	\N	36	\N	1933-01-01	1940-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
25	\N	\N	25	\N	1933-01-01	1940-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
37	\N	\N	37	\N	1940-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
28	\N	\N	28	\N	1933-01-01	1946-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
38	\N	\N	38	\N	1946-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
39	\N	\N	39	\N	1946-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
29	\N	\N	29	\N	1933-01-01	1936-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
40	\N	\N	40	\N	1936-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
41	\N	\N	41	\N	1950-01-01	1973-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
42	\N	\N	42	\N	1973-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
43	\N	\N	43	\N	1961-01-01	1973-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
44	\N	\N	44	\N	1973-01-01	1974-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
45	\N	\N	45	\N	1978-01-01	1979-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
46	\N	\N	46	\N	2013-01-01	2015-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
47	\N	\N	47	\N	2015-01-01	2024-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
48	\N	\N	48	\N	1979-01-01	1980-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
49	\N	\N	49	\N	1981-01-01	1982-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
50	\N	\N	50	\N	1985-01-01	1987-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
51	\N	\N	51	\N	1987-01-01	1991-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
52	\N	\N	52	\N	2013-01-01	2015-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
53	\N	\N	53	\N	1979-01-01	1980-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
54	\N	\N	54	\N	1979-01-01	1980-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
55	\N	\N	55	\N	1999-01-01	2000-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
56	\N	\N	56	\N	1976-01-01	2006-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
57	\N	\N	57	\N	1976-01-01	2006-12-31	2025-03-23 11:58:01	2025-03-23 11:58:01
\.


--
-- Data for Name: instituicao_entidade_juridicas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_entidade_juridicas (id, entidade_juridica_id, instituicao_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_governos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_governos (id, uuid, instituicao_id, governo_id, sinopse, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_legislatura_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_legislatura_anexos (uuid, nome, instituicao_legislatura_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_legislaturas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_legislaturas (id, uuid, nome, instituicao_id, legislatura_id, sinopse, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_leis; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_leis (id, instituicao_id, lei_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_moradas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_moradas (id, instituicao_id, morada, codigo_postal, localidade, concelho_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_nacionalidades; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_nacionalidades (id, instituicao_id, nacionalidade_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_presidenciais; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_presidenciais (id, uuid, nome, instituicao_id, presidencial_id, sinopse, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_presidencial_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_presidencial_anexos (uuid, nome, instituicao_presidencial_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_relacoes; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_relacoes (id, instituicao_id, com_instituicao_id, com_cidadao_id, relacao_tipo_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instituicao_tipos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicao_tipos (id, uuid, codigo, tipo, sinopse, created_at, updated_at) FROM stdin;
1	be87c611-7623-42c6-9081-0495f118cfe4	\N	Presidencial	O Presidente da República é o chefe de Estado e representa a República Portuguesa mas é apenas um cargo atribuido a um cidadão. Já a Presidência da República que é o máximo e outras instituições/orgãos, como o concelho de estado	2025-03-23 11:47:11	2025-03-23 11:47:11
2	22b383a8-dbf5-41b2-941e-df4189927d29	\N	Executivo	Devido ao sistema eleitoral, o governo é que executa grande parte das funções do estado, sendo o primeiro ministro o lider do governo. Depois o conselho de ministros, secretários de estado, Ministérios, etc.	2025-03-23 11:47:11	2025-03-23 11:47:11
3	a4649442-8d58-4154-8796-2f36a4640f2b	\N	Legislativo	A Assembleia da República é o órgão legislativo de Portugal, sendo a câmara baixa do parlamento português. Depois parlamento e mesa da assembleia, e outros orgãos como equipas de trabalho, comissões, etc	2025-03-23 11:47:11	2025-03-23 11:47:11
4	430f6fa7-0b72-4afd-8012-96bd45bf8370	\N	Judicial	Agrega orgãos independentes e autónomos que compõem o sistema judicial. Ex: Tribunais, Comarcas...	2025-03-23 11:47:11	2025-03-23 11:47:11
5	e2dfb699-95c7-4beb-bcfc-69874d4fdcaa	\N	Independente	São estabelecidas para operar autonomamente do governo e da Assembleia da República. Têm funções de fiscalização, regulação ou supervisão, garantindo imparcialidade e objetividade	2025-03-23 11:47:11	2025-03-23 11:47:11
6	b447d029-a415-46fa-b5c6-cf354fc8c03e	\N	Externo	São organizações que interagem com a Assembleia da República, mas que não fazem parte da sua estrutura interna. Incluem agências governamentais, instituições públicas (como universidades) e organizações internacionais.	2025-03-23 11:47:11	2025-03-23 11:47:11
7	1786293e-1591-47c9-8566-7047ca8111aa	\N	Partido	Outros de estatuto especial (in)controlado	2025-03-23 11:47:11	2025-03-23 11:47:11
8	af26234e-e685-457e-b77f-e9ce281968e2	P001	Órgãos de Soberania	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
9	16409258-532d-4ce5-9ae9-0d62ec2108e3	P002	Governação	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
10	30e14f0c-56d7-4dcf-8927-e90a72d0867e	P003	Representação Externa	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
11	2f7a656c-26c9-4439-9c61-303db20d3fb3	P004	Defesa	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
12	126c96f8-de39-4a37-8a57-6785ec675f8c	P005	Segurança Interna	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
13	77f43a96-688e-4b29-81cd-0a1eeda84244	P006	Justiça	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
14	f645356e-21e5-495e-a271-39b02caecf86	P007	Finanças	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
15	12bf29d6-06f6-49b5-b23f-1dbe6dde0ee0	P008	Gestão da Dívida Pública	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
16	d606bf15-95f3-4143-bfbe-596bd94b94aa	P009	Economia e Mar	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
17	f7278da4-d523-4b6e-a80b-4147a0784943	P010	Cultura	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
18	496313c5-d583-4a9b-ace8-dd43235af73b	P011	Ciência, Tecnologia e Ensino Superior	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
19	3a1c4f38-6779-4841-b2c8-f56fde533bf4	P012	Ensino Básico e Secundário e Administração Escolar	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
20	29bfbf1b-9538-4e87-9594-c94a76f31cee	P013	Trabalho, Solidariedade e Segurança Social	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
21	2fd75723-a708-4ff2-9cfe-4bf7dafe6de8	P014	Saúde	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
22	875be8bf-9567-4a0c-b41c-ab54bc449b87	P015	Ambiente e Ação Climática	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
23	2a985834-42c7-4610-95fe-aed43b352076	P016	Infraestruturas e Habitação	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
24	126abcf4-144e-4d31-ba8f-33659410e998	P017	Agricultura e Alimentação	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
25	a1ba79d6-3a70-460b-8e4e-c1be33ec9343	\N	Segurança Social	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
26	83e10927-3af5-4c65-823f-37fc320ab797	MIN	Ministério	Órgão governamental responsável por uma área específica da administração pública.	2025-03-23 11:58:01	2025-03-23 11:58:01
\.


--
-- Data for Name: instituicoes; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.instituicoes (id, uuid, nome, sigla, sinopse, responde_instituicao_id, nacional, extinta, params, created_at, updated_at) FROM stdin;
1	9fd7a4bd-858c-4133-9ae0-979861e1a46e	2 Monarquia Constitucional	2MC	Ministério histórico de Portugal, ativo entre 1822 e 1910.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
2	9814d302-6688-4af1-8923-80e39a327572	3 Primeira República	3PR	Ministério histórico de Portugal, ativo entre 1910 e 1926.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
3	4b745424-a1db-4b47-a0df-048281d9aa8d	4 Estado Novo (Ditadura Política)	4EN(P	Ministério histórico de Portugal, ativo entre 1933 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
4	fffe2865-4eba-4461-8ac6-608591e59a5d	5 Terceira República	5TR	Ministério histórico de Portugal, ativo entre 1974 e presente.	\N	t	f	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
5	829d7f54-248d-4246-80a0-cddb8e26911a	Secretaria de Estado dos Negócios da Fazenda	SENF	Ministério histórico de Portugal, ativo entre 1801 e 1822.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
6	dbfdbb45-18fd-4e9e-a39f-d23c4f83662e	Secretaria de Estado dos Negócios Eclesiásticos e da Justiça	SENEJ	Ministério histórico de Portugal, ativo entre 1821 e 1822.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
7	b89fef0d-10c0-4808-ad27-7a57c86c92bf	Ministério do Reino	MR	Ministério histórico de Portugal, ativo entre 1822 e 1910.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
8	9e9c6087-d57d-4f78-991c-7249e5d26596	Ministério da Marinha e Ultramar	MMU	Ministério histórico de Portugal, ativo entre 1822 e 1910.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
11	5abb045e-136e-47a7-a21c-93f91819ed99	Ministério dos Negócios Eclesiásticos e da Justiça	MNEJ	Ministério histórico de Portugal, ativo entre 1822 e 1910.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
12	265b77d7-af81-4728-8ebd-1975fbb267df	Ministério da Fazenda	MF	Ministério histórico de Portugal, ativo entre 1822 e 1910.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
13	ae0ab829-3758-4e28-b424-6dea3fbacabf	Ministério das Obras Públicas, Comércio e Indústria	MOPCI	Ministério histórico de Portugal, ativo entre 1852 e 1910.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
14	ca788b92-198c-4333-b624-b9bb96e7b9f0	Ministério da Instrução Pública e Belas Artes	MIPBA	Ministério histórico de Portugal, ativo entre 1890 e 1898.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
16	85141e30-97c1-4411-91d1-47d56e59b489	Ministério da Marinha e Colónias	MMC	Ministério histórico de Portugal, ativo entre 1910 e 1911.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
21	09f5b45e-8138-4bb6-94bf-226e874fac40	Ministério das Finanças	MF	Ministério histórico de Portugal, ativo entre 1933 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
38	98d101b3-77e3-4201-811b-e4cb0a7c2191	Ministério das Obras Públicas	MOP	Ministério histórico de Portugal, ativo entre 1946 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
22	805dadf3-dd91-4552-8284-237c7846b0fe	Ministério do Fomento	MF	Ministério histórico de Portugal, ativo entre 1910 e 1917.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
23	93884d49-ca3f-468b-a97d-a5f0231ee63e	Ministério do Comércio	MC	Ministério histórico de Portugal, ativo entre 1917 e 1919.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
24	9a795c0f-4052-4f93-99aa-5b342b233c82	Ministério do Comércio e Comunicações	MCC	Ministério histórico de Portugal, ativo entre 1919 e 1932.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
26	8a153821-4b54-4da0-bf41-e3745a2267e8	Ministério dos Abastecimentos	MA	Ministério histórico de Portugal, ativo entre 1918 e 1919.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
27	612d61cc-6927-4e52-840c-e7f25e99341f	Ministério do Comércio, Indústria e Agricultura	MCIA	Ministério histórico de Portugal, ativo entre 1932 e 1933.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
30	8e6eb190-d999-438b-a32b-172dd135ac8c	Ministério do Trabalho e Previdência Social	MTPS	Ministério histórico de Portugal, ativo entre 1916 e 1917.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
31	ab55e1e9-17ba-43b6-adb4-01002b137f09	Ministério do Trabalho	MT	Ministério histórico de Portugal, ativo entre 1917 e 1925.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
32	0c9fa45a-e4cf-4b40-b1a3-effb3853a44d	Presidência do Conselho de Ministros	PCM	Ministério histórico de Portugal, ativo entre 1933 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
15	0baa34c0-e310-402e-8e5e-64359ed57a3d	Ministério do Interior	MI	Ministério histórico de Portugal, ativo entre 1933 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
17	ebda3df9-f379-4faa-bb43-dbda017ab78a	Ministério da Marinha	MM	Ministério histórico de Portugal, ativo entre 1933 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
18	c56f7e0b-c3be-40f5-825e-7e097bef2b46	Ministério das Colónias	MC	Ministério histórico de Portugal, ativo entre 1933 e 1950.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
33	821f218c-4f08-40bd-9927-2fe11bead9cd	Ministério do Ultramar	MU	Ministério histórico de Portugal, ativo entre 1950 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
9	41c29d00-f533-461f-90fb-ebbc86f6a025	Ministério dos Negócios Estrangeiros	MNE	Ministério histórico de Portugal, ativo entre 1933 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
20	f7de7679-da31-4487-a1e5-95b5b9e24748	Ministério da Justiça e dos Cultos	MJC	Ministério histórico de Portugal, ativo entre 1933 e 1934.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
19	9168a2d1-7f2b-475b-81db-ebdb3b10cb4e	Ministério da Justiça	MJ	Ministério histórico de Portugal, ativo entre 1934 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
10	08df7054-1b7a-443c-a8b3-613f2304a548	Ministério da Guerra	MG	Ministério histórico de Portugal, ativo entre 1933 e 1950.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
34	ded2cac7-7c48-4c9d-926c-dd25c471a4dd	Ministério do Exército	ME	Ministério histórico de Portugal, ativo entre 1950 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
35	e04ff1c3-b031-4995-9ab6-8e5bfc4c97f5	Ministério da Defesa Nacional	MDN	Ministério histórico de Portugal, ativo entre 1950 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
36	41e669b5-2c05-4534-9e1a-b3d61c11b88c	Ministério do Comércio e Indústria	MCI	Ministério histórico de Portugal, ativo entre 1933 e 1940.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
25	02d422fe-38ab-44c8-bbaf-6b3f9e6bd084	Ministério da Agricultura	MA	Ministério histórico de Portugal, ativo entre 1933 e 1940.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
37	e03084c4-a2f9-4e26-a7d1-f4821b389a76	Ministério da Economia	ME	Ministério histórico de Portugal, ativo entre 1940 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
28	37cf4ea8-ae2f-418c-a566-612f54cc19af	Ministério das Obras Públicas e Comunicações	MOPC	Ministério histórico de Portugal, ativo entre 1933 e 1946.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
39	59ad8425-a07f-4ea1-b76b-fe52b3ffed41	Ministério das Comunicações	MC	Ministério histórico de Portugal, ativo entre 1946 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
29	f7be2896-c323-4666-9cdd-645469fe3a45	Ministério da Instrução Pública	MIP	Ministério histórico de Portugal, ativo entre 1933 e 1936.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
40	9f15bb0a-ddcb-4112-8a7e-5badb3d9d5b0	Ministério da Educação Nacional	MEN	Ministério histórico de Portugal, ativo entre 1936 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
41	a00f76f9-1358-4a17-bbd4-1bd1615c9f92	Ministério das Corporações e Previdência Social	MCPS	Ministério histórico de Portugal, ativo entre 1950 e 1973.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
42	085097ce-0287-4b25-812d-233d113c7fc9	Ministério das Corporações e Segurança Social	MCSS	Ministério histórico de Portugal, ativo entre 1973 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
43	a65a4a09-0aeb-40b7-8398-72d049004fd3	Ministério da Saúde e Assistência	MSA	Ministério histórico de Portugal, ativo entre 1961 e 1973.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
44	1a9cb84f-cb0e-4994-b6ca-01d6e6b02794	Ministério da Saúde	MS	Ministério histórico de Portugal, ativo entre 1973 e 1974.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
45	6947320a-4981-4036-b5ba-f635ab7d7929	Vice-primeiro-ministro para os Assuntos Económicos e Integração Europeia	VPAEIE	Ministério histórico de Portugal, ativo entre 1978 e 1979.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
46	81924e66-60c6-41a3-8d3b-7aef2b9b104c	Ministro da Presidência e dos Assuntos Parlamentares	MPAP	Ministério histórico de Portugal, ativo entre 2013 e 2015.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
47	5be09568-9268-4349-8269-f9452b88f47a	Ministro da Presidência e da Modernização Administrativa	MPMA	Ministério histórico de Portugal, ativo entre 2015 e 2024.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
48	1f225ddb-8dc2-43c3-84cf-3176f8e6f761	Ministro adjunto para a Administração Interna	MAPAI	Ministério histórico de Portugal, ativo entre 1979 e 1980.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
49	29f432fe-7cf5-48d7-8b25-da9f2acf076b	Ministro adjunto do primeiro-ministro e dos Assuntos Parlamentares	MAPAP	Ministério histórico de Portugal, ativo entre 1981 e 1982.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
50	f470b35e-866a-4f5b-900e-bccdb7c01046	Ministro adjunto e para os Assuntos Parlamentares	MAPAP	Ministério histórico de Portugal, ativo entre 1985 e 1987.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
51	47e4f920-6fc2-4929-bfa0-1ef8b3748b2c	Ministro adjunto e da Juventude	MAJ	Ministério histórico de Portugal, ativo entre 1987 e 1991.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
52	80c56508-e51d-451c-aff7-815cd037e019	Ministro adjunto e do Desenvolvimento Regional	MADR	Ministério histórico de Portugal, ativo entre 2013 e 2015.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
53	7924f21d-95fa-4e84-b384-e2151ac37d6e	Ministro da Coordenação Social	MCS	Ministério histórico de Portugal, ativo entre 1979 e 1980.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
54	7b4b6cba-4057-4a64-8b3d-49e00796f0b0	Ministro da Coordenação Cultural	MCC	Ministério histórico de Portugal, ativo entre 1979 e 1980.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
55	cd39d3ae-c81a-4004-b0d0-781f728febe8	Ministro da Igualdade	MI	Ministério histórico de Portugal, ativo entre 1999 e 2000.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
56	de14151e-3a90-433c-91d5-190b8e043874	Ministro da República para a Região Autónoma dos Açores	MRPRAA	Ministério histórico de Portugal, ativo entre 1976 e 2006.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
57	aadce731-0596-4057-ae34-846a2333a983	Ministro da República para a Região Autónoma da Madeira	MRPRAM	Ministério histórico de Portugal, ativo entre 1976 e 2006.	\N	t	t	\N	2025-03-23 11:58:01	2025-03-23 11:58:01
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: legislatura_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.legislatura_anexos (id, uuid, nome, legislatura_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: legislaturas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.legislaturas (id, uuid, sigla, nome, republica_id, eleicoes, formacao, dissolucao, sinopse, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lei_adendas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.lei_adendas (id, lei_original_id, lei_adenda_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lei_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.lei_anexos (id, uuid, nome, lei_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lei_emissores; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.lei_emissores (id, lei_id, emissor_tipo, emissor_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lei_partes; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.lei_partes (id, uuid, codigo, parte, sinopse, created_at, updated_at) FROM stdin;
1	c722980a-b940-4bdf-be55-778240d07cb6	A 	Presidência da República	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
2	3af56423-b252-4dcb-9bd1-7a939f8d38de	B 	Assembleia da República	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
3	beb41226-23d6-45f2-8817-a2a238f23b2c	C 	Governo e Administração direta e indireta do Estado	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
4	51af0f9a-41d2-46fe-a9f8-c38f4605f682	D 	Tribunais e Ministério Público	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
5	4cbbd874-abac-410c-bc2d-b265fe4d762e	E 	Entidades administrativas independentes e Administração autónoma	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
6	82de4d49-66f2-4f5f-836c-6c262f10f022	F 	Regiões Autónomas	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
7	3cc89da8-d1fb-4908-bf89-a8d9f7c718d8	G 	Empresas públicas	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
8	04bacbdb-8bf6-4c5c-9c3d-08bf6a34d8d6	H 	Autarquias locais	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
9	79d80ab8-114e-41f1-8d6e-f57cef3b7218	I 	Outras entidades	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
10	7e7cdfb8-e766-4dcd-8b01-c962d7867d74	J1	Administração Pública - Concursos para Cargos Dirigentes	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
11	ec7a3128-762f-48a6-8195-96bb7e63212f	J2	Administração Pública - Alterações Excecionais de Posições Remuneratórias	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
12	94b4f4e9-5659-4ad8-b2fd-a38b68a2759e	J3	Administração Pública - Relações Coletivas de Trabalho	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
13	5ec2e54a-8053-489b-bf55-cdf0f4ff351c	L 	Contratos públicos	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
\.


--
-- Data for Name: lei_tipos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.lei_tipos (id, uuid, tipo, sinopse, created_at, updated_at) FROM stdin;
1	a5903a61-2f0b-4a18-b717-c7c5d32d3e58	Acórdão	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
2	a016f2c6-0501-4965-9d52-d05e9b31e35b	Acordo	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
3	78d393ff-ca7b-4c56-8324-497e6dec9783	Acta	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
4	37b982a2-7d24-4eb3-9734-909d17c3bb99	Alvará	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
5	eee42eb8-ae7c-4748-8249-dfb2a01daf4b	Alvará-Extracto	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
6	7172a707-0a6f-4fcb-89e1-5ae103b4b9ce	Anúncio	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
7	02574b54-bd87-4bd5-93a9-b536940a8794	Assento	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
8	096c6902-28e6-4e09-b68a-5040eba10d65	Autorização	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
9	bd7b5e26-49b8-4049-850d-89a11b54c64b	Aviso	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
10	aea1bb40-a5a8-4e03-a9ca-87733d3f9eb8	Aviso-Extracto	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
11	dda7d5fe-f6ed-4f15-87d9-8fbdc4ebcd11	Carta de Confirmação e Ratificação de Convenção Internacional	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
12	ef1517fa-e44f-4496-87ae-60eb72100a85	Carta de Lei	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
13	fb7c1f7a-5382-4ca8-8367-57d7c78a70d8	Comunicação de Renúncia	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
14	4e792858-26ef-476c-ae88-b5d586a40556	Conta	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
15	fe2f432f-7b68-4c48-8d71-f0fceb4ca178	Contrato	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
16	b08a46a0-5fa4-4546-b7de-2035695da1ec	Contrato-Extrato	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
17	8a3619e6-34f4-4276-9bd9-2dbc9a84a39e	Convénio	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
18	46722a0e-b3e9-4b1a-90af-d1a943a52022	Declaração	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
19	e5aa59d4-6281-463b-b86c-53b9648d5f34	Declaração de Dívida	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
20	4c0dcead-8723-4665-b58d-aae46943d189	Declaração de Rectificação	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
21	f03ffb2a-b5f8-4c28-8a47-3324912fe644	Decreto	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
22	871d3d6e-9207-4707-ba15-95527a33eabd	Decreto Legislativo Regional	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
23	8794c761-411f-4453-8bf3-92ef532b61f2	Decreto Lei	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
24	75f7f189-1213-42df-9806-87fdd38d05b9	Decreto Regional	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
25	9a64585d-db45-4ee1-8fb0-7b320fb45b61	Decreto Regulamentar	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
26	8369dcac-3d22-466c-988a-d6119bba741f	Decreto Regulamentar Regional	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
27	6f39a040-88aa-480b-ac57-09cb468d7484	Deliberação	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
28	c9ad04c0-62b7-4b4b-9d41-24f3bfacb4e3	Deliberação-Extrato	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
29	4042b5dc-01c7-42ec-9d2e-e9f8563db7f2	Despacho	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
30	50e6e33b-a588-4cf9-b4d0-47df9290d311	Despacho Conjunto	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
31	d133fb6d-02d3-4ddf-9b79-36d91de824ac	Despacho-Extrato	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
32	566f5df4-30b8-4cf0-8d09-935457460f1f	Despacho Ministerial	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
33	f3a83ada-8965-433b-9c5d-65e6b83a554f	Despacho Normativo	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
34	58889ba1-a423-4b28-8f7c-5ebcd210ecb3	Despacho Orientador	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
35	275b722e-f608-4ddf-8e26-bc3549b4eab6	Despacho Rectificativo	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
36	48b26d23-8c18-4b85-9c2a-e4fda19196b2	Despacho Regulador	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
37	1356d870-85a0-4228-81c7-2423b68ca8a4	Directiva Contabilística	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
38	29e61186-6813-44dd-8fcc-950a80ab386b	Edital	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
39	02a8f9cb-7785-479b-a5b0-747f875b65c3	Extrato	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
40	ee17596c-bfa3-4f11-8848-daa70202f2e3	Instrução	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
41	af8f8bed-d13c-473d-b004-4567c10f7b0b	Instruções	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
42	25a2e333-cff1-4d4a-87ab-04dbcdfa8458	Jurisprudência	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
43	7061adaf-06ea-4d3c-9ce1-8346b0cd1446	Lei	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
44	b5249bf6-dbed-400a-ada8-e0aa2e9e7b70	Lei Constitucional	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
45	39774e16-2cea-4c5a-a5f5-baf7df053b54	Lei Orgânica	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
46	c4e7bbd1-d406-4195-b7fb-e3cd00c81658	Listagem	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
47	e04c906a-f0ce-4e3b-9b12-8944275a0e4e	Lista Rectificativa	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
48	a9c70945-7c2f-4865-bf76-e850e05fbe9d	Louvor	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
49	e47e7c53-0f76-4537-afa9-940076320012	Mapa	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
50	fe9e4553-194a-4814-9c4d-840da5202891	Mapa Oficial	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
51	6aa1b808-70b3-451b-91aa-74a4a36045db	Moção	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
52	2942b87e-de47-423d-bf2e-8e59c52fcf7c	Moção De Confiança	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
53	bab00ced-4bea-4c19-a76f-3abc77a6fe0e	Não Especificado	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
54	30a45fb9-8780-49d3-abb0-b2c747daf3ae	Norma	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
55	58e2de07-2fee-4741-b9e3-8e897ae2f0b6	Projeto de Lei	Proposta de lei apresentada por um deputado ou grupo de deputados.	2025-03-23 11:47:12	2025-03-23 11:47:12
56	38e96499-7507-4560-8cf0-47e8256f2699	Proposta Lei	Apresentada pelo Governos, é uma proposta de lei que é discutida e votada na Assembleia da República.	2025-03-23 11:47:12	2025-03-23 11:47:12
57	dd17552e-b896-42ab-b2a0-3674d9f49c73	Proposta de Resolução	Proposta de resolução apresentada por um deputado ou grupo de deputados.	2025-03-23 11:47:12	2025-03-23 11:47:12
58	0054f11a-51af-4517-bf74-3fb8d54a8ca4	Parecer	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
59	10242ebd-92ca-4ef6-9bf1-013395d0f129	Portaria	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
60	d8b8fb47-959f-42cd-92b0-a07dba080291	Portaria-Extracto	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
61	e62ff17b-a71e-43a7-ad9b-854f0e7a327e	Processo	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
62	fca2c7e8-f2c8-41d6-922d-4c53ab7fb679	Protocolo	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
63	21fac74f-5baa-41b6-b326-b3e9b90e613a	Recomendação	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
64	7fb6477a-1740-4976-9cf9-b14c0922a733	Rectificação	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
65	6cf7aa21-043e-441e-9dc6-2e4fa5c1ed21	Regimento	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
66	0051b223-53a8-4a16-b397-8312f986b0c2	Regulamento	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
67	db5aa90f-ade3-4ba1-87f3-bd455e4c8b67	Regulamento Interno	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
68	c0e4d5dc-af11-46a1-9e87-f4c81d7536aa	Relatório	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
69	0c2c3884-0df3-4cf8-9ef4-b5fd420c51a0	Resolução	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
70	aa735588-41c0-45ba-a008-05c67f37648d	Resolução da Assembleia Nacional	\N	2025-03-23 11:47:12	2025-03-23 11:47:12
\.


--
-- Data for Name: leis; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.leis (id, uuid, lei_tipo_id, codigo, nome_completo, proponente, lei_parte_id, sumario, texto, em_vigor, data_toggle, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.logs (id, user_id, aplicacao_id, method, code, url, message, params, reply, "time", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0000_00_00_000000_create_statuses_table	1
2	0000_00_00_000001_create_distritos_table	1
3	0000_00_00_000002_create_concelhos_table	1
4	0000_00_00_000003_create_freguesia_tipos_table	1
5	0000_00_00_000004_create_freguesias_table	1
6	0000_00_00_000005_create_anexo_tipos_table	1
7	0000_00_00_000006_create_cidadaos_table	1
8	0000_00_00_000007_create_nacionalidades_table	1
9	0000_00_00_000008_create_relacao_tipos_table	1
10	0000_00_00_000011_create_distrito_anexos_table	1
11	0000_00_00_000012_create_concelho_anexos_table	1
12	0000_00_00_000013_create_freguesia_anexos_table	1
13	0001_01_01_000000_create_users_table	1
14	0001_01_01_000001_create_cache_table	1
15	0001_01_01_000002_create_jobs_table	1
16	0001_01_01_000010_create_user_comentarios_table	1
17	2024_12_24_064809_create_personal_access_tokens_table	1
18	2025_01_02_130103_create_newsletter_users_table	1
19	2025_02_06_183213_create_roles_table	1
20	2025_02_06_183214_create_role_cargos_table	1
21	2025_02_06_183317_create_user_roles_table	1
22	2025_02_06_183351_create_permissions_table	1
23	2025_02_06_183422_create_user_permissions_table	1
24	2025_02_06_183423_create_role_permissions_table	1
25	2025_02_07_174654_create_contacto_tipos_table	1
26	2025_02_07_184653_create_entidade_juridicas_table	1
27	2025_02_07_184654_create_entidade_juridica_anexos_table	1
28	2025_02_07_194652_create_diario_republica_glossarios_table	1
29	2025_02_07_194653_create_diario_republica_series_table	1
30	2025_02_07_194654_create_diario_republicas_table	1
31	2025_02_07_194655_create_diario_republica_publicacoes_table	1
32	2025_02_07_194656_create_diario_republica_publicacao_anexos_table	1
33	2025_02_07_223737_create_republicas_table	1
34	2025_02_07_223738_create_republica_anexos_table	1
35	2025_02_07_224148_create_legislaturas_table	1
36	2025_02_07_224149_create_legislatura_anexos_table	1
37	2025_02_07_234148_create_presidenciais_table	1
38	2025_02_07_234149_create_presidencial_anexos_table	1
39	2025_02_08_153819_create_instituicao_tipos_table	1
40	2025_02_08_153833_create_instituicoes_table	1
41	2025_02_08_153834_create_instituicao_com_tipos_table	1
42	2025_02_08_162217_create_instituicao_legislaturas_table	1
43	2025_02_08_162218_create_instituicao_legislatura_anexos_table	1
44	2025_02_08_162219_create_instituicao_presidenciais_table	1
45	2025_02_08_162220_create_instituicao_presidencial_anexos_table	1
46	2025_02_08_180852_create_instituicao_cargos_table	1
47	2025_02_08_180853_create_instituicao_cargo_anexos_table	1
48	2025_02_08_191412_create_instituicao_anexos_table	1
49	2025_02_08_191413_create_instituicao_dados_table	1
50	2025_02_08_191414_create_instituicao_moradas_table	1
51	2025_02_08_191415_create_instituicao_contactos_table	1
52	2025_02_08_191416_create_instituicao_nacionalidades_table	1
53	2025_02_08_191417_create_instituicao_relacoes_table	1
54	2025_02_08_201410_create_lei_partes_table	1
55	2025_02_08_201411_create_lei_tipos_table	1
56	2025_02_08_201412_create_leis_table	1
57	2025_02_08_201413_create_entidade_juridica_leis_table	1
58	2025_02_08_201413_create_instituicao_cargo_leis_table	1
59	2025_02_08_201413_create_instituicao_leis_table	1
60	2025_02_08_201413_create_lei_emissores_table	1
61	2025_02_08_201414_create_diario_republica_publicacao_leis_table	1
62	2025_02_08_201415_create_lei_anexos_table	1
63	2025_02_08_201416_create_lei_adendas_table	1
64	2025_02_09_094709_create_cidadao_moradas_table	1
65	2025_02_09_094710_create_cidadao_dados_table	1
66	2025_02_09_094711_create_cidadao_anexos_table	1
67	2025_02_09_094712_create_cidadao_cargos_table	1
68	2025_02_09_094713_create_cidadao_contactos_table	1
69	2025_02_09_094714_create_cidadao_relacoes_table	1
70	2025_02_16_081031_create_cidadao_cargo_anexos_table	1
71	2025_02_16_112206_create_cidadao_nacionalidades_table	1
72	2025_03_03_063940_create_governos_table	1
73	2025_03_03_063958_create_governo_anexos_table	1
74	2025_03_03_064039_create_instituicao_governos_table	1
75	2025_03_04_103958_create_aplicacoes_table	1
76	2025_03_04_164344_create_conselho_ministros_table	1
77	2025_03_04_164345_create_logs_table	1
78	2025_03_23_110032_create_instituicao_entidade_juridicas_table	1
\.


--
-- Data for Name: nacionalidades; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.nacionalidades (id, nacionalidade, pais, params, created_at, updated_at) FROM stdin;
1	south-africa	África do Sul	"{\\"flag\\":\\"south-africa\\"}"	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: newsletter_users; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.newsletter_users (id, name, email, phone, hash, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.permissions (id, uuid, code, name, description, params, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: presidenciais; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.presidenciais (id, uuid, sigla, nome, republica_id, eleicoes, posse, termino, sinopse, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: presidencial_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.presidencial_anexos (id, uuid, nome, presidencial_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: relacao_tipos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.relacao_tipos (id, entre, tipo, created_at, updated_at) FROM stdin;
1	cidadaos	Pai	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: republica_anexos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.republica_anexos (id, uuid, nome, republica_id, anexo_tipo_id, anexo, descricao, created_at, updated_at) FROM stdin;
1	f2a450d3-910e-45f6-b208-bd69b19ed4c8	Bandeira da Monarquia Absoluta	1	1	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Flag_of_Portugal_%281610-1640%29.svg/1200px-Flag_of_Portugal_%281610-1640%29.svg.png	Bandeira ou símbolo da Monarquia Absoluta	2025-03-23 11:47:12	2025-03-23 11:47:12
2	870f97fc-bffb-400b-858d-599778846506	Bandeira da Monarquia Constitucional	2	1	https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Portugal_%281830-1910%29.svg/1200px-Flag_of_Portugal_%281830-1910%29.svg.png	Bandeira ou símbolo da Monarquia Constitucional	2025-03-23 11:47:12	2025-03-23 11:47:12
3	efbe3a50-86c3-4157-a0df-66e3267eabc8	Bandeira da Primeira República Portuguesa	3	1	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png	Bandeira ou símbolo da Primeira República Portuguesa	2025-03-23 11:47:12	2025-03-23 11:47:12
4	9ecf78d7-5db7-410d-990f-df32910766b0	Bandeira da Ditadura Militar e Ditadura Nacional	4	1	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png	Bandeira ou símbolo da Ditadura Militar e Ditadura Nacional	2025-03-23 11:47:12	2025-03-23 11:47:12
5	4f449d67-c7a6-4100-afdf-8accd756d865	Bandeira da Estado Novo	5	1	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png	Bandeira ou símbolo da Estado Novo	2025-03-23 11:47:12	2025-03-23 11:47:12
6	8e84b5aa-501c-4938-bd4a-29228043ced0	Bandeira da Terceira República Portuguesa	6	1	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png	Bandeira ou símbolo da Terceira República Portuguesa	2025-03-23 11:47:12	2025-03-23 11:47:12
\.


--
-- Data for Name: republicas; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.republicas (id, uuid, nome, inicio, fim, sinopse, created_at, updated_at) FROM stdin;
1	3eee75c0-af1c-4c08-a20d-8d278f1413c4	Monarquia Absoluta	1736-01-01	1822-09-24	Regime monárquico absolutista que vigorou em Portugal até à Revolução Liberal.	2025-03-23 11:47:12	2025-03-23 11:47:12
2	35214f39-c29d-432b-89d8-f842aee9c6ca	Monarquia Constitucional	1822-09-24	1910-10-05	Regime monárquico com constituição, encerrado pela Revolução Republicana de 1910.	2025-03-23 11:47:12	2025-03-23 11:47:12
3	41a951a0-e15e-4891-831a-8c0cccec60e7	Primeira República Portuguesa	1910-10-05	1926-05-28	Regime democrático parlamentar que se seguiu à queda da monarquia portuguesa.	2025-03-23 11:47:12	2025-03-23 11:47:12
4	ca413eda-ef40-42b2-b526-68d914a1177b	Ditadura Militar e Ditadura Nacional	1926-05-28	1933-04-11	Regime político autoritário que sucedeu à Primeira República.	2025-03-23 11:47:12	2025-03-23 11:47:12
5	8b5ec7a6-bad0-4789-b3a7-ac4898ad6fef	Estado Novo	1933-04-11	1974-04-25	Regime político autoritário, autocrata e corporativista de Estado que vigorou em Portugal.	2025-03-23 11:47:12	2025-03-23 11:47:12
6	0d79a399-e4ed-4ac4-ad4b-d3f0aa781a23	Terceira República Portuguesa	1974-04-25	\N	Atual regime democrático parlamentar de Portugal, iniciado após a Revolução dos Cravos.	2025-03-23 11:47:12	2025-03-23 11:47:12
\.


--
-- Data for Name: role_cargos; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.role_cargos (id, uuid, code, name, description, params, role_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.role_permissions (id, role_id, permission_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.roles (id, uuid, code, name, description, params, created_at, updated_at) FROM stdin;
1	7def1686-5aec-4ab9-a494-d31d1fdbab12	sys-admin	Open-Source	Pessoas que desenvolvem código...	"{\\"color\\":{\\"hex\\":\\"#f6c000\\",\\"bootstrap\\":\\"warning\\"},\\"icon\\":\\"fa fa-code\\"}"	2025-03-23 11:47:11	2025-03-23 11:47:11
2	fe5fb907-d69c-476d-999e-fac6f07c7564	management	Operadores	Utilizadores que ficaram com responsabilidades	"{\\"color\\":{\\"hex\\":\\"#056EE9\\",\\"bootstrap\\":\\"primary\\"},\\"icon\\":\\"fa fa-user-tie\\"}"	2025-03-23 11:47:11	2025-03-23 11:47:11
3	15795610-9e9c-4bfa-acf0-bda94d11869c	user	Utilizador Registado	Utilizadores Resgistados	"{\\"color\\":{\\"hex\\":\\"#04B440\\",\\"bootstrap\\":\\"success\\"},\\"icon\\":\\"fa fa-user\\"}"	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.statuses (id, uuid, tipo, status, params, descricao, created_at, updated_at) FROM stdin;
1	619e0ed2-ec20-4413-8465-4608599febd4	users	Activo	"{\\"color\\":{\\"hex\\":\\"#17c653\\",\\"bootstrap\\":\\"success\\"}}"	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
2	d37654ea-2f10-46c5-8d2c-e83ab1d4dd2d	users	Registado	"{\\"color\\":{\\"hex\\":\\"#f6c000\\",\\"bootstrap\\":\\"warning\\"}}"	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
3	a91be555-cab8-42e6-b167-b06be070d8a0	users	Suspenso	"{\\"color\\":{\\"hex\\":\\"#f8285a\\",\\"bootstrap\\":\\"danger\\"}}"	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
4	56ff14b7-4847-4196-920f-b1849ba58141	users	Inactivo	"{\\"color\\":{\\"hex\\":\\"#f9f9f9\\",\\"bootstrap\\":\\"secondary\\"}}"	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
5	89429c9c-c8f9-4432-bc05-150f7ee3e50d	users	Apagado	"{\\"color\\":{\\"hex\\":\\"#1e2129\\",\\"bootstrap\\":\\"dark\\"}}"	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: user_comentarios; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.user_comentarios (id, user_id, em, comentario_id, comentario, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_permissions; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.user_permissions (id, user_id, permission_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.user_roles (id, user_id, role_id, cargo_id, created_at, updated_at) FROM stdin;
1	1	1	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: local_user
--

COPY public.users (id, uuid, name, status_id, email, cidadao_id, rgpd, password, email_verified_at, remember_token, created_at, updated_at) FROM stdin;
1	371450a6-f0ad-4dae-8eba-958f92863fad	Operadores	1	deployuser@bewhy.org	\N	t	$2y$12$acqdFnn.RW4sml9SvkuELuoJzeUuVni0Dw/.cGeo5m5uMVflIAjJq	\N	\N	2025-03-23 11:47:11	2025-03-23 11:47:11
\.


--
-- Name: anexo_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.anexo_tipos_id_seq', 9, true);


--
-- Name: aplicacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.aplicacoes_id_seq', 2, true);


--
-- Name: cidadao_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_anexos_id_seq', 1, false);


--
-- Name: cidadao_cargo_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_cargo_anexos_id_seq', 1, false);


--
-- Name: cidadao_cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_cargos_id_seq', 1, false);


--
-- Name: cidadao_contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_contactos_id_seq', 1, false);


--
-- Name: cidadao_dados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_dados_id_seq', 1, false);


--
-- Name: cidadao_moradas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_moradas_id_seq', 1, false);


--
-- Name: cidadao_nacionalidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_nacionalidades_id_seq', 1, false);


--
-- Name: cidadao_relacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadao_relacoes_id_seq', 1, false);


--
-- Name: cidadaos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.cidadaos_id_seq', 1, false);


--
-- Name: concelho_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.concelho_anexos_id_seq', 1, false);


--
-- Name: concelhos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.concelhos_id_seq', 308, true);


--
-- Name: conselho_ministros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.conselho_ministros_id_seq', 1, false);


--
-- Name: contacto_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.contacto_tipos_id_seq', 6, true);


--
-- Name: diario_republica_glossarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.diario_republica_glossarios_id_seq', 1, false);


--
-- Name: diario_republica_publicacao_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.diario_republica_publicacao_anexos_id_seq', 1, false);


--
-- Name: diario_republica_publicacao_leis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.diario_republica_publicacao_leis_id_seq', 1, false);


--
-- Name: diario_republica_publicacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.diario_republica_publicacoes_id_seq', 1, false);


--
-- Name: diario_republica_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.diario_republica_series_id_seq', 1, false);


--
-- Name: diario_republicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.diario_republicas_id_seq', 1, false);


--
-- Name: distrito_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.distrito_anexos_id_seq', 1, false);


--
-- Name: distritos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.distritos_id_seq', 20, true);


--
-- Name: entidade_juridica_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.entidade_juridica_anexos_id_seq', 1, false);


--
-- Name: entidade_juridica_leis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.entidade_juridica_leis_id_seq', 1, false);


--
-- Name: entidade_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.entidade_juridicas_id_seq', 36, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: freguesia_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.freguesia_anexos_id_seq', 1, false);


--
-- Name: freguesia_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.freguesia_tipos_id_seq', 3, true);


--
-- Name: freguesias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.freguesias_id_seq', 5169, true);


--
-- Name: governo_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.governo_anexos_id_seq', 1, false);


--
-- Name: governos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.governos_id_seq', 1, false);


--
-- Name: instituicao_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_anexos_id_seq', 1, false);


--
-- Name: instituicao_cargo_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_cargo_anexos_id_seq', 1, false);


--
-- Name: instituicao_cargo_leis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_cargo_leis_id_seq', 1, false);


--
-- Name: instituicao_cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_cargos_id_seq', 1, false);


--
-- Name: instituicao_com_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_com_tipos_id_seq', 114, true);


--
-- Name: instituicao_contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_contactos_id_seq', 1, false);


--
-- Name: instituicao_dados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_dados_id_seq', 57, true);


--
-- Name: instituicao_entidade_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_entidade_juridicas_id_seq', 1, false);


--
-- Name: instituicao_governos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_governos_id_seq', 1, false);


--
-- Name: instituicao_legislaturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_legislaturas_id_seq', 1, false);


--
-- Name: instituicao_leis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_leis_id_seq', 1, false);


--
-- Name: instituicao_moradas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_moradas_id_seq', 1, false);


--
-- Name: instituicao_nacionalidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_nacionalidades_id_seq', 1, false);


--
-- Name: instituicao_presidenciais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_presidenciais_id_seq', 1, false);


--
-- Name: instituicao_relacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_relacoes_id_seq', 1, false);


--
-- Name: instituicao_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicao_tipos_id_seq', 26, true);


--
-- Name: instituicoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.instituicoes_id_seq', 57, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: legislatura_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.legislatura_anexos_id_seq', 1, false);


--
-- Name: legislaturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.legislaturas_id_seq', 1, false);


--
-- Name: lei_adendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.lei_adendas_id_seq', 1, false);


--
-- Name: lei_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.lei_anexos_id_seq', 1, false);


--
-- Name: lei_emissores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.lei_emissores_id_seq', 1, false);


--
-- Name: lei_partes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.lei_partes_id_seq', 13, true);


--
-- Name: lei_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.lei_tipos_id_seq', 70, true);


--
-- Name: leis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.leis_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.migrations_id_seq', 78, true);


--
-- Name: nacionalidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.nacionalidades_id_seq', 1, true);


--
-- Name: newsletter_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.newsletter_users_id_seq', 1, false);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: presidenciais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.presidenciais_id_seq', 1, false);


--
-- Name: presidencial_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.presidencial_anexos_id_seq', 1, false);


--
-- Name: relacao_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.relacao_tipos_id_seq', 1, true);


--
-- Name: republica_anexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.republica_anexos_id_seq', 6, true);


--
-- Name: republicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.republicas_id_seq', 6, true);


--
-- Name: role_cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.role_cargos_id_seq', 1, false);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.statuses_id_seq', 5, true);


--
-- Name: user_comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.user_comentarios_id_seq', 1, false);


--
-- Name: user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.user_permissions_id_seq', 1, false);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: anexo_tipos anexo_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.anexo_tipos
    ADD CONSTRAINT anexo_tipos_pkey PRIMARY KEY (id);


--
-- Name: anexo_tipos anexo_tipos_tipo_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.anexo_tipos
    ADD CONSTRAINT anexo_tipos_tipo_unique UNIQUE (tipo);


--
-- Name: aplicacoes aplicacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.aplicacoes
    ADD CONSTRAINT aplicacoes_pkey PRIMARY KEY (id);


--
-- Name: aplicacoes aplicacoes_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.aplicacoes
    ADD CONSTRAINT aplicacoes_uuid_unique UNIQUE (uuid);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: cidadao_anexos cidadao_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_anexos
    ADD CONSTRAINT cidadao_anexos_pkey PRIMARY KEY (id);


--
-- Name: cidadao_anexos cidadao_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_anexos
    ADD CONSTRAINT cidadao_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: cidadao_cargo_anexos cidadao_cargo_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargo_anexos
    ADD CONSTRAINT cidadao_cargo_anexos_pkey PRIMARY KEY (id);


--
-- Name: cidadao_cargo_anexos cidadao_cargo_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargo_anexos
    ADD CONSTRAINT cidadao_cargo_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: cidadao_cargos cidadao_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargos
    ADD CONSTRAINT cidadao_cargos_pkey PRIMARY KEY (id);


--
-- Name: cidadao_contactos cidadao_contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_contactos
    ADD CONSTRAINT cidadao_contactos_pkey PRIMARY KEY (id);


--
-- Name: cidadao_dados cidadao_dados_cc_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_dados
    ADD CONSTRAINT cidadao_dados_cc_unique UNIQUE (cc);


--
-- Name: cidadao_dados cidadao_dados_n_saude_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_dados
    ADD CONSTRAINT cidadao_dados_n_saude_unique UNIQUE (n_saude);


--
-- Name: cidadao_dados cidadao_dados_nif_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_dados
    ADD CONSTRAINT cidadao_dados_nif_unique UNIQUE (nif);


--
-- Name: cidadao_dados cidadao_dados_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_dados
    ADD CONSTRAINT cidadao_dados_pkey PRIMARY KEY (id);


--
-- Name: cidadao_dados cidadao_dados_seg_social_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_dados
    ADD CONSTRAINT cidadao_dados_seg_social_unique UNIQUE (seg_social);


--
-- Name: cidadao_moradas cidadao_moradas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_moradas
    ADD CONSTRAINT cidadao_moradas_pkey PRIMARY KEY (id);


--
-- Name: cidadao_nacionalidades cidadao_nacionalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_nacionalidades
    ADD CONSTRAINT cidadao_nacionalidades_pkey PRIMARY KEY (id);


--
-- Name: cidadao_relacoes cidadao_relacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_relacoes
    ADD CONSTRAINT cidadao_relacoes_pkey PRIMARY KEY (id);


--
-- Name: cidadaos cidadaos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadaos
    ADD CONSTRAINT cidadaos_pkey PRIMARY KEY (id);


--
-- Name: cidadaos cidadaos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadaos
    ADD CONSTRAINT cidadaos_uuid_unique UNIQUE (uuid);


--
-- Name: concelho_anexos concelho_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelho_anexos
    ADD CONSTRAINT concelho_anexos_pkey PRIMARY KEY (id);


--
-- Name: concelho_anexos concelho_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelho_anexos
    ADD CONSTRAINT concelho_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: concelhos concelhos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelhos
    ADD CONSTRAINT concelhos_pkey PRIMARY KEY (id);


--
-- Name: concelhos concelhos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelhos
    ADD CONSTRAINT concelhos_uuid_unique UNIQUE (uuid);


--
-- Name: conselho_ministros conselho_ministros_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.conselho_ministros
    ADD CONSTRAINT conselho_ministros_pkey PRIMARY KEY (id);


--
-- Name: contacto_tipos contacto_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.contacto_tipos
    ADD CONSTRAINT contacto_tipos_pkey PRIMARY KEY (id);


--
-- Name: diario_republica_glossarios diario_republica_glossarios_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_glossarios
    ADD CONSTRAINT diario_republica_glossarios_pkey PRIMARY KEY (id);


--
-- Name: diario_republica_glossarios diario_republica_glossarios_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_glossarios
    ADD CONSTRAINT diario_republica_glossarios_uuid_unique UNIQUE (uuid);


--
-- Name: diario_republica_publicacao_anexos diario_republica_publicacao_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_anexos
    ADD CONSTRAINT diario_republica_publicacao_anexos_pkey PRIMARY KEY (id);


--
-- Name: diario_republica_publicacao_anexos diario_republica_publicacao_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_anexos
    ADD CONSTRAINT diario_republica_publicacao_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: diario_republica_publicacao_leis diario_republica_publicacao_leis_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_leis
    ADD CONSTRAINT diario_republica_publicacao_leis_pkey PRIMARY KEY (id);


--
-- Name: diario_republica_publicacoes diario_republica_publicacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacoes
    ADD CONSTRAINT diario_republica_publicacoes_pkey PRIMARY KEY (id);


--
-- Name: diario_republica_publicacoes diario_republica_publicacoes_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacoes
    ADD CONSTRAINT diario_republica_publicacoes_uuid_unique UNIQUE (uuid);


--
-- Name: diario_republica_series diario_republica_series_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_series
    ADD CONSTRAINT diario_republica_series_pkey PRIMARY KEY (id);


--
-- Name: diario_republicas diario_republicas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republicas
    ADD CONSTRAINT diario_republicas_pkey PRIMARY KEY (id);


--
-- Name: diario_republicas diario_republicas_publicacao_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republicas
    ADD CONSTRAINT diario_republicas_publicacao_unique UNIQUE (publicacao);


--
-- Name: diario_republicas diario_republicas_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republicas
    ADD CONSTRAINT diario_republicas_uuid_unique UNIQUE (uuid);


--
-- Name: distrito_anexos distrito_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distrito_anexos
    ADD CONSTRAINT distrito_anexos_pkey PRIMARY KEY (id);


--
-- Name: distrito_anexos distrito_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distrito_anexos
    ADD CONSTRAINT distrito_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: distritos distritos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distritos
    ADD CONSTRAINT distritos_pkey PRIMARY KEY (id);


--
-- Name: distritos distritos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distritos
    ADD CONSTRAINT distritos_uuid_unique UNIQUE (uuid);


--
-- Name: entidade_juridica_anexos entidade_juridica_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_anexos
    ADD CONSTRAINT entidade_juridica_anexos_pkey PRIMARY KEY (id);


--
-- Name: entidade_juridica_anexos entidade_juridica_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_anexos
    ADD CONSTRAINT entidade_juridica_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: entidade_juridica_leis entidade_juridica_leis_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_leis
    ADD CONSTRAINT entidade_juridica_leis_pkey PRIMARY KEY (id);


--
-- Name: entidade_juridicas entidade_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridicas
    ADD CONSTRAINT entidade_juridicas_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: freguesia_anexos freguesia_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesia_anexos
    ADD CONSTRAINT freguesia_anexos_pkey PRIMARY KEY (id);


--
-- Name: freguesia_anexos freguesia_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesia_anexos
    ADD CONSTRAINT freguesia_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: freguesia_tipos freguesia_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesia_tipos
    ADD CONSTRAINT freguesia_tipos_pkey PRIMARY KEY (id);


--
-- Name: freguesias freguesias_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesias
    ADD CONSTRAINT freguesias_pkey PRIMARY KEY (id);


--
-- Name: freguesias freguesias_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesias
    ADD CONSTRAINT freguesias_uuid_unique UNIQUE (uuid);


--
-- Name: governo_anexos governo_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governo_anexos
    ADD CONSTRAINT governo_anexos_pkey PRIMARY KEY (id);


--
-- Name: governo_anexos governo_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governo_anexos
    ADD CONSTRAINT governo_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: governos governos_legislatura_id_sigla_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governos
    ADD CONSTRAINT governos_legislatura_id_sigla_unique UNIQUE (legislatura_id, sigla);


--
-- Name: governos governos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governos
    ADD CONSTRAINT governos_pkey PRIMARY KEY (id);


--
-- Name: governos governos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governos
    ADD CONSTRAINT governos_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_anexos instituicao_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_anexos
    ADD CONSTRAINT instituicao_anexos_pkey PRIMARY KEY (id);


--
-- Name: instituicao_anexos instituicao_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_anexos
    ADD CONSTRAINT instituicao_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_cargo_anexos instituicao_cargo_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_anexos
    ADD CONSTRAINT instituicao_cargo_anexos_pkey PRIMARY KEY (id);


--
-- Name: instituicao_cargo_anexos instituicao_cargo_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_anexos
    ADD CONSTRAINT instituicao_cargo_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_cargo_leis instituicao_cargo_leis_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_leis
    ADD CONSTRAINT instituicao_cargo_leis_pkey PRIMARY KEY (id);


--
-- Name: instituicao_cargos instituicao_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargos
    ADD CONSTRAINT instituicao_cargos_pkey PRIMARY KEY (id);


--
-- Name: instituicao_com_tipos instituicao_com_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_com_tipos
    ADD CONSTRAINT instituicao_com_tipos_pkey PRIMARY KEY (id);


--
-- Name: instituicao_contactos instituicao_contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_contactos
    ADD CONSTRAINT instituicao_contactos_pkey PRIMARY KEY (id);


--
-- Name: instituicao_dados instituicao_dados_nif_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_dados
    ADD CONSTRAINT instituicao_dados_nif_unique UNIQUE (nif);


--
-- Name: instituicao_dados instituicao_dados_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_dados
    ADD CONSTRAINT instituicao_dados_pkey PRIMARY KEY (id);


--
-- Name: instituicao_entidade_juridicas instituicao_entidade_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_entidade_juridicas
    ADD CONSTRAINT instituicao_entidade_juridicas_pkey PRIMARY KEY (id);


--
-- Name: instituicao_governos instituicao_governos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_governos
    ADD CONSTRAINT instituicao_governos_pkey PRIMARY KEY (id);


--
-- Name: instituicao_governos instituicao_governos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_governos
    ADD CONSTRAINT instituicao_governos_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_legislatura_anexos instituicao_legislatura_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislatura_anexos
    ADD CONSTRAINT instituicao_legislatura_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_legislaturas instituicao_legislaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislaturas
    ADD CONSTRAINT instituicao_legislaturas_pkey PRIMARY KEY (id);


--
-- Name: instituicao_legislaturas instituicao_legislaturas_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislaturas
    ADD CONSTRAINT instituicao_legislaturas_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_leis instituicao_leis_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_leis
    ADD CONSTRAINT instituicao_leis_pkey PRIMARY KEY (id);


--
-- Name: instituicao_moradas instituicao_moradas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_moradas
    ADD CONSTRAINT instituicao_moradas_pkey PRIMARY KEY (id);


--
-- Name: instituicao_nacionalidades instituicao_nacionalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_nacionalidades
    ADD CONSTRAINT instituicao_nacionalidades_pkey PRIMARY KEY (id);


--
-- Name: instituicao_presidenciais instituicao_presidenciais_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidenciais
    ADD CONSTRAINT instituicao_presidenciais_pkey PRIMARY KEY (id);


--
-- Name: instituicao_presidenciais instituicao_presidenciais_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidenciais
    ADD CONSTRAINT instituicao_presidenciais_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_presidencial_anexos instituicao_presidencial_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidencial_anexos
    ADD CONSTRAINT instituicao_presidencial_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: instituicao_relacoes instituicao_relacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_relacoes
    ADD CONSTRAINT instituicao_relacoes_pkey PRIMARY KEY (id);


--
-- Name: instituicao_tipos instituicao_tipos_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_tipos
    ADD CONSTRAINT instituicao_tipos_codigo_unique UNIQUE (codigo);


--
-- Name: instituicao_tipos instituicao_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_tipos
    ADD CONSTRAINT instituicao_tipos_pkey PRIMARY KEY (id);


--
-- Name: instituicao_tipos instituicao_tipos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_tipos
    ADD CONSTRAINT instituicao_tipos_uuid_unique UNIQUE (uuid);


--
-- Name: instituicoes instituicoes_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicoes
    ADD CONSTRAINT instituicoes_pkey PRIMARY KEY (id);


--
-- Name: instituicoes instituicoes_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicoes
    ADD CONSTRAINT instituicoes_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: legislatura_anexos legislatura_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislatura_anexos
    ADD CONSTRAINT legislatura_anexos_pkey PRIMARY KEY (id);


--
-- Name: legislatura_anexos legislatura_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislatura_anexos
    ADD CONSTRAINT legislatura_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: legislaturas legislaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislaturas
    ADD CONSTRAINT legislaturas_pkey PRIMARY KEY (id);


--
-- Name: legislaturas legislaturas_republica_id_sigla_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislaturas
    ADD CONSTRAINT legislaturas_republica_id_sigla_unique UNIQUE (republica_id, sigla);


--
-- Name: legislaturas legislaturas_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislaturas
    ADD CONSTRAINT legislaturas_uuid_unique UNIQUE (uuid);


--
-- Name: lei_adendas lei_adendas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_adendas
    ADD CONSTRAINT lei_adendas_pkey PRIMARY KEY (id);


--
-- Name: lei_anexos lei_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_anexos
    ADD CONSTRAINT lei_anexos_pkey PRIMARY KEY (id);


--
-- Name: lei_anexos lei_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_anexos
    ADD CONSTRAINT lei_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: lei_emissores lei_emissores_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_emissores
    ADD CONSTRAINT lei_emissores_pkey PRIMARY KEY (id);


--
-- Name: lei_partes lei_partes_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_partes
    ADD CONSTRAINT lei_partes_pkey PRIMARY KEY (id);


--
-- Name: lei_partes lei_partes_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_partes
    ADD CONSTRAINT lei_partes_uuid_unique UNIQUE (uuid);


--
-- Name: lei_tipos lei_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_tipos
    ADD CONSTRAINT lei_tipos_pkey PRIMARY KEY (id);


--
-- Name: lei_tipos lei_tipos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_tipos
    ADD CONSTRAINT lei_tipos_uuid_unique UNIQUE (uuid);


--
-- Name: leis leis_codigo_lei_tipo_id_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.leis
    ADD CONSTRAINT leis_codigo_lei_tipo_id_unique UNIQUE (codigo, lei_tipo_id);


--
-- Name: leis leis_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.leis
    ADD CONSTRAINT leis_pkey PRIMARY KEY (id);


--
-- Name: leis leis_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.leis
    ADD CONSTRAINT leis_uuid_unique UNIQUE (uuid);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: nacionalidades nacionalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_pkey PRIMARY KEY (id);


--
-- Name: newsletter_users newsletter_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.newsletter_users
    ADD CONSTRAINT newsletter_users_email_unique UNIQUE (email);


--
-- Name: newsletter_users newsletter_users_hash_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.newsletter_users
    ADD CONSTRAINT newsletter_users_hash_unique UNIQUE (hash);


--
-- Name: newsletter_users newsletter_users_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.newsletter_users
    ADD CONSTRAINT newsletter_users_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_code_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_code_unique UNIQUE (code);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_uuid_unique UNIQUE (uuid);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: presidenciais presidenciais_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidenciais
    ADD CONSTRAINT presidenciais_pkey PRIMARY KEY (id);


--
-- Name: presidenciais presidenciais_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidenciais
    ADD CONSTRAINT presidenciais_uuid_unique UNIQUE (uuid);


--
-- Name: presidencial_anexos presidencial_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidencial_anexos
    ADD CONSTRAINT presidencial_anexos_pkey PRIMARY KEY (id);


--
-- Name: presidencial_anexos presidencial_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidencial_anexos
    ADD CONSTRAINT presidencial_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: relacao_tipos relacao_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.relacao_tipos
    ADD CONSTRAINT relacao_tipos_pkey PRIMARY KEY (id);


--
-- Name: republica_anexos republica_anexos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republica_anexos
    ADD CONSTRAINT republica_anexos_pkey PRIMARY KEY (id);


--
-- Name: republica_anexos republica_anexos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republica_anexos
    ADD CONSTRAINT republica_anexos_uuid_unique UNIQUE (uuid);


--
-- Name: republicas republicas_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republicas
    ADD CONSTRAINT republicas_pkey PRIMARY KEY (id);


--
-- Name: republicas republicas_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republicas
    ADD CONSTRAINT republicas_uuid_unique UNIQUE (uuid);


--
-- Name: role_cargos role_cargos_code_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_cargos
    ADD CONSTRAINT role_cargos_code_unique UNIQUE (code);


--
-- Name: role_cargos role_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_cargos
    ADD CONSTRAINT role_cargos_pkey PRIMARY KEY (id);


--
-- Name: role_cargos role_cargos_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_cargos
    ADD CONSTRAINT role_cargos_uuid_unique UNIQUE (uuid);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_code_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_code_unique UNIQUE (code);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles roles_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_uuid_unique UNIQUE (uuid);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: statuses statuses_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_uuid_unique UNIQUE (uuid);


--
-- Name: user_comentarios user_comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_comentarios
    ADD CONSTRAINT user_comentarios_pkey PRIMARY KEY (id);


--
-- Name: user_permissions user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_uuid_unique UNIQUE (uuid);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: local_user
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: local_user
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: local_user
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: local_user
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: statuses_tipo_status_index; Type: INDEX; Schema: public; Owner: local_user
--

CREATE INDEX statuses_tipo_status_index ON public.statuses USING btree (tipo, status);


--
-- Name: cidadao_anexos cidadao_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_anexos
    ADD CONSTRAINT cidadao_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: cidadao_anexos cidadao_anexos_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_anexos
    ADD CONSTRAINT cidadao_anexos_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_cargo_anexos cidadao_cargo_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargo_anexos
    ADD CONSTRAINT cidadao_cargo_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: cidadao_cargo_anexos cidadao_cargo_anexos_cidadao_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargo_anexos
    ADD CONSTRAINT cidadao_cargo_anexos_cidadao_cargo_id_foreign FOREIGN KEY (cidadao_cargo_id) REFERENCES public.cidadao_cargos(id);


--
-- Name: cidadao_cargos cidadao_cargos_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargos
    ADD CONSTRAINT cidadao_cargos_cargo_id_foreign FOREIGN KEY (cargo_id) REFERENCES public.instituicao_cargos(id);


--
-- Name: cidadao_cargos cidadao_cargos_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargos
    ADD CONSTRAINT cidadao_cargos_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_cargos cidadao_cargos_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_cargos
    ADD CONSTRAINT cidadao_cargos_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: cidadao_contactos cidadao_contactos_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_contactos
    ADD CONSTRAINT cidadao_contactos_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_contactos cidadao_contactos_contacto_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_contactos
    ADD CONSTRAINT cidadao_contactos_contacto_tipo_id_foreign FOREIGN KEY (contacto_tipo_id) REFERENCES public.contacto_tipos(id);


--
-- Name: cidadao_dados cidadao_dados_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_dados
    ADD CONSTRAINT cidadao_dados_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_moradas cidadao_moradas_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_moradas
    ADD CONSTRAINT cidadao_moradas_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_moradas cidadao_moradas_concelho_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_moradas
    ADD CONSTRAINT cidadao_moradas_concelho_id_foreign FOREIGN KEY (concelho_id) REFERENCES public.concelhos(id);


--
-- Name: cidadao_nacionalidades cidadao_nacionalidades_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_nacionalidades
    ADD CONSTRAINT cidadao_nacionalidades_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_nacionalidades cidadao_nacionalidades_nacionalidade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_nacionalidades
    ADD CONSTRAINT cidadao_nacionalidades_nacionalidade_id_foreign FOREIGN KEY (nacionalidade_id) REFERENCES public.nacionalidades(id);


--
-- Name: cidadao_relacoes cidadao_relacoes_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_relacoes
    ADD CONSTRAINT cidadao_relacoes_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_relacoes cidadao_relacoes_com_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_relacoes
    ADD CONSTRAINT cidadao_relacoes_com_cidadao_id_foreign FOREIGN KEY (com_cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: cidadao_relacoes cidadao_relacoes_relacao_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadao_relacoes
    ADD CONSTRAINT cidadao_relacoes_relacao_tipo_id_foreign FOREIGN KEY (relacao_tipo_id) REFERENCES public.relacao_tipos(id);


--
-- Name: cidadaos cidadaos_freguesia_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.cidadaos
    ADD CONSTRAINT cidadaos_freguesia_id_foreign FOREIGN KEY (freguesia_id) REFERENCES public.freguesias(id);


--
-- Name: concelho_anexos concelho_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelho_anexos
    ADD CONSTRAINT concelho_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: concelho_anexos concelho_anexos_concelho_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelho_anexos
    ADD CONSTRAINT concelho_anexos_concelho_id_foreign FOREIGN KEY (concelho_id) REFERENCES public.concelhos(id);


--
-- Name: concelhos concelhos_distrito_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.concelhos
    ADD CONSTRAINT concelhos_distrito_id_foreign FOREIGN KEY (distrito_id) REFERENCES public.distritos(id);


--
-- Name: conselho_ministros conselho_ministros_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.conselho_ministros
    ADD CONSTRAINT conselho_ministros_cargo_id_foreign FOREIGN KEY (cargo_id) REFERENCES public.instituicao_cargos(id);


--
-- Name: conselho_ministros conselho_ministros_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.conselho_ministros
    ADD CONSTRAINT conselho_ministros_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: conselho_ministros conselho_ministros_instituicao_governo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.conselho_ministros
    ADD CONSTRAINT conselho_ministros_instituicao_governo_id_foreign FOREIGN KEY (instituicao_governo_id) REFERENCES public.instituicao_governos(id);


--
-- Name: diario_republica_publicacao_anexos diario_republica_publicacao_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_anexos
    ADD CONSTRAINT diario_republica_publicacao_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: diario_republica_publicacao_anexos diario_republica_publicacao_anexos_diario_republica_publicacao_; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_anexos
    ADD CONSTRAINT diario_republica_publicacao_anexos_diario_republica_publicacao_ FOREIGN KEY (diario_republica_publicacao_id) REFERENCES public.diario_republica_publicacoes(id);


--
-- Name: diario_republica_publicacao_leis diario_republica_publicacao_leis_dr_publicacao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_leis
    ADD CONSTRAINT diario_republica_publicacao_leis_dr_publicacao_id_foreign FOREIGN KEY (dr_publicacao_id) REFERENCES public.diario_republica_publicacoes(id);


--
-- Name: diario_republica_publicacao_leis diario_republica_publicacao_leis_lei_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacao_leis
    ADD CONSTRAINT diario_republica_publicacao_leis_lei_id_foreign FOREIGN KEY (lei_id) REFERENCES public.leis(id);


--
-- Name: diario_republica_publicacoes diario_republica_publicacoes_diario_republica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacoes
    ADD CONSTRAINT diario_republica_publicacoes_diario_republica_id_foreign FOREIGN KEY (diario_republica_id) REFERENCES public.diario_republicas(id);


--
-- Name: diario_republica_publicacoes diario_republica_publicacoes_serie_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.diario_republica_publicacoes
    ADD CONSTRAINT diario_republica_publicacoes_serie_id_foreign FOREIGN KEY (serie_id) REFERENCES public.diario_republica_series(id);


--
-- Name: distrito_anexos distrito_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distrito_anexos
    ADD CONSTRAINT distrito_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: distrito_anexos distrito_anexos_distrito_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.distrito_anexos
    ADD CONSTRAINT distrito_anexos_distrito_id_foreign FOREIGN KEY (distrito_id) REFERENCES public.distritos(id);


--
-- Name: entidade_juridica_anexos entidade_juridica_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_anexos
    ADD CONSTRAINT entidade_juridica_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: entidade_juridica_anexos entidade_juridica_anexos_entidades_juridica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_anexos
    ADD CONSTRAINT entidade_juridica_anexos_entidades_juridica_id_foreign FOREIGN KEY (entidades_juridica_id) REFERENCES public.entidade_juridicas(id);


--
-- Name: entidade_juridica_leis entidade_juridica_leis_entidade_juridica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_leis
    ADD CONSTRAINT entidade_juridica_leis_entidade_juridica_id_foreign FOREIGN KEY (entidade_juridica_id) REFERENCES public.entidade_juridicas(id);


--
-- Name: entidade_juridica_leis entidade_juridica_leis_lei_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.entidade_juridica_leis
    ADD CONSTRAINT entidade_juridica_leis_lei_id_foreign FOREIGN KEY (lei_id) REFERENCES public.leis(id);


--
-- Name: instituicao_legislatura_anexos fk_inst_leg_anexo_tipo_id; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislatura_anexos
    ADD CONSTRAINT fk_inst_leg_anexo_tipo_id FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: instituicao_presidencial_anexos fk_inst_pres_anexo_tipo_id; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidencial_anexos
    ADD CONSTRAINT fk_inst_pres_anexo_tipo_id FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: instituicao_legislatura_anexos fk_legislatura_id; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislatura_anexos
    ADD CONSTRAINT fk_legislatura_id FOREIGN KEY (instituicao_legislatura_id) REFERENCES public.instituicao_legislaturas(id);


--
-- Name: instituicao_presidencial_anexos fk_presidencial_id; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidencial_anexos
    ADD CONSTRAINT fk_presidencial_id FOREIGN KEY (instituicao_presidencial_id) REFERENCES public.instituicao_presidenciais(id);


--
-- Name: freguesia_anexos freguesia_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesia_anexos
    ADD CONSTRAINT freguesia_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: freguesia_anexos freguesia_anexos_freguesia_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesia_anexos
    ADD CONSTRAINT freguesia_anexos_freguesia_id_foreign FOREIGN KEY (freguesia_id) REFERENCES public.freguesias(id);


--
-- Name: freguesias freguesias_concelho_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesias
    ADD CONSTRAINT freguesias_concelho_id_foreign FOREIGN KEY (concelho_id) REFERENCES public.concelhos(id);


--
-- Name: freguesias freguesias_distrito_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesias
    ADD CONSTRAINT freguesias_distrito_id_foreign FOREIGN KEY (distrito_id) REFERENCES public.distritos(id);


--
-- Name: freguesias freguesias_freguesia_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.freguesias
    ADD CONSTRAINT freguesias_freguesia_tipo_id_foreign FOREIGN KEY (freguesia_tipo_id) REFERENCES public.freguesia_tipos(id);


--
-- Name: governo_anexos governo_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governo_anexos
    ADD CONSTRAINT governo_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: governo_anexos governo_anexos_governo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governo_anexos
    ADD CONSTRAINT governo_anexos_governo_id_foreign FOREIGN KEY (governo_id) REFERENCES public.governos(id);


--
-- Name: governos governos_legislatura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governos
    ADD CONSTRAINT governos_legislatura_id_foreign FOREIGN KEY (legislatura_id) REFERENCES public.legislaturas(id);


--
-- Name: governos governos_republica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.governos
    ADD CONSTRAINT governos_republica_id_foreign FOREIGN KEY (republica_id) REFERENCES public.republicas(id);


--
-- Name: instituicao_anexos instituicao_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_anexos
    ADD CONSTRAINT instituicao_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: instituicao_anexos instituicao_anexos_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_anexos
    ADD CONSTRAINT instituicao_anexos_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_cargo_anexos instituicao_cargo_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_anexos
    ADD CONSTRAINT instituicao_cargo_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: instituicao_cargo_anexos instituicao_cargo_anexos_instituicao_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_anexos
    ADD CONSTRAINT instituicao_cargo_anexos_instituicao_cargo_id_foreign FOREIGN KEY (instituicao_cargo_id) REFERENCES public.instituicao_cargos(id);


--
-- Name: instituicao_cargo_leis instituicao_cargo_leis_instituicao_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_leis
    ADD CONSTRAINT instituicao_cargo_leis_instituicao_cargo_id_foreign FOREIGN KEY (instituicao_cargo_id) REFERENCES public.instituicao_cargos(id);


--
-- Name: instituicao_cargo_leis instituicao_cargo_leis_lei_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargo_leis
    ADD CONSTRAINT instituicao_cargo_leis_lei_id_foreign FOREIGN KEY (lei_id) REFERENCES public.leis(id);


--
-- Name: instituicao_cargos instituicao_cargos_cargo_responde_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_cargos
    ADD CONSTRAINT instituicao_cargos_cargo_responde_id_foreign FOREIGN KEY (cargo_responde_id) REFERENCES public.instituicao_cargos(id);


--
-- Name: instituicao_com_tipos instituicao_com_tipos_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_com_tipos
    ADD CONSTRAINT instituicao_com_tipos_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_com_tipos instituicao_com_tipos_instituicao_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_com_tipos
    ADD CONSTRAINT instituicao_com_tipos_instituicao_tipo_id_foreign FOREIGN KEY (instituicao_tipo_id) REFERENCES public.instituicao_tipos(id);


--
-- Name: instituicao_contactos instituicao_contactos_contacto_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_contactos
    ADD CONSTRAINT instituicao_contactos_contacto_tipo_id_foreign FOREIGN KEY (contacto_tipo_id) REFERENCES public.contacto_tipos(id);


--
-- Name: instituicao_contactos instituicao_contactos_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_contactos
    ADD CONSTRAINT instituicao_contactos_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_dados instituicao_dados_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_dados
    ADD CONSTRAINT instituicao_dados_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_entidade_juridicas instituicao_entidade_juridicas_entidade_juridica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_entidade_juridicas
    ADD CONSTRAINT instituicao_entidade_juridicas_entidade_juridica_id_foreign FOREIGN KEY (entidade_juridica_id) REFERENCES public.entidade_juridicas(id);


--
-- Name: instituicao_entidade_juridicas instituicao_entidade_juridicas_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_entidade_juridicas
    ADD CONSTRAINT instituicao_entidade_juridicas_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_governos instituicao_governos_governo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_governos
    ADD CONSTRAINT instituicao_governos_governo_id_foreign FOREIGN KEY (governo_id) REFERENCES public.governos(id);


--
-- Name: instituicao_governos instituicao_governos_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_governos
    ADD CONSTRAINT instituicao_governos_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_legislaturas instituicao_legislaturas_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislaturas
    ADD CONSTRAINT instituicao_legislaturas_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_legislaturas instituicao_legislaturas_legislatura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_legislaturas
    ADD CONSTRAINT instituicao_legislaturas_legislatura_id_foreign FOREIGN KEY (legislatura_id) REFERENCES public.legislaturas(id);


--
-- Name: instituicao_leis instituicao_leis_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_leis
    ADD CONSTRAINT instituicao_leis_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_leis instituicao_leis_lei_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_leis
    ADD CONSTRAINT instituicao_leis_lei_id_foreign FOREIGN KEY (lei_id) REFERENCES public.leis(id);


--
-- Name: instituicao_moradas instituicao_moradas_concelho_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_moradas
    ADD CONSTRAINT instituicao_moradas_concelho_id_foreign FOREIGN KEY (concelho_id) REFERENCES public.concelhos(id);


--
-- Name: instituicao_moradas instituicao_moradas_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_moradas
    ADD CONSTRAINT instituicao_moradas_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_nacionalidades instituicao_nacionalidades_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_nacionalidades
    ADD CONSTRAINT instituicao_nacionalidades_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_nacionalidades instituicao_nacionalidades_nacionalidade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_nacionalidades
    ADD CONSTRAINT instituicao_nacionalidades_nacionalidade_id_foreign FOREIGN KEY (nacionalidade_id) REFERENCES public.nacionalidades(id);


--
-- Name: instituicao_presidenciais instituicao_presidenciais_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidenciais
    ADD CONSTRAINT instituicao_presidenciais_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_presidenciais instituicao_presidenciais_presidencial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_presidenciais
    ADD CONSTRAINT instituicao_presidenciais_presidencial_id_foreign FOREIGN KEY (presidencial_id) REFERENCES public.presidenciais(id);


--
-- Name: instituicao_relacoes instituicao_relacoes_com_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_relacoes
    ADD CONSTRAINT instituicao_relacoes_com_cidadao_id_foreign FOREIGN KEY (com_cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: instituicao_relacoes instituicao_relacoes_com_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_relacoes
    ADD CONSTRAINT instituicao_relacoes_com_instituicao_id_foreign FOREIGN KEY (com_instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_relacoes instituicao_relacoes_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_relacoes
    ADD CONSTRAINT instituicao_relacoes_instituicao_id_foreign FOREIGN KEY (instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: instituicao_relacoes instituicao_relacoes_relacao_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicao_relacoes
    ADD CONSTRAINT instituicao_relacoes_relacao_tipo_id_foreign FOREIGN KEY (relacao_tipo_id) REFERENCES public.relacao_tipos(id);


--
-- Name: instituicoes instituicoes_responde_instituicao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.instituicoes
    ADD CONSTRAINT instituicoes_responde_instituicao_id_foreign FOREIGN KEY (responde_instituicao_id) REFERENCES public.instituicoes(id);


--
-- Name: legislatura_anexos legislatura_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislatura_anexos
    ADD CONSTRAINT legislatura_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: legislatura_anexos legislatura_anexos_legislatura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislatura_anexos
    ADD CONSTRAINT legislatura_anexos_legislatura_id_foreign FOREIGN KEY (legislatura_id) REFERENCES public.legislaturas(id);


--
-- Name: legislaturas legislaturas_republica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.legislaturas
    ADD CONSTRAINT legislaturas_republica_id_foreign FOREIGN KEY (republica_id) REFERENCES public.republicas(id);


--
-- Name: lei_adendas lei_adendas_lei_adenda_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_adendas
    ADD CONSTRAINT lei_adendas_lei_adenda_id_foreign FOREIGN KEY (lei_adenda_id) REFERENCES public.leis(id);


--
-- Name: lei_adendas lei_adendas_lei_original_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_adendas
    ADD CONSTRAINT lei_adendas_lei_original_id_foreign FOREIGN KEY (lei_original_id) REFERENCES public.leis(id);


--
-- Name: lei_anexos lei_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_anexos
    ADD CONSTRAINT lei_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: lei_anexos lei_anexos_lei_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_anexos
    ADD CONSTRAINT lei_anexos_lei_id_foreign FOREIGN KEY (lei_id) REFERENCES public.leis(id);


--
-- Name: lei_emissores lei_emissores_lei_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.lei_emissores
    ADD CONSTRAINT lei_emissores_lei_id_foreign FOREIGN KEY (lei_id) REFERENCES public.leis(id);


--
-- Name: leis leis_lei_parte_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.leis
    ADD CONSTRAINT leis_lei_parte_id_foreign FOREIGN KEY (lei_parte_id) REFERENCES public.lei_partes(id);


--
-- Name: leis leis_lei_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.leis
    ADD CONSTRAINT leis_lei_tipo_id_foreign FOREIGN KEY (lei_tipo_id) REFERENCES public.lei_tipos(id);


--
-- Name: logs logs_aplicacao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_aplicacao_id_foreign FOREIGN KEY (aplicacao_id) REFERENCES public.aplicacoes(id);


--
-- Name: logs logs_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: presidenciais presidenciais_republica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidenciais
    ADD CONSTRAINT presidenciais_republica_id_foreign FOREIGN KEY (republica_id) REFERENCES public.republicas(id);


--
-- Name: presidencial_anexos presidencial_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidencial_anexos
    ADD CONSTRAINT presidencial_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: presidencial_anexos presidencial_anexos_presidencial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.presidencial_anexos
    ADD CONSTRAINT presidencial_anexos_presidencial_id_foreign FOREIGN KEY (presidencial_id) REFERENCES public.presidenciais(id);


--
-- Name: republica_anexos republica_anexos_anexo_tipo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republica_anexos
    ADD CONSTRAINT republica_anexos_anexo_tipo_id_foreign FOREIGN KEY (anexo_tipo_id) REFERENCES public.anexo_tipos(id);


--
-- Name: republica_anexos republica_anexos_republica_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.republica_anexos
    ADD CONSTRAINT republica_anexos_republica_id_foreign FOREIGN KEY (republica_id) REFERENCES public.republicas(id);


--
-- Name: role_cargos role_cargos_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_cargos
    ADD CONSTRAINT role_cargos_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: role_permissions role_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: role_permissions role_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: user_comentarios user_comentarios_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_comentarios
    ADD CONSTRAINT user_comentarios_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_permissions user_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: user_permissions user_permissions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_roles user_roles_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_cargo_id_foreign FOREIGN KEY (cargo_id) REFERENCES public.role_cargos(id);


--
-- Name: user_roles user_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: user_roles user_roles_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users users_cidadao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cidadao_id_foreign FOREIGN KEY (cidadao_id) REFERENCES public.cidadaos(id);


--
-- Name: users users_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: local_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_status_id_foreign FOREIGN KEY (status_id) REFERENCES public.statuses(id);


--
-- PostgreSQL database dump complete
--

