--
-- PostgreSQL database dump
--

\restrict jJmkErVbxnZ0cr5E5NoO0CHW24QA3kMEsuh0aeFuxPbFRgRSDIZJ5uMdmXk3M4A

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-07-09 17:39:24 UTC

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

--
-- TOC entry 18 (class 2615 OID 16498)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- TOC entry 14 (class 2615 OID 16392)
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- TOC entry 17 (class 2615 OID 16578)
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- TOC entry 16 (class 2615 OID 16567)
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- TOC entry 11 (class 2615 OID 16390)
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- TOC entry 8 (class 2615 OID 16559)
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- TOC entry 19 (class 2615 OID 16546)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- TOC entry 15 (class 2615 OID 16607)
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- TOC entry 4 (class 3079 OID 16393)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 2 (class 3079 OID 16447)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 5 (class 3079 OID 16608)
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- TOC entry 3 (class 3079 OID 16436)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 1066 (class 1247 OID 16738)
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- TOC entry 1090 (class 1247 OID 16879)
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- TOC entry 1063 (class 1247 OID 16732)
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1060 (class 1247 OID 16727)
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1108 (class 1247 OID 16982)
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1120 (class 1247 OID 17055)
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1102 (class 1247 OID 16960)
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1111 (class 1247 OID 16992)
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1096 (class 1247 OID 16921)
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1147 (class 1247 OID 17206)
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- TOC entry 1138 (class 1247 OID 17166)
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- TOC entry 1141 (class 1247 OID 17181)
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- TOC entry 1153 (class 1247 OID 17248)
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- TOC entry 1150 (class 1247 OID 17219)
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- TOC entry 1171 (class 1247 OID 17438)
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- TOC entry 371 (class 1255 OID 16544)
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 371
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- TOC entry 383 (class 1255 OID 16709)
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- TOC entry 370 (class 1255 OID 16543)
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 370
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- TOC entry 369 (class 1255 OID 16542)
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 369
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- TOC entry 372 (class 1255 OID 16551)
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 372
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- TOC entry 376 (class 1255 OID 16572)
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 376
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- TOC entry 373 (class 1255 OID 16553)
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 373
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- TOC entry 374 (class 1255 OID 16563)
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- TOC entry 375 (class 1255 OID 16564)
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- TOC entry 377 (class 1255 OID 16574)
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 377
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- TOC entry 413 (class 1255 OID 33388)
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: supabase_admin
--

CREATE FUNCTION graphql_public.graphql("operationName" text DEFAULT NULL::text, query text DEFAULT NULL::text, variables jsonb DEFAULT NULL::jsonb, extensions jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;


ALTER FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) OWNER TO supabase_admin;

--
-- TOC entry 319 (class 1255 OID 16391)
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- TOC entry 389 (class 1255 OID 17241)
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 410 (class 1255 OID 17511)
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- TOC entry 391 (class 1255 OID 17253)
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- TOC entry 387 (class 1255 OID 17203)
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- TOC entry 386 (class 1255 OID 17198)
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- TOC entry 390 (class 1255 OID 17249)
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- TOC entry 392 (class 1255 OID 17260)
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 385 (class 1255 OID 17197)
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- TOC entry 409 (class 1255 OID 17510)
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- TOC entry 384 (class 1255 OID 17195)
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- TOC entry 388 (class 1255 OID 17230)
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- TOC entry 393 (class 1255 OID 17313)
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- TOC entry 412 (class 1255 OID 28894)
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


ALTER FUNCTION storage.allow_any_operation(expected_operations text[]) OWNER TO supabase_storage_admin;

--
-- TOC entry 411 (class 1255 OID 28893)
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


ALTER FUNCTION storage.allow_only_operation(expected_operation text) OWNER TO supabase_storage_admin;

--
-- TOC entry 400 (class 1255 OID 17379)
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- TOC entry 403 (class 1255 OID 17435)
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- TOC entry 396 (class 1255 OID 17354)
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Get the last path segment (the actual filename)
    SELECT _parts[array_length(_parts, 1)] INTO _filename;
    -- Extract extension: reverse, split on '.', then reverse again
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 395 (class 1255 OID 17353)
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 394 (class 1255 OID 17352)
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 404 (class 1255 OID 17492)
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- TOC entry 397 (class 1255 OID 17366)
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint)::bigint as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- TOC entry 401 (class 1255 OID 17418)
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 405 (class 1255 OID 17493)
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- TOC entry 402 (class 1255 OID 17434)
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- TOC entry 408 (class 1255 OID 17499)
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- TOC entry 398 (class 1255 OID 17368)
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 407 (class 1255 OID 17497)
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- TOC entry 406 (class 1255 OID 17496)
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- TOC entry 399 (class 1255 OID 17369)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 239 (class 1259 OID 16529)
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- TOC entry 258 (class 1259 OID 17078)
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    custom_claims_allowlist text[] DEFAULT '{}'::text[] NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 252 (class 1259 OID 16883)
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- TOC entry 243 (class 1259 OID 16681)
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- TOC entry 238 (class 1259 OID 16522)
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- TOC entry 247 (class 1259 OID 16770)
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- TOC entry 246 (class 1259 OID 16758)
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- TOC entry 245 (class 1259 OID 16745)
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- TOC entry 255 (class 1259 OID 16995)
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- TOC entry 257 (class 1259 OID 17068)
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- TOC entry 254 (class 1259 OID 16965)
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- TOC entry 256 (class 1259 OID 17028)
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- TOC entry 253 (class 1259 OID 16933)
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 237 (class 1259 OID 16511)
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- TOC entry 236 (class 1259 OID 16510)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 236
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- TOC entry 250 (class 1259 OID 16812)
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- TOC entry 251 (class 1259 OID 16830)
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- TOC entry 240 (class 1259 OID 16537)
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- TOC entry 244 (class 1259 OID 16711)
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- TOC entry 249 (class 1259 OID 16797)
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- TOC entry 248 (class 1259 OID 16788)
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- TOC entry 235 (class 1259 OID 16499)
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- TOC entry 260 (class 1259 OID 17143)
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


ALTER TABLE auth.webauthn_challenges OWNER TO supabase_auth_admin;

--
-- TOC entry 259 (class 1259 OID 17120)
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


ALTER TABLE auth.webauthn_credentials OWNER TO supabase_auth_admin;

--
-- TOC entry 276 (class 1259 OID 17535)
-- Name: appointment_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_history (
    id bigint NOT NULL,
    appointment_id bigint NOT NULL,
    old_status character varying(255),
    new_status character varying(255) NOT NULL,
    changed_by bigint,
    reason text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.appointment_history OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 17540)
-- Name: appointment_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointment_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointment_history_id_seq OWNER TO postgres;

--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 277
-- Name: appointment_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointment_history_id_seq OWNED BY public.appointment_history.id;


--
-- TOC entry 278 (class 1259 OID 17541)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    worker_id bigint NOT NULL,
    client_id bigint,
    starts_at timestamp(0) without time zone NOT NULL,
    ends_at timestamp(0) without time zone NOT NULL,
    status character varying(255) NOT NULL,
    changed_by bigint,
    notes text,
    reason text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 17547)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO postgres;

--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 279
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 280 (class 1259 OID 17548)
-- Name: business_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_hours (
    id bigint NOT NULL,
    day_of_week smallint NOT NULL,
    start_time time(0) without time zone NOT NULL,
    end_time time(0) without time zone NOT NULL,
    is_working boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.business_hours OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 17552)
-- Name: business_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_hours_id_seq OWNER TO postgres;

--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 281
-- Name: business_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_hours_id_seq OWNED BY public.business_hours.id;


--
-- TOC entry 282 (class 1259 OID 17553)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 17558)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 17563)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 17566)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 285
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 286 (class 1259 OID 17567)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17573)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 287
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 288 (class 1259 OID 17574)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 17579)
-- Name: job_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_positions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.job_positions OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 17584)
-- Name: job_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_position_id_seq OWNER TO postgres;

--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 290
-- Name: job_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_position_id_seq OWNED BY public.job_positions.id;


--
-- TOC entry 291 (class 1259 OID 17585)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 17590)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 292
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 293 (class 1259 OID 17591)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 17594)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 294
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 295 (class 1259 OID 17595)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 17600)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 17605)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 297
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 298 (class 1259 OID 17606)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 17609)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 299
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 300 (class 1259 OID 17610)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    category_id bigint,
    duration integer NOT NULL,
    price numeric(8,2) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    image character varying(255),
    preparation_time integer DEFAULT 0 NOT NULL,
    cleanup_time integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 17618)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 301
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 302 (class 1259 OID 17619)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 17624)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    phone character varying(255),
    gender character varying(255),
    birth_date date,
    role character varying(255) DEFAULT 'client'::character varying NOT NULL,
    is_approved boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    job_position_id bigint,
    can_book_appointments boolean,
    no_show_count integer DEFAULT 0 NOT NULL,
    no_show_total_count integer DEFAULT 0 NOT NULL,
    cancelled_count integer DEFAULT 0 NOT NULL,
    completed_count integer DEFAULT 0 NOT NULL,
    CONSTRAINT users_gender_check CHECK (((gender)::text = ANY (ARRAY[('male'::character varying)::text, ('female'::character varying)::text, ('other'::character varying)::text]))),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY (ARRAY[('admin'::character varying)::text, ('worker'::character varying)::text, ('client'::character varying)::text])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 17638)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 304
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 305 (class 1259 OID 17639)
-- Name: worker_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_service (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    service_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    price_override numeric(8,2),
    duration_override integer
);


ALTER TABLE public.worker_service OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 17642)
-- Name: worker_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.worker_service_id_seq OWNER TO postgres;

--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 306
-- Name: worker_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_service_id_seq OWNED BY public.worker_service.id;


--
-- TOC entry 275 (class 1259 OID 17514)
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- TOC entry 261 (class 1259 OID 17160)
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- TOC entry 264 (class 1259 OID 17183)
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- TOC entry 263 (class 1259 OID 17182)
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 268 (class 1259 OID 17324)
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 272 (class 1259 OID 17444)
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- TOC entry 273 (class 1259 OID 17457)
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- TOC entry 267 (class 1259 OID 17316)
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- TOC entry 269 (class 1259 OID 17334)
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 270 (class 1259 OID 17383)
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- TOC entry 271 (class 1259 OID 17397)
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- TOC entry 274 (class 1259 OID 17467)
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- TOC entry 3686 (class 2604 OID 16514)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 3764 (class 2604 OID 17643)
-- Name: appointment_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_history ALTER COLUMN id SET DEFAULT nextval('public.appointment_history_id_seq'::regclass);


--
-- TOC entry 3765 (class 2604 OID 17644)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3766 (class 2604 OID 17645)
-- Name: business_hours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_hours ALTER COLUMN id SET DEFAULT nextval('public.business_hours_id_seq'::regclass);


--
-- TOC entry 3768 (class 2604 OID 17646)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3769 (class 2604 OID 17647)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3771 (class 2604 OID 17648)
-- Name: job_positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions ALTER COLUMN id SET DEFAULT nextval('public.job_position_id_seq'::regclass);


--
-- TOC entry 3772 (class 2604 OID 17649)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3773 (class 2604 OID 17650)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3774 (class 2604 OID 17651)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3775 (class 2604 OID 17652)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3776 (class 2604 OID 17653)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 3780 (class 2604 OID 17654)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3788 (class 2604 OID 17655)
-- Name: worker_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_service ALTER COLUMN id SET DEFAULT nextval('public.worker_service_id_seq'::regclass);


--
-- TOC entry 4261 (class 0 OID 16529)
-- Dependencies: 239
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- TOC entry 4278 (class 0 OID 17078)
-- Dependencies: 258
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at, custom_claims_allowlist) FROM stdin;
\.


--
-- TOC entry 4272 (class 0 OID 16883)
-- Dependencies: 252
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- TOC entry 4263 (class 0 OID 16681)
-- Dependencies: 243
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- TOC entry 4260 (class 0 OID 16522)
-- Dependencies: 238
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4267 (class 0 OID 16770)
-- Dependencies: 247
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- TOC entry 4266 (class 0 OID 16758)
-- Dependencies: 246
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- TOC entry 4265 (class 0 OID 16745)
-- Dependencies: 245
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- TOC entry 4275 (class 0 OID 16995)
-- Dependencies: 255
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- TOC entry 4277 (class 0 OID 17068)
-- Dependencies: 257
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- TOC entry 4274 (class 0 OID 16965)
-- Dependencies: 254
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- TOC entry 4276 (class 0 OID 17028)
-- Dependencies: 256
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- TOC entry 4273 (class 0 OID 16933)
-- Dependencies: 253
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4259 (class 0 OID 16511)
-- Dependencies: 237
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- TOC entry 4270 (class 0 OID 16812)
-- Dependencies: 250
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- TOC entry 4271 (class 0 OID 16830)
-- Dependencies: 251
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- TOC entry 4262 (class 0 OID 16537)
-- Dependencies: 240
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
20260625000000
\.


--
-- TOC entry 4264 (class 0 OID 16711)
-- Dependencies: 244
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- TOC entry 4269 (class 0 OID 16797)
-- Dependencies: 249
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4268 (class 0 OID 16788)
-- Dependencies: 248
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- TOC entry 4257 (class 0 OID 16499)
-- Dependencies: 235
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- TOC entry 4280 (class 0 OID 17143)
-- Dependencies: 260
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- TOC entry 4279 (class 0 OID 17120)
-- Dependencies: 259
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- TOC entry 4292 (class 0 OID 17535)
-- Dependencies: 276
-- Data for Name: appointment_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_history (id, appointment_id, old_status, new_status, changed_by, reason, created_at, updated_at) FROM stdin;
1	1	\N	pending	6	\N	2026-03-20 17:49:43	2026-03-20 17:49:43
2	2	\N	pending	6	\N	2026-03-29 10:55:02	2026-03-29 10:55:02
3	3	\N	pending	6	\N	2026-03-29 10:58:52	2026-03-29 10:58:52
4	4	\N	pending	6	\N	2026-03-29 10:59:41	2026-03-29 10:59:41
5	5	\N	pending	6	\N	2026-03-29 11:00:03	2026-03-29 11:00:03
6	5	pending	confirmed	2	\N	2026-03-29 11:00:27	2026-03-29 11:00:27
7	4	pending	confirmed	2	\N	2026-03-29 11:00:32	2026-03-29 11:00:32
8	4	confirmed	cancelled	6	\N	2026-03-29 11:08:21	2026-03-29 11:08:21
9	5	confirmed	in_progress	2	\N	2026-03-29 11:28:48	2026-03-29 11:28:48
10	3	pending	confirmed	2	\N	2026-03-29 11:39:41	2026-03-29 11:39:41
11	5	in_progress	completed	2	\N	2026-03-29 12:31:03	2026-03-29 12:31:03
12	2	pending	declined	2	\N	2026-03-29 15:14:47	2026-03-29 15:14:47
13	6	\N	pending	6	\N	2026-03-29 15:15:56	2026-03-29 15:15:56
14	7	\N	pending	6	\N	2026-03-29 15:16:21	2026-03-29 15:16:21
15	7	pending	declined	2	\N	2026-03-29 15:17:58	2026-03-29 15:17:58
16	6	pending	confirmed	2	\N	2026-03-29 15:19:40	2026-03-29 15:19:40
17	8	\N	pending	6	\N	2026-03-29 15:20:01	2026-03-29 15:20:01
18	9	\N	pending	6	\N	2026-03-29 15:20:18	2026-03-29 15:20:18
19	10	\N	pending	6	\N	2026-03-29 17:32:57	2026-03-29 17:32:57
20	10	pending	cancelled	6	\N	2026-03-29 17:33:11	2026-03-29 17:33:11
21	11	\N	pending	6	\N	2026-03-29 17:34:16	2026-03-29 17:34:16
22	11	pending	confirmed	2	\N	2026-03-29 17:36:57	2026-03-29 17:36:57
23	11	confirmed	cancelled	6	\N	2026-03-29 17:37:35	2026-03-29 17:37:35
24	12	\N	pending	6	\N	2026-03-29 17:39:05	2026-03-29 17:39:05
25	12	pending	confirmed	2	\N	2026-03-29 17:39:51	2026-03-29 17:39:51
26	12	confirmed	cancelled	6	сдс	2026-03-29 18:39:18	2026-03-29 18:39:18
27	6	confirmed	in_progress	2	\N	2026-03-29 19:47:41	2026-03-29 19:47:41
28	13	\N	pending	6	\N	2026-03-29 20:02:47	2026-03-29 20:02:47
29	14	\N	pending	6	\N	2026-03-29 20:03:13	2026-03-29 20:03:13
30	13	pending	confirmed	2	\N	2026-03-29 20:03:27	2026-03-29 20:03:27
31	14	pending	confirmed	2	\N	2026-03-29 20:03:31	2026-03-29 20:03:31
32	9	pending	confirmed	2	\N	2026-03-29 20:03:34	2026-03-29 20:03:34
33	13	confirmed	in_progress	2	\N	2026-03-29 20:03:44	2026-03-29 20:03:44
34	14	confirmed	in_progress	2	\N	2026-03-29 20:12:02	2026-03-29 20:12:02
35	9	confirmed	in_progress	2	\N	2026-03-29 20:16:22	2026-03-29 20:16:22
36	3	confirmed	in_progress	2	\N	2026-03-29 20:23:05	2026-03-29 20:23:05
37	15	\N	pending	6	\N	2026-03-29 20:33:54	2026-03-29 20:33:54
38	15	pending	confirmed	2	\N	2026-03-29 20:34:34	2026-03-29 20:34:34
39	15	confirmed	declined	2	sdf	2026-03-29 20:55:05	2026-03-29 20:55:05
40	15	confirmed	in_progress	2	\N	2026-03-29 20:56:43	2026-03-29 20:56:43
41	9	confirmed	in_progress	2	\N	2026-03-29 21:06:52	2026-03-29 21:06:52
42	7	confirmed	in_progress	2	\N	2026-03-29 21:06:58	2026-03-29 21:06:58
43	15	in_progress	completed	2	\N	2026-03-29 21:07:03	2026-03-29 21:07:03
44	3	confirmed	in_progress	2	\N	2026-03-29 21:10:44	2026-03-29 21:10:44
45	13	confirmed	declined	2	fsd	2026-03-29 21:13:12	2026-03-29 21:13:12
46	14	confirmed	declined	2	fd	2026-03-29 21:16:06	2026-03-29 21:16:06
47	8	pending	confirmed	2	\N	2026-03-29 21:27:45	2026-03-29 21:27:45
48	13	pending	declined	2	\N	2026-03-29 21:51:30	2026-03-29 21:51:30
49	15	pending	confirmed	2	\N	2026-03-29 21:51:35	2026-03-29 21:51:35
50	9	pending	declined	2	\N	2026-03-29 21:52:01	2026-03-29 21:52:01
51	7	pending	declined	2	\N	2026-03-29 21:52:06	2026-03-29 21:52:06
52	14	pending	declined	2	\N	2026-03-29 21:52:11	2026-03-29 21:52:11
53	8	pending	declined	2	\N	2026-03-29 21:52:14	2026-03-29 21:52:14
54	10	pending	declined	2	\N	2026-03-29 22:12:53	2026-03-29 22:12:53
55	14	pending	declined	2	\N	2026-03-29 22:13:02	2026-03-29 22:13:02
56	2	pending	timed_out	\N	\N	2026-03-29 22:28:00	2026-03-29 22:28:00
57	11	pending	confirmed	2	\N	2026-03-29 22:46:15	2026-03-29 22:46:15
58	9	pending	confirmed	2	\N	2026-03-29 22:46:20	2026-03-29 22:46:20
59	11	confirmed	in_progress	2	\N	2026-03-29 22:46:35	2026-03-29 22:46:35
60	7	pending	confirmed	2	\N	2026-03-29 22:49:36	2026-03-29 22:49:36
61	3	pending	declined	2	\N	2026-03-29 22:49:41	2026-03-29 22:49:41
62	9	confirmed	in_progress	2	\N	2026-03-29 23:12:39	2026-03-29 23:12:39
63	7	confirmed	declined	2	е	2026-03-29 23:12:47	2026-03-29 23:12:47
64	9	in_progress	completed	2	\N	2026-03-29 23:13:15	2026-03-29 23:13:15
65	15	pending	confirmed	2	\N	2026-03-29 23:26:36	2026-03-29 23:26:36
66	8	pending	declined	2	\N	2026-03-29 23:26:41	2026-03-29 23:26:41
67	6	pending	confirmed	2	\N	2026-03-29 23:26:46	2026-03-29 23:26:46
68	6	confirmed	declined	2	ewr	2026-03-29 23:46:42	2026-03-29 23:46:42
69	15	confirmed	declined	2	sdf	2026-03-29 23:48:54	2026-03-29 23:48:54
70	12	pending	declined	2	\N	2026-03-29 23:49:04	2026-03-29 23:49:04
71	3	pending	timed_out	\N	\N	2026-03-29 23:53:00	2026-03-29 23:53:00
72	6	pending	declined	2	\N	2026-03-29 23:57:23	2026-03-29 23:57:23
73	7	pending	declined	2	\N	2026-03-29 23:57:49	2026-03-29 23:57:49
74	8	pending	confirmed	2	\N	2026-03-29 23:57:54	2026-03-29 23:57:54
75	9	pending	declined	2	\N	2026-03-29 23:58:32	2026-03-29 23:58:32
76	15	pending	confirmed	2	\N	2026-03-29 23:58:59	2026-03-29 23:58:59
77	11	pending	declined	2	\N	2026-03-29 23:59:04	2026-03-29 23:59:04
78	12	pending	declined	2	\N	2026-03-30 00:00:37	2026-03-30 00:00:37
79	8	confirmed	in_progress	2	\N	2026-03-30 00:01:03	2026-03-30 00:01:03
80	15	confirmed	declined	2	2344	2026-03-30 00:01:18	2026-03-30 00:01:18
81	10	confirmed	declined	2	dfs	2026-03-30 00:08:44	2026-03-30 00:08:44
82	5	confirmed	in_progress	2	\N	2026-03-30 00:08:49	2026-03-30 00:08:49
83	8	in_progress	completed	2	\N	2026-03-30 00:08:54	2026-03-30 00:08:54
84	12	pending	declined	2	\N	2026-03-30 00:36:01	2026-03-30 00:36:01
85	11	pending	confirmed	2	\N	2026-03-30 00:36:14	2026-03-30 00:36:14
86	10	pending	confirmed	2	\N	2026-03-30 00:36:17	2026-03-30 00:36:17
87	9	pending	confirmed	2	\N	2026-03-30 00:36:19	2026-03-30 00:36:19
88	5	pending	confirmed	2	\N	2026-03-30 00:36:22	2026-03-30 00:36:22
89	11	confirmed	declined	2	qwer	2026-03-30 00:36:47	2026-03-30 00:36:47
90	9	confirmed	in_progress	2	\N	2026-03-30 00:37:13	2026-03-30 00:37:13
91	10	confirmed	cancelled	6	sadf	2026-03-30 00:47:14	2026-03-30 00:47:14
92	1	pending	expired	\N	\N	2026-03-30 01:00:01	2026-03-30 01:00:01
93	2	pending	timed_out	\N	\N	2026-03-30 01:01:00	2026-03-30 01:01:00
94	3	pending	timed_out	\N	\N	2026-03-30 01:01:01	2026-03-30 01:01:01
95	4	pending	timed_out	\N	\N	2026-03-30 01:01:01	2026-03-30 01:01:01
96	6	pending	timed_out	\N	\N	2026-03-30 01:01:01	2026-03-30 01:01:01
97	7	pending	timed_out	\N	\N	2026-03-30 01:24:00	2026-03-30 01:24:00
98	8	pending	timed_out	\N	\N	2026-03-30 01:25:00	2026-03-30 01:25:00
99	4	pending	timed_out	\N	\N	2026-03-30 07:22:00	2026-03-30 07:22:00
100	13	pending	declined	2	\N	2026-03-30 07:22:01	2026-03-30 07:22:01
101	6	pending	timed_out	\N	\N	2026-03-30 07:22:01	2026-03-30 07:22:01
102	7	pending	timed_out	\N	\N	2026-03-30 07:22:01	2026-03-30 07:22:01
103	8	pending	timed_out	\N	\N	2026-03-30 07:22:01	2026-03-30 07:22:01
104	13	pending	timed_out	\N	\N	2026-03-30 07:22:01	2026-03-30 07:22:01
105	14	pending	timed_out	\N	\N	2026-03-30 07:22:02	2026-03-30 07:22:02
106	15	pending	timed_out	\N	2344	2026-03-30 07:22:02	2026-03-30 07:22:02
107	4	pending	timed_out	\N	\N	2026-03-30 07:29:00	2026-03-30 07:29:00
108	8	pending	timed_out	\N	\N	2026-03-30 07:29:01	2026-03-30 07:29:01
109	13	pending	cancelled	6	\N	2026-03-30 07:36:32	2026-03-30 07:36:32
110	10	confirmed	cancelled	6	eert	2026-03-30 07:36:44	2026-03-30 07:36:44
111	1	confirmed	no_show	\N	\N	2026-03-30 08:00:00	2026-03-30 08:00:00
112	4	pending	timed_out	\N	\N	2026-03-30 11:01:00	2026-03-30 11:01:00
113	6	pending	timed_out	\N	\N	2026-03-30 12:38:00	2026-03-30 12:38:00
114	2	confirmed	no_show	\N	\N	2026-03-30 13:00:00	2026-03-30 13:00:00
115	7	pending	timed_out	\N	\N	2026-03-30 13:24:00	2026-03-30 13:24:00
116	8	pending	timed_out	\N	\N	2026-03-30 13:25:00	2026-03-30 13:25:00
117	3	confirmed	no_show	\N	\N	2026-03-30 14:00:00	2026-03-30 14:00:00
118	5	confirmed	no_show	\N	\N	2026-03-30 15:00:00	2026-03-30 15:00:00
119	9	confirmed	no_show	\N	\N	2026-03-30 16:00:00	2026-03-30 16:00:00
120	14	pending	timed_out	\N	\N	2026-03-30 18:02:00	2026-03-30 18:02:00
121	15	pending	timed_out	\N	2344	2026-03-30 18:02:01	2026-03-30 18:02:01
122	11	pending	confirmed	2	\N	2026-03-30 20:24:18	2026-03-30 20:24:18
123	13	pending	declined	2	\N	2026-03-30 20:36:30	2026-03-30 20:36:30
124	11	confirmed	declined	2	sdf	2026-03-30 20:41:34	2026-03-30 20:41:34
125	7	pending	declined	2	\N	2026-03-30 20:41:44	2026-03-30 20:41:44
126	3	pending	confirmed	2	\N	2026-03-30 20:41:50	2026-03-30 20:41:50
127	1	pending	confirmed	2	\N	2026-03-30 20:41:55	2026-03-30 20:41:55
128	10	pending	confirmed	2	\N	2026-03-30 20:42:00	2026-03-30 20:42:00
129	2	pending	confirmed	2	\N	2026-03-30 20:42:02	2026-03-30 20:42:02
130	8	pending	confirmed	2	\N	2026-03-30 20:42:08	2026-03-30 20:42:08
131	14	pending	confirmed	2	\N	2026-03-30 20:42:13	2026-03-30 20:42:13
132	5	pending	confirmed	2	\N	2026-03-30 20:42:18	2026-03-30 20:42:18
133	6	pending	confirmed	2	\N	2026-03-30 20:42:23	2026-03-30 20:42:23
134	15	pending	confirmed	2	\N	2026-03-30 20:42:28	2026-03-30 20:42:28
135	14	confirmed	cancelled	6	ertet	2026-03-30 20:43:06	2026-03-30 20:43:06
136	12	pending	declined	2	\N	2026-03-30 20:55:25	2026-03-30 20:55:25
137	1	confirmed	declined	2	weqe	2026-03-30 20:55:39	2026-03-30 20:55:39
138	6	confirmed	cancelled	6	sdf	2026-03-30 20:56:42	2026-03-30 20:56:42
139	5	confirmed	declined	2	дсф	2026-03-30 21:00:13	2026-03-30 21:00:13
140	9	pending	declined	2	\N	2026-03-30 21:00:59	2026-03-30 21:00:59
141	8	confirmed	declined	2	rt	2026-03-30 21:14:01	2026-03-30 21:14:01
142	3	confirmed	declined	2	sdf	2026-03-30 21:23:37	2026-03-30 21:23:37
143	2	confirmed	declined	2	sdf	2026-03-30 21:23:46	2026-03-30 21:23:46
144	4	pending	declined	2	\N	2026-03-30 21:31:35	2026-03-30 21:31:35
145	15	confirmed	declined	2	ds	2026-03-31 00:48:11	2026-03-31 00:48:11
146	2	pending	confirmed	2	\N	2026-04-01 23:26:14	2026-04-01 23:26:14
147	5	pending	declined	2	\N	2026-04-01 23:27:58	2026-04-01 23:27:58
148	13	pending	declined	2	\N	2026-04-01 23:28:10	2026-04-01 23:28:10
149	14	pending	confirmed	2	\N	2026-04-01 23:30:52	2026-04-01 23:30:52
150	15	pending	confirmed	2	\N	2026-04-01 23:36:14	2026-04-01 23:36:14
151	9	pending	confirmed	2	\N	2026-04-01 23:38:42	2026-04-01 23:38:42
152	8	pending	declined	2	\N	2026-04-01 23:40:41	2026-04-01 23:40:41
153	4	pending	declined	2	\N	2026-04-01 23:42:49	2026-04-01 23:42:49
154	3	pending	confirmed	2	\N	2026-04-01 23:42:55	2026-04-01 23:42:55
155	7	pending	confirmed	2	\N	2026-04-01 23:43:03	2026-04-01 23:43:03
156	14	confirmed	declined	2	mkl	2026-04-01 23:56:30	2026-04-01 23:56:30
157	15	confirmed	no_show	1	\N	2026-04-02 00:18:32	2026-04-02 00:18:32
158	9	confirmed	no_show	1	\N	2026-04-02 00:19:02	2026-04-02 00:19:02
159	7	confirmed	in_progress	2	\N	2026-04-02 02:09:09	2026-04-02 02:09:09
160	7	in_progress	completed	2	\N	2026-04-02 02:15:19	2026-04-02 02:15:19
161	3	confirmed	in_progress	2	\N	2026-04-02 02:15:26	2026-04-02 02:15:26
162	3	in_progress	completed	2	\N	2026-04-02 02:24:11	2026-04-02 02:24:11
163	16	\N	pending	6	\N	2026-04-13 15:43:09	2026-04-13 15:43:09
164	17	\N	pending	6	\N	2026-04-13 15:44:07	2026-04-13 15:44:07
165	18	\N	pending	6	\N	2026-04-13 15:51:00	2026-04-13 15:51:00
166	10	pending	declined	2	alert	2026-04-13 19:25:22	2026-04-13 19:25:22
167	11	pending	confirmed	2	\N	2026-04-15 19:32:24	2026-04-15 19:32:24
168	12	pending	confirmed	2	\N	2026-04-15 21:57:35	2026-04-15 21:57:35
169	11	confirmed	no_show	2	\N	2026-04-15 21:57:46	2026-04-15 21:57:46
170	12	confirmed	in_progress	2	\N	2026-04-15 22:20:29	2026-04-15 22:20:29
171	16	pending	confirmed	2	\N	2026-04-15 22:21:48	2026-04-15 22:21:48
172	17	pending	confirmed	2	\N	2026-04-15 22:21:53	2026-04-15 22:21:53
173	16	confirmed	in_progress	2	\N	2026-04-15 22:22:04	2026-04-15 22:22:04
174	17	confirmed	in_progress	2	\N	2026-04-15 22:27:11	2026-04-15 22:27:11
175	16	in_progress	completed	2	\N	2026-04-15 22:27:18	2026-04-15 22:27:18
176	19	\N	pending	6	\N	2026-04-27 13:35:45	2026-04-27 13:35:45
177	19	pending	confirmed	2	\N	2026-04-27 13:36:49	2026-04-27 13:36:49
178	19	confirmed	in_progress	2	\N	2026-04-27 13:37:03	2026-04-27 13:37:03
179	19	in_progress	completed	2	\N	2026-04-27 13:37:08	2026-04-27 13:37:08
180	1	pending	timed_out	\N	weqe	2026-04-27 22:13:01	2026-04-27 22:13:01
181	2	pending	timed_out	\N	\N	2026-04-27 22:13:01	2026-04-27 22:13:01
182	6	pending	timed_out	\N	sdf	2026-04-27 22:13:02	2026-04-27 22:13:02
183	18	pending	timed_out	\N	\N	2026-04-27 22:13:02	2026-04-27 22:13:02
184	20	\N	pending	6	\N	2026-05-05 09:20:30	2026-05-05 09:20:30
185	20	pending	timed_out	\N	\N	2026-05-06 09:21:00	2026-05-06 09:21:00
\.


--
-- TOC entry 4294 (class 0 OID 17541)
-- Dependencies: 278
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, service_id, worker_id, client_id, starts_at, ends_at, status, changed_by, notes, reason, created_at, updated_at) FROM stdin;
12	1	2	6	2026-04-29 13:15:00	2026-04-01 13:55:00	in_progress	2	\N	\N	2026-03-29 17:39:05	2026-04-15 22:20:28
17	1	2	6	2026-04-29 10:00:00	2026-04-13 10:40:00	in_progress	2	\N	\N	2026-04-13 15:44:06	2026-04-15 22:27:11
16	2	2	6	2026-04-29 11:45:00	2026-04-15 13:05:00	completed	2	test	\N	2026-04-13 15:43:09	2026-04-15 22:27:18
5	1	2	6	2026-04-30 12:15:00	2026-03-30 12:55:00	declined	2	\N	\N	2026-03-29 11:00:03	2026-04-01 23:27:58
13	1	2	6	2026-04-30 17:15:00	2026-03-30 17:55:00	declined	2	\N	\N	2026-03-29 20:02:47	2026-04-01 23:28:10
19	1	2	6	2026-04-28 10:00:00	2026-04-28 10:40:00	completed	2	дфгд	\N	2026-04-27 13:35:45	2026-04-27 13:37:08
1	1	2	6	2026-04-30 10:00:00	2026-03-23 10:40:00	timed_out	\N	\N	weqe	2026-03-20 17:49:43	2026-04-27 22:13:01
2	1	2	6	2026-04-30 10:00:00	2026-03-30 10:40:00	timed_out	\N	\N	\N	2026-03-29 10:55:02	2026-04-27 22:13:01
8	1	2	6	2026-04-30 11:30:00	2026-03-30 12:10:00	declined	2	\N	\N	2026-03-29 15:20:01	2026-04-01 23:40:41
4	1	2	7	2026-04-30 11:30:00	2026-03-30 12:10:00	declined	2	\N	\N	2026-03-29 10:59:41	2026-04-01 23:42:49
6	1	2	6	2026-04-30 10:00:00	2026-03-30 10:40:00	timed_out	\N	\N	sdf	2026-03-29 15:15:55	2026-04-27 22:13:01
18	2	2	6	2026-04-29 10:45:00	2026-04-13 12:05:00	timed_out	\N	\N	\N	2026-04-13 15:51:00	2026-04-27 22:13:02
14	1	2	6	2026-04-30 16:00:00	2026-03-30 16:40:00	declined	2	\N	mkl	2026-03-29 20:03:13	2026-04-01 23:56:30
20	1	2	6	2026-05-14 10:00:00	2026-05-14 10:40:00	timed_out	\N	test	\N	2026-05-05 09:20:30	2026-05-06 09:21:00
15	1	2	6	2026-04-30 13:30:00	2026-03-30 14:10:00	no_show	1	\N	\N	2026-03-29 20:33:54	2026-04-02 00:18:31
9	1	2	6	2026-04-30 12:30:00	2026-03-30 13:10:00	no_show	1	\N	\N	2026-03-29 15:20:18	2026-04-02 00:19:02
7	1	2	6	2026-04-30 11:30:00	2026-03-30 12:10:00	completed	2	\N	\N	2026-03-29 15:16:20	2026-04-02 02:15:19
3	1	2	6	2026-04-30 10:45:00	2026-03-30 11:25:00	completed	2	\N	\N	2026-03-29 10:58:52	2026-04-02 02:24:11
11	1	2	6	2026-04-01 12:15:00	2026-04-01 12:55:00	no_show	2	\N	\N	2026-03-29 17:34:16	2026-04-15 21:57:46
10	1	2	6	2026-04-29 10:00:00	2026-04-01 10:40:00	declined	2	\N	alert	2026-03-29 17:32:57	2026-04-13 19:25:22
\.


--
-- TOC entry 4296 (class 0 OID 17548)
-- Dependencies: 280
-- Data for Name: business_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business_hours (id, day_of_week, start_time, end_time, is_working, created_at, updated_at) FROM stdin;
1	0	10:00:00	18:00:00	t	\N	\N
2	1	10:00:00	18:00:00	t	\N	\N
3	2	10:00:00	18:00:00	t	\N	\N
4	3	10:00:00	18:00:00	t	\N	\N
5	4	10:00:00	18:00:00	t	\N	\N
6	5	10:00:00	14:00:00	t	\N	\N
7	6	10:00:00	18:00:00	f	\N	\N
\.


--
-- TOC entry 4298 (class 0 OID 17553)
-- Dependencies: 282
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 4299 (class 0 OID 17558)
-- Dependencies: 283
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 4300 (class 0 OID 17563)
-- Dependencies: 284
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	Фризьорски услуги	2026-02-02 22:02:07	2026-02-02 22:02:07
2	Маникюр	2026-02-02 22:02:07	2026-02-02 22:02:07
3	Козметика	2026-02-02 22:02:07	2026-04-13 12:09:32
\.


--
-- TOC entry 4302 (class 0 OID 17567)
-- Dependencies: 286
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4304 (class 0 OID 17574)
-- Dependencies: 288
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 4305 (class 0 OID 17579)
-- Dependencies: 289
-- Data for Name: job_positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_positions (id, name, description, created_at, updated_at) FROM stdin;
1	Фризьор	Специалист по подстригване и оформяне на прически..	2026-01-23 21:42:39	2026-01-26 15:37:08
2	Маникюрист	Специалист по грижа за ръцете и ноктите.	2026-01-23 21:42:39	2026-01-23 21:42:39
3	Козметик	Специалист по грижа за кожата и лицето.	2026-01-23 21:42:39	2026-01-23 21:42:39
4	Складов работник	Поддържане на инвентар, следене за наличности.	2026-01-23 21:47:45	2026-01-23 21:47:45
5	Стилист	Специалист по подстригване и оформяне на прически.	2026-01-30 16:02:02	2026-01-31 04:53:54
7	Козметик	Специалист по грижа за кожата и лицето.	2026-01-30 16:02:03	2026-01-30 16:02:03
8	Фризьор	Специалист по подстригване и оформяне на прически.	2026-01-30 16:03:10	2026-01-30 16:03:10
9	Маникюрист	Специалист по грижа за ръцете и ноктите.	2026-01-30 16:03:11	2026-01-30 16:03:11
23	new	nrewrwe	2026-01-31 20:02:34	2026-01-31 20:02:34
24	test1	sdfs	2026-02-01 14:52:18	2026-02-02 15:02:30
25	324	sfas	2026-02-02 07:01:45	2026-02-02 07:01:45
\.


--
-- TOC entry 4307 (class 0 OID 17585)
-- Dependencies: 291
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 4309 (class 0 OID 17591)
-- Dependencies: 293
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_12_22_113225_create_personal_access_tokens_table	1
5	2025_12_23_072514_create_roles_table	1
6	2025_12_23_091729_add_profile_fields_to_users_table	1
7	2025_12_23_095455_services_table	1
8	2025_12_23_100118_appoitments_table	1
9	2026_01_22_110255_add_column_is_active_in_user_table	1
10	2026_01_23_204511_create_job_position_table	1
11	2026_01_23_205439_add_job_position_id_to_users_table	1
12	2026_01_23_210046_create_worker_service_table	1
13	2026_01_23_213417_rename_job_position_to_job_positions_table	1
14	2026_01_30_161647_categories_table	1
15	2026_02_02_223324_add_column_worker_service_table	1
16	2026_02_12_071440_create_business_hours_table	1
17	2026_02_13_101234_add_column_can_book_appointments_in_user_table	1
18	2026_02_13_173250_scratch_appointmens_table	1
19	2026_02_15_211639_add_columns_to_users_table	1
20	2026_03_20_125954_recreate_appointments_table	1
21	2026_03_20_131737_appointment_history_table	1
22	2026_03_20_152143_change_status_enum_to_string_in_appointments	1
23	2026_03_29_112042_drop_appointments_status_check	2
\.


--
-- TOC entry 4311 (class 0 OID 17595)
-- Dependencies: 295
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4312 (class 0 OID 17600)
-- Dependencies: 296
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
25	App\\Models\\User	6	react	b32204377229de7d2cb5c17d02c537e1ee0cf508c5727add650d62221b16c421	["*"]	2026-04-12 23:56:32	\N	2026-04-12 23:56:30	2026-04-12 23:56:32
20	App\\Models\\User	1	react	2c6d3d7f57b2610f610030e7fecdb3e740aa78082381489937af28642385fd07	["*"]	2026-04-02 01:54:04	\N	2026-04-02 00:18:12	2026-04-02 01:54:04
26	App\\Models\\User	6	react	de02e31774602bda8c7bc469b8de1945da0eb3cf69de2adb51cab19189eca546	["*"]	2026-04-12 23:58:37	\N	2026-04-12 23:58:35	2026-04-12 23:58:37
27	App\\Models\\User	6	react	39bad6b5bb8d86ea3b29ffcd79ff149e995d2c9e1f7529224c829abe517d5fd8	["*"]	\N	\N	2026-04-13 00:02:09	2026-04-13 00:02:09
46	App\\Models\\User	6	react	b864d3d835ca257bd5bebd8454b20170a72ad9f500956d7b9fc23aa934eadf41	["*"]	2026-04-15 21:31:06	\N	2026-04-15 21:30:55	2026-04-15 21:31:06
28	App\\Models\\User	6	react	d30de1c8ba5fbd5dcfa555957ccf478378507a99acff8b1484bc0f824f7e87a1	["*"]	2026-04-13 00:57:13	\N	2026-04-13 00:51:29	2026-04-13 00:57:13
29	App\\Models\\User	1	react	bbae3e58a784d3194a44d10f5659ccacf373f89b22155297994d3d0fbe7cea6a	["*"]	2026-04-13 01:54:07	\N	2026-04-13 01:29:38	2026-04-13 01:54:07
30	App\\Models\\User	1	react	20a15d8fd99b6f3c077a3ed2b395c5ca806fe4e166de111f5e4e4c63fe1fe0e9	["*"]	\N	\N	2026-04-13 01:54:29	2026-04-13 01:54:29
31	App\\Models\\User	1	react	1bd1226c0e9d3ef7d1e2688e551086e394ef3debf3749cf139c531bf8a324764	["*"]	\N	\N	2026-04-13 01:54:31	2026-04-13 01:54:31
33	App\\Models\\User	1	react	ceba5cfcc1305ea4928a8f6d6083d2b512bbd63f753a75e4a00165a6a96aefe1	["*"]	2026-04-13 09:30:05	\N	2026-04-13 09:20:57	2026-04-13 09:30:05
50	App\\Models\\User	6	react	e83304c1c3796af376e38022beeeb6807cb9c3e1321ae28d2102bc0ee92d94cd	["*"]	\N	\N	2026-04-16 21:37:11	2026-04-16 21:37:11
35	App\\Models\\User	1	react	4276fb2048e1723b7021603e48614b93a9fe3d8eb46aa73acc0c951800d72804	["*"]	2026-04-13 10:41:22	\N	2026-04-13 10:24:56	2026-04-13 10:41:22
21	App\\Models\\User	2	react	a583666af2b5973523078f64585b35f049f92942675ad8ddfe6f8b1311a86dcf	["*"]	2026-04-02 02:26:41	\N	2026-04-02 01:43:50	2026-04-02 02:26:41
22	App\\Models\\User	6	react	f3efcdc1799d877e2c9676ecd13daf807a6b38b0048de01e4e5e0e0913dda88b	["*"]	\N	\N	2026-04-12 23:40:33	2026-04-12 23:40:33
19	App\\Models\\User	2	react	641528e3c6d3336ee1a6ec4a23532d9b7112bb035866aeeef8da284b8ba01309	["*"]	2026-04-02 01:36:22	\N	2026-04-01 22:57:05	2026-04-02 01:36:22
67	App\\Models\\User	1	react	b09d2a15ef91e29ee183f98420980abdb2716529ecd7b79c72e8d1c572d35b17	["*"]	2026-07-07 23:49:27	\N	2026-07-07 23:29:27	2026-07-07 23:49:27
23	App\\Models\\User	6	react	90f51723eec66d9d773e7314986ad30d34830497d3ba82d6248523c3528a6cd5	["*"]	2026-04-12 23:52:16	\N	2026-04-12 23:50:43	2026-04-12 23:52:16
51	App\\Models\\User	6	react	80904e7efb4a38811f13b55b958c42281073e57997dab2fc3e70d114f607bbab	["*"]	2026-04-16 23:33:24	\N	2026-04-16 21:45:50	2026-04-16 23:33:24
52	App\\Models\\User	6	react	3c494d97f3d3694a5f22a3638b25f14bafad663fec9cb821ff9e28707734bf72	["*"]	\N	\N	2026-04-17 00:51:29	2026-04-17 00:51:29
24	App\\Models\\User	6	react	99916697b10938429d259a34976e1b5b6853718437d477a982b5ef795ca8b42e	["*"]	2026-04-12 23:55:35	\N	2026-04-12 23:55:33	2026-04-12 23:55:35
54	App\\Models\\User	6	react	465c568945cef9a850f55369ca0e7676d1e78dadbdd4f8c073412a7840967fe0	["*"]	\N	\N	2026-04-17 00:52:18	2026-04-17 00:52:18
32	App\\Models\\User	1	react	9d13e57bb826a603059e587e0e3bf60b1fa922c30387aef6519e953cd26d5d24	["*"]	2026-04-17 00:53:20	\N	2026-04-13 01:54:32	2026-04-17 00:53:20
43	App\\Models\\User	2	react	9e55736597a839847fa33f8d50dc4b490b7f82639731fe3f080989584c4687b7	["*"]	2026-04-15 23:20:13	\N	2026-04-13 17:34:00	2026-04-15 23:20:13
64	App\\Models\\User	1	react	7b846d9d089410695be649200401edf5a82c2d24e0a898dd208a526145178513	["*"]	2026-07-08 00:02:17	\N	2026-07-07 22:49:03	2026-07-08 00:02:17
60	App\\Models\\User	2	react	0e9a03a88e55708ce698bb403e9ac0911101034e6a9cbb0ae6228573e4a8347c	["*"]	2026-04-27 13:37:19	\N	2026-04-27 13:36:31	2026-04-27 13:37:19
63	App\\Models\\User	6	react	100fcef043de1bacffbbaa28e4477e01bf3f3ccbe9ba4e65b1172c5b985290ba	["*"]	2026-05-05 09:20:31	\N	2026-05-05 09:19:41	2026-05-05 09:20:31
\.


--
-- TOC entry 4314 (class 0 OID 17606)
-- Dependencies: 298
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	admin
2	worker
3	client
4	admin
5	worker
6	client
7	admin
8	worker
9	client
10	admin
11	worker
12	client
13	admin
14	worker
15	client
16	admin
17	worker
18	client
\.


--
-- TOC entry 4316 (class 0 OID 17610)
-- Dependencies: 300
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name, description, category_id, duration, price, is_active, image, preparation_time, cleanup_time, created_at, updated_at) FROM stdin;
1	Мъжко подстригване	Мъжкото подстригване при нас е насочено към изчистена визия, прецизност и комфорт. Работим с внимание към детайла и индивидуалния стил на всеки клиент, като се съобразяваме с формата на лицето, типа коса и личните предпочитания. Подстригването се извършва с професионални инструменти и техники за дълготраен и поддържан резултат. Подходящо както за класически, така и за модерни визии. Бързо обслужване, спокойна атмосфера и отличен краен резултат.	1	30	20.00	t	\N	5	5	2026-01-30 16:13:48	2026-02-09 15:54:06
2	Дамско подстригване	Дамското подстригване при нас е съобразено с индивидуалността, стила и желанията на всяка дама. Подхождаме с внимание към структурата на косата, формата на лицето и ежедневните навици, за да постигнем практична и красива визия. Работим с професионални техники и качествени инструменти за прецизен и естествен резултат. Независимо дали търсите освежаване или пълна промяна, целта ни е косата ви да изглежда здрава, поддържана и стилна. Комфорт и персонално отношение по време на цялата процедура.	1	60	45.00	t	\N	10	10	2026-01-30 16:13:48	2026-02-09 15:54:16
3	Маникюр с гел лак	Маникюрът с гел лак при нас съчетава естетика, дълготрайност и грижа за ноктите. Процедурата се извършва с висококачествени продукти и внимание към детайла, за да се постигне красив и издръжлив резултат. Съобразяваме се с формата на ноктите и предпочитанията на клиента, като предлагаме богата гама от цветове и дизайни. Маникюрът осигурява перфектен външен вид за седмици напред. Хигиена, прецизност и комфорт са гарантирани.	2	90	35.00	t	\N	5	10	2026-01-30 16:13:48	2026-02-09 15:54:24
4	Почистване на лице	Почистването на лице е процедура, насочена към здравето и свежия вид на кожата. Тя спомага за премахване на замърсявания, излишен себум и мъртви клетки, като оставя кожата чиста и обновена. Процедурата се извършва внимателно и съобразено с типа кожа, за да се избегне дразнене и дискомфорт. Подходяща е за всеки тип кожа и за редовна поддръжка на лицето. Резултатът е по-свежа, гладка и сияйна кожа.	3	60	50.00	t	\N	10	10	2026-01-30 16:13:48	2026-02-09 15:54:36
5	Мезотерапия	Мезотерапията е ефективна процедура за подхранване и подмладяване на кожата. Чрез въвеждане на активни съставки се подобрява хидратацията, еластичността и общия тонус на кожата. Процедурата се извършва професионално и с индивидуален подход според нуждите на клиента. Подходяща е за лице, шия и деколте и спомага за видимо освежен и стегнат вид. Комфортна обстановка и сигурност по време на всяка стъпка от процедурата.	3	45	80.00	t	\N	10	10	2026-01-30 16:13:48	2026-02-09 15:54:43
8	Детско подстригване	Детското подстригване при нас е съобразено изцяло с нуждите и комфорта на малките ни клиенти. Работим с търпение, внимание и усмивка, за да превърнем подстригването в приятно изживяване, а не в стресиращ момент.\n\nПодстригването се извършва бързо и внимателно, с подходящи инструменти и индивидуален подход към всяко дете. Съобразяваме се с желанията на родителите и стила на детето, като целта ни е практична, удобна и красива визия.\n\nПодходящо за деца от ранна възраст.\nКомфортна обстановка и приятелско отношение гарантирани.	1	60	10.00	t	\N	5	5	2026-02-05 15:23:14	2026-02-05 15:36:45
\.


--
-- TOC entry 4318 (class 0 OID 17619)
-- Dependencies: 302
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
ELfPe9uheaJf35pZyZCf5he974jObIfkp5ADiEky	\N	10.66.4.47	PostmanRuntime/7.51.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlllWlFobERkYjRBZEFiQk5QWlZWbnpYeVVqcFNZYmZLUnNrc2hMUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMC42Ni40LjQ3Ojg5ODkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1769600105
JDaPerGp37cq90WlhR2r57HfB4ldtxCJPnJcAju0	\N	10.66.4.47	PostmanRuntime/7.51.1	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU14VFcyTXJmdmlDeExEZFBQQUhMQUY0WTRMU3pWaVJSSThlOGo3dSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMC42Ni40LjQ3Ojg5ODkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1769885363
E7dU3RpWAyI7KLAjisySmoOeEZfcFekM37AkNd3b	\N	10.66.4.47	PostmanRuntime/7.51.1	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3N2eGFXeTlZMVFCVlVYNm9ZcjNwYVowQ0pDcHdXUnJieklVYmlzTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMC42Ni40LjQ3Ojg5ODkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1769936463
vcPBRHm4fzR6QbsuYQaPklt2vJpE9C8X30qjxT6h	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXFyRzZrRGRPWnZSODdCNXNKOWFQN0c5SWVPQ0ZHeGlLVWdOVkZwMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODk4OSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1774255283
\.


--
-- TOC entry 4319 (class 0 OID 17624)
-- Dependencies: 303
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, phone, gender, birth_date, role, is_approved, is_active, job_position_id, can_book_appointments, no_show_count, no_show_total_count, cancelled_count, completed_count) FROM stdin;
1	admin	admin@test.com	2026-01-23 21:42:40	$2y$12$P2VHehcyur4QsK6Ul9P3P.RmB78s8ZXy8RSNbBup5JhEx64aBL5wC	KSTqXShgEkAJdI6q08SwrdXTzKcpaqxwwkYJs0bZz4dAW7wS9Xau2fLuIbYm	2026-01-23 21:42:40	2026-02-01 13:50:37	\N	\N	\N	admin	t	t	\N	\N	0	0	0	0
2	An	an@test.com	2026-01-23 21:42:40	$2y$12$6XGo70CHo3tRhjdMt9j6eemZ7a51awO.xc62ii/mRJAtmtt83vPUO	\N	2026-01-23 21:42:40	2026-01-23 21:42:40	+380991234567	female	\N	worker	t	t	1	\N	0	0	0	0
3	Eva	eva@test.com	2026-01-23 21:42:41	$2y$12$S3Nw1NlgDvNRlJSRa.4YUul/lHZFSo4Iyd7e1NYZZiuc0X9cbBjii	\N	2026-01-23 21:42:41	2026-02-16 10:39:53	+380991234567	female	2026-01-05	worker	t	t	1	\N	1	1	0	0
4	Angela Klein Jr.	moore.kirsten@example.net	2026-01-26 21:15:39	$2y$12$rVhQJItir9bwKyGHxoUcG.HpXpXrLPNAk1Q6FSgnJ02jm4F7XDfIa	\N	2026-01-26 21:19:14	2026-02-05 07:51:12	(225) 291-8549	female	2026-01-25	worker	t	t	1	\N	0	0	0	0
5	Clarabelle Marquardt	ckutch@example.com	2026-01-26 21:15:39	$2y$12$cWv8nvp1pNclhpg.kUj5du0/ZRDOHIC7xDBCK/miRPDGACa9Sq/Ou	\N	2026-01-26 21:19:14	2026-03-08 22:52:16	+1-470-693-8937	other	2026-01-26	client	t	t	\N	t	1	15	3	1
6	John Doe	john@example.com	2026-01-26 21:15:40	$2y$12$4eLqKFFKePYjUgGV82YqFOOg.6gYKTlI9YsGBFqV1y3LMXskd826.	\N	2026-01-26 21:19:14	2026-02-10 16:04:54	+359888123456	male	1990-01-15	client	t	t	\N	t	0	0	0	0
7	Garfield Tillman	javonte.nikolaus@example.net	2026-01-26 21:15:40	$2y$12$.2tGfHSuTRVyshLdsh810ehkVzw9IkLWzo.2DwHri33S6U4u0cAGS	\N	2026-01-26 21:19:14	2026-01-26 21:19:14	(540) 756-7600	other	2000-03-04	client	t	t	\N	t	0	0	0	0
8	Jennie Bechtelar V	jonathon.lueilwitz@example.com	2026-01-26 21:15:40	$2y$12$Ea5dgDEilRZCkZ2PP/VloefOmRMtZkDJOTj1JdSoEXXyVexgEaBAq	\N	2026-01-26 21:19:14	2026-01-31 07:53:40	1-636-865-7477	male	1974-03-23	client	t	t	\N	t	0	0	0	0
9	Sierra Boehm DDS	bheathcote@example.org	2026-01-26 21:15:40	$2y$12$A9XaW/AkEidAaifOPrQEI.gMYr/.WR9UWy/GMrxP5OQ6aI2T8/XZy	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	321-467-9562	other	1973-09-11	client	t	t	\N	t	0	0	0	0
10	Kip Reynolds V	antonia.batz@example.org	2026-01-26 21:15:40	$2y$12$0iupnJxG425hl9hD1sMiJuDTQCjJu0nTbkf8ccMGDFjP7ksxAuNVa	\N	2026-01-26 21:19:15	2026-02-03 14:49:30	+1.248.306.4922	female	2026-01-26	client	t	f	\N	t	0	0	0	0
11	Mr. Judge Windler	lakin.margaretta@example.net	2026-01-26 21:15:41	$2y$12$Tc8oIl2YpGlJFbihwqP68.Lyn7xlICwWHVDd.PaNoBjLHb8aeP1mq	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	+17759228680	other	1999-01-28	client	t	t	\N	t	0	0	0	0
12	Natasha Labadie	cwilliamson@example.com	2026-01-26 21:15:41	$2y$12$FtmkScBP0a.UKMc6F8tMNOxwNnuKqCatKGON3jzzI/qe7Xa3kzeZ6	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	+14459837355	male	1981-01-28	client	t	t	\N	t	0	0	0	0
13	Helena Mitchell DDS	guido.ernser@example.com	2026-01-26 21:15:41	$2y$12$RvUi.0LfmlaVzXxcLsWxCeBGNYti/PrZHg61OyJ.DXTLlLIFUWqAq	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	267-441-9003	male	2000-03-20	client	t	t	\N	t	0	0	0	0
14	Dr. Matilda Schiller	collier.julia@example.com	2026-01-26 21:15:41	$2y$12$8opXUsiJfqEbfo3mgi3YW.6BhjUMwPKrBba0Hv1jJovEY3qC/sS4O	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	(716) 440-6844	other	1993-08-05	client	t	t	\N	t	0	0	0	0
15	Gertrude Ankunding Sr.	gracie.botsford@example.com	2026-01-26 21:15:41	$2y$12$1CKbjNSz9TXhSZFem7WHFOTtQmX4Xh6lfw2sXKNPEzH0SAUf7SbOe	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	+1 (224) 998-3477	other	1977-06-29	client	t	t	\N	t	0	0	0	0
16	Kareem Swift	bkoepp@example.net	2026-01-26 21:15:42	$2y$12$EDu/60RfT0rr0JOVjRSNZ.wT4eFVMMJnHMsTX.FnbyVRIWmUpPOOa	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	+1-386-488-4156	male	1975-06-05	client	t	t	\N	t	0	0	0	0
17	Alejandra Cartwright	ernser.crawford@example.com	2026-01-26 21:15:42	$2y$12$rAK0lkC2ty5IvkqE51Flveo4nJ8TuH.oPGrTQZcpm/Z.TcTy35O36	\N	2026-01-26 21:19:15	2026-01-26 21:19:15	+1.435.744.6759	male	1991-08-10	client	t	t	\N	t	0	0	0	0
18	Mya Bashirian	carlos54@example.net	2026-01-26 21:15:42	$2y$12$5/LeaWSe6cvHe3R0JTtOnukmrDVFiaUJli8ahD7pEsEAJl/RQFwjC	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	458-973-0549	male	1994-12-10	client	t	t	\N	t	0	0	0	0
19	Prof. Maude Shields IV	hansen.jaquelin@example.org	2026-01-26 21:15:42	$2y$12$iYuNZE3xRNrmMF6WQEzYxOZQuEuCYiW5EU23d1xkE.28TpGYpA3HW	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	+1-726-261-3574	other	1990-05-08	client	t	t	\N	t	0	0	0	0
20	Mr. Russell Predovic IV	dillon.kirlin@example.org	2026-01-26 21:15:43	$2y$12$pV0ywWg0cmoN3AiNsV03k.5DzevamE3oYbSvK5XAwpLOdFp9hFsni	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	1-954-846-7814	female	1970-11-05	client	t	t	\N	t	0	0	0	0
21	Dr. Shaylee Dietrich MD	ollie07@example.net	2026-01-26 21:15:43	$2y$12$6NktQxazEO4RZg7uf96wHOpD0xBL7ntOQfDqyD.OtwjrkvFCisNYm	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	(352) 858-1727	female	1976-04-29	client	t	t	\N	t	0	0	0	0
22	Mara Russel III	alivia.muller@example.org	2026-01-26 21:15:43	$2y$12$BmWx95aqhV98fbQqRpG38uIK/n7SmDI7ZSHRJL86GImm7zmMSS38G	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	(561) 339-0722	other	1997-05-15	client	t	t	\N	t	0	0	0	0
23	Prof. Scottie Jacobi	rebecca.tillman@example.org	2026-01-26 21:15:43	$2y$12$2cmh.Y1mHoh.XSFarL2fv.pOxwW5JrRWUnL12GwLqJ7FIpxsOp.gW	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	+19206140942	other	2003-01-23	client	t	t	\N	t	0	0	0	0
24	Fernando Gottlieb	schneider.ambrose@example.org	2026-01-26 21:15:43	$2y$12$9xQqDClqEVbnKLMiFhVHfutZTDeC5SK.jWK08X0IYGRauD3s99ThC	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	854-435-2520	female	1974-12-16	client	t	t	\N	t	0	0	0	0
25	Hillary Williamson	jarrell.wiza@example.net	2026-01-26 21:15:44	$2y$12$Ejsi4Ys9ZXQSJWrruvwtnuU6LvhlB21kcpEOHA6rZbBhbL90uBqLO	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	(346) 437-6476	male	1991-01-25	client	t	t	\N	t	0	0	0	0
26	Shemar Auer	abshire.velda@example.com	2026-01-26 21:15:44	$2y$12$PYPZTcvy3UAlJ5PgaQ.EgunuTXaFGZ9X888iG1zIRWtchlU21nyIi	\N	2026-01-26 21:19:16	2026-01-26 21:19:16	985-901-5572	male	1988-09-27	client	t	t	\N	t	0	0	0	0
27	Clyde Hilpert Jr.	vella.franecki@example.com	2026-01-26 21:15:44	$2y$12$dtQ0fuM/g5HLC4vkHreV/euXAhJtnGHxlJ1cBK59i1jCXnKjMfAfq	\N	2026-01-26 21:19:17	2026-01-26 21:19:17	(209) 916-6025	male	1997-06-09	client	t	t	\N	t	0	0	0	0
28	Mina Littel	zbogan@example.org	2026-01-26 21:15:44	$2y$12$wkPwIT5oPvWR8C8nSqezC.8mx8jUzTxbgE/F.MRKDFd.otG3qxif2	\N	2026-01-26 21:19:17	2026-01-26 21:19:17	(248) 874-0716	female	1981-10-09	client	t	t	\N	t	0	0	0	0
29	Prof. Bernhard Hettinger I	zoie.lang@example.net	2026-01-26 21:15:44	$2y$12$GNwAQjayljgmBgOCBZO8S.2juyvpvuch9DftplB29tTtaqhlFL4IC	\N	2026-01-26 21:19:17	2026-01-26 21:19:17	+1-661-734-0691	other	1977-01-15	client	t	t	\N	t	0	0	0	0
30	Camilla Tremblay	nicola23@example.net	2026-01-26 21:15:45	$2y$12$QykPcUMfnGezSzSGWSwlZe5XhW6Bv.6DOXXPWvesB2ebz4Y6lTK4W	\N	2026-01-26 21:19:17	2026-01-26 21:19:17	1-785-275-8359	female	1982-12-03	client	t	t	\N	t	0	0	0	0
31	Nona Schulist	pat52@example.org	2026-01-26 21:15:45	$2y$12$DwRgJdM.iPD0Teep25ROMuUzS.HprNJRTC4WpjfGKVYfsSfMZAzfO	\N	2026-01-26 21:19:17	2026-01-26 21:19:17	1-620-454-9400	male	2001-01-04	client	t	t	\N	t	0	0	0	0
32	Dr. Albertha Kassulke I	ilarson@example.org	2026-01-26 21:15:45	$2y$12$X8b9rtYO6z8IG5MWn2sp3O60/t3W69tvVqSJIWPhySD.hQD59DTXa	\N	2026-01-26 21:19:17	2026-01-26 21:19:17	+1 (424) 809-5753	other	1988-08-26	client	t	t	\N	t	0	0	0	0
33	Justice Bahringer	turcotte.dannie@example.org	2026-01-26 21:15:45	$2y$12$NLrLd6oO8RVBDxgppgnojOPcGTp6yMwak6Q0YDRtMUjLrGDNQJysq	\N	2026-01-26 21:19:17	2026-01-26 21:19:17	1-786-210-0128	other	1994-04-07	client	t	t	\N	t	0	0	0	0
34	Prof. Alfonso Tremblay III	ghilpert@example.net	2026-01-26 21:15:45	$2y$12$x7i7lEOr9EyTyG0Mh.Xwau86FPwwSom5BoJMicu.LiPmhKIYXSEhu	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	(337) 251-3649	female	1986-12-24	client	t	t	\N	t	0	0	0	0
35	Mr. Terence Gulgowski IV	pmoore@example.com	2026-01-26 21:15:46	$2y$12$fzhGeHm1JlRGZVU29VwQbeYs3rCRtSEbxvGxABFIeVT4ClVczPqiC	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	534.893.0628	female	1993-04-17	client	t	t	\N	t	0	0	0	0
36	Deanna Gerhold	iglover@example.org	2026-01-26 21:15:46	$2y$12$XK1awK93EGIJrr38R/k.o.pdkNZzGciByfIiXN2QZyoMKlF1VQcF2	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	1-936-310-5907	male	1994-07-12	client	t	t	\N	t	0	0	0	0
37	Ashtyn Johnston	rae.mohr@example.org	2026-01-26 21:15:46	$2y$12$bbHMdx9eSHupaQFljAD/Ju4h1v7IIcUdiaNLn3GqrxVtXAhUcVONe	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	+12696336774	other	1996-11-09	client	t	t	\N	t	0	0	0	0
38	Mr. Rene Boehm DVM	fbeier@example.net	2026-01-26 21:15:46	$2y$12$jr6KufJkMEE0Vn2dpZ1Y5.Queg3vIvesvcGbHgabVog5RSnjW2VtS	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	+1-209-989-9967	other	1970-05-30	client	t	t	\N	t	0	0	0	0
39	Keara Heller	rae.durgan@example.net	2026-01-26 21:15:47	$2y$12$bZu5eOeqOyd13LreqycDye.eDWtjnyX6xXBRO0a9HqKPkhCOK0C3m	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	1-785-907-8602	male	1994-07-04	client	t	t	\N	t	0	0	0	0
40	Damian Gulgowski	garfield73@example.net	2026-01-26 21:15:47	$2y$12$u9BzJaceiqC5MIrx0kLrE.OJYzb3BzTH/PF7OoT1BIrzGMyj08hrO	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	832.436.9543	male	1972-07-01	client	t	t	\N	t	0	0	0	0
41	Cordell Rogahn	hoppe.chaz@example.com	2026-01-26 21:15:47	$2y$12$iWk0s9.L4xBF5curwUbMee24xWLzeBLINAEk95S6.CSnNFqOKiqCy	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	+1 (213) 247-9106	other	1990-04-02	client	t	t	\N	t	0	0	0	0
42	Ethelyn Moen	igreenholt@example.net	2026-01-26 21:15:47	$2y$12$Lpz3c3SQp4hhv8KS6EPSIewftfwasI02K3iAUPfdMmzrDxF/pcqly	\N	2026-01-26 21:19:18	2026-01-26 21:19:18	(848) 423-6383	other	2000-03-27	client	t	t	\N	t	0	0	0	0
43	Rhianna Carter	keven.rice@example.com	2026-01-26 21:15:47	$2y$12$LrZ2x6SWXaBiidxQmqsI8On6cbtzScxvsjphmPmi4IvNIi.Iss7SS	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	1-657-490-1786	male	1978-08-05	client	t	t	\N	t	0	0	0	0
44	Clemens Zulauf Sr.	oschultz@example.net	2026-01-26 21:15:48	$2y$12$51zJ0Ix6/OTz3eFSkkHYNeS8oyhQVxLI9EYn3BMnZR9yXuNSD7/G2	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	517-824-6274	female	1974-08-23	client	t	t	\N	t	0	0	0	0
45	Dr. Pinkie Buckridge	pdaniel@example.com	2026-01-26 21:15:48	$2y$12$Kr7gTw.oBGD4FBazUuuIBegh1Rk04wYVxX3SMvsdH.xnk6eWRx886	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	1-231-616-9180	other	1972-08-12	client	t	t	\N	t	0	0	0	0
46	Mrs. Jennyfer Jacobson V	terrence31@example.net	2026-01-26 21:15:48	$2y$12$T4W6mOiBNOwIlwNx1F476O1qqI3wbsrxT.1uQAQ0/X/9WX/HOA3bi	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	+1-478-456-9251	other	1992-04-11	client	t	t	\N	t	0	0	0	0
47	Dameon Pfannerstill	junius.block@example.net	2026-01-26 21:15:48	$2y$12$ncLBR0LfQO07JDY4wrS7dOtP2xk8LjXXXn3EYPAg9CVtJL6aFUsMq	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	678-894-6346	male	1974-12-27	client	t	t	\N	t	0	0	0	0
48	Jean Hickle	ueichmann@example.com	2026-01-26 21:15:48	$2y$12$40zXzFcRDZrHcwbMU8.mIeQeF1dayou6KTZX4C0ffiU2r7c27d0fa	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	+15302092247	female	1988-05-15	client	t	t	\N	t	0	0	0	0
49	Ms. Katelyn Kovacek DVM	swaniawski.aisha@example.com	2026-01-26 21:15:49	$2y$12$6YnbnD4RQZjPqgYMMd7ile.R8CBhzMk14HNt41wIOny2GvKhxaYHW	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	+1 (650) 935-3071	male	1983-02-09	client	t	t	\N	t	0	0	0	0
50	Anderson Nader	cordell53@example.net	2026-01-26 21:15:49	$2y$12$wFh4GHE9SIr/dE.uydVCL.aVuBduP1MY9PhC8JU68.v6BKSIP52I6	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	347-737-9548	male	1974-01-14	client	t	t	\N	t	0	0	0	0
51	Dr. Pascale Homenick	kristopher25@example.com	2026-01-26 21:15:49	$2y$12$OW8mmrlE2c4Ikr33EOti2ukwVxGGqt81d6otnjY1YLV0nSU7bXYMG	\N	2026-01-26 21:19:19	2026-01-26 21:19:19	+1.256.720.0952	male	1992-06-20	client	t	t	\N	t	0	0	0	0
52	Miss Brielle Pacocha	sadie82@example.com	2026-01-26 21:15:49	$2y$12$ZLRREGvvI9mcn3pxCSCfpuJxdS3TXkbrLeZ6ktj/S2qsC/W7imUzG	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	1-352-836-9967	other	1980-01-19	client	t	t	\N	t	0	0	0	0
53	Angela Kuhn	kreinger@example.net	2026-01-26 21:15:50	$2y$12$X8G.5GkWv2PYLiNiYS5HvOi3ifsmMnNcITk8IN7L46ADS23xzQZuG	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	(504) 671-3574	female	1979-10-07	client	t	t	\N	t	0	0	0	0
54	Josie Kihn	alexander96@example.net	2026-01-26 21:15:50	$2y$12$b2thvZL40DQbQono1JxXWeziaSYMpLM4VysWwHWfzDEM0l9uypHZu	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	+1-319-332-5729	other	1973-09-05	client	t	t	\N	t	0	0	0	0
55	Elinore Sporer V	mkulas@example.com	2026-01-26 21:15:50	$2y$12$jdfOPppv.HIG.tzP5GUctu94C2Uf6eRqj1L2KxaRaITiqc0joJogC	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	330.424.1429	male	1980-09-29	client	t	t	\N	t	0	0	0	0
56	Dr. Trisha Volkman DDS	jessie.torp@example.org	2026-01-26 21:15:50	$2y$12$hTjCZ6ajepjiUcPJ3V14IugozB2TIvbIUjz.06zTmgvqGZLVT7C02	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	+16082844268	female	1974-04-27	client	t	t	\N	t	0	0	0	0
57	Yazmin Brekke	green.shayna@example.org	2026-01-26 21:15:50	$2y$12$n67vmYvLdPhdADMrejjUAe/P7DCHM.do0J8KzqJtlDFRH6YxQzXqi	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	+1.406.519.5374	other	1984-11-09	client	t	t	\N	t	0	0	0	0
58	Kathlyn Doyle	lind.hubert@example.org	2026-01-26 21:15:51	$2y$12$Gl6Mao95F6Kz60DiGmFbteQkYSkWFUdtKoWxs9nY7y5tMU7ApoH/K	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	+1.814.619.2824	male	1994-02-06	client	t	t	\N	t	0	0	0	0
59	Mossie Toy	jacobson.rosie@example.org	2026-01-26 21:15:51	$2y$12$iP4hboXnQ57z3FnhSuRW4OMM4TbPhVuNN/liwot0W0RITxP9OcGHe	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	716-440-3732	other	1974-10-26	client	t	t	\N	t	0	0	0	0
60	Kaylin Nikolaus	genoveva53@example.com	2026-01-26 21:15:51	$2y$12$T9WYX5BMP7Wlv5RQWXAeNOzTV5fSpIGET8bViM2ZCNAtRUindpy7S	\N	2026-01-26 21:19:20	2026-01-26 21:19:20	(385) 270-0418	other	2002-11-02	client	t	t	\N	t	0	0	0	0
61	Brock Trantow V	hkling@example.net	2026-01-26 21:15:51	$2y$12$kk33.hP56O/ki6OSHyd46uBtxodz9HPeHoKHeNQpsC6uHJbkgxsGC	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	930.688.9298	other	1998-01-24	client	t	t	\N	t	0	0	0	0
62	Mrs. Antonia Towne MD	wklocko@example.org	2026-01-26 21:15:51	$2y$12$PAr7ATgHqnVdrrL1eP/K8uuQRfgSRUn6F7k3dK.s3IpzrukGGyF76	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	830-358-7634	female	1970-03-23	client	t	t	\N	t	0	0	0	0
63	Rod Block	williamson.aurelia@example.com	2026-01-26 21:15:52	$2y$12$cjJnqFBnnYTK10q814FhE.LSOGZ3ndiynJNJIHr0sdpibjcniMoD6	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	201-297-2244	female	1996-01-08	client	t	t	\N	t	0	0	0	0
64	Rosalind Grimes	nader.mabelle@example.org	2026-01-26 21:15:52	$2y$12$ygEzEeMKhgqL0YpV8dfOP.fyh6m2ED/zBE3zJe8UcVIxoPaMtDI8i	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	781-362-9608	other	1977-08-12	client	t	t	\N	t	0	0	0	0
65	Jamaal Ankunding	ida.wehner@example.net	2026-01-26 21:15:52	$2y$12$FxsXuT44/c/eMZHBaRma6Oxq7aljrHoWwuOd.YEU6hA/Oy8/YxlGu	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	+1-680-914-6594	male	1978-12-16	client	t	t	\N	t	0	0	0	0
66	Mr. Cecil Prosacco	gkozey@example.net	2026-01-26 21:15:52	$2y$12$4zcoEkOIc/lxOFskuyAWLeBiWPu7KIXrc09Mzf9gaeEowb2xJpqFq	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	+1-415-746-5749	female	1988-03-09	client	t	t	\N	t	0	0	0	0
67	Deondre Wuckert DVM	velma36@example.net	2026-01-26 21:15:53	$2y$12$xMxWGwN1BGgSFJMW1qxfsOv1QZW2ngXkYVsFchaYTJ6UeTBhXrniK	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	+16695374809	other	1985-01-22	client	t	t	\N	t	0	0	0	0
68	Mr. Lucius Feil IV	harris.estefania@example.net	2026-01-26 21:15:53	$2y$12$.7pfLsmPUjilSlJFBJdbLuC/gPwQ.2MGKiyy8saGgrlo52ZrJkZca	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	+1-978-510-6749	male	2003-08-28	client	t	t	\N	t	0	0	0	0
69	Prof. Terry Hand	will.melvin@example.net	2026-01-26 21:15:53	$2y$12$32t0qGAJJmtS6Dq0UW40LuDtYHHKyLkfR2IdLI.iJ0Z/ahJlIQaum	\N	2026-01-26 21:19:21	2026-01-26 21:19:21	(541) 808-5889	female	1997-05-03	client	t	t	\N	t	0	0	0	0
70	Tina Rath	jany.littel@example.org	2026-01-26 21:15:53	$2y$12$JOBV/eIwNd7x6/6e4MMbUOvH88BpREG58g9wKBCqzdwGa/V3wnuFS	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	(561) 759-5458	female	1982-04-21	client	t	t	\N	t	0	0	0	0
71	Jermain Runolfsson	nels.goldner@example.org	2026-01-26 21:15:53	$2y$12$40Hia8YGKlzNOf3wUoK/xO0MSjZbLyQ7VxGYNAkVZnXBbtFWWUZ42	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	+1.517.231.2177	other	1976-11-22	client	t	t	\N	t	0	0	0	0
72	Ms. Eunice Schumm	stan47@example.net	2026-01-26 21:15:54	$2y$12$S4NZscVQ7o/nZbLTuyO1L.wD1Xy2le/iZOCHTumZWhLmennnz7woq	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	781-799-0337	other	1985-02-24	client	t	t	\N	t	0	0	0	0
73	Prof. Delpha Haley	clyde.mohr@example.net	2026-01-26 21:15:54	$2y$12$T/gXLngpQ54IoL1IORpKpOpi1ze2/yXIM6XLRwyeewgyuuVCJOUOu	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	820.484.5464	female	1986-07-28	client	t	t	\N	t	0	0	0	0
74	Oral Cummerata	arlene84@example.com	2026-01-26 21:15:54	$2y$12$MRbLoGlDzHHIPYqcLocFwuc5dYNUNHofT09e/hmWozIV48ncDluzu	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	907.567.3779	male	1976-10-12	client	t	t	\N	t	0	0	0	0
75	Zachariah Labadie	douglas.weissnat@example.net	2026-01-26 21:15:54	$2y$12$Ikaygh63jQ/iw3WwstD7eONR584aQmSQA2Wdz1iAoYn65..lB6M2e	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	463-247-6452	male	1987-10-02	client	t	t	\N	t	0	0	0	0
76	Emilia Ebert	victoria85@example.com	2026-01-26 21:15:54	$2y$12$oSlUr418LVC6bHcv7/wOAOahqUn/0zSFm.tYOQxVfbg0SKWfc3h.W	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	+1.715.952.2271	female	1982-05-05	client	t	t	\N	t	0	0	0	0
77	Ms. Linnie McLaughlin II	rudy.mcdermott@example.net	2026-01-26 21:15:55	$2y$12$N2izdp4RCfeJP6wSVo2Ys.l4dSlj6rU1ztunNPCAMhD4M7nQeFIjm	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	458.820.5081	other	1986-08-03	client	t	t	\N	t	0	0	0	0
78	Dawson Considine	layne11@example.org	2026-01-26 21:15:55	$2y$12$TTTpqVnEndm5tFdKAN1/a.lUV.cRuq5lofLB4zrpCxJS/GlZWsfW6	\N	2026-01-26 21:19:22	2026-01-26 21:19:22	+1-628-744-0802	male	1999-05-28	client	t	t	\N	t	0	0	0	0
79	Hilda Dare	angel.bruen@example.com	2026-01-26 21:15:55	$2y$12$Hlb.vxhXg13YvLEM0G9Ot.IecWP6wPDx5YpnRsygzVsZl/GHDz01C	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	+1.862.272.2868	female	1987-12-24	client	t	t	\N	t	0	0	0	0
80	Prof. Lenore Langworth	hquitzon@example.com	2026-01-26 21:15:55	$2y$12$FqBXeEf4Zw7mzv1bq9WM4.leYYIFhUj7KJ4GUowxFhHIBeCJdVyvW	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	+18065315762	other	2001-06-22	client	t	t	\N	t	0	0	0	0
81	Miguel Tremblay Sr.	robel.kenya@example.com	2026-01-26 21:15:56	$2y$12$W0eOC/AHwGQQ10jRmWmfC.UpPiE0CO03fXYQOZyWQtAmdTRy76FVW	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	617-928-6107	other	1981-06-21	client	t	t	\N	t	0	0	0	0
82	Mr. Junior O'Hara III	astrid70@example.com	2026-01-26 21:15:56	$2y$12$e.uLAydkl8qlOhIVikehkez2//cEQjU4MjOKYmO2eIdrDB8eo0r.K	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	+1-504-780-6117	male	1981-11-12	client	t	t	\N	t	0	0	0	0
83	Ms. Marietta Becker DVM	gschaden@example.net	2026-01-26 21:15:56	$2y$12$qEr6F7/4AW7v8KnNMtLbV.VrBFFkglwrUwhPsr0T0WcmZ6QoNz7nO	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	+16064088658	male	2004-08-28	client	t	t	\N	t	0	0	0	0
84	Kayleigh Braun	breana86@example.net	2026-01-26 21:15:56	$2y$12$nrMyMkaVFH4MoXje38iTR.gW1Xk0F6wPXpaTMAOtqNReeMyMflyuu	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	+1.551.703.8583	male	1978-10-23	client	t	t	\N	t	0	0	0	0
85	Dr. Chandler Hyatt	cristian.cormier@example.org	2026-01-26 21:15:56	$2y$12$fQAJ6/NHVDHFuP7cdGPyW.vG5dhJP9z9wSQQ1mk2l1ku1RZnGMFmC	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	+1-878-597-6345	male	2004-06-05	client	t	t	\N	t	0	0	0	0
86	Aurelie Schimmel	cummerata.amalia@example.com	2026-01-26 21:15:57	$2y$12$9zd1jZC9QEBlwug9IYmolOAQem4W/K.Hml8L1zL6Hh34hi39NNQqK	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	+17049360484	other	1980-05-28	client	t	t	\N	t	0	0	0	0
87	Dr. Beth Denesik	abel39@example.org	2026-01-26 21:15:57	$2y$12$HlvaaQRkOh7fKRz6SKLDSORHmRkVwEWQ5Rx7H8wg.1DMv.wjI2W1u	\N	2026-01-26 21:19:23	2026-01-26 21:19:23	(775) 802-4754	other	1974-09-07	client	t	t	\N	t	0	0	0	0
88	Lessie Huel	matt.mayer@example.org	2026-01-26 21:15:57	$2y$12$bu7LUmRZpeKDlPWAhOwpoO1rIvIGz.rpOMXps6d7CGdIjhbQMzuhq	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	+1 (701) 447-2609	female	1971-05-06	client	t	t	\N	t	0	0	0	0
89	Kolby Cassin	kautzer.dorothea@example.org	2026-01-26 21:15:57	$2y$12$JON9DQ1wDbfNDtXFk8pF1eVDAlEyh7H3p/UCWHTPutymMGCecDvtC	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	1-507-542-2694	other	1995-03-13	client	t	t	\N	t	0	0	0	0
90	Harvey Powlowski	pswift@example.net	2026-01-26 21:15:57	$2y$12$/jJqp3egKrF88O64IdRdG.ReHEPFdTjidvXW7ABjIMfUDs/5Hmwd6	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	+18386701715	other	1982-08-03	client	t	t	\N	t	0	0	0	0
91	Darron Bosco	meda.kuhlman@example.com	2026-01-26 21:15:58	$2y$12$gKG0Um5LywbuzXk5TBt.G.YQhi5vJ/3Vu2lBkA93GNT1zRlFYlktG	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	1-256-826-8208	female	1999-08-18	client	t	t	\N	t	0	0	0	0
92	Carissa Cole	bauch.art@example.net	2026-01-26 21:15:58	$2y$12$xeO.9YIkK72aFj2CAMRZOurziOUv7LuEDbsGfKul7QKykLm2BU.GK	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	+1.907.917.1394	other	1973-07-25	client	t	t	\N	t	0	0	0	0
93	Jazmyn Dietrich	crist.agnes@example.org	2026-01-26 21:15:58	$2y$12$Uzo1fAeCbbGFG2q257UFWO6SnpdrKsdFvBJyokFuXLGN5HDPZGo9G	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	+1.830.443.3964	other	1976-08-01	client	t	t	\N	t	0	0	0	0
94	Maryse Beer PhD	annalise38@example.com	2026-01-26 21:15:58	$2y$12$M8.0MFUMWioZXHnCCKiKnuyIWYdJo/pUcc4jRW72l5becsrHJNac2	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	(754) 489-8322	male	1981-06-05	client	t	t	\N	t	0	0	0	0
95	Beth Jones	jefferey61@example.net	2026-01-26 21:15:58	$2y$12$kr.m5NqAycuTad//nJmQI.SuUi/9UMZJ2rosbJzFPzu/A491fSB8u	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	682-818-9432	other	1980-08-14	client	t	t	\N	t	0	0	0	0
96	Mose Abshire	brendon23@example.net	2026-01-26 21:15:59	$2y$12$6YV9tz8il3Djllvqs2tVmeZXZC0fr2wqPM4cW3EMwo5WjgtHcIKpW	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	224-914-4616	other	1975-09-01	client	t	t	\N	t	0	0	0	0
97	Dr. Corene Okuneva	kbartoletti@example.com	2026-01-26 21:15:59	$2y$12$9OW6CoKmd9wzGO.bRNKiU.nwfURZIaE2p2hpFpCJoeL2aK7MGRgX6	\N	2026-01-26 21:19:24	2026-01-26 21:19:24	858.516.8857	female	1977-10-08	client	t	t	\N	t	0	0	0	0
98	Mr. Corbin Satterfield	lhuel@example.org	2026-01-26 21:15:59	$2y$12$IvfT1nKqm4fUJCn09XpuJ.E3G.BUEKj4ZTL23YYNtj.Ys9gkzJNau	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	+1-845-402-6517	male	1993-08-02	client	t	t	\N	t	0	0	0	0
99	Omari Ortiz	vmayer@example.net	2026-01-26 21:15:59	$2y$12$KQncREv/sFKizxlijknLTe1.VWf9/YxdivsUj60IP910dWljjMQ7i	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	1-815-833-8806	female	2001-03-10	client	t	t	\N	t	0	0	0	0
100	Miss Samantha DuBuque	schmidt.kenyatta@example.com	2026-01-26 21:16:00	$2y$12$Kk3enH0FJMHj7.apFUIHpueoAfb/EBEatqy2FI8oVYAU26A19xaXG	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	+1-520-875-0071	other	1999-02-06	client	t	t	\N	t	0	0	0	0
101	Grover Bogan	vincenzo.okuneva@example.org	2026-01-26 21:16:00	$2y$12$bMYznhL2LUYJuLYnBIfS3ujgodtjCOelCl2J8h2QvlTwNGf1ku6tK	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	+1-707-282-7676	female	1992-07-03	client	t	t	\N	t	0	0	0	0
102	Laila Ankunding	zmosciski@example.net	2026-01-26 21:16:00	$2y$12$6RHJhir57Zrf9T1MgRbT3OrAtrZ55IvvQ7gi.BjyXrFaFaEuwsB3m	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	864.966.8696	female	1998-10-26	client	t	t	\N	t	0	0	0	0
103	Prof. Antoinette Okuneva MD	gkuhic@example.org	2026-01-26 21:16:00	$2y$12$3wIQKORuEtb3xt5S9kUpK..L.dahb7n5xUo8VxPthYA77CzOQBG6K	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	971-363-6893	female	1990-09-10	client	t	t	\N	t	0	0	0	0
104	Emilie Pacocha	runte.darrell@example.com	2026-01-26 21:16:00	$2y$12$qQ8K5NgoNq8Y4pAV91d4GOwatW9f23GZA5ximlrfN6OB0LLjbwcOO	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	(580) 680-1789	male	1983-11-10	client	t	t	\N	t	0	0	0	0
105	Jakob Botsford	botsford.eriberto@example.com	2026-01-26 21:16:01	$2y$12$yIW8Ga/c2aYJUGb46YyTwOL.tCNHEGUiXzXTYrac9CNnSSxrySybu	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	913.875.5886	male	1979-01-01	client	t	t	\N	t	0	0	0	0
106	Enoch Smitham	brakus.salvador@example.com	2026-01-26 21:16:01	$2y$12$Tc4/NY2sUSZh/O0NWAj3F.iKrmOC96gnhZTCtYF9XW3vjh.W1EmEm	\N	2026-01-26 21:19:25	2026-01-26 21:19:25	(775) 691-1099	female	1973-04-06	client	t	t	\N	t	0	0	0	0
107	Herminia Corkery	jadyn.pollich@example.org	2026-01-26 21:16:01	$2y$12$70AOkZ81rm77F70OlKfVkOsAW7AjaA2Ey9nPfJKmWrXAa9kb/Qa.i	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	+1-310-731-0039	other	1976-02-16	client	t	t	\N	t	0	0	0	0
108	Jalen Hegmann	ova79@example.net	2026-01-26 21:16:01	$2y$12$ck.XP5tqrLW32YuLQ9Wlqu8Ea5hLAbm4OsjhJ/5SFckw.1SZzKJ2y	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	1-321-851-8774	male	1997-09-12	client	t	t	\N	t	0	0	0	0
109	Cheyanne Cremin III	tbalistreri@example.org	2026-01-26 21:16:01	$2y$12$y.gYyyaP9M1pMFXzE7kFae2kAQPM3tgPu3QMke98jBa6OeEpbby02	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	(234) 490-5265	female	1982-04-20	client	t	t	\N	t	0	0	0	0
110	Dahlia Kirlin	elise.ryan@example.net	2026-01-26 21:16:02	$2y$12$z/cbuzO7kRx4wY4oRcKl3.zgjEQbLE1U4RE/RXBZswfJAB3HAfUTK	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	612.209.9634	male	1985-10-28	client	t	t	\N	t	0	0	0	0
111	Freida Muller	tierra52@example.org	2026-01-26 21:16:02	$2y$12$ILWxg2ZIKiI6eJWpVx11BO9LHupO13mhQtK7nmbaogIgs37Eq5lQ.	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	+1 (302) 826-3577	female	1972-01-27	client	t	t	\N	t	0	0	0	0
112	Nettie Howe I	torphy.janiya@example.org	2026-01-26 21:16:02	$2y$12$ZRljVb29rz7t7bXX47xK0exJEzdCBNx9Lrzfd5w0nsnvGRI8L.uxi	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	732-995-2192	other	1976-06-30	client	t	t	\N	t	0	0	0	0
113	Amaya Rowe Jr.	sydnee47@example.com	2026-01-26 21:16:02	$2y$12$ZFjg52j3sWnR.3VARG3Ibup9iybZTmNu/1hRZBLwWEFBpAbyJuaA6	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	+1 (559) 443-4521	other	1972-03-15	client	t	t	\N	t	0	0	0	0
114	Ceasar Koepp	xhills@example.org	2026-01-26 21:16:03	$2y$12$TgiBVrxfrzKwMuqdIQgdr.bikd6K6YLpu5u8324orNBMKIVbMmonm	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	717.296.3084	female	2003-01-05	client	t	t	\N	t	0	0	0	0
115	Miss Willow Schinner	jaylen.mohr@example.com	2026-01-26 21:16:03	$2y$12$Av.6sp6TVH0NtBEUruMIh.R42D4iJ3ZyXrepNA/hgaJcL.szTIQj2	\N	2026-01-26 21:19:26	2026-01-26 21:19:26	+1-541-437-2846	other	1992-07-05	client	t	t	\N	t	0	0	0	0
116	Dr. Odessa Nicolas	creola.lind@example.net	2026-01-26 21:16:03	$2y$12$ulQyFuOXoBWRp7zovSl6aexQrs7hsr5CXoCRAiobry1Q6.g5N9zUu	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	+1 (650) 489-8443	male	1981-01-23	client	t	t	\N	t	0	0	0	0
117	Esta Brekke	lysanne.beahan@example.org	2026-01-26 21:16:03	$2y$12$y0zLS0WUUyDTj2dKltXNOeHd3qRAqo3AyZcHaYScM5rcOYc.KFgFa	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	+1 (217) 214-5996	female	2001-07-13	client	t	t	\N	t	0	0	0	0
118	Carlee Becker III	weissnat.deja@example.com	2026-01-26 21:16:03	$2y$12$qDC4UhRNSKf1rqMLQvjL.On0Y/SNTFKQ2jNLhXZyqbzcJglJ63l0.	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	+1-708-729-6580	other	1987-12-08	client	t	t	\N	t	0	0	0	0
119	Dr. Cortney Kozey I	hettinger.anjali@example.net	2026-01-26 21:16:04	$2y$12$OuiB2kbE4hjmlXpUA6SCRuiXS95wbzYfFpI8vJvGUjmWT2sWHSJdO	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	+1.757.795.4057	male	2002-09-09	client	t	t	\N	t	0	0	0	0
120	Dr. Enola Strosin	clarissa12@example.com	2026-01-26 21:16:04	$2y$12$hz1XPUelpMPgiU2dCJOAyuV99j1y4EEfcoinSjdZ0PNd7FFej.Dui	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	(262) 360-9982	female	2000-01-23	client	t	t	\N	t	0	0	0	0
121	Arnulfo Shanahan	swiza@example.org	2026-01-26 21:16:04	$2y$12$8SiwAW.6WMw8NBqFzNbLIO0ewi62.OItFTrEbiJmLG8/.7EFogU/O	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	+18459146179	female	1986-05-04	client	t	t	\N	t	0	0	0	0
122	Helga Bernier	ernie56@example.com	2026-01-26 21:16:04	$2y$12$4O73wjRow8W00GQIt1c2BujYWLBAjIedAK5vJKnUCMarPDeN37spi	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	234-769-1007	other	1999-08-02	client	t	t	\N	t	0	0	0	0
123	Ayana Kemmer	zoie56@example.org	2026-01-26 21:16:04	$2y$12$i/wqbYNmm8WrCeQQMfvWJeZJyDCGArPdVkWmAuHvuw8E1hTpynObW	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	949-639-0619	male	1980-12-12	client	t	t	\N	t	0	0	0	0
124	Sandrine Tremblay	ykovacek@example.com	2026-01-26 21:16:05	$2y$12$j5bMySoqhE5pzQ4ro0Plc.Uo/xcwKD6bbROu/KcHIGqsS4UoL03su	\N	2026-01-26 21:19:27	2026-01-26 21:19:27	410.682.8090	other	1976-01-11	client	t	t	\N	t	0	0	0	0
125	Schuyler Pfannerstill	georgette.kuhic@example.org	2026-01-26 21:16:05	$2y$12$1rh2b5G83Ov1BNV0MXu9G.FvLVqfUn6IQ13RNNaN5DwaF3QSA5mli	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	+1.660.750.6769	female	2003-04-24	client	t	t	\N	t	0	0	0	0
126	Jeff Wintheiser	sadye93@example.com	2026-01-26 21:16:05	$2y$12$iY5l/2pJzIky634x5sxor.I00pCl6qtGYP/tEjd7HppCGuNmQqtr.	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	1-518-370-1560	other	1984-12-18	client	t	t	\N	t	0	0	0	0
127	Efrain Thompson	gleichner.jaron@example.net	2026-01-26 21:16:05	$2y$12$wzSQUb2YAOium8sJQjZu2e/SLlhO1NNMgzTyq48WGyLduI707oLRG	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	+1.463.692.3852	other	1990-06-17	client	t	t	\N	t	0	0	0	0
128	Lenna Schowalter	woodrow14@example.com	2026-01-26 21:16:05	$2y$12$RkvWMHL/bdYj/wbBeu53QuPdQ8lS40BounsONm/IQ6YaQo8P9RuRS	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	1-626-747-1170	female	1972-12-10	client	t	t	\N	t	0	0	0	0
129	Daniela Bruen	joyce24@example.org	2026-01-26 21:16:06	$2y$12$hRVXNXkBEu5XtCz6xN8I2ewAmqnzI7glBhtHTmEo0N3.fNOFgdnUm	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	+1-205-502-8084	female	1970-01-20	client	t	t	\N	t	0	0	0	0
130	Dr. Mitchell McGlynn DVM	murl58@example.org	2026-01-26 21:16:06	$2y$12$I1dzz0rsBEkONpAhEpHVP.18zHOOxPA4SsMGITi9JLtXsSRq6qmSW	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	1-901-898-6332	female	1991-07-30	client	t	t	\N	t	0	0	0	0
131	Ms. Kira Bode II	taylor.zemlak@example.org	2026-01-26 21:16:06	$2y$12$/HXokKccuRAkxSIc3.o11eToAa5spyLJz3adcpQRzlazmhnrUE3ku	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	(937) 414-1488	male	1974-10-15	client	t	t	\N	t	0	0	0	0
132	Ms. Malvina Zulauf DVM	rempel.eulalia@example.com	2026-01-26 21:16:06	$2y$12$FhdPdS5LEiOzZ7c6RbMDNehXhIgwYSkTf2NQTmHeF5t5zQZL0gIaO	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	1-318-458-1862	male	1985-03-29	client	t	t	\N	t	0	0	0	0
133	Harry Cruickshank	huels.hollie@example.net	2026-01-26 21:16:07	$2y$12$R6ggSo/t25cWhfiEj2u6dOKhqsunskzrcwL1swZ8y04u3AVDGOsCy	\N	2026-01-26 21:19:28	2026-01-26 21:19:28	302.380.4107	female	1986-05-10	client	t	t	\N	t	0	0	0	0
134	Jarod Reichel	khills@example.com	2026-01-26 21:16:07	$2y$12$sSz1kdAr5OIa3T2Lua4MteplbS7XZSXvwDcSjP8wW5pVb6yWgL9tW	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	+1-785-655-6718	female	1990-09-11	client	t	t	\N	t	0	0	0	0
135	Mr. Frankie Russel	dbins@example.org	2026-01-26 21:16:07	$2y$12$98py1k6vpms5K/7SNTwuM..7k/M4j0gRnJFpdLEfe59tpu2NJlY9O	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	513.227.0846	female	1991-02-06	client	t	t	\N	t	0	0	0	0
136	Crystal Crist	arnold.stoltenberg@example.com	2026-01-26 21:16:07	$2y$12$a5ZhDuWS/N/qwKNW3IzkGuXDn/5dUPFV7E1UrJYAfjp9E6ysr7n7O	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	425-743-4710	male	1988-07-29	client	t	t	\N	t	0	0	0	0
137	Roxane Koss	umueller@example.org	2026-01-26 21:16:07	$2y$12$9jMO9Tl3HTQ04GFXBlbIjeE5L1f153wOFOEIBTQU35GP1Wdskqj9e	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	+1-515-882-0505	other	1998-04-05	client	t	t	\N	t	0	0	0	0
138	Coty Anderson MD	irowe@example.com	2026-01-26 21:16:08	$2y$12$hg2GvhGDBfm9upbh2yDW2ObP.hUXeAqtkSZNDPIht801WU.clYTk2	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	(339) 779-6778	male	1980-10-12	client	t	t	\N	t	0	0	0	0
139	Isidro Padberg	jerde.frances@example.net	2026-01-26 21:16:08	$2y$12$pZiv3N/UiRjRYMP/ZhwTN.2QtelhyKy8NhzJzWATQRm5rIb912NLS	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	(959) 728-2776	female	1976-05-20	client	t	t	\N	t	0	0	0	0
140	Samson Hartmann	beahan.carey@example.org	2026-01-26 21:16:08	$2y$12$W4v8mrAANTuEEsyKa2UezOhBnFLpHu3RSDdMIqoECt6RPsl.L/VSK	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	+1.980.984.9867	male	2000-12-23	client	t	t	\N	t	0	0	0	0
141	Mrs. Maye Tremblay V	susan91@example.com	2026-01-26 21:16:08	$2y$12$5JmnKA64bihRt48Cgd2nhehw5QbXJucGAkbYFR.5q9ecE8urZ0Gu6	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	+1-207-839-2896	female	1985-12-26	client	t	t	\N	t	0	0	0	0
142	Mrs. Vallie Donnelly	buckridge.madge@example.org	2026-01-26 21:16:08	$2y$12$UsjlPCsxxvmRAFcWNM/cu.D5jrQGikuwZEhRbP4AjgYAY3HoIbHkK	\N	2026-01-26 21:19:29	2026-01-26 21:19:29	848-907-0817	male	1993-08-18	client	t	t	\N	t	0	0	0	0
143	Prof. Schuyler Graham IV	telly.hills@example.net	2026-01-26 21:16:09	$2y$12$rznKkOZ/X2U7DlDdvsFHqenL409fylG34nLNTbUCA/QbaUBsjv./G	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	+19899869446	female	1974-01-08	client	t	t	\N	t	0	0	0	0
144	Jannie Carroll	julian.kunde@example.org	2026-01-26 21:16:09	$2y$12$s3I7yczPs.a/LWA8Vjsj3eYeBdl77Tm1ob7PuGPdC1XuWueqUe9sS	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	928-632-3729	female	1993-11-04	client	t	t	\N	t	0	0	0	0
145	Carrie Keeling II	joannie.wiegand@example.net	2026-01-26 21:16:09	$2y$12$MQXelg.y3t/wUKIWsQubne4mN1t2x8B6GH5ASTV72iZS6YA2SN1HO	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	740-752-6372	female	1980-02-12	client	t	t	\N	t	0	0	0	0
146	Audreanne Altenwerth	jonas.zulauf@example.net	2026-01-26 21:16:09	$2y$12$5W1zhdhxNQOV.bfJbv062OktMjSnHjAV0BYhOOLfzyXdTJJ8nG73e	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	773-256-2167	male	1996-12-31	client	t	t	\N	t	0	0	0	0
147	Rita Hartmann DDS	donnelly.jaleel@example.net	2026-01-26 21:16:10	$2y$12$.wYzs0aouekI16qwn/FDPuxXlmkDGknhBQJMOzJt2nL87v3ubpuPa	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	1-641-240-9882	other	1979-03-12	client	t	t	\N	t	0	0	0	0
148	Mr. Brad Donnelly	berge.river@example.com	2026-01-26 21:16:10	$2y$12$rA6n7qD9j6pz2aaqryGkEuVHnBoUs/9nOtYjeDsRhHGFQw9upZVtO	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	+1-313-342-1802	other	1978-04-14	client	t	t	\N	t	0	0	0	0
149	Callie Beier	walter52@example.org	2026-01-26 21:16:10	$2y$12$vGvdKCq6DTnJ/Jm0gli.9eLRcjaWJTg42JI0sh19JSgLv6i17Qvwm	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	1-512-826-6570	female	1988-06-15	client	t	t	\N	t	0	0	0	0
150	Dr. Milford Johnson I	lavinia20@example.org	2026-01-26 21:16:10	$2y$12$LGVFHWorV8OZ6GoilPBbJuzZbbpoMV0wGWAn2LQMwSWz2TTFUk4n.	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	1-973-733-8645	female	2001-08-20	client	t	t	\N	t	0	0	0	0
151	Wilmer Kuhn	micheal24@example.net	2026-01-26 21:16:10	$2y$12$Sa6ohP2AYBg9act/FoYERe0OThNkWjSABqH/NM1QVURZYpMbvxOES	\N	2026-01-26 21:19:30	2026-01-26 21:19:30	303-986-7117	female	1989-09-27	client	t	t	\N	t	0	0	0	0
152	Mr. Lula McKenzie	utowne@example.org	2026-01-26 21:16:11	$2y$12$2PDLgYRN9DJ2vheM8RKPU.KDhkLOwSO//4hAFpZXWOemxtcdQpFmu	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	831-778-9390	other	1986-03-17	client	t	t	\N	t	0	0	0	0
153	Albina Heller	mauricio.hackett@example.org	2026-01-26 21:16:11	$2y$12$WDVlOe7LN3XOmpqeZb5q8eT.kza08TrMWQ9SYYfYGJ89fNdzxAZM6	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	520.840.8657	female	1974-12-18	client	t	t	\N	t	0	0	0	0
154	Zechariah Rau	douglas.claud@example.org	2026-01-26 21:16:11	$2y$12$VoReDSkis4ztu6M4ipsjaew8X7Gs/Oaxmas4z7Dq/UBbLZ6g3i6pm	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	(571) 314-2946	female	1973-05-21	client	t	t	\N	t	0	0	0	0
155	Kenna Haley PhD	rowena.keebler@example.com	2026-01-26 21:16:11	$2y$12$eoOEmXr0XGVzHfi3QHL7MOLXZeT5iVErCylcBx.RpSaNmP1VvdmfK	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	563.315.5454	male	1982-01-19	client	t	t	\N	t	0	0	0	0
156	Dr. Floyd Armstrong	hallie.hermiston@example.com	2026-01-26 21:16:11	$2y$12$V6fcmF7jEksMF1a7coSr2.BBVr.w4B5nnFt9RtXdwJi3Mj.Wej5IO	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	573-708-2946	other	1995-01-24	client	t	t	\N	t	0	0	0	0
157	Anjali Stokes	darryl35@example.com	2026-01-26 21:16:12	$2y$12$1Y0VtAEbqG92G6JjZXl9RuyKwy.OqN6XRwaJIXB./wyw6c03DFj.a	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	+1.281.251.2250	other	1979-12-04	client	t	t	\N	t	0	0	0	0
158	Trinity Deckow	bferry@example.org	2026-01-26 21:16:12	$2y$12$vW/oiiS8M9KDkc9JGDBj0Om.jo.OWmBZ086QUpMX8qiecbRkqd2gS	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	(336) 445-1057	other	1975-12-15	client	t	t	\N	t	0	0	0	0
159	Prof. Alexander Treutel	floy44@example.org	2026-01-26 21:16:12	$2y$12$Mwp5kAocKG3/tDQOkfOS6.K78D3tMUAszCAGCFlNRIsbZl4v/BFuy	\N	2026-01-26 21:19:31	2026-01-26 21:19:31	432-861-4992	female	1983-01-15	client	t	t	\N	t	0	0	0	0
160	Magali Hansen	lillian32@example.com	2026-01-26 21:16:12	$2y$12$FHdEuZu0vn0zSxY4oNZk4ejqBsJjVnktPC4WXfYj2W1HjsE3Qfi2S	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	504.831.1447	other	1990-08-29	client	t	t	\N	t	0	0	0	0
161	Arvilla Barton	nlarson@example.org	2026-01-26 21:16:12	$2y$12$YaNAPSQMdCJ7KvmfOnYDnu4hMNrSmbVCbF2DxiF/Qm8jZ3r4XgeES	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	1-662-495-0923	male	1996-07-02	client	t	t	\N	t	0	0	0	0
162	Brendon Jast	heaney.sedrick@example.com	2026-01-26 21:16:13	$2y$12$Aet2/ezVZ9xgaG798VGFy.7eZuouidwDpq51G/EGAw.u3Y/4R/cpy	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	+1-419-792-8078	other	1982-07-09	client	t	t	\N	t	0	0	0	0
163	Maye Ward	tillman.rath@example.net	2026-01-26 21:16:13	$2y$12$EQYB2pQUQxzk75JNYvCs2efeinmWgsHXiadek/krOwbbzrKEGh8OS	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	+16035972003	male	1970-03-20	client	t	t	\N	t	0	0	0	0
164	Mr. Horacio Deckow	louisa.heidenreich@example.com	2026-01-26 21:16:13	$2y$12$wGiBtq9TI3QFw3jUNJYTQ.CkQxZa/vg2NKJgpXdW0uWjut7pY8eL6	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	341.738.3596	male	1992-01-06	client	t	t	\N	t	0	0	0	0
165	Clovis Hettinger	hettie.kessler@example.net	2026-01-26 21:16:13	$2y$12$mB.2YhDE/Qm9JDW2duK1Q.RISV4BR29i0/PkF5/pn8NEpMTWItTwy	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	+1 (971) 251-0985	female	1985-04-20	client	t	t	\N	t	0	0	0	0
166	Imogene Toy	mclaughlin.emmanuelle@example.net	2026-01-26 21:16:14	$2y$12$NUrOTdFWl9Hv8cJ11jm8QeDA/iY8nC4aSNpn79DgjmK.Tlq6LVqN6	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	920.585.3973	female	1973-04-11	client	t	t	\N	t	0	0	0	0
167	Prof. Noah Smitham	zzboncak@example.net	2026-01-26 21:16:14	$2y$12$qbGp0lGTtxNc82LO4awzaupyNePorJr/kBM/txVvUiENRw3XxC4oC	\N	2026-01-26 21:19:32	2026-01-26 21:19:32	513-909-9037	female	1973-09-19	client	t	t	\N	t	0	0	0	0
168	Prof. Uriel Harvey	zwyman@example.net	2026-01-26 21:16:14	$2y$12$fr9fggUeZAzuYecocAsfzeO3SHjA9t7dyl1KKC6v88nzS.kfOyRKW	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	+1 (563) 883-8442	female	1971-08-21	client	t	t	\N	t	0	0	0	0
169	Asa Willms	reilly.adeline@example.net	2026-01-26 21:16:14	$2y$12$rb0BTX88vcsV2arV4vbfIOxIlEcVemPBlbei9ek/avnEXwFJkli/m	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	+1 (810) 696-5137	other	1990-04-05	client	t	t	\N	t	0	0	0	0
170	Barrett Doyle II	louisa.morar@example.org	2026-01-26 21:16:14	$2y$12$CklBPtlBuN/qv/jpoBDoSOx5az0MXwBsK9hI0dQ7BEcH.w75Otake	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	435.625.3973	female	1977-01-23	client	t	t	\N	t	0	0	0	0
171	Lorenza Ondricka	emmanuelle35@example.org	2026-01-26 21:16:15	$2y$12$MsAr37ITMxCwwocdZl2.Dec/37iMQo5IHvBSpS9xneW0E1Wz.Ca0u	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	1-830-687-7551	female	1973-03-20	client	t	t	\N	t	0	0	0	0
172	Mrs. Jeanette Dooley	kulas.brice@example.org	2026-01-26 21:16:15	$2y$12$BcTPrawTv/0S/aD/hZd4/.xzw8rMJ9xykFtvJ/cCMx7kf1uRJzrYe	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	941-265-8980	other	1985-06-28	client	t	t	\N	t	0	0	0	0
173	Roman Smitham	nelson46@example.org	2026-01-26 21:16:15	$2y$12$L2AwX8wT2FdGBbkmCJ9mXOUbuhEfY.0DiJqZdVyKQJYNz6kLAL7IK	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	+16517208303	female	1988-08-03	client	t	t	\N	t	0	0	0	0
174	Ms. Wendy Tremblay	gwill@example.org	2026-01-26 21:16:15	$2y$12$8bK2ZNf8UywCGzczQ.AKMOoBmCgfXGPGWUvA.OTTXLsxDZ3hSYmOu	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	(629) 582-2297	other	1973-07-08	client	t	t	\N	t	0	0	0	0
175	Bernice Nader	lakin.jonathan@example.org	2026-01-26 21:16:15	$2y$12$Im/PdP8k3nAY89I1b0JELOd9rgwZnkUufUqTe2csaTsgAZ5tolbi6	\N	2026-01-26 21:19:33	2026-01-26 21:19:33	+1-423-423-1453	female	1981-02-02	client	t	t	\N	t	0	0	0	0
176	Gregory Schroeder	mbartell@example.org	2026-01-26 21:16:16	$2y$12$hfmUe0fCLE1h39WwivWWvu6QVf1499GvwExp1V22syrEyglfo5wa2	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	+1 (303) 919-0626	male	1987-11-26	client	t	t	\N	t	0	0	0	0
177	Rossie Ziemann	jedediah32@example.org	2026-01-26 21:16:16	$2y$12$PFfgnCEvRj1P5f5FnX8K..4rI02C1kqEMlUdzNuvxmAmkOpRvxEvW	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	(283) 528-1541	female	1988-09-28	client	t	t	\N	t	0	0	0	0
178	Dino Hirthe	braun.axel@example.com	2026-01-26 21:16:16	$2y$12$S5yaGnVQOmSJCfauAWB/fuR7cOpFeGpZ2PGAxwCTI8JrMbJrQPVBG	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	253.560.0636	other	1988-10-10	client	t	t	\N	t	0	0	0	0
179	Dr. Kasandra Goodwin V	tcole@example.org	2026-01-26 21:16:16	$2y$12$qhyHiO1lvf8lzvFpXY7RCO6SKJ3BrIi5/2gqeBqjuCkdUc1T.uAIu	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	218.299.2758	other	1996-03-13	client	t	t	\N	t	0	0	0	0
180	Malika Ward	koepp.eulah@example.com	2026-01-26 21:16:17	$2y$12$CvlirmDvANI6CE41/0qwZO0MdDQFB7GN1GslTUDqO4y3Mg4uE1VNC	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	1-848-330-7940	other	1974-12-08	client	t	t	\N	t	0	0	0	0
181	Viva Wyman	wharvey@example.org	2026-01-26 21:16:17	$2y$12$rXXIPUFKUUkUgabo89XtSO.Hu2KI1/uDKDIbXY0hQVRyh.sSBpmwW	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	+14235410613	male	1973-09-19	client	t	t	\N	t	0	0	0	0
182	Sydney Torphy	wcummings@example.net	2026-01-26 21:16:17	$2y$12$mPEB8drn5jaIxcxyYdW28eCUZRLddxOBKOBKA0AwO1hoSSRaxINM.	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	636.404.2101	other	1996-07-30	client	t	t	\N	t	0	0	0	0
183	Alden Parisian Sr.	rodriguez.valentina@example.org	2026-01-26 21:16:17	$2y$12$3z45NOdmLIjKvfoy0gZZd.HSD.BcddALKtB6nz1I1ttXl5PmM6M0a	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	1-231-737-9659	male	1982-10-11	client	t	t	\N	t	0	0	0	0
184	Mrs. Carli Powlowski	jordane.hyatt@example.net	2026-01-26 21:16:17	$2y$12$oy7UAoindlixwW7n9c76NeOHKUDnbDCOZRNdILe47UaaIGxTiwgqG	\N	2026-01-26 21:19:34	2026-01-26 21:19:34	+1-754-741-7018	other	1998-06-23	client	t	t	\N	t	0	0	0	0
185	Luigi Abbott DDS	emard.elmer@example.net	2026-01-26 21:16:18	$2y$12$aMURRrfTlyfNuGv0r2rn0./5.5XOQoqtxMNQSkx/jAMSLEIgShE.6	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	276.518.0584	male	1990-05-08	client	t	t	\N	t	0	0	0	0
186	Prof. Janae Mills IV	celestine18@example.com	2026-01-26 21:16:18	$2y$12$o0LYvpSKWgwj9eUmXdlRzu7Q.Ed3HlhNYyqU0a5a9thgAkYs0yI8G	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	+1-858-872-6722	other	1997-07-20	client	t	t	\N	t	0	0	0	0
187	Mrs. Lacy Hilpert I	jeremy.herman@example.net	2026-01-26 21:16:18	$2y$12$eNUqujFvy6GDPDk1Hglmg.BzPDQSsOVIgk1mC6Fch7XZzJ9kWo7F6	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	+1-786-364-0016	female	2001-04-11	client	t	t	\N	t	0	0	0	0
188	Dr. Taryn Metz I	barrett.kassulke@example.org	2026-01-26 21:16:18	$2y$12$fLehSzmqlnMZCeT6IgrZhOq3GJzRfUIbW8JA9ZC0Sl5XPi20vc3bi	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	+1-929-247-2058	female	1998-01-08	client	t	t	\N	t	0	0	0	0
189	Nolan Mitchell	pmante@example.org	2026-01-26 21:16:18	$2y$12$z/whUmbydvQ3mcL40gJUluefma3W7CVlZHUQNnkQnhYwgNeILbKtS	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	1-505-632-6599	other	1971-06-10	client	t	t	\N	t	0	0	0	0
190	Jamey Pfeffer	lschoen@example.com	2026-01-26 21:16:19	$2y$12$0SCrZndsEfRcN.235S0mWecXFNmOVihPMzSE21jVozMarNGvdoed2	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	(314) 466-0744	female	1986-11-21	client	t	t	\N	t	0	0	0	0
191	Reuben Hirthe	waino48@example.org	2026-01-26 21:16:19	$2y$12$r/BBRwkDdpLEt/dbfeb7wuuJbxHjLkajuZTgt3DqbvyTGsycWsWL.	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	1-806-466-1831	other	1988-10-19	client	t	t	\N	t	0	0	0	0
192	Ms. Shanie Trantow	kuhlman.orin@example.net	2026-01-26 21:16:19	$2y$12$elnuAOX3oSsR5Gy/5bbeVea/5YrDCIUwmD7KQh5qL9U4SimU9FD82	\N	2026-01-26 21:19:35	2026-01-26 21:19:35	573-996-5661	other	1999-05-11	client	t	t	\N	t	0	0	0	0
193	Leonel Hodkiewicz DDS	vivienne86@example.net	2026-01-26 21:16:19	$2y$12$oEnny1Z69n59DVYoU9ZOO.bfj0EKWjLqsTfGHmt1XqB.Tqxd8FWZG	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	+1.503.289.1841	other	1982-07-22	client	t	t	\N	t	0	0	0	0
194	Marianne Yundt III	yadira38@example.com	2026-01-26 21:16:19	$2y$12$Zx50E6.GyqaiXoZpEQ3wwuLd39jd7tewg6tn32scKER5667SA9frG	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	678.430.1720	other	1993-04-07	client	t	t	\N	t	0	0	0	0
195	Ryder Mills	shayne60@example.org	2026-01-26 21:16:20	$2y$12$P93M5CkVsJDcevXHliDmM.RU1AL6Rw0n/mK3HGu35dPN7lsaqSqse	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	1-678-597-7068	male	1988-01-29	client	t	t	\N	t	0	0	0	0
196	Thaddeus Labadie	delia37@example.net	2026-01-26 21:16:20	$2y$12$rzIN0yPXfzRG35fZxryiEOUvM7EM15qHv8zfzEioFkqUzIrxpVam.	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	1-530-416-7757	other	1985-08-29	client	t	t	\N	t	0	0	0	0
197	Santos Kuhic	jhaag@example.net	2026-01-26 21:16:20	$2y$12$v.quMwwF9gnLND3fAwZmzeyuaa/TQJRrVO92Y1SqReK3tk8VsaTyW	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	+17866615453	male	1992-11-16	client	t	t	\N	t	0	0	0	0
198	Ms. Rebeka Grant I	gspinka@example.net	2026-01-26 21:16:20	$2y$12$cJp8HIYZxKzTc/SUJzRstOSH7FofiMrjuG..sp8/XVeb0jXmmXYAy	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	678-894-9953	female	1979-03-29	client	t	t	\N	t	0	0	0	0
199	Kian Beier	domenica54@example.com	2026-01-26 21:16:21	$2y$12$ZI8V98Z1XL18G7Tq4HOcxOqfT.Zer4VjIVSYDFBQtJ2hRRnf1qZpa	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	+1 (702) 272-8937	other	1999-10-17	client	t	t	\N	t	0	0	0	0
200	Dominique Sporer	moises.carroll@example.net	2026-01-26 21:16:21	$2y$12$Jm8lA3DVUI/2KRwSXB.jXekQXppf6WfYIN5sBnUCz.rV58PimJgzO	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	1-970-941-1171	male	1992-11-24	client	t	t	\N	t	0	0	0	0
201	Prof. Hyman Cremin	trisha45@example.com	2026-01-26 21:16:21	$2y$12$bqSqpmi70nHFKPqu/1QM2OJeecK/G0NZdxNMH0iFG4qrs.W.1DBF.	\N	2026-01-26 21:19:36	2026-01-26 21:19:36	+1 (810) 569-9435	other	1990-07-23	client	t	t	\N	t	0	0	0	0
202	Augustus Beier	lheller@example.net	2026-01-26 21:16:21	$2y$12$ZThLYNZnXyl2bX5Iqn7a..em0wIIMFFaN8VDIcvshHtI8BXlyE2dO	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	989-214-5420	male	2000-12-07	client	t	t	\N	t	0	0	0	0
203	Prof. Hazle Mayer	mraz.adrianna@example.com	2026-01-26 21:16:21	$2y$12$UCynW9Eqj0Umb/LS/JA.YujppmyQyl1OpCXtcbA6kLgpzYbaV.rf6	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	628.495.6200	other	1996-10-30	client	t	t	\N	t	0	0	0	0
204	Kaela Weissnat Sr.	keon.gleason@example.net	2026-01-26 21:16:22	$2y$12$PNyJnEsXwxqpC4TSamQb9O3pp4sunHMrdn3sqiLzWaSRDJWZ71KOK	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	725-201-5350	female	2002-04-14	client	t	t	\N	t	0	0	0	0
205	Felicity Homenick	lue87@example.com	2026-01-26 21:16:22	$2y$12$CIDcego0JUNNArvfikM0g.ercyIiljHvAc0B5JSSt9SgQnga5KBHe	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	854.738.0343	male	1979-11-22	client	t	t	\N	t	0	0	0	0
206	Eleonore Miller	gveum@example.net	2026-01-26 21:16:22	$2y$12$cD4RB7g8diiCj2ySti4oX.eLIHaez44BpA0w9Hr6LPqDFCc2wo76a	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	+1-520-674-1277	male	1972-08-31	client	t	t	\N	t	0	0	0	0
207	Verdie Feil IV	karelle21@example.org	2026-01-26 21:16:22	$2y$12$352hMpO9arp86YytsVPi9ulPgko2xU/xw57z3P010X8Y4xi5Ex9QS	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	+1.239.209.4974	female	1975-09-14	client	t	t	\N	t	0	0	0	0
208	Coty Crooks	johnny.hill@example.org	2026-01-26 21:16:22	$2y$12$OxIBw4HHOgL5uzrgiXmYvuBPGWPK/649.g1S7mdqqlBWtusu2kLn2	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	262.496.3246	other	1981-05-18	client	t	t	\N	t	0	0	0	0
209	Mariano Marquardt	koepp.rigoberto@example.org	2026-01-26 21:16:23	$2y$12$WjeEusfJIynkFGSB7pIW9OqX6FMIlHXwTnseZIcKSRivLjzNwEKci	\N	2026-01-26 21:19:37	2026-01-26 21:19:37	+1 (610) 463-8890	female	1975-07-06	client	t	t	\N	t	0	0	0	0
210	Nolan Altenwerth MD	boehm.jaquan@example.net	2026-01-26 21:16:23	$2y$12$Jn2aUVmdIt1iJfV8bS2Y3uK0xgf8U4voKBU43OVncjIX.5IF985.u	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	223.648.1299	male	1985-05-02	client	t	t	\N	t	0	0	0	0
211	Elbert Abbott	loyce.lowe@example.org	2026-01-26 21:16:23	$2y$12$3HDqYLGtVUvcx4swx987s.9rmDLRjYPUv4tHw9fFzcGGhtXPnAFBe	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	754.669.6854	other	1985-09-14	client	t	t	\N	t	0	0	0	0
212	Nellie Von	emmanuelle.mosciski@example.com	2026-01-26 21:16:23	$2y$12$Ar3vOzUh5RlYgi.lgVU4Ne7B0MOt3OSB9ku81y3fF4dMtNZKfZ7Ye	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	321-494-2960	female	1993-05-04	client	t	t	\N	t	0	0	0	0
213	Grayson Schamberger	collins.kiana@example.com	2026-01-26 21:16:24	$2y$12$xZbgCsM7CNvBZ17Jaix80e/ROxl15KlJCKvOItBHoFoV5Uq.6g1Bu	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	1-724-645-4565	female	1998-10-24	client	t	t	\N	t	0	0	0	0
214	Garth Kling DVM	tyshawn41@example.com	2026-01-26 21:16:24	$2y$12$AWFWNKKZ0fxPoLV8yH2KJ.DcXSiHAYosqoVQUks7soUCq8mNrnsba	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	346.366.6861	male	1990-12-19	client	t	t	\N	t	0	0	0	0
215	Raven Crist	abner.gleason@example.com	2026-01-26 21:16:24	$2y$12$gPooOUN2mB2sdZg1zXx1Q.mPFTSrg1aYrs3TrOvTwSQCloIV.mnnO	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	(904) 788-2755	male	1987-11-25	client	t	t	\N	t	0	0	0	0
216	Toy Collins	dario64@example.org	2026-01-26 21:16:24	$2y$12$YYbnvXshLUBe2rB7yggxSuRIzvUvOvCHXjPXZha/5Bd5tOQL.tK9G	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	+18604740105	male	1973-03-30	client	t	t	\N	t	0	0	0	0
217	Dr. Chadd Gorczany III	mlegros@example.org	2026-01-26 21:16:24	$2y$12$Wbxvac/CLSGeH143jEmilO1wkegyl5H9a2eWGEojdQ0O.NbDT.Ofa	\N	2026-01-26 21:19:38	2026-01-26 21:19:38	+1 (541) 489-0437	female	1975-07-22	client	t	t	\N	t	0	0	0	0
218	Prof. Jonatan Corkery Sr.	hauck.roxane@example.org	2026-01-26 21:16:25	$2y$12$CkKsZeiXYBcCHqGyibA4W.EBfWOXq9svtmN/aAoFyN4IuFG4yx89C	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	(206) 930-6358	male	1976-07-04	client	t	t	\N	t	0	0	0	0
219	Ms. Sydnie Johnson MD	shayne32@example.com	2026-01-26 21:16:25	$2y$12$tBKNqEavPdAukx0CguRy.OptX2xd2pP8oHc6rM6UMSsm0dSbWlVWa	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	+1-636-963-5773	other	2001-07-24	client	t	t	\N	t	0	0	0	0
220	Iva Bechtelar	lockman.lenora@example.org	2026-01-26 21:16:25	$2y$12$ut6P0vmTMgzWoUH0ueuFVOQ46QjhBDSW2hPfDMhyRgGBGXVcFEE/y	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	+1-210-748-6539	other	1981-05-29	client	t	t	\N	t	0	0	0	0
221	Kaleb Ondricka	kub.elliott@example.org	2026-01-26 21:16:25	$2y$12$HUccsezWDtzuTSvxoi1Aa.yU0WME2L42zk/rlTV/bgUG9vuCw/Cgy	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	940.287.5551	male	1983-06-12	client	t	t	\N	t	0	0	0	0
222	Edyth Gerhold	gerlach.granville@example.org	2026-01-26 21:16:25	$2y$12$QCOQJMj/Q8kPr.LgDbjxbuLDCeOeU7dtMKHz9snPqBz7.I7XN197K	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	(386) 993-9896	male	1975-05-15	client	t	t	\N	t	0	0	0	0
223	Prof. Guiseppe Schamberger V	grady.margot@example.net	2026-01-26 21:16:26	$2y$12$To.xILqDg5yptucafTKXwe90McQ6R6GoGedqltdVIYCtoFOsLN0V2	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	1-831-900-7981	female	1972-06-18	client	t	t	\N	t	0	0	0	0
224	Dr. Brady Bechtelar	rosalyn.kris@example.org	2026-01-26 21:16:26	$2y$12$jbITfDycqX3ju7vskOHAyucW8yHmmcP.D7bRBiOKU5OyTvpHhHaqW	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	445-210-4933	male	1976-02-04	client	t	t	\N	t	0	0	0	0
225	Summer O'Connell	nprosacco@example.net	2026-01-26 21:16:26	$2y$12$qqXPtF9ZMaVnbCqSjOZxFuK5Wss5a6DGW3FqPJZ7H71lqQrCs.H0G	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	(423) 875-1191	other	1988-04-01	client	t	t	\N	t	0	0	0	0
226	Carol Farrell	bartoletti.jeanne@example.com	2026-01-26 21:16:26	$2y$12$06a0z1PETauh8oiJosQN8OrkIpYoOa2wMwELn9mIezIdVCsz8Byg2	\N	2026-01-26 21:19:39	2026-01-26 21:19:39	+15674245258	other	1978-02-13	client	t	t	\N	t	0	0	0	0
227	Nasir Jacobi	feil.corbin@example.org	2026-01-26 21:16:27	$2y$12$9I5NSu1IxqcplirKp6n5BeQACS2CAtvdUGVmd/w.qM/MAdM5FMyQO	\N	2026-01-26 21:19:40	2026-01-26 21:19:40	+1-586-499-9603	male	2003-08-17	client	t	t	\N	t	0	0	0	0
228	Ernesto Gutkowski	elouise.smith@example.org	2026-01-26 21:16:27	$2y$12$I36NI9zA52sEnxc3bsYG4O6JKNKuJp/LJYFOIY98HI1E3Et8roimy	\N	2026-01-26 21:19:40	2026-01-26 21:19:40	(586) 853-8383	female	1998-03-01	client	t	t	\N	t	0	0	0	0
229	Brett Lockman	elena.hettinger@example.net	2026-01-26 21:16:27	$2y$12$6hTiNMrhpLq05Z7vT9rvXeHCx0Fs46S3S5W8cl79yb2VQHV5XH2Ym	\N	2026-01-26 21:19:40	2026-01-26 21:19:40	223-390-6125	other	1985-01-25	client	t	t	\N	t	0	0	0	0
230	Tatyana Harris	susie00@example.com	2026-01-26 21:16:27	$2y$12$bC9C/P2/4HcUmEfIUM6VzOHDpBgycAYyvkXjU8n7P9rn/g5tpVt9G	\N	2026-01-26 21:19:40	2026-01-26 21:19:40	+1-660-219-8469	male	1971-02-16	client	t	t	\N	t	0	0	0	0
231	Tobin O'Reilly	ewest@example.com	2026-01-26 21:16:27	$2y$12$45kVYHPQO47VB8eINo54FOrO/z/xBf.h3DiyyZjA2LbOsTNNJZcSm	\N	2026-01-26 21:19:40	2026-01-26 21:19:40	1-540-515-8517	other	1983-10-12	client	t	t	\N	t	0	0	0	0
232	Mac Lynch Jr.	dchristiansen@example.org	2026-01-26 21:16:28	$2y$12$deLW6r3ErjLPdS6kV6TLA.X3wjd0veR0hQQGgqGnrWcYJP8ddmxBG	\N	2026-01-26 21:19:40	2026-01-26 21:19:40	1-508-454-1591	other	1988-05-26	client	t	t	\N	t	0	0	0	0
233	Dewayne Daugherty	bzulauf@example.net	2026-01-26 21:16:28	$2y$12$IOkKYFwE8fVGk9KJyq9xiO3DqS.VYdZvyCWNsSB7zyb170B/iiDKi	\N	2026-01-26 21:19:40	2026-01-26 21:19:40	907.910.0698	male	1981-04-08	client	t	t	\N	t	0	0	0	0
234	Mr. Cade Nikolaus V	leora.gleason@example.net	2026-01-26 21:16:28	$2y$12$6KtYZXKnJClGHt/r8zJhruEBddR6qFHYsw/NqJwk7DStkg4v9gjGe	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	838-447-4026	other	1979-11-03	client	t	t	\N	t	0	0	0	0
235	Mrs. Florida Hodkiewicz III	hartmann.zakary@example.com	2026-01-26 21:16:28	$2y$12$GnJAceWJHkcTQqt3S1mot.gu/jNKiJuatf6RiWrwitRbsNy9YA2gy	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	+15036955718	other	1976-04-02	client	t	t	\N	t	0	0	0	0
236	Erich Rodriguez IV	bailey.duane@example.net	2026-01-26 21:16:28	$2y$12$pUuYQmWHC/0BSyDa8Y1ooeFlR0t8oC6Vw9GyAZXCHuL8uUMuxNUwy	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	407-807-1958	other	1977-12-19	client	t	t	\N	t	0	0	0	0
237	Edwardo Fahey III	znienow@example.com	2026-01-26 21:16:29	$2y$12$OwbmmxvyRNlUADvKkL0ep.uO8JvGsmiRRFLJAThMYGjSyNSJSVboq	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	(520) 600-7433	male	2001-09-04	client	t	t	\N	t	0	0	0	0
238	Nola Stark	jeanie78@example.net	2026-01-26 21:16:29	$2y$12$hl6yOUhGx/fIZ0ppD5mrUOir5zk.kU2lNvj5eCxfMBimwX6xxC/T6	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	(770) 837-9324	other	2002-03-29	client	t	t	\N	t	0	0	0	0
239	Johan Hauck	mosinski@example.net	2026-01-26 21:16:29	$2y$12$2RBWNP84B82viKdLPDZC9ugvLzaAJGABvKa6tGJCHHONQwPOaV1BO	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	1-352-849-6994	male	1993-01-27	client	t	t	\N	t	0	0	0	0
240	Bernita Russel	baylee.dicki@example.org	2026-01-26 21:16:29	$2y$12$GmlNOX.UP1J93KtfGmGnIeQc/fhCl62bakGGyEogCtK8gZNMJnpp2	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	+1.551.277.5347	female	1991-08-10	client	t	t	\N	t	0	0	0	0
241	Gaylord Gaylord	romaguera.lacey@example.com	2026-01-26 21:16:30	$2y$12$xMPEPZjYTojxnKFs7.H0iuC4zw5nWjTL5yvGWiIe7UM.lPnjEYUwW	\N	2026-01-26 21:19:41	2026-01-26 21:19:41	1-845-978-8356	other	1986-09-22	client	t	t	\N	t	0	0	0	0
242	Prof. Mabel Schumm	wmurazik@example.net	2026-01-26 21:16:30	$2y$12$A/6r0ZIA8dz.gTSFIihSe.3CSoe3412tlNRCeQbhTDoFKpvTF56ga	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	+1.862.330.1218	female	1974-01-04	client	t	t	\N	t	0	0	0	0
243	Myrtis Bosco	sauer.arlie@example.org	2026-01-26 21:16:30	$2y$12$p9qo50iA5bpGun3KvFVAlOIOee2UoMoX34Bf31g7zMrG9l3t5ujGK	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	856.314.7780	female	1982-12-01	client	t	t	\N	t	0	0	0	0
244	Sandra Kilback	elna.wilderman@example.com	2026-01-26 21:16:30	$2y$12$gEVdZl.SbsmgUY/nOIGbe.chY06oF3pd6.k9.QNwJqP3gUOdwjLNi	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	623-658-4778	female	1997-10-26	client	t	t	\N	t	0	0	0	0
245	Dean Schmidt	maurice.kulas@example.org	2026-01-26 21:16:30	$2y$12$3/QrFwj1D11tv3JfA6uJ6ecO3XYXAKTUVbHzZuPohh3quGHTRxl9y	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	754-550-7846	female	1995-02-17	client	t	t	\N	t	0	0	0	0
246	Stephanie Ullrich DDS	croberts@example.com	2026-01-26 21:16:31	$2y$12$YX.I5t.x0ywF3CPTbWM6gOa6kZkT03cSYMIqXYnt9hq.TZ47PhK1m	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	+1-864-700-6401	female	2000-05-21	client	t	t	\N	t	0	0	0	0
247	Adriana Lubowitz	botsford.moshe@example.org	2026-01-26 21:16:31	$2y$12$gbafUUyzEiYq1T7faBrB/.3bn4uf21YujnL4z1OkmALfMf2CGyxyy	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	1-681-717-8136	male	1994-11-23	client	t	t	\N	t	0	0	0	0
248	Prof. Edd Olson	emmerich.miracle@example.com	2026-01-26 21:16:31	$2y$12$UbyGX5/L70FyAyi5pzrFv.uUvOdKeyyImMHGhoVayMUNuEP77SsCy	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	(984) 550-3838	male	1999-04-18	client	t	t	\N	t	0	0	0	0
249	Annamarie Kuhic	qmraz@example.org	2026-01-26 21:16:31	$2y$12$mPKvOdk3Wr85VHjCePsoY.yFGKKg6CuHH4MKHrny9xelv5uKZbxvm	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	641-680-0344	male	1970-05-11	client	t	t	\N	t	0	0	0	0
250	Jonatan Schamberger	paucek.wilfredo@example.org	2026-01-26 21:16:32	$2y$12$SIviTVBOKKMwq/7EYHOFy.OSD8Mv4JhJ6A.TWKW.a79xAN38v52h6	\N	2026-01-26 21:19:42	2026-01-26 21:19:42	(667) 748-7404	male	1980-05-29	client	t	t	\N	t	0	0	0	0
251	Roderick Goyette	blaze76@example.org	2026-01-26 21:16:32	$2y$12$KsCTM8DKkS0Bz1TawvrpXOh2dTKA8AIpocwgf6Hb.IkdviBddkr4S	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	1-904-999-9167	female	1975-04-17	client	t	t	\N	t	0	0	0	0
252	Savanna Beier	laurine.hamill@example.com	2026-01-26 21:16:32	$2y$12$CiflEsytdr/umhKRQj3V8.qLVckJDMVGxktS/tXYWuvAj9K7gZ/F.	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	929.272.2356	other	2002-10-21	client	t	t	\N	t	0	0	0	0
253	Zora Hoppe	skiles.allie@example.com	2026-01-26 21:16:32	$2y$12$pSalfl2LfO01ZmNBsStL2eY/Qug2kAxMooH1EmobXyUt3GGQsgMSK	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	360-245-9917	male	1991-12-03	client	t	t	\N	t	0	0	0	0
254	Mr. Ricky Jaskolski DVM	destiney35@example.net	2026-01-26 21:16:32	$2y$12$rsdLz.G0GtwPrJ7U3ymrKe7eVVDlJtJzbliMBVDE/GmGswIhwi90W	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	+1.520.498.2375	male	1970-10-15	client	t	t	\N	t	0	0	0	0
255	Dr. Ransom Conn	eblanda@example.com	2026-01-26 21:16:33	$2y$12$daRUNy1dwH2wUev20E3uU.RJ41uisesx4nLXnm73fyII5r6hMviwa	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	+1.283.635.1946	other	1995-12-03	client	t	t	\N	t	0	0	0	0
256	Randy Jast	abelardo.nienow@example.com	2026-01-26 21:16:33	$2y$12$rsfifONK4cOo6Z.Qn/KgO.ssb8tvvNPpLvUdOuClREj.hPdI9JjV2	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	848-880-2886	female	1970-09-18	client	t	t	\N	t	0	0	0	0
257	Mrs. Trinity King	barton.susanna@example.net	2026-01-26 21:16:33	$2y$12$3Ex6aMBsdy/vvhkj7Oz0hOxACVKZqOYWFK1yFEbKSJ0k4I0t8FV56	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	(507) 813-0566	male	1985-10-19	client	t	t	\N	t	0	0	0	0
258	Ressie McLaughlin	adela.wolff@example.org	2026-01-26 21:16:33	$2y$12$00Nt2.NLkNebCNz55xw9numOJB/mNpHIzPwCysTlV/hWoPFCB/ihm	\N	2026-01-26 21:19:43	2026-01-26 21:19:43	1-253-349-8844	male	1982-08-01	client	t	t	\N	t	0	0	0	0
259	William Turcotte	tiana.haag@example.com	2026-01-26 21:16:34	$2y$12$6S9rzCFVGq.z.4HFHueIxeXDqFfj7BmOVhjDJBl12dR9VYbz3o.H6	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	567-330-7315	other	1979-10-29	client	t	t	\N	t	0	0	0	0
260	Mrs. Kimberly Sawayn	spinka.lexus@example.org	2026-01-26 21:16:34	$2y$12$wZiYSci2Ld8haByMyoF3o.q36rNwSAC/4gzvrvYWIFkfPOAdWIp..	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	1-346-284-1638	male	1999-10-01	client	t	t	\N	t	0	0	0	0
261	Selmer Stark	dakota28@example.net	2026-01-26 21:16:34	$2y$12$m4hK1DpG.dvwRHlkmBg3duTfNtU3OuC5NIH/EJInkhnQSxcJ0xr.O	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	(563) 340-3307	female	1994-11-19	client	t	t	\N	t	0	0	0	0
262	Anastacio Fadel	viviane.steuber@example.org	2026-01-26 21:16:34	$2y$12$miHygI5m5OX/j4j7raFNVePAnjFJMxVOKiipaattjz2h7NJq8pjPG	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	254-629-8600	male	1974-11-25	client	t	t	\N	t	0	0	0	0
263	Tavares Spinka DVM	lane68@example.net	2026-01-26 21:16:34	$2y$12$EDGK0pkRIBzXkVOjAIQ6Je63/dVOqfQIlo4NCKp6BtEJtEeN5NK2G	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	+1 (475) 897-9857	male	1970-12-22	client	t	t	\N	t	0	0	0	0
264	Evan Frami	jwisozk@example.net	2026-01-26 21:16:35	$2y$12$GDvIYqAWHXZ6TZiBtbllJOx8QPxhUCxy7fCMLaYNyDuGS47zESs5G	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	1-878-892-8457	male	1975-02-11	client	t	t	\N	t	0	0	0	0
265	Avis Hettinger	bria.abshire@example.net	2026-01-26 21:16:35	$2y$12$nI7ncAsauiZnRyVbA4IpA.ZfsPuBPw5GqQ2aTgkli0BZNU7WR.Z0S	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	1-919-453-0168	male	1978-08-15	client	t	t	\N	t	0	0	0	0
266	Dr. Vergie Emmerich I	franco06@example.org	2026-01-26 21:16:35	$2y$12$kjCt1swRzrctiIzJv8UMrOAVwWNQl9sH2qCABUXu2K//Mt2DcVzc6	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	231.914.8261	female	1994-03-29	client	t	t	\N	t	0	0	0	0
267	Prof. Damian Schulist Sr.	kulas.obie@example.net	2026-01-26 21:16:35	$2y$12$hJ1VpFLoN.2ki7LHaOi4l.bo2neHXHhrBTIlQ3ZIRnbc19jrCF8R6	\N	2026-01-26 21:19:44	2026-01-26 21:19:44	1-925-532-6439	other	2003-12-03	client	t	t	\N	t	0	0	0	0
268	Thad Swaniawski III	haley.adaline@example.org	2026-01-26 21:16:35	$2y$12$NQdLcBbd7CEbX/lLPBgB4.sgHtkcBvkPdccot41mDxds5Oi4hCL5q	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	202.581.4544	other	1990-03-10	client	t	t	\N	t	0	0	0	0
269	Peggie Reinger	auer.cheyenne@example.org	2026-01-26 21:16:36	$2y$12$5WPeiRoeXN6vf0EKmcHUSOTEJcJnWIm6Hi8afJnvQV9s2pEIrMsvy	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	+1 (520) 851-8178	female	1989-09-25	client	t	t	\N	t	0	0	0	0
270	Prof. Arjun Hermann Sr.	sierra73@example.com	2026-01-26 21:16:36	$2y$12$ZSGIXaoPWlQA49aly6.Spu.oQEYCJGgCxeup0a/lMI5Qs5PeGOsbq	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	334.491.7031	male	1995-10-16	client	t	t	\N	t	0	0	0	0
271	Keyon Heidenreich	xyundt@example.org	2026-01-26 21:16:36	$2y$12$0ErC6M09RxcOVU6.hHzQ0O/OXBnT9sLQAtm..S/71eWLftt2VJrym	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	678.308.2163	other	1991-11-28	client	t	t	\N	t	0	0	0	0
272	Miss Madonna Leuschke I	marcel.senger@example.com	2026-01-26 21:16:36	$2y$12$H.wmqINfWF7KUhMEPZ8wb.DKGtNH5dpmUPZJFF5eed0eo5Q/DWbe6	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	479-544-6522	other	1990-03-09	client	t	t	\N	t	0	0	0	0
273	Thad Nolan	oledner@example.org	2026-01-26 21:16:37	$2y$12$.I1qZgLLllYMvt.rA2NI2OP8eXIVTaXfgAHrM.YBehUc8gJltI5lm	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	+1-737-279-5445	other	1982-04-03	client	t	t	\N	t	0	0	0	0
274	Evelyn DuBuque	beatty.carmine@example.com	2026-01-26 21:16:37	$2y$12$cDhg.J7JSUfeB8BM.LvzG.aWV5VkIQMSEv/tzkKKkiZWlnD.d03sq	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	+1 (913) 643-3731	female	2003-09-21	client	t	t	\N	t	0	0	0	0
275	Susanna Will	willms.mabelle@example.org	2026-01-26 21:16:37	$2y$12$f3AsSndd4pLvGCvDP4qHWup6x3HkAnWHn0uqVzGzMaboAUUMGSCB.	\N	2026-01-26 21:19:45	2026-01-26 21:19:45	1-248-649-5298	other	1985-07-31	client	t	t	\N	t	0	0	0	0
276	Rickie Nikolaus	turner.cremin@example.com	2026-01-26 21:16:37	$2y$12$E02V7/83uh2PIP3wEZZniuTllxiywGR5Sf.Vnr7ffBtAt65tkchSS	\N	2026-01-26 21:19:46	2026-01-26 21:19:46	+1-307-472-6035	other	1993-07-25	client	t	t	\N	t	0	0	0	0
277	Prof. Korbin Doyle	abraun@example.net	2026-01-26 21:16:37	$2y$12$4JE6eX3AaqceVlu6TBsa7eOrVAeZ09UUtgKQ/Jc/JGjl.fTuF5PLO	\N	2026-01-26 21:19:46	2026-01-26 21:19:46	+1-830-275-6832	other	1992-02-21	client	t	t	\N	t	0	0	0	0
278	Clifton Stehr	tobin22@example.com	2026-01-26 21:16:38	$2y$12$6UCpb2/sE3YWKDrl9OLFb.Y2Fy8eETNjVhoSNuJSP0Z5OaZXOMPCK	\N	2026-01-26 21:19:46	2026-01-26 21:19:46	(607) 926-7897	male	1988-08-06	client	t	t	\N	t	0	0	0	0
279	Micaela Vandervort	mariana.kerluke@example.com	2026-01-26 21:16:38	$2y$12$4.ccahsVDIUpXiKAM6JG9OEHht5RKrYXVohfFws3546WicHcJsp26	\N	2026-01-26 21:19:46	2026-01-26 21:19:46	(480) 996-1992	female	1996-04-18	client	t	t	\N	t	0	0	0	0
280	Elbert Hilpert	udaniel@example.com	2026-01-26 21:16:38	$2y$12$jr.Vj7sAjNP1C6h95Mebe.zCr1nBjWYyq/S95uic9mxBLyxpbHwKu	\N	2026-01-26 21:19:46	2026-01-26 21:19:46	(917) 624-5930	female	1973-03-04	client	t	t	\N	t	0	0	0	0
281	Olga Trantow III	hirthe.lelah@example.net	2026-01-26 21:16:38	$2y$12$UU9nedcKxY8OWEeBg7V0COF.BMlnTHPg4Mb4i7Guti/TSmkdNZlWC	\N	2026-01-26 21:19:46	2026-01-26 21:19:46	+1.562.921.3528	female	1996-01-01	client	t	t	\N	t	0	0	0	0
282	Jeremie Strosin	hammes.sarah@example.com	2026-01-26 21:16:39	$2y$12$afG11JcdZgid10nJaGfHouqVMmtTWj9s57dSHBsRxjjuQ5q95J9EG	\N	2026-01-26 21:19:46	2026-01-26 21:19:46	+1 (469) 667-4438	female	1977-07-18	client	t	t	\N	t	0	0	0	0
283	Prof. Wilbert Reichert	awalker@example.com	2026-01-26 21:16:39	$2y$12$ikDwh5lw7q4b3raVbRNa3ujpONagiMnvAj93Ho4QeDJXljeOJlvqS	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	+1 (860) 905-4501	other	1993-11-24	client	t	t	\N	t	0	0	0	0
284	Prof. Annetta Cartwright IV	hfranecki@example.com	2026-01-26 21:16:39	$2y$12$Izt9s9EHQ3DG5WEzGkKKEOd/YbHtD.3EXwrxsxaQogYSB95wrv07K	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	+1-341-979-3047	other	1985-07-24	client	t	t	\N	t	0	0	0	0
285	Deion Ruecker I	keyshawn65@example.com	2026-01-26 21:16:39	$2y$12$Mqj.jyQXHJHWl.DWIqx7C.B8mluhUckkQZMhEQltffWzhPdGAVz9u	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	820-973-5767	female	1995-06-28	client	t	t	\N	t	0	0	0	0
286	Dahlia Yost V	rwiegand@example.org	2026-01-26 21:16:39	$2y$12$AVi8arawup3KtXaDz5dsJ.FoFotzg73dFZ2JMTlAX3uy07glG/pci	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	+1.260.427.9625	female	1977-10-11	client	t	t	\N	t	0	0	0	0
287	Delpha McGlynn DVM	volkman.wilfrid@example.net	2026-01-26 21:16:40	$2y$12$mVSTChi5sj5be0brPoJbF.L3h2RwytGNXXSWqLQZet.uEAWnGI8jq	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	+12605448849	other	1978-09-11	client	t	t	\N	t	0	0	0	0
288	Marcus Boehm	anderson.karianne@example.net	2026-01-26 21:16:40	$2y$12$gBE2wJvCAmiMlNHMhJV2n.9AII60GXCsO8o3nRSd60nhX8MnWn7vq	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	(463) 915-3694	female	1972-04-05	client	t	t	\N	t	0	0	0	0
289	Montana Emmerich III	rice.ashley@example.org	2026-01-26 21:16:40	$2y$12$UduxxqhkOb./8OyD25R70.0m9JZ1aOm25NpYr1wac47HNk981z5SW	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	1-712-489-5792	male	2002-09-25	client	t	t	\N	t	0	0	0	0
290	Victoria Mueller	ortiz.jess@example.com	2026-01-26 21:16:41	$2y$12$S9WKO17Pz9c5utFmS9k0neRkAGeNH/GtH8v4hN0j5VRjWT0FtjwPy	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	531.531.7470	other	1992-06-07	client	t	t	\N	t	0	0	0	0
291	Sigmund Streich IV	conor.damore@example.org	2026-01-26 21:16:41	$2y$12$g9FdabTOT392lzwZkxO.6.Dr5I93uP7ORUFcWigoUTbOkM1IcTBA.	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	+17344407807	female	2000-07-04	client	t	t	\N	t	0	0	0	0
292	Dan Yundt	thea10@example.org	2026-01-26 21:16:41	$2y$12$/3lQkzMeGmvgCiGrfZv5w.j2f7CaLcoKYmk4BtttfW2nQWPdTl7Fi	\N	2026-01-26 21:19:47	2026-01-26 21:19:47	(940) 410-4220	male	1993-07-10	client	t	t	\N	t	0	0	0	0
293	Amalia Fahey	eliezer.williamson@example.com	2026-01-26 21:16:41	$2y$12$frveVUyZhxsVSwRQob5yoeBVP.ZIoUB84hqAFm1Y9FvAknwa1.oha	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	+1.239.322.3432	male	1998-01-07	client	t	t	\N	t	0	0	0	0
294	Miss Addison Bayer	halvorson.jacey@example.com	2026-01-26 21:16:42	$2y$12$dQuTNf6XhfjU5EUyIea5fe1LBm0P2fdipCuLaO2P0I5CiWgn4Bzyq	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	(332) 732-9521	other	1992-07-11	client	t	t	\N	t	0	0	0	0
295	Belle Tremblay	cgreenholt@example.org	2026-01-26 21:16:42	$2y$12$ULwWzVc3Ti0T95thzn86ZOc0HIbOhO2LR4xrMIIXKC6woZs5sC9T.	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	(754) 350-2950	male	1992-10-10	client	t	t	\N	t	0	0	0	0
296	Marcel Pouros II	claude00@example.com	2026-01-26 21:16:42	$2y$12$e/WAAp3/FkP693t4pYvTsOHV/pWLKd0cmeWGglUyxxXzu4q2nrrA6	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	(315) 723-2360	other	1983-11-26	client	t	t	\N	t	0	0	0	0
297	Myrl Stamm	berge.makayla@example.org	2026-01-26 21:16:42	$2y$12$Z9pU4JeevLjMQxtVhQRVe.K6WYkgp4bbMg2I45OXleKGHIeFE8jqm	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	+1.661.464.3066	female	1987-08-12	client	t	t	\N	t	0	0	0	0
298	Savion Skiles	tabbott@example.com	2026-01-26 21:16:43	$2y$12$wwzenlyy4cO0MusGGt.ymu9fkCYNJNPqinrS4o3VzE0RVrPcVQKOC	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	+1-731-463-2909	other	1971-08-12	client	t	t	\N	t	0	0	0	0
299	Keon Purdy III	frederique.baumbach@example.net	2026-01-26 21:16:43	$2y$12$4PVK4bvoSytBW//0CC6b4OQ9a1edOcXdv9M2xcP2F4KFLNztCSYsW	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	929.490.9748	other	1986-11-10	client	t	t	\N	t	0	0	0	0
300	Pattie Witting DDS	dortha81@example.org	2026-01-26 21:16:43	$2y$12$qB/fWE6yHjnQZkHXoiivU.8.hcreBlQBOFYXxdRMDRJeBImRiZA02	\N	2026-01-26 21:19:48	2026-01-26 21:19:48	+1-608-389-7406	other	1992-04-28	client	t	t	\N	t	0	0	0	0
301	Sally Christiansen V	zbednar@example.com	2026-01-26 21:16:43	$2y$12$q6wm6V1Ci6FA/D2.rXIP3O897sBKVFgkLZ54W5a25us16gjFY6WjO	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	386-321-0098	male	1975-07-24	client	t	t	\N	t	0	0	0	0
302	Chaz Lakin	geovanny08@example.com	2026-01-26 21:16:43	$2y$12$/ly62NKwJr0AdhKOaE9p6eroOugYTBnG7D.qe0f71YX1m2rwY01pa	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	+17708782753	male	2000-12-29	client	t	t	\N	t	0	0	0	0
303	Sydnie Funk	hblick@example.net	2026-01-26 21:16:44	$2y$12$xbwqiIoclMNLGTrzJQtndeWEVZyPZrajXJuWInBLkRSgGxA5IbfrW	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	561-240-6211	female	1983-12-13	client	t	t	\N	t	0	0	0	0
304	Elyse Johnston	fdonnelly@example.com	2026-01-26 21:16:44	$2y$12$9u7HyKSeq7OfRCwghKj8me7zOyywUHq3vil6iNEohn4OjBSYQciyS	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	229-974-3871	male	1991-09-11	client	t	t	\N	t	0	0	0	0
305	Michael Swift	lyda.nolan@example.net	2026-01-26 21:16:44	$2y$12$SYkDYklUYMy9hR7wF5/3P.zV1rgXoFTIJ1LA/7BxarePKkUW8KY3e	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	725-850-8425	other	1986-09-05	client	t	t	\N	t	0	0	0	0
306	Edgar Ernser	ryder19@example.org	2026-01-26 21:16:44	$2y$12$EbNzTsUufkvM/ID9R/bk1edOrNboevQG3fiUkW6G0OT7RpS.tqfUq	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	+1 (832) 751-3210	male	1994-06-01	client	t	t	\N	t	0	0	0	0
307	Prof. Zechariah Howell	tromp.june@example.net	2026-01-26 21:16:44	$2y$12$qM5iC/BcNVdOhA97.KZxEeAnqi70w1VeSOZWK0jyvRqZ9fKDz.5NG	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	+1 (818) 343-6564	other	2001-03-03	client	t	t	\N	t	0	0	0	0
308	Alfonzo Swift	addie.green@example.net	2026-01-26 21:16:45	$2y$12$2jbsfY7VL7axWK4vegkCMuYxNdFjZlocoEiTLrU0gEX7Y8LwIje8K	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	956-268-6221	other	1972-04-13	client	t	t	\N	t	0	0	0	0
309	Mrs. Keira Grady Jr.	llynch@example.org	2026-01-26 21:16:45	$2y$12$pGOAJqVKVSXM4k699sJmDu34f1kGvGNKyglXeOAPeGmbr8hnixkAq	\N	2026-01-26 21:19:49	2026-01-26 21:19:49	(425) 856-8589	female	1976-04-24	client	t	t	\N	t	0	0	0	0
310	Teresa Hodkiewicz	dubuque.shawna@example.org	2026-01-26 21:16:45	$2y$12$PlnlXTlbkDN4KKTFSi7Vce84ouwGSzcIVetgHjDAmyfciDZp19XHW	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	1-845-648-5033	female	1986-05-05	client	t	t	\N	t	0	0	0	0
311	Mr. Ariel Predovic PhD	mckenzie.maggio@example.org	2026-01-26 21:16:45	$2y$12$Gfv7tQTqMu.VYW944gPLy.alOaUaataY7mq2/1ZtqlCZHNkTbwuai	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	+1-678-596-0218	other	1988-12-03	client	t	t	\N	t	0	0	0	0
312	Itzel Schuster	phill@example.net	2026-01-26 21:16:46	$2y$12$u40K7psKVHmSvaxrj7BmuOxfu06vg5rdSkb2Uj5ukrDRZthybNzBS	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	820.286.6568	male	1975-05-12	client	t	t	\N	t	0	0	0	0
313	Adah Towne	ferry.peyton@example.org	2026-01-26 21:16:46	$2y$12$7VcjDmuY4zHP/ssFZNvpO.8VxzK0cAI1ughK1yi7HzRWwwn3MB4nO	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	1-440-845-2276	male	1985-08-14	client	t	t	\N	t	0	0	0	0
314	Dasia Ziemann	gleason.rosalee@example.net	2026-01-26 21:16:46	$2y$12$UCmahviok105k9BgLfY92eyKX9jfPCMRBlR27c6cp9k6mjSh4C0ai	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	+1-219-778-3570	male	1978-11-05	client	t	t	\N	t	0	0	0	0
315	Dr. Levi Mitchell I	kyleigh03@example.net	2026-01-26 21:16:46	$2y$12$ef1M3hyLyEmH0Qx6uGyU.e6WK3aeMPTNHk4VurL2uByN6x0gbrfQe	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	954.947.4338	other	1972-09-02	client	t	t	\N	t	0	0	0	0
316	Dr. Jarvis Dickens	cormier.donnell@example.net	2026-01-26 21:16:46	$2y$12$jaFq0JqBepdZnFbFQY/1BOMv5T4tQJW6HY7utznQX/h7vvy6RLJU2	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	1-657-239-1206	female	1983-05-10	client	t	t	\N	t	0	0	0	0
317	Gaston Jacobi	pherman@example.com	2026-01-26 21:16:47	$2y$12$pcObBE9tEnfqztqTJ1u0xOo61IXqFOmHjZ00kfDlQmK1tUon/0Jl6	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	+1-715-844-7684	female	1992-06-14	client	t	t	\N	t	0	0	0	0
318	Mr. Frederick Schultz	graham.reyna@example.net	2026-01-26 21:16:47	$2y$12$Z21kecRqCOJ49.h39mBuZeHJrxpCUgZc5szQpf/sW9ftJydNYFmRS	\N	2026-01-26 21:19:50	2026-01-26 21:19:50	+1-469-547-3265	male	1978-04-14	client	t	t	\N	t	0	0	0	0
319	Dante Jaskolski	zdouglas@example.org	2026-01-26 21:16:47	$2y$12$1JaHYZ3VUVPsWiMB3RP.huOcF0QNm/FGsYhjOyUOaqQ.zzHhbwVyK	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	609.906.6486	other	1994-03-07	client	t	t	\N	t	0	0	0	0
320	Prof. Buford Orn	zwyman@example.com	2026-01-26 21:16:47	$2y$12$AnrS/j8gWJFTmlEnhLzNS.6ifBWTnVfMW32CbvmC1rFxB33YTGK/u	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	+12564019765	male	1997-09-15	client	t	t	\N	t	0	0	0	0
321	Paula McClure	wmurazik@example.org	2026-01-26 21:16:47	$2y$12$2shbmTXFzqn3jsJrU.Ahj.O6kspn2.fyoTPfejPwqXO8HKiv0g1/.	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	913-216-5616	other	1980-11-29	client	t	t	\N	t	0	0	0	0
322	Dr. Lisette Bailey	kylie08@example.com	2026-01-26 21:16:48	$2y$12$8xP7LAbZXDAlFvfy6K1P/.uTldtOmReMhEHr6Ut229oO7HM67u8T2	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	347.278.4552	male	1985-12-15	client	t	t	\N	t	0	0	0	0
323	Pablo Jerde I	rreinger@example.net	2026-01-26 21:16:48	$2y$12$AVCJVDFxzmtE8pqtefWxWOBdvc6bg2xQYCERTua7y6NTD0EtonoVS	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	541.533.0256	male	2001-06-23	client	t	t	\N	t	0	0	0	0
324	Giovanna Ward	dana83@example.com	2026-01-26 21:16:48	$2y$12$VLbN0nygaDoS/WPDlRM3n.vAq8wJoIGxWdV/J0oedsVXGBzX8AIqW	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	(323) 309-3025	male	1995-10-29	client	t	t	\N	t	0	0	0	0
325	Mr. Cordelia Spencer	alda.koelpin@example.net	2026-01-26 21:16:48	$2y$12$Zo3EV7AeqlRBbY9y0M9VfO2VKip787omO9agCsANwLwJPBXSpx732	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	(678) 281-6698	female	1997-04-12	client	t	t	\N	t	0	0	0	0
326	Brooks Cronin	asa.sipes@example.com	2026-01-26 21:16:48	$2y$12$VvxlPnvYAyq4u5OGMUZt4uPrvk2txRWJdgi.yIL.1H0R80.GqU3Qq	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	+1-234-486-2789	female	1994-12-03	client	t	t	\N	t	0	0	0	0
327	Marge Lowe IV	king.demond@example.com	2026-01-26 21:16:49	$2y$12$Avsl4P4knl8X0Yh69ID4lewpoiPubOm39fisY4WPN1Buji0DLUaJO	\N	2026-01-26 21:19:51	2026-01-26 21:19:51	417-555-0790	male	2002-04-09	client	t	t	\N	t	0	0	0	0
328	Salma Rippin	jacobs.bulah@example.org	2026-01-26 21:16:49	$2y$12$qjBnFIG2AEuj7xA/M/EMQOcvfYT.U1KcO0/EjMGcUk0sMVqeP7I3a	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	559.216.8154	male	1996-08-16	client	t	t	\N	t	0	0	0	0
329	Claudie Gottlieb	hermann94@example.net	2026-01-26 21:16:49	$2y$12$8Tnk.te37zsAPNtcXDeDE.XG/OPdTnFpnK8JEnOKnwSNEC2OErN0O	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	1-678-557-4008	other	1979-02-04	client	t	t	\N	t	0	0	0	0
330	Javon Satterfield DVM	elyse.friesen@example.com	2026-01-26 21:16:49	$2y$12$7wkvFgtKheDv3bhJExjXsemHZo/XHd2NzQpPrZfeGzxRzWur0jQpm	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	(681) 378-5480	other	1970-04-24	client	t	t	\N	t	0	0	0	0
331	Prof. Geovany Ullrich DDS	adeline.aufderhar@example.com	2026-01-26 21:16:50	$2y$12$wOwDptPpuxop8TK792Q7Wudhaa8XQ5.OftoLoq1RkBcVsc3Clq8ei	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	+19312695237	male	1975-10-19	client	t	t	\N	t	0	0	0	0
332	Mr. Oral Metz	buster81@example.org	2026-01-26 21:16:50	$2y$12$7E0bo1ENqX9GVlsJHp.W4.UR4vDgRy5a2l8ilwEr6uiughkj0dmtq	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	(820) 919-0478	other	1980-11-21	client	t	t	\N	t	0	0	0	0
333	Ms. Jammie Goyette	jrice@example.org	2026-01-26 21:16:50	$2y$12$Kizq2.VgiTCc.SLGBLGxU./wdnJDWD4CkhKzS02aoV4j8QbKE0ilW	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	+1.838.887.2210	male	1975-08-16	client	t	t	\N	t	0	0	0	0
334	Milford Denesik DDS	casper.nicholas@example.com	2026-01-26 21:16:50	$2y$12$m6NKXX8OzQPjGV06bmUoEuzffUzCoZD/ZI4NjYn5JCBjs7gMhjkM2	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	+19295616695	male	1984-11-12	client	t	t	\N	t	0	0	0	0
335	Prof. Jada Corwin	hester61@example.org	2026-01-26 21:16:50	$2y$12$NMPJmqvx1yOIuRN0e02BgOx/UizTpvw1rIKL9j3ntpaE68k3vZ3Yq	\N	2026-01-26 21:19:52	2026-01-26 21:19:52	+1-629-389-5978	male	1986-12-20	client	t	t	\N	t	0	0	0	0
336	Miss Hope Welch IV	parker.halie@example.com	2026-01-26 21:16:51	$2y$12$x/aj.diF.PriiY2hSpnFMeXt3cr6XPkPn70L4b0qBi5rS2tYqu1Va	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	909-956-5664	male	1973-05-09	client	t	t	\N	t	0	0	0	0
337	Mr. Edgar Robel	shyann.hoeger@example.org	2026-01-26 21:16:51	$2y$12$18CgMfH6uz2wQ6p2/fRnzu.w83O3Q.i4E6UA.n0lsaFNUh9Q9yJkC	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	+1 (808) 856-0259	other	1986-03-31	client	t	t	\N	t	0	0	0	0
338	Roma Bauch	kpagac@example.com	2026-01-26 21:16:51	$2y$12$XsfSkZMrrBuwp/qcfdwFDuin6sveGp4z2rmmG7sV0VHyFj8M/2.yK	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	+1-424-827-1460	other	1982-01-11	client	t	t	\N	t	0	0	0	0
339	German Ullrich	pamela77@example.com	2026-01-26 21:16:51	$2y$12$sN6edpuPc.iS6wZ72o2U0uKf5M1oI2upBvpSVQGnkxez6DazaSQ96	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	+1-661-932-8197	male	2002-12-07	client	t	t	\N	t	0	0	0	0
340	Cristian Donnelly	white.durward@example.net	2026-01-26 21:16:52	$2y$12$a0qlrWRQ7FwLEKT3nqqmk.TpMtCwmajOQb2zOm7sG4tb.kAYkNBx6	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	513-339-2751	other	1998-07-30	client	t	t	\N	t	0	0	0	0
341	Prof. Talon Mayert Jr.	peggie29@example.net	2026-01-26 21:16:52	$2y$12$.KwNUyyn4vIRZnybzd8nR..4/rphQDs0/cZZuPcvasvD7Pq6Vja4S	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	972-518-9146	female	1979-02-25	client	t	t	\N	t	0	0	0	0
342	Blair McCullough	glesch@example.com	2026-01-26 21:16:52	$2y$12$SN3Bq//60ENI26kL1uTNMup/xDtM71pdvE.2IbsQ.RrQfU.CMfGR2	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	+1-432-452-2959	other	1981-05-09	client	t	t	\N	t	0	0	0	0
343	Turner Beahan	roma97@example.com	2026-01-26 21:16:52	$2y$12$l.6iccoIPZm5XNeipcLlrOfFramtZZTP8p1nGvHsRfq9U2xfPBot2	\N	2026-01-26 21:19:53	2026-01-26 21:19:53	+17797797702	male	1988-05-02	client	t	t	\N	t	0	0	0	0
344	Theresa Douglas	london.dickens@example.net	2026-01-26 21:16:52	$2y$12$.HXnqsQYUKpopAS.SwqG..D7FxNCYaH/8MjDcXa8a/RlXYWKQ/GIy	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	747-801-1265	male	1972-01-27	client	t	t	\N	t	0	0	0	0
345	Rhoda Gleichner	earlene19@example.com	2026-01-26 21:16:53	$2y$12$8hSz0cVeAD0PVhBFUItpfu/sEZGj1g/xg0nSzPn0BGIi/B9mAF7c.	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	+1-716-756-8219	other	1997-01-02	client	t	t	\N	t	0	0	0	0
346	Dr. Wellington Dibbert DVM	ifarrell@example.net	2026-01-26 21:16:53	$2y$12$/3bGhlxT5eLQpR.iJYbFhe5JIt5N0B4KcTmL.EICM.O/xBOmwWkF6	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	814-244-2699	male	1993-05-20	client	t	t	\N	t	0	0	0	0
347	Grace Reilly	lind.delia@example.net	2026-01-26 21:16:53	$2y$12$P.cOz2BwZEK0DrcXnftjtug7d05es3Thlgvd.k58kAhguIjZnRIIa	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	+1.754.310.7722	female	2001-08-27	client	t	t	\N	t	0	0	0	0
348	Dr. Ralph Torp IV	dashawn.quitzon@example.net	2026-01-26 21:16:53	$2y$12$lYc/4NEhNiyTTAH2mIFUee/rRRFmXAm61GKc49Gchqm.TmjTagrSu	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	+14794319909	female	1992-12-23	client	t	t	\N	t	0	0	0	0
349	Sammie Pfeffer	larue.bayer@example.com	2026-01-26 21:16:54	$2y$12$l3HpoYEFWvAIhfao25ZDreOdYTVakdkGLUdYdP/XAeIAaDSsP3Ml6	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	+15619098699	other	1978-05-23	client	t	t	\N	t	0	0	0	0
350	Jameson Glover	fdicki@example.net	2026-01-26 21:16:54	$2y$12$MPUW5FI/Y9CyotLvkum83Oo3d7mWHFo/yZv86674KUUEEs9PNCh7i	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	424.258.7672	other	1970-08-07	client	t	t	\N	t	0	0	0	0
351	Prof. Kaden Terry Jr.	tina08@example.com	2026-01-26 21:16:54	$2y$12$IVUx2DzvJ00p4b3Kftw.NuzJEPO8BApmL54EyMBDjR9NocuahY066	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	1-870-446-0113	other	1992-07-16	client	t	t	\N	t	0	0	0	0
352	Brennon Pfannerstill	mellie.bartoletti@example.org	2026-01-26 21:16:54	$2y$12$T/WciJMKAzVfnMRXV.gWP.GrnVRfLeP63mN6mbthM4aDZjfg9tIha	\N	2026-01-26 21:19:54	2026-01-26 21:19:54	478-391-8680	male	1998-03-19	client	t	t	\N	t	0	0	0	0
353	Alana Heathcote	mmckenzie@example.org	2026-01-26 21:16:54	$2y$12$KEFYBDHjDlnN4JJBoh3yt.J25GXvaWaI/D6gl.dGZHDj5WVcuP1qS	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	757-242-3838	female	1976-05-02	client	t	t	\N	t	0	0	0	0
354	Marc Johnson	kgrant@example.net	2026-01-26 21:16:55	$2y$12$xztEZQrJgDYTlLS8JB1ADeGHLhNstZgEpF2kXkXfmeJAmDCD.9qka	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	(865) 303-1629	other	1979-04-01	client	t	t	\N	t	0	0	0	0
355	Dr. Mariela Zboncak	narciso56@example.net	2026-01-26 21:16:55	$2y$12$F900YgXNOaSqlpZfhzRhgePB4dUU3o39c0381bYN7NUUcGnMyCXwy	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	612.412.9001	other	1991-01-08	client	t	t	\N	t	0	0	0	0
356	Thaddeus Monahan IV	farrell.randal@example.net	2026-01-26 21:16:55	$2y$12$GkzTSya6jF94nAibuB/Kqe74YkCyRXOQXNC34KoELqf6X2e3dHaJC	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	(218) 699-2909	male	2003-12-26	client	t	t	\N	t	0	0	0	0
357	Jeremie McClure	iabshire@example.com	2026-01-26 21:16:55	$2y$12$cD42ZuQAn0UptfUxuceeA.Mz4NtFPgI9Oh5FgGqnv97RKps6w9qam	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	801-898-8627	other	2004-11-08	client	t	t	\N	t	0	0	0	0
358	Lolita Bode	swift.liana@example.com	2026-01-26 21:16:55	$2y$12$o6xCKSyn4QN7jz5yMPRi8eqSwbG94BEOahoQAhjG70WCVaVCj8Exm	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	1-470-555-5796	other	1986-11-13	client	t	t	\N	t	0	0	0	0
359	Clare Shanahan MD	braden63@example.com	2026-01-26 21:16:56	$2y$12$kyBSPcwsvOs7RhWa5FfmL.nFFKAvKUpS4IIETYJC7V1H9aycpd2E2	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	747-590-5852	female	1989-07-16	client	t	t	\N	t	0	0	0	0
360	Viva McGlynn	gwendolyn.wisoky@example.org	2026-01-26 21:16:56	$2y$12$k6W8tiUHEUx.8VHy01dT.u0U87JutmzuD6x9hxY6j7nw02Axhsn5m	\N	2026-01-26 21:19:55	2026-01-26 21:19:55	248.882.5215	male	1996-09-01	client	t	t	\N	t	0	0	0	0
361	Florencio Wunsch III	bria83@example.net	2026-01-26 21:16:56	$2y$12$0TVUXfHuhkMDOKrR15vveOcU1hsSsTd8QkG8xozJf6s0EwF1N4qpi	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	(458) 721-0461	female	1988-12-20	client	t	t	\N	t	0	0	0	0
362	Keven Stiedemann I	keeling.ewell@example.net	2026-01-26 21:16:56	$2y$12$EXhGDG./SB6THlmP8igW1.tJvWDmV89K.FUEESGaABZmbiVgkRcNi	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	(657) 735-5099	other	2002-06-15	client	t	t	\N	t	0	0	0	0
363	Prof. Maritza Shanahan V	jerde.gertrude@example.com	2026-01-26 21:16:57	$2y$12$e.0bllFxVDhs7iAq4Xodium7sM2F/9phBwMAobaT2Zzttf4VvGgp6	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	+1-279-589-0370	male	2002-11-04	client	t	t	\N	t	0	0	0	0
364	Omer Konopelski	qdaugherty@example.com	2026-01-26 21:16:57	$2y$12$8fwnahvE33iN81tubEBdpe9ILROPcJYl8T8bNwdDi1eHFQkzHz7GO	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	+1-773-304-7744	other	1992-12-21	client	t	t	\N	t	0	0	0	0
365	Boyd Hartmann	vinnie.stoltenberg@example.org	2026-01-26 21:16:57	$2y$12$js6g9VlBXReiRqQ04IY/EeR0rIkrod6eFNBSe2YRHA7j9aIXBxVey	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	641-412-7926	female	1987-07-10	client	t	t	\N	t	0	0	0	0
366	Pamela Hackett I	bullrich@example.com	2026-01-26 21:16:57	$2y$12$NieCKopE240Vj.37s8VBF.3VGalIr3rW.rmy6uFbRjzidnZ2LOeki	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	+1 (539) 329-0566	other	1998-02-14	client	t	t	\N	t	0	0	0	0
367	Sherwood Mueller	jayde70@example.com	2026-01-26 21:16:57	$2y$12$5dAdRSdgLaUdgEm9fw/RkuvicTeYU6igJ6RyB5LqppYkMRvYeyfF2	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	+1-351-954-7688	female	1990-10-25	client	t	t	\N	t	0	0	0	0
368	Zoie Morar	srosenbaum@example.com	2026-01-26 21:16:58	$2y$12$aIvchxRbdtarbBUTPw8mdeCLo/nrS7OMbgWSmKRIxzPJV4NKf8/h6	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	+1-740-862-7328	male	1985-12-28	client	t	t	\N	t	0	0	0	0
369	Bernadine Bechtelar	nvon@example.com	2026-01-26 21:16:58	$2y$12$GZUTMeCENpOUc7EOMOyxU.X/cAHSFHZnsfS3SSVw9YpiaIZ7..PfC	\N	2026-01-26 21:19:56	2026-01-26 21:19:56	505-960-0220	other	1986-08-27	client	t	t	\N	t	0	0	0	0
370	Vena Zieme	hmuller@example.com	2026-01-26 21:16:58	$2y$12$tP3KfFBRQvkkzkhQUjex9.hv15ZqMR02dGMv4KH5YUT15Ag506IA6	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	832-390-1410	male	1980-02-24	client	t	t	\N	t	0	0	0	0
371	Marion Abbott	casandra27@example.com	2026-01-26 21:16:58	$2y$12$3.sGQ/UW5sv.sBklRWueFuF2d81CXIOSTWFvQuort251HxM2BX6NG	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	(272) 748-4147	other	1974-01-20	client	t	t	\N	t	0	0	0	0
372	Kiana Kunde	jbergnaum@example.com	2026-01-26 21:16:58	$2y$12$tO0yk7asAF13PnSxUqXlKuXovYsbjoPwD5XIhikNQNyRN33ePmB.u	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	534-768-8462	female	1997-12-05	client	t	t	\N	t	0	0	0	0
373	Craig Schimmel III	tremayne.reynolds@example.net	2026-01-26 21:16:59	$2y$12$NMBaeRmVNKLvKVu865jXZumQxY1BpOR2vPnG.lrc4emOCtSlsM02K	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	737-817-2369	other	1989-03-06	client	t	t	\N	t	0	0	0	0
374	Mr. Mateo Welch IV	odicki@example.net	2026-01-26 21:16:59	$2y$12$KjyQUHCr0dgo3leLiuBs3uRckMdawVZ3EdUASHjMKspg510IsqpeS	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	+18047054744	female	1985-02-05	client	t	t	\N	t	0	0	0	0
375	Kraig Schmitt	carleton.schmidt@example.org	2026-01-26 21:16:59	$2y$12$tivWomI6r4yYi83jHyJ5JOlJAl/LB/N.OMhP3dleGu6bjyZB/..tC	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	301-707-7227	female	1998-07-17	client	t	t	\N	t	0	0	0	0
376	Prof. Tyler Auer MD	diamond.dietrich@example.net	2026-01-26 21:16:59	$2y$12$7CQbskoCRmr4.IBaScRT.uztvW5hKVc6fXgcIRyUBvTIoKTUu5VZe	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	+18487574628	other	1978-01-04	client	t	t	\N	t	0	0	0	0
377	Ms. Leanne Bogisich DDS	randall.ullrich@example.org	2026-01-26 21:17:00	$2y$12$LmuAqAoBQB3xSZljNA1MauHQNGLYoXz2fptwKJoz1B2omxsvygRuO	\N	2026-01-26 21:19:57	2026-01-26 21:19:57	504-539-6450	male	1988-11-16	client	t	t	\N	t	0	0	0	0
378	Laisha Botsford	ward.jade@example.net	2026-01-26 21:17:00	$2y$12$RZt9rLavoRgqD6Jt61d.SOphZdiI4PO7uE1OjZx6F2mMRKKUHOOAK	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	936-425-3253	female	2001-01-30	client	t	t	\N	t	0	0	0	0
379	Mrs. Dorothea Weimann	nwillms@example.org	2026-01-26 21:17:00	$2y$12$WNeqc8M6oHFogPrjDPb.xebty/N0WB1UzzCvpfFwbKjSW1.p88Hj2	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	1-417-344-0021	female	1986-05-20	client	t	t	\N	t	0	0	0	0
380	Orlo Batz	hudson.jerel@example.com	2026-01-26 21:17:00	$2y$12$2lnZrzI5U51.okF13YIyAeST0J2Gn1Ns84Jcun4OO9nkwhZxhTVgi	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	743.655.1641	other	1980-11-28	client	t	t	\N	t	0	0	0	0
381	Dr. Kristopher Barrows	streich.chance@example.net	2026-01-26 21:17:00	$2y$12$lkV30DDAyLlY4jO7DQtKz.T/dafDg2/u42MGq668pT6mV.wMIU8ra	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	458-398-8265	male	1993-08-09	client	t	t	\N	t	0	0	0	0
382	Frieda Schowalter	novella57@example.com	2026-01-26 21:17:01	$2y$12$cmg.j1sVuQeOwZTb3Ekehe/fQLQrLjHd1mtviWOjQs0XQPuA4F.We	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	724.604.7849	other	1987-06-28	client	t	t	\N	t	0	0	0	0
383	Mrs. Raphaelle Pagac	xlangworth@example.net	2026-01-26 21:17:01	$2y$12$P2Mm5KbVcj5wfOkrn07rgenK/gbjlAGEA59rkPvuMpU5R1.FAiFPK	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	+1 (908) 680-5755	other	1972-04-19	client	t	t	\N	t	0	0	0	0
384	Armand Rodriguez	schamberger.breanne@example.net	2026-01-26 21:17:01	$2y$12$.ZHyC9zcqbUM.K7DsUcwzOQSAYv4diwdM61g/EK.ykQe4CqR16jAK	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	+12056431094	other	1988-01-31	client	t	t	\N	t	0	0	0	0
385	Madelyn Johnston IV	vdeckow@example.com	2026-01-26 21:17:01	$2y$12$iRvj1SVbGifdPjsvJz6MquXAiBA7iXJqoj/OrbmMGjEi3hSRUWZJS	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	(916) 326-9228	male	1973-12-06	client	t	t	\N	t	0	0	0	0
386	Dr. Haven Littel Sr.	rgaylord@example.org	2026-01-26 21:17:02	$2y$12$mQ2MUCbHnqAn4WmmPEpvUOfHewaRd3jVwLjLYXeVXb/CKTmHpnEwK	\N	2026-01-26 21:19:58	2026-01-26 21:19:58	480-390-1300	male	1995-02-24	client	t	t	\N	t	0	0	0	0
387	Charley Flatley	sconroy@example.org	2026-01-26 21:17:02	$2y$12$4BQFq4N7EnxDUMNHVBNJqObXmd.ocw7.Gq0OiNwyVlMSqhOdBpDoy	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	+1-719-529-0848	female	2004-12-13	client	t	t	\N	t	0	0	0	0
388	Dante Kunde	harber.blake@example.com	2026-01-26 21:17:02	$2y$12$eF5fu0ziHrLqe0aEmcyaB.dc4BWcU6dT2Ri84AFBvJnZ.Ul3FSsvW	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	1-726-489-3529	male	1972-08-15	client	t	t	\N	t	0	0	0	0
389	Dr. Keanu Kovacek	ilittle@example.net	2026-01-26 21:17:02	$2y$12$Ne9hZGPK7BDoasNxmxe5buokRRIr5KDJuEXO.X9WokvMF4uEI3RRm	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	+1-938-657-1766	other	1972-08-08	client	t	t	\N	t	0	0	0	0
390	Sasha Hane	camden68@example.org	2026-01-26 21:17:02	$2y$12$1wn3/uuTlwynBy8.X3ohX.F9Di477fPqz0BVravLoaO6tgfrxQf2G	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	1-469-278-9258	other	1979-02-15	client	t	t	\N	t	0	0	0	0
391	Erick Mitchell	elton.sanford@example.net	2026-01-26 21:17:03	$2y$12$dpuyul92iXc6nWE41mDpE.KwifFm2etUL.oUNAkzT9Ap0L0zKKz6K	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	(231) 517-5100	female	1971-03-04	client	t	t	\N	t	0	0	0	0
392	Ms. Leanne O'Conner	malinda.durgan@example.com	2026-01-26 21:17:03	$2y$12$5ZoW6JTQOAO1aL/H7BuiPelV.28f9Q1FN69uDdSclBCt5J4.rEZ7W	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	321-283-0192	female	1981-06-02	client	t	t	\N	t	0	0	0	0
393	Nestor Leuschke	bmcdermott@example.org	2026-01-26 21:17:03	$2y$12$VTnlR6FTnCLhOikxfbMDy.8owdmPfUIg5KLHUX5o031h4EKiszTXu	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	1-210-361-4562	other	1977-09-29	client	t	t	\N	t	0	0	0	0
394	Alysson Maggio	fritsch.kendrick@example.com	2026-01-26 21:17:03	$2y$12$SVD8PacQUE3SBSD.m.N3V.5ZOoTW9xzqu0N4arEdiXWtvTISB.FPu	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	410-838-5395	female	1990-03-28	client	t	t	\N	t	0	0	0	0
395	Jaclyn Durgan	gusikowski.wilbert@example.org	2026-01-26 21:17:03	$2y$12$.0Ten9zxQNcqTbkLMp.tFO1eIaUmaKaip2GoxKs14fxllomhWdWSu	\N	2026-01-26 21:19:59	2026-01-26 21:19:59	360.784.9493	male	1996-07-19	client	t	t	\N	t	0	0	0	0
396	Tyrel Wunsch	sgottlieb@example.org	2026-01-26 21:17:04	$2y$12$n7OB77llcl/9EzQ0b/yJSuzjZi07wrOYHQfKLvO06nJQvUEaq1G3S	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	+1-283-640-7591	male	1978-10-10	client	t	t	\N	t	0	0	0	0
397	Alia Beahan	beahan.terrence@example.org	2026-01-26 21:17:04	$2y$12$WwdL9Hzd6U5apKdGnxPRKuImdPupzKTuwS1JPdKaP21fnGZFnpMdq	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	216.507.1544	female	1976-12-22	client	t	t	\N	t	0	0	0	0
398	Dr. Dejah Bradtke	ashlee75@example.com	2026-01-26 21:17:04	$2y$12$qwatH6mOS1KJwTbyAJznGecQ5cMYgZWpVeB4Nx9T.oxv9UrrSI8US	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	1-857-783-3151	female	2002-08-07	client	t	t	\N	t	0	0	0	0
399	Prof. Garfield Kozey	roosevelt.barrows@example.com	2026-01-26 21:17:04	$2y$12$QIER37KlYEXFHSMTKvMUMuFu4IMkhCwUcyRHdDKGN/OAbjc.VPU5a	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	(586) 765-7995	other	1987-06-18	client	t	t	\N	t	0	0	0	0
400	Krista Powlowski	graham.nitzsche@example.com	2026-01-26 21:17:05	$2y$12$bydFZN.4laRjSPt3PRJw9u3teby/1rDFXUNBnA86bIP1SQ/8DPBz.	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	(734) 475-5898	female	1988-07-23	client	t	t	\N	t	0	0	0	0
401	Tony Sauer	xhirthe@example.org	2026-01-26 21:17:05	$2y$12$yAumtqvvZ3Lzj6O1tjGiAeRAJo/WxYjeCS7Ak9G2zEu91wu/wvY4G	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	(352) 466-3396	female	1991-05-25	client	t	t	\N	t	0	0	0	0
402	Ms. Effie Waelchi	michele.spinka@example.com	2026-01-26 21:17:05	$2y$12$tuilYe1iofUFqtJcljzQneIShtibjQPlqBglVcbdlQdT9wdvAQqZK	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	+1.380.710.9139	male	2000-02-19	client	t	t	\N	t	0	0	0	0
403	Favian Wintheiser I	xsatterfield@example.net	2026-01-26 21:17:05	$2y$12$oELa/YFel9JzP.KIkC8xpOFhsUMJYIyArCfnv4D59i.EUctwfnuj2	\N	2026-01-26 21:20:00	2026-01-26 21:20:00	+1-641-807-2993	other	1984-06-14	client	t	t	\N	t	0	0	0	0
404	Marjorie Collier PhD	marilyne.becker@example.net	2026-01-26 21:17:05	$2y$12$hek5wUHzi35MS0cM58RmZOYzzW65BdIEscfKGnVsWc321dKZtIMSG	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	615.754.9915	male	1976-10-24	client	t	t	\N	t	0	0	0	0
405	Connie Braun I	farrell.kobe@example.net	2026-01-26 21:17:06	$2y$12$r/PUUhcM7Ikc1cBNZFtQBOCq0NfPjpJgX6BfHgqMgawR8YLZn1yWO	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	+1 (929) 587-7983	male	2004-12-13	client	t	t	\N	t	0	0	0	0
406	Immanuel Robel	hkemmer@example.org	2026-01-26 21:17:06	$2y$12$JruozAg4DkwR9GDzck06de13wFMUBR2f.pC5Uo4C.M/Zzgol6EKaG	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	458-567-8640	male	2002-11-03	client	t	t	\N	t	0	0	0	0
407	Mrs. Zoie Kuvalis	keeling.kacey@example.com	2026-01-26 21:17:06	$2y$12$bhloF/zRINwuaH2TJp35QO7.GRmR1KDOgdi4l9kfFVJyAZROMz8FG	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	458-529-6777	other	1985-12-28	client	t	t	\N	t	0	0	0	0
408	Chaz Jerde	whaley@example.com	2026-01-26 21:17:06	$2y$12$/gT5es7cCEz6Ye5W1vGbH.1NhguxwVb8DnGf14A0glHYEQ8IL8etS	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	(971) 842-3074	other	1976-02-17	client	t	t	\N	t	0	0	0	0
409	Miss Autumn Cassin	kaela.armstrong@example.com	2026-01-26 21:17:07	$2y$12$.D./KeL3uFp7jVZErwYFhe6orfVPk8SlM4KFHNZKKESjLgr6XpxdG	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	+17733867538	male	2004-01-14	client	t	t	\N	t	0	0	0	0
410	Shayna McClure	bode.alex@example.com	2026-01-26 21:17:07	$2y$12$4iNNKsCBsMCq7tyg8jB1l./fFfT8hDMkY5stWkLvRYlTgFiJ5s6kS	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	+1-678-324-2163	female	1989-05-21	client	t	t	\N	t	0	0	0	0
411	Adele Renner II	larson.gretchen@example.org	2026-01-26 21:17:07	$2y$12$5EDUGGGFmgJ.b02I6AI.eOIYnfkRfh2ZFiVi9vyh1oIDsB.RWisLC	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	463-205-1765	other	1990-04-18	client	t	t	\N	t	0	0	0	0
412	Sherwood Reynolds	lenny78@example.com	2026-01-26 21:17:07	$2y$12$cp/fJsnCiVQOTqNkAWbzuO.VROIrY9Z54hEvWS6N5776WTKswAFYK	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	(413) 895-4498	male	1986-02-09	client	t	t	\N	t	0	0	0	0
413	Dr. Serena Murphy MD	walton.oreilly@example.net	2026-01-26 21:17:07	$2y$12$Fl6Dvf8AzrRXVwXSZGjRiujEILokcewfmay9XrZdVwAxKVz8TUmN.	\N	2026-01-26 21:20:01	2026-01-26 21:20:01	+1-716-554-5937	other	1999-04-01	client	t	t	\N	t	0	0	0	0
414	Gay Howe	lohara@example.net	2026-01-26 21:17:08	$2y$12$A2bIukjaMwINwagZKXslWOeObEs8CLW7i37f5ushk9vSHNIIQGAgG	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	1-740-454-2898	female	1991-01-27	client	t	t	\N	t	0	0	0	0
415	Loraine Cruickshank	jacques.volkman@example.com	2026-01-26 21:17:08	$2y$12$be8Z4qbCP3jklVYFWNjhnOdZGfIYFFMHwiAGFmiQBWHm3WIg9qcsq	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	+1.732.881.1279	female	1980-07-08	client	t	t	\N	t	0	0	0	0
416	Marlon Beahan V	jeremy.gulgowski@example.com	2026-01-26 21:17:08	$2y$12$sMzCSee2u10s7RmuDazyM.zqBuHyZrzeLv6PvSchTb3xsLDEEpt8m	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	+1-934-664-8348	female	2003-01-26	client	t	t	\N	t	0	0	0	0
417	Newton Koepp	cmurazik@example.com	2026-01-26 21:17:08	$2y$12$cnJrvIkh3tQep1gpjxWOF.NQ6yTSgMfMmy8Pof9hJk1zZ0v0MQgQG	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	(580) 266-7029	male	1978-09-22	client	t	t	\N	t	0	0	0	0
418	Allene Wolff	miles17@example.org	2026-01-26 21:17:08	$2y$12$WoRD.UfsbLfrrCFuYdDurei0o2WaqBnLYDqJhr6YKzwh3hXNQtX8e	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	872.787.3490	female	1995-12-01	client	t	t	\N	t	0	0	0	0
419	Fanny Dibbert	tillman.domenic@example.com	2026-01-26 21:17:09	$2y$12$Vrcc22PzHMU0yLS6QV0WmO6DCZ660at6PuI4aGjzzMDgXbYPUofxu	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	(612) 231-8854	other	1985-04-23	client	t	t	\N	t	0	0	0	0
420	Frederic Sawayn	audreanne48@example.net	2026-01-26 21:17:09	$2y$12$Bv3MIS7uceyZbvPEefJTlO315wW8fVTibN.Eutpt65KnBlUVRsqtm	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	(860) 642-4648	other	1997-10-02	client	t	t	\N	t	0	0	0	0
421	Scot Reynolds	xmedhurst@example.org	2026-01-26 21:17:09	$2y$12$OwLMEA7pgintlQIDFsLr/e.Bs1943gSXq3FKdvNm224yBCWDsEsbm	\N	2026-01-26 21:20:02	2026-01-26 21:20:02	+1-952-240-8419	female	1995-01-05	client	t	t	\N	t	0	0	0	0
422	Katelyn Donnelly V	effie24@example.com	2026-01-26 21:17:09	$2y$12$c.1NSNhjc76pU.NcCO0N6.7kmhCbuBfczgEO4aTpV0Z4xeEhyhv.y	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	740-257-0519	male	1975-03-21	client	t	t	\N	t	0	0	0	0
423	Dr. Felix Strosin	bernita01@example.org	2026-01-26 21:17:09	$2y$12$09l0HULEFSNbYMUnEqLmaeIvnlx6KsTr33Q2fCGQpIvijopsaCyqW	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	+1 (832) 773-0026	other	1994-11-21	client	t	t	\N	t	0	0	0	0
424	Lonnie Marks	jsteuber@example.org	2026-01-26 21:17:10	$2y$12$uO3WvxeVNQAG9wSaw1D0yukr1OkskwcJcMZkNdAdGrAXtSZzJPgQC	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	380.217.3323	male	1992-03-24	client	t	t	\N	t	0	0	0	0
425	Dr. Oswaldo Conroy	opfannerstill@example.net	2026-01-26 21:17:10	$2y$12$OpHIHnwWtkRAp.dWaNkPseK3DsCNwLj1yUuMvUAdOelVkwcTC8.hW	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	+1-508-855-5875	male	1989-10-27	client	t	t	\N	t	0	0	0	0
426	Mozelle Champlin IV	lina.denesik@example.com	2026-01-26 21:17:10	$2y$12$TPbAaLtzqeSBCLDLCxR9NeBNpvTKKcdNgjOILuxxbeuXKTn8YLliK	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	872-661-5647	male	1980-02-10	client	t	t	\N	t	0	0	0	0
427	Astrid Batz	jswaniawski@example.net	2026-01-26 21:17:10	$2y$12$ck1969deNNLXkDmL6kgKheDfX3k88lhaauyAWSXiAXoIF5efgh/fm	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	+1-650-320-9395	male	1972-07-29	client	t	t	\N	t	0	0	0	0
428	Maxie Marquardt	idubuque@example.org	2026-01-26 21:17:11	$2y$12$LIiQfL/tlxnB9tNmcEEK0uNIBwJ2YaUVxULn5Av0N.7rUWCL0MTAm	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	434.400.8817	female	1972-06-28	client	t	t	\N	t	0	0	0	0
429	Prof. Lavonne Rodriguez IV	wisoky.ansley@example.net	2026-01-26 21:17:11	$2y$12$9tyQ6L0bzr9LRZBhDRRzMOO5erxl3qSQHAlhimyzz/CO7qRiYKNGC	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	907-850-5018	female	1991-10-05	client	t	t	\N	t	0	0	0	0
430	Graham Friesen	dortha.buckridge@example.net	2026-01-26 21:17:11	$2y$12$eTBX3K3OBRmmiWsP8lpQ.eQGm173xpHRo3Y/1jGtXLBcyN2Pi3aeq	\N	2026-01-26 21:20:03	2026-01-26 21:20:03	515.946.9804	female	1970-12-04	client	t	t	\N	t	0	0	0	0
431	Corbin Veum	werner49@example.org	2026-01-26 21:17:11	$2y$12$3XiY5rspP.wFwr44hjxF.OsxFlvkytyqRLCrZLdOs608SP71sXrSO	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	(520) 322-2387	other	1979-07-01	client	t	t	\N	t	0	0	0	0
432	Charlene Hickle	verlie28@example.org	2026-01-26 21:17:11	$2y$12$6bvKwVXu90x9KQ1Nhoyn1ePC2ctlv.dtFOc5ocbGpetKJlKuuoH8W	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	(303) 456-5318	female	1985-10-28	client	t	t	\N	t	0	0	0	0
433	Elmo Emard	lavada.okuneva@example.org	2026-01-26 21:17:12	$2y$12$fVqAl8t3YZduY85cGNMAwuK668ZenKiLd2bTV4Pz.3TSFu15gZhfG	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	(938) 843-1555	female	1997-09-30	client	t	t	\N	t	0	0	0	0
434	Lorenz Ernser	bruen.ignatius@example.com	2026-01-26 21:17:12	$2y$12$GNcAuQv0Q5Ten9r.Qcz/LOeFlbxf80n2h6JP1KR8qYYo5Lqp2598K	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	+19309444740	other	1999-04-06	client	t	t	\N	t	0	0	0	0
435	Dr. Corene Heathcote DDS	kunde.ross@example.net	2026-01-26 21:17:12	$2y$12$lczHTIhiSCo1nmCIyANc5.jJfgYzHnf5lJDOhufmdX6l/8BCrqKeC	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	+1-920-984-1172	female	1995-07-03	client	t	t	\N	t	0	0	0	0
436	Jazmin Conn	ariel21@example.org	2026-01-26 21:17:12	$2y$12$oNY3qgS6JWRgeSkUY0DsPeY7rGlyAVVQ5KPTmzuotV6QY5ECJTmBC	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	1-419-323-8731	other	2000-12-06	client	t	t	\N	t	0	0	0	0
437	Lura Marvin	malinda05@example.com	2026-01-26 21:17:12	$2y$12$FZ2eWvkVXrHnvbezLVhTo.W6HEZz1Un4t5g0Oy2SYEUKXH0YTGfoa	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	+16606055698	female	1983-06-26	client	t	t	\N	t	0	0	0	0
438	Mr. Jerry Smitham	elmira95@example.com	2026-01-26 21:17:13	$2y$12$PJLRG4Lpk5lDKS8ZYi9NGO71oUOqxIenqwleKtkW7G4kyXWJTe056	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	314-622-5329	female	1984-07-26	client	t	t	\N	t	0	0	0	0
439	Mr. Travon Mitchell DDS	ronny88@example.net	2026-01-26 21:17:13	$2y$12$gUHt5xl6gsyiRNFKvfLCM.FvsD9p3pCV.DuqxHqFQnitYJmH9YOJ.	\N	2026-01-26 21:20:04	2026-01-26 21:20:04	1-626-394-2920	female	1986-03-20	client	t	t	\N	t	0	0	0	0
440	Erich Gibson	bpowlowski@example.com	2026-01-26 21:17:13	$2y$12$RewJTz3ciZixl6NzJ./WfutH1wxIjGEtQ5GuPOgEA4p/DLG.vXyKi	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	+19419572000	female	1979-09-06	client	t	t	\N	t	0	0	0	0
441	Vita Reilly	twisoky@example.com	2026-01-26 21:17:13	$2y$12$E4VxvNYgHCbQXfJ1TpAN6e6yvhW3xksWD0cPltbTFrO2UhSGmNX1K	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	+16784133908	other	1978-08-06	client	t	t	\N	t	0	0	0	0
442	Nina Bashirian	aweissnat@example.org	2026-01-26 21:17:14	$2y$12$IubJ.CKyFrhIo4QUdlPzgOnChlDzk1tXMczaJVQX22qmnrv05WuL6	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	(205) 919-3469	female	1985-04-27	client	t	t	\N	t	0	0	0	0
443	Rudy Prosacco	amos14@example.com	2026-01-26 21:17:14	$2y$12$r3HlUzU4uyGzBciEsEoALOsFo38gHomQZhW7iEGvPWccEojQIeonu	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	520-418-7564	male	1978-04-11	client	t	t	\N	t	0	0	0	0
444	Hallie Rempel II	adonis01@example.net	2026-01-26 21:17:14	$2y$12$XQNQUU1gZJjBTXcJXt1wjuWBVX5brxlz71QIyyqY4vLBazda9dPt6	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	+1.480.656.9037	male	1992-05-17	client	t	t	\N	t	0	0	0	0
445	Curtis Aufderhar	gus.cartwright@example.net	2026-01-26 21:17:14	$2y$12$55DV.X0PRmHvj5.KyfbmXuAnLUuHCZChCkCioe/EKuUZqVADil6HK	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	551.860.1789	other	1988-01-04	client	t	t	\N	t	0	0	0	0
446	Ms. Zula Heidenreich	brown.kaci@example.com	2026-01-26 21:17:14	$2y$12$Qe0tBMYS5SLOhPvophaV4Ok4itbz0wbu.Q2yLzqQbPfa7z50jEbDe	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	+1-737-666-3369	male	1985-05-12	client	t	t	\N	t	0	0	0	0
447	Ms. Clemmie Harvey V	leola19@example.org	2026-01-26 21:17:15	$2y$12$zuPIyjw4JGTjOYG2c0xRF./FZbdy0L5oHZlnTxQuRmpvbj6wBpnwC	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	801.728.6671	male	1986-10-06	client	t	t	\N	t	0	0	0	0
448	Ryder Barrows	kkub@example.net	2026-01-26 21:17:15	$2y$12$Fv203nx.et1dMKDeAz2NRe5/LjmdwjVgmyodf281E.ApiSXnjoorK	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	1-267-927-0685	other	1970-12-03	client	t	t	\N	t	0	0	0	0
449	Mrs. Ada Tromp	gianni90@example.net	2026-01-26 21:17:15	$2y$12$skryYDSpOgwInVKhsGjwvOeoea1Z4gYFroAJOCR9eG8wQWFOG5qZK	\N	2026-01-26 21:20:05	2026-01-26 21:20:05	+1-539-769-9894	female	1994-10-27	client	t	t	\N	t	0	0	0	0
450	Mr. Charlie Larkin	morissette.jan@example.org	2026-01-26 21:17:15	$2y$12$fAct64WsRSKmrGHevBRk7udRj0oDH8QhJyMq4qm870HbuXPGMbIMq	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	+1.863.395.6273	other	1985-05-25	client	t	t	\N	t	0	0	0	0
451	Coy Stokes	clark17@example.net	2026-01-26 21:17:16	$2y$12$oDqRB4bCMGBSdiF55GIKw.yTTQrfoj3ryQdyIpcAe6DG7pHUNIyBC	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	+13525664562	other	1993-09-19	client	t	t	\N	t	0	0	0	0
452	Miss Willa Batz	lolita10@example.org	2026-01-26 21:17:16	$2y$12$EWz8/N4CClv6zvkKP8BZLOee22YxlcGFt6VbOaHT4o5i0sFvXEvNi	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	+1 (302) 879-6590	other	1988-01-05	client	t	t	\N	t	0	0	0	0
453	Prof. Herminio O'Reilly	noemy.okeefe@example.org	2026-01-26 21:17:16	$2y$12$At/FInQuUVcJmnFnVx4qs.uNbSUvLsfKJbnm9qA/xZEBd.LNX19bq	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	1-323-367-3766	female	2002-04-19	client	t	t	\N	t	0	0	0	0
454	Jerrell Smith	quinton64@example.net	2026-01-26 21:17:16	$2y$12$vJnaPxGhZk7ydOvZLUbqCeyQUPOeP/2xuQqNWjmcyjnvor9NPF5se	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	+1 (734) 420-9485	male	1975-03-20	client	t	t	\N	t	0	0	0	0
455	Alena West	eda60@example.com	2026-01-26 21:17:16	$2y$12$cZ4TAjjEyJqMJosgsImlbeII/hfp.Weld/MQkj8FwWx7Ag8fwjRIm	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	240.240.5609	other	1986-05-09	client	t	t	\N	t	0	0	0	0
456	Gwendolyn Rolfson	aileen.tromp@example.org	2026-01-26 21:17:17	$2y$12$kt9c.W3cZOpuq4MQYMfAeOCPd7u7dwXXhUErPrfiRhi4NjXKl.tHy	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	650.736.2599	female	1988-11-10	client	t	t	\N	t	0	0	0	0
457	Myron Macejkovic	christiansen.jeff@example.net	2026-01-26 21:17:17	$2y$12$LXJ5SrOpk3I6IGCmWZDNpu2kGL/KClA.oCiTI06jB3ZUVBCn1Bc3C	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	+1.283.823.5956	female	2000-05-12	client	t	t	\N	t	0	0	0	0
458	Arden Pouros	rosalee41@example.com	2026-01-26 21:17:17	$2y$12$kv2GowbiZv1T8fvFAh1vbe656CcWfuoOA3F18Hs38o/9szKIej126	\N	2026-01-26 21:20:06	2026-01-26 21:20:06	1-781-639-4145	female	1998-07-12	client	t	t	\N	t	0	0	0	0
459	Hilton Corkery	iweimann@example.com	2026-01-26 21:17:17	$2y$12$XRx5OxhGbGUCRotu6nLhhOWzwpByvzhiWEI8967a6PEACfPI5nSWi	\N	2026-01-26 21:20:07	2026-01-26 21:20:07	781-840-3474	male	1988-02-08	client	t	t	\N	t	0	0	0	0
460	Tristin Ferry	stephania.predovic@example.net	2026-01-26 21:17:18	$2y$12$DjkKMfcUTpARPcbSyMsPy.fIbSADNxTWhAf36lyGrsvniEeJOwr9e	\N	2026-01-26 21:20:07	2026-01-26 21:20:07	773.353.6671	other	1994-10-18	client	t	t	\N	t	0	0	0	0
461	Charlotte Willms I	kkovacek@example.org	2026-01-26 21:17:18	$2y$12$IJW81vpg.DaY8ew549joleHUqQlAU9SJwWpybO9hvLQw6cyfboRue	\N	2026-01-26 21:20:07	2026-01-26 21:20:07	+14408392333	other	2003-03-23	client	t	t	\N	t	0	0	0	0
462	Mark Rodriguez	dalton.rohan@example.com	2026-01-26 21:17:18	$2y$12$009kt5dlD7580CFgf3F8IOQqfND.b2Q3ytwrtTRtiP4Bb/fwHvfnm	\N	2026-01-26 21:20:07	2026-01-26 21:20:07	+1.402.274.9561	male	1997-07-26	client	t	t	\N	t	0	0	0	0
463	Amani Fahey DDS	quinten28@example.com	2026-01-26 21:17:18	$2y$12$96o8RdrUQgMdoMVVutYnxui3YwiKqQKDn6eftO39BcY8vlgy5aUHC	\N	2026-01-26 21:20:07	2026-01-26 21:20:07	1-239-532-7736	male	1989-09-03	client	t	t	\N	t	0	0	0	0
464	Sherwood Streich	torphy.claudie@example.com	2026-01-26 21:17:18	$2y$12$cdwuU4JpBTcaOfk8jyTBnuBq2gj1OzwpdJrgw.hBEkPkeUoF/Ch3K	\N	2026-01-26 21:20:07	2026-01-26 21:20:07	1-602-886-1833	female	1970-06-07	client	t	t	\N	t	0	0	0	0
465	Dr. Donato Borer	kaylin16@example.com	2026-01-26 21:17:19	$2y$12$KANPxGEarKsyBVLPv5f08eTqTJXkSWdQMPK6RvVu.GPApljAR5JM6	\N	2026-01-26 21:20:07	2026-01-26 21:20:07	660-250-0682	female	1983-04-28	client	t	t	\N	t	0	0	0	0
466	Raul Satterfield	herbert69@example.net	2026-01-26 21:17:19	$2y$12$5dNJpT6HE9dJ1/uG8mY3xuBsJqmUwdSufwf4mkDxy.VRV.KsPtO0G	\N	2026-01-26 21:20:08	2026-01-26 21:20:08	(743) 995-9736	male	1999-11-23	client	t	t	\N	t	0	0	0	0
467	Olen Mann	stiedemann.justina@example.org	2026-01-26 21:17:19	$2y$12$GPedsPJwg5BXp1Km4iOF3.jFa.g/WrTFTdx0NjEUh3qrQK6A47Xzq	\N	2026-01-26 21:20:08	2026-01-26 21:20:08	+1 (484) 608-5599	male	1979-11-15	client	t	t	\N	t	0	0	0	0
468	Heloise Hickle	ned46@example.com	2026-01-26 21:17:19	$2y$12$ev5z7L1OqcpBEcfRRNvzV.QtMGbheSW.ONAdCkthrbMeLFqJWGyHO	\N	2026-01-26 21:20:08	2026-01-26 21:20:08	+1 (442) 536-5266	other	1990-07-12	client	t	t	\N	t	0	0	0	0
469	Sheldon Littel	haskell.cronin@example.net	2026-01-26 21:17:20	$2y$12$ehc5iFzVxQGZKhfdTtiP/e0M3RtPV3L4877smAYLlf/iGC6nsHUJm	\N	2026-01-26 21:20:08	2026-01-26 21:20:08	1-808-526-7698	male	1980-01-11	client	t	t	\N	t	0	0	0	0
470	Marcelle Terry	kub.shyanne@example.net	2026-01-26 21:17:20	$2y$12$tbUk9xrM9q9bTT3iglYBn.jO3WfsPvYDxBGUqxD2m01zDo/qobjAy	\N	2026-01-26 21:20:08	2026-01-26 21:20:08	931.683.4810	male	1978-01-19	client	t	t	\N	t	0	0	0	0
471	Sofia Veum	kgoyette@example.org	2026-01-26 21:17:20	$2y$12$UhyzEZIifXgvKBXy24oCD.anRSsjHej.yd0hnJ4UprgnX/QwULiGO	\N	2026-01-26 21:20:08	2026-01-26 21:20:08	+1-574-204-2468	female	1983-03-09	client	t	t	\N	t	0	0	0	0
472	Leon Bayer	bernard29@example.net	2026-01-26 21:17:20	$2y$12$VCDttwS1EKUpVetRpaqINekQdS8h6fsoPAZLdqOlk2jJqa5POQ1L6	\N	2026-01-26 21:20:08	2026-01-26 21:20:08	573.687.8200	female	1984-03-31	client	t	t	\N	t	0	0	0	0
473	Dr. Angelina Lehner DVM	melyssa92@example.net	2026-01-26 21:17:20	$2y$12$hVLLWEfD8gdj1cLg8rajCuTsUg8QkTjZM2m02EwL9Kg20yI8YZUZ.	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	(321) 916-3162	other	1986-11-01	client	t	t	\N	t	0	0	0	0
474	Miss Marina Flatley	ondricka.jess@example.com	2026-01-26 21:17:21	$2y$12$qZQcc7wULv7RX5fM1JHHyu1oEn.MN8puxVNUo5TFfBOEGChf6gjke	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	+19366003264	male	2002-02-12	client	t	t	\N	t	0	0	0	0
475	Alverta Torphy	vilma.mills@example.org	2026-01-26 21:17:21	$2y$12$K1y/O441g2s5qQkTf1/u/..CfBJ7hch06jAZBLRmYh0vX8ZbhTayC	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	828.656.0484	male	1983-03-04	client	t	t	\N	t	0	0	0	0
476	Ms. Kylie Leannon	crist.judson@example.net	2026-01-26 21:17:21	$2y$12$5RD3DWukdQWjiJjnHSxRkehQ89o7qlp1HZn2m6DdPQ87YpgmSQgie	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	(734) 735-6684	other	2004-07-10	client	t	t	\N	t	0	0	0	0
477	Prof. Benny Ebert	hailee81@example.net	2026-01-26 21:17:21	$2y$12$HYwIO.tH1FYs5cv8eKxoE.pLBpIiob8B8xT9l/kbELjXYWqbi.9Je	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	+1-417-246-2475	female	1980-01-21	client	t	t	\N	t	0	0	0	0
478	Prof. Doug Daugherty MD	jedidiah56@example.net	2026-01-26 21:17:21	$2y$12$e3j/GaN23ymv8c2EMOywbOQoPB5jKNElnS8e4qpmQA9Yr0I.jFrRW	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	+1-520-941-5077	other	1985-01-09	client	t	t	\N	t	0	0	0	0
479	Prof. Garrison Rice	ayana10@example.net	2026-01-26 21:17:22	$2y$12$P6B/vm1hey9Reh3rSVFQJOOUyH4QF0OypX9MLgvNP4JGHuMSA9SQy	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	575-836-9984	other	2002-02-27	client	t	t	\N	t	0	0	0	0
480	Aiden Eichmann	dexter71@example.com	2026-01-26 21:17:22	$2y$12$5hJcHKdp1PmfeeDVLp.CAuqvlkdIDyT225Cj1HXDOp5HMTMVdJd26	\N	2026-01-26 21:20:09	2026-01-26 21:20:09	(346) 968-6753	male	1994-02-14	client	t	t	\N	t	0	0	0	0
481	Sienna Sawayn	reilly17@example.com	2026-01-26 21:17:22	$2y$12$w2iN/r1y/Yjwo3PVxQXO8up/NiKC8ixaxkv98wPoxFOqQueDDy3AC	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	(225) 844-3678	other	1998-08-30	client	t	t	\N	t	0	0	0	0
482	Miss Alysa Haag DDS	qsatterfield@example.org	2026-01-26 21:17:22	$2y$12$L8jvd3wPV5CAn1ULIfb21eA8.doD9Gj2f3cQCyid3MLctOqsvet/a	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	860.226.2789	female	1972-06-05	client	t	t	\N	t	0	0	0	0
483	Rogers Jenkins PhD	dagmar.kemmer@example.org	2026-01-26 21:17:23	$2y$12$Ht6MuZlgQVfVzdsCpX8fkeJa5uel3QjQHignj0FUvWExuqnAr0pPS	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	1-254-797-4062	female	1986-06-19	client	t	t	\N	t	0	0	0	0
484	Diana Streich	veum.deshawn@example.net	2026-01-26 21:17:23	$2y$12$5RPEdumV.G40LbUSn/pqs.1NjVVoHEfVSh2Tt.S907GmCcXdmSVf2	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	+1.270.693.1070	other	1990-07-11	client	t	t	\N	t	0	0	0	0
485	Miss Ebba Kunze I	ned.hartmann@example.com	2026-01-26 21:17:23	$2y$12$iU/6dNh8MBxvC5SRldSGCufPx/2gbLtFpY.KlkhRuXpMX9VODPN8m	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	786.302.0723	female	1970-04-10	client	t	t	\N	t	0	0	0	0
486	Kendall Kuphal	lfeil@example.net	2026-01-26 21:17:23	$2y$12$KPBYGzYiRr2Reb8Q9NLiVe1H7wRSd5wIFldYH0GX2TJFB.J/1kEuy	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	352.683.3860	female	1997-12-04	client	t	t	\N	t	0	0	0	0
487	Elnora Kris	destany31@example.net	2026-01-26 21:17:23	$2y$12$kS8OzLlQ/TwvEAlNcC.YcuJGsP52mQzYkZDntB8whjYEiBOZITQLq	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	828-984-6181	male	1984-11-29	client	t	t	\N	t	0	0	0	0
488	Theresa Leuschke III	al48@example.com	2026-01-26 21:17:24	$2y$12$1lcdt4QLArQz.vMTj3Qkeus9jDrKgy11ugCmrEWJRpm3mcoymQ8im	\N	2026-01-26 21:20:10	2026-01-26 21:20:10	(606) 246-6243	other	1996-06-16	client	t	t	\N	t	0	0	0	0
489	Dr. Carmelo Abbott Jr.	cheyenne22@example.com	2026-01-26 21:17:24	$2y$12$XQe.tAZ8LevDxjN8zJDeLuue.s0xOKWlUicCVWuhOjW58aOLexRfe	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	541.582.7181	other	1989-05-20	client	t	t	\N	t	0	0	0	0
490	Lynn Auer	schoen.dedrick@example.net	2026-01-26 21:17:24	$2y$12$R/wgAQxFBsngB13jCe/AaeZuNqjphg/ObfZU4PUmoyQvG8U1w/LsC	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	567-723-1129	female	1999-06-16	client	t	t	\N	t	0	0	0	0
491	Jan Hodkiewicz	rex58@example.com	2026-01-26 21:17:24	$2y$12$SerjoTlqPp21QPamlHgOxuvAJP9TrxhtOrc5xD8RE.l/yewGYzqVC	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	1-347-801-8251	other	1987-05-08	client	t	t	\N	t	0	0	0	0
492	Lilyan Franecki	hegmann.eloisa@example.com	2026-01-26 21:17:24	$2y$12$c15GlPn7xsVcfPVSKiLELel91.wF1nhN3B68udGOu1achanCzoT.W	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	442.312.2497	male	1971-01-26	client	t	t	\N	t	0	0	0	0
493	Josefa Jacobs	alf92@example.net	2026-01-26 21:17:25	$2y$12$jnAJmYKnCwVvjh3vaYm7ZOm0MwFLoRXyo/Aioz9xKoo1.RpyWcviK	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	(346) 463-3660	other	2003-12-08	client	t	t	\N	t	0	0	0	0
494	Olen Dietrich II	kacey.heaney@example.com	2026-01-26 21:17:25	$2y$12$RLMkdqaEZYesXdtwHmS4Ke.D93sMcF6.TNIqHuNOrrF2umarGko9S	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	978.717.8773	female	1991-03-02	client	t	t	\N	t	0	0	0	0
495	Nola Botsford	hill.demond@example.org	2026-01-26 21:17:25	$2y$12$qwGgcVyQvA.xfZ7IcSC5i.6La2.zwnln825/g1MMp3oM2ohyXd09i	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	(463) 907-2511	male	1995-06-17	client	t	t	\N	t	0	0	0	0
496	Alexandra McDermott	santiago.hauck@example.net	2026-01-26 21:17:25	$2y$12$qEFrBSN30MVJnX/3CkJmouvPP./I2XSIrcvKIMZtLdsspYeh6Q7v6	\N	2026-01-26 21:20:11	2026-01-26 21:20:11	+1-646-927-5170	male	2000-11-01	client	t	t	\N	t	0	0	0	0
497	Modesta Huel	uchristiansen@example.com	2026-01-26 21:17:26	$2y$12$paoxvVzcH4fpDuRansT3c.zIPgk/4fcc1aTZDMicfbeIF0D0Kf.tC	\N	2026-01-26 21:20:12	2026-01-26 21:20:12	1-971-877-7555	other	1976-12-01	client	t	t	\N	t	0	0	0	0
498	Alan McDermott	demetris61@example.com	2026-01-26 21:17:26	$2y$12$zxQIp4PEgyQRxhFEn0kRFuwd7MRaoJENtj.NfNWl8GKqS/.bF7X9q	\N	2026-01-26 21:20:12	2026-01-26 21:20:12	1-863-914-9802	other	1991-11-08	client	t	t	\N	t	0	0	0	0
499	Juliet Braun	gmueller@example.com	2026-01-26 21:17:26	$2y$12$6mIv3N8TMIpxONacI1Ba8uT7AXnIR9K6uwd.lNSATvsvwY2sp4PiG	\N	2026-01-26 21:20:12	2026-01-26 21:20:12	1-412-427-8911	female	1992-02-06	client	t	t	\N	t	0	0	0	0
500	Mrs. Sandy Blick Jr.	marisa64@example.org	2026-01-26 21:17:26	$2y$12$Z.kpLlLwQs6eZiUXJrZFdO9VQjiRea7SS2GhEbQS6/NRKEYjP08pa	\N	2026-01-26 21:20:12	2026-01-26 21:20:12	+1-781-657-0469	male	1991-05-06	client	t	t	\N	t	0	0	0	0
501	Juwan Hilpert	osinski.mekhi@example.com	2026-01-26 21:17:26	$2y$12$6wbu5.beDYgFwRU/QBfrYObNV9aff1gqkfQmmmBJnKQhMis1r8HKi	\N	2026-01-26 21:20:12	2026-01-26 21:20:12	+1.480.318.5909	female	1987-09-21	client	t	t	\N	t	0	0	0	0
502	Eddie Wunsch	uschimmel@example.net	2026-01-26 21:17:27	$2y$12$vVFMoyjXvMrGwlLorWvLZe0YX7t/1Ytk6TErK4Nl0NcHZK69kmZ8e	\N	2026-01-26 21:20:12	2026-01-26 21:20:12	716-804-1743	female	1974-06-17	client	t	t	\N	t	0	0	0	0
503	Dr. Buford Muller	dooley.emie@example.net	2026-01-26 21:17:27	$2y$12$EI4VH8JhJXZafiEItQRsW..YBL3itT7Ov1dgSAuUvGqqhdjhVQH4K	\N	2026-01-26 21:20:12	2026-01-26 21:20:12	+1-856-977-4800	female	2000-09-27	client	t	t	\N	t	0	0	0	0
504	Cortez Nikolaus	evelyn86@example.org	2026-01-26 21:17:27	$2y$12$hByh.m6GciRCi4398AH/NOm0Q8psLllVeJMGiX8FAeZP2YvoZ0a4G	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	432.254.0510	other	1976-08-07	client	t	t	\N	t	0	0	0	0
505	Lela Lynch	wisozk.arvid@example.org	2026-01-26 21:17:27	$2y$12$uOHO.pGRTa1rNbtBLZW2yuzPwJv9luZuAUzBMcgx9Jzj2ip4DEbK6	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	1-580-209-8856	male	1997-01-12	client	t	t	\N	t	0	0	0	0
506	Dr. Esther Raynor MD	jewell05@example.org	2026-01-26 21:17:27	$2y$12$JMlpoTV/eqh.CZfISqOLru05vAgOQEUoh1LA5m1m0q00037ebZOKW	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	218-452-1764	female	1994-01-01	client	t	t	\N	t	0	0	0	0
507	Nicolas Wiegand	tlubowitz@example.com	2026-01-26 21:17:28	$2y$12$H13xKtr6ivJATm.nOSwvxOis5RmJ.oFJBiMhwKz6Mki6lpK1muaym	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	+1 (812) 379-2996	other	1973-02-28	client	t	t	\N	t	0	0	0	0
508	Ava Jerde	ucremin@example.com	2026-01-26 21:17:28	$2y$12$vk3/kt4kGsttUy4ZX16z4uzAXBhgeYl8uE4cCSn0R7J34bLMIkroK	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	+15649963004	female	1976-11-15	client	t	t	\N	t	0	0	0	0
509	Isabella Stamm	pkreiger@example.net	2026-01-26 21:17:28	$2y$12$L0Mo/4CM/8rglPVDiNjk2e1Y35No8lU/.OfEGGnh.da/8vj01GGkm	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	+1 (567) 548-1149	male	1991-07-15	client	t	t	\N	t	0	0	0	0
510	Prof. Joanne Kautzer I	zgoodwin@example.net	2026-01-26 21:17:28	$2y$12$FgcpWmtwRJ5FqTfggNivLOshOjYg0dMAHIWhBFUgQN.9kLQ8ZqtD.	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	220.855.4240	other	1991-06-10	client	t	t	\N	t	0	0	0	0
511	Dr. Elna Kihn IV	mazie.zemlak@example.com	2026-01-26 21:17:29	$2y$12$Ry462vL1OI7LrF52IqPCheCn1YDn5weGhYg7zLXFWkWwxpmepYmGy	\N	2026-01-26 21:20:13	2026-01-26 21:20:13	(251) 840-6834	other	1987-12-27	client	t	t	\N	t	0	0	0	0
512	Idell Kihn Jr.	renee.damore@example.com	2026-01-26 21:17:29	$2y$12$3R9d2qTyg3lqD.MvyLxmqORrX7t4.VzUX/99SgZnAkpgF.rxIsQbO	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	+1-469-531-1783	female	1975-08-14	client	t	t	\N	t	0	0	0	0
513	Prof. Amos Braun	devyn87@example.com	2026-01-26 21:17:29	$2y$12$GwcFdj4a5aIP12iKuPbJDuq4PiL7ck3sPHEywaHkUOD1oN.T5lLKq	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	724-674-6745	male	1975-11-10	client	t	t	\N	t	0	0	0	0
514	Rahsaan Kutch MD	bradley45@example.net	2026-01-26 21:17:29	$2y$12$dUr1mbKGQPOMuRPZLfRjMuup1YRXWjNBkAC94CBsgtd9Z.mKg4MWi	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	(253) 739-5256	other	1988-05-04	client	t	t	\N	t	0	0	0	0
515	Rickie Hyatt	haag.alexandrine@example.com	2026-01-26 21:17:29	$2y$12$5c8EIyqwbFM/4ovOoQqXPO5SA5vPNP54akcAudM2MWZZtNkL5ZGvK	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	(234) 681-5125	other	1983-03-13	client	t	t	\N	t	0	0	0	0
516	Miss Myra Abbott	barrows.alessia@example.org	2026-01-26 21:17:30	$2y$12$T/2g1ILM87WDizFbH0g.J.CwJxTQzmuwC7fBf6BpUTbpR0PDgrGJ6	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	+1.970.835.5754	female	2004-08-26	client	t	t	\N	t	0	0	0	0
517	Melvin Friesen	samara82@example.net	2026-01-26 21:17:30	$2y$12$z7hKQWz1SKPEooyT8KAPyec38mMbRCvL907zWR4uRfB4deewfok4G	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	283.615.8151	female	1972-08-12	client	t	t	\N	t	0	0	0	0
518	Ms. Jada Hill	kohler.barney@example.net	2026-01-26 21:17:30	$2y$12$6/p5vQBUyo8m697oB3iK9e8hzwWcqKWK5SMEjWAMITXt7IycK4aY.	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	334-499-9273	male	1990-04-09	client	t	t	\N	t	0	0	0	0
519	Owen Grady	reilly.erick@example.org	2026-01-26 21:17:30	$2y$12$TQqZ6tUosq1.jr47X6s9GuTz0MWolthZjC64MrqEUeDLoAwt0E2gi	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	347-434-0318	male	1979-04-08	client	t	t	\N	t	0	0	0	0
520	Kimberly Johnson	jfriesen@example.org	2026-01-26 21:17:30	$2y$12$2bPnIbv7Bt11jc3AXTXOou7yby7XO5fr8bDnUTWfBCozU6flCAfS2	\N	2026-01-26 21:20:14	2026-01-26 21:20:14	1-570-578-1404	other	1984-05-08	client	t	t	\N	t	0	0	0	0
521	Mr. Makenna Bosco	sschneider@example.org	2026-01-26 21:17:31	$2y$12$4.KobIWxS0hkOIazuu6wxuvuw8xkFNBOhTVDNu45f.I1UO.bj0oQG	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	+1-843-679-6975	male	1987-08-26	client	t	t	\N	t	0	0	0	0
522	Mrs. Astrid Bashirian MD	ncasper@example.com	2026-01-26 21:17:31	$2y$12$dFa34KItnFR5XRwtIwVB.O0LGOtE3GtlTnARr4HNiAxSHXB1hYCBG	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	754-891-1091	male	1980-06-28	client	t	t	\N	t	0	0	0	0
523	Colleen Gusikowski	dbergstrom@example.org	2026-01-26 21:17:31	$2y$12$EuulIovEZQIjeyijG8kkROIQHedKrxBy81xsgjJ/R7gsiFiSpGWMi	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	+18628569592	other	2004-02-15	client	t	t	\N	t	0	0	0	0
524	Prof. Haley Gerlach	esmitham@example.com	2026-01-26 21:17:31	$2y$12$CFlJf/c.6rjFrkdbuSmrIubNmuFriwu21GGe8NPQip2.kjQvKaV6W	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	1-650-820-8930	male	1990-05-04	client	t	t	\N	t	0	0	0	0
525	Alexandrine Schowalter	travon42@example.net	2026-01-26 21:17:32	$2y$12$3JgP.ZEQ.VNfOzHGtQkkVu9pKBFEM3lfGyr2rv/xVQoA48DI8BQTi	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	+17327983992	female	1997-10-15	client	t	t	\N	t	0	0	0	0
526	Elbert Yost	yhayes@example.org	2026-01-26 21:17:32	$2y$12$NHlfvosbUzGSieqBUfH4i.x/NOnF9GSv.RCMSixcOZR3ajDLhGKsW	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	+1-872-740-8893	other	1974-05-26	client	t	t	\N	t	0	0	0	0
527	Prof. Name Buckridge	gardner52@example.com	2026-01-26 21:17:32	$2y$12$ydZ5DhAVmH6KYczRbmZD9uJ7DnwX.XykXsolWJqxJMTfPPbiDN/aS	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	305.881.2648	female	1997-05-11	client	t	t	\N	t	0	0	0	0
528	Porter Brakus	rbeer@example.org	2026-01-26 21:17:32	$2y$12$hdhx.qdCVsSMW.43rCg.C.qQAcB.G8/WTCktnv8vIgA7I9UObUfsi	\N	2026-01-26 21:20:15	2026-01-26 21:20:15	650.885.0525	male	1985-05-20	client	t	t	\N	t	0	0	0	0
529	Mayra Rice	anitzsche@example.net	2026-01-26 21:17:32	$2y$12$m6GHICHq0h3/NOVGvdcxLu0pAb4eF.1XG.OEPQGOThaR4ogzvZvtO	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	(660) 415-9900	male	1998-11-05	client	t	t	\N	t	0	0	0	0
530	Dasia Cruickshank	roob.chelsea@example.org	2026-01-26 21:17:33	$2y$12$kJU521C7kcSHXU3hJkguZ.a75iSRFGqyTSf/2WOmdRusn4DjRfIKK	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	+18703130090	female	1986-02-25	client	t	t	\N	t	0	0	0	0
531	David Bashirian	bechtelar.cyrus@example.com	2026-01-26 21:17:33	$2y$12$6/pWqQXwLwn141zXYgc/j.AOvlgIgAipFMzRmEP0usxZB2bdz5soC	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	+1-479-201-8230	female	1983-04-26	client	t	t	\N	t	0	0	0	0
532	Margaret Moore Sr.	lelah50@example.net	2026-01-26 21:17:33	$2y$12$RSleWE9yXB.0bAzdrg3QDu3IaFPBKYfP6K3v0jJMVwkXH2KV/1yIK	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	1-989-992-7291	female	2001-10-19	client	t	t	\N	t	0	0	0	0
533	Pattie Gibson	haylie20@example.org	2026-01-26 21:17:33	$2y$12$1MgEApaGM2j2eOgQqHM6XeEg9PhJVwHmHErWJMZ2p2qgbU3dVb96K	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	+1 (845) 235-5542	male	1974-09-19	client	t	t	\N	t	0	0	0	0
534	Dessie Abbott IV	bosco.avery@example.net	2026-01-26 21:17:34	$2y$12$IIj4hOYOQSpUggZ74X4Nc.h8vFE.LYg0/X6CDIdN7xtn3xl39bQL.	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	(818) 410-3545	other	1989-04-12	client	t	t	\N	t	0	0	0	0
535	Halle Romaguera	eleazar47@example.org	2026-01-26 21:17:34	$2y$12$FvGyZPL3ZEAVjyoilGKYfuQnjULeREboQ4NPh1W1hnAVPPiEJAsZi	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	936-243-7980	other	1985-04-03	client	t	t	\N	t	0	0	0	0
536	Shania Vandervort Jr.	esta26@example.org	2026-01-26 21:17:34	$2y$12$K/xW/ifadHomXBdNx.Eg/.NQklC2C7cNglwiP1UKqoHYqWmGaCC26	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	276-527-2401	male	1980-04-29	client	t	t	\N	t	0	0	0	0
537	Calista Haley	bode.electa@example.org	2026-01-26 21:17:34	$2y$12$jseVWMn8/IdSVEYyihF5s.zG9tVJ.8jyG9soy.vJG8hliHNz70jJG	\N	2026-01-26 21:20:16	2026-01-26 21:20:16	361-582-7993	other	2001-02-26	client	t	t	\N	t	0	0	0	0
538	Sanford Reilly	carter.marta@example.org	2026-01-26 21:17:34	$2y$12$Z4KvmR5jF6Hb7QlqpIzeOuPjPpNsLKeXKj1oR9Q06jzQViQBTH9oO	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	+1 (802) 322-3368	male	1984-02-03	client	t	t	\N	t	0	0	0	0
539	Prof. Clarissa Terry I	jaren32@example.com	2026-01-26 21:17:35	$2y$12$sjndNU/24Z41b57rq/Hk/uQoDMm6/dRBzhb5Gj1oe2mu4KL9QeLlG	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	978.722.1063	male	1989-10-08	client	t	t	\N	t	0	0	0	0
540	Sidney Bahringer	emil90@example.net	2026-01-26 21:17:35	$2y$12$fJNc1ugYmezTEiIryKyyLeTr8YhvIPbRdTQgU9.c5o/lrpOwuwQW.	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	+13416234564	other	1986-12-13	client	t	t	\N	t	0	0	0	0
541	Camylle Kassulke Jr.	apowlowski@example.org	2026-01-26 21:17:35	$2y$12$.wtDa.YAmVIp7RquyW5fY.Xh1rx/.pWESQ.M1RfMYfddcqqSHWNh2	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	1-351-246-6721	other	1980-11-12	client	t	t	\N	t	0	0	0	0
542	Mrs. Dina Gulgowski IV	tzemlak@example.com	2026-01-26 21:17:35	$2y$12$mR/NH/LMYdX3O3f6m5H.M.kSKCokjMpZO8uCl40za8VfcPPJtoRIm	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	1-629-391-4508	female	1972-11-17	client	t	t	\N	t	0	0	0	0
543	Ally Rodriguez	ambrose44@example.org	2026-01-26 21:17:35	$2y$12$Kd4ahaCQBUEJ6I6GE2CkU.fZ/V8qr4scAEvPPXATaxoT5CI1XBLZW	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	934.810.8286	female	1970-12-12	client	t	t	\N	t	0	0	0	0
544	Brisa Schimmel	melyssa76@example.com	2026-01-26 21:17:36	$2y$12$uIy0cOd02oL2l9WAQbfTV.mWHT8XehTF5gObXuwOwM2aEnF42DS1u	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	(469) 755-7267	other	1984-03-31	client	t	t	\N	t	0	0	0	0
545	Ms. Crystal Hills	corine96@example.org	2026-01-26 21:17:36	$2y$12$.q/k1cWonMJYJuSTpc1PLOmY8dz2pOif2TtDCeiNRZG/e3S82X87G	\N	2026-01-26 21:20:17	2026-01-26 21:20:17	217.631.9857	other	1993-01-31	client	t	t	\N	t	0	0	0	0
546	Hertha Rogahn PhD	mkeeling@example.net	2026-01-26 21:17:36	$2y$12$PGsjP/l9Y86lNkMXaBjcGONbM.Y18QWJK9cVY1qlvnDeDJrLN.Hwy	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	1-520-759-9288	female	1997-11-19	client	t	t	\N	t	0	0	0	0
547	Mr. Toby Dare	pierce.mills@example.com	2026-01-26 21:17:36	$2y$12$U/CEy15xUSKVTRVsFX5r9.O/x.pNUv04ZdyHvauBzWmBBRhee7ONm	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	+1 (870) 995-7076	female	1988-07-05	client	t	t	\N	t	0	0	0	0
548	Ms. Julianne Jerde DVM	lew.ratke@example.net	2026-01-26 21:17:37	$2y$12$ghFgTEIpz/.rwni4Zj4SSO865hpezoCNhuWMIAhET3Pxu4qT.dscK	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	641-237-6819	other	1972-08-30	client	t	t	\N	t	0	0	0	0
549	Wilford Runolfsdottir II	gmurazik@example.net	2026-01-26 21:17:37	$2y$12$NL9VWTN9R2ZibynhZ98DauV6SIoEyIeua/LRjdtU1tUeaiSufVdAa	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	283-615-5417	male	2000-12-21	client	t	t	\N	t	0	0	0	0
550	Petra Zemlak DDS	tobin32@example.org	2026-01-26 21:17:37	$2y$12$mZH.chSnjofzX1FWfXs2culKIFGLepBW38XQQkq/Ktsp081y0rEXC	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	458-634-7244	female	1984-11-17	client	t	t	\N	t	0	0	0	0
551	Hadley Lebsack Sr.	michele.windler@example.com	2026-01-26 21:17:37	$2y$12$CiSF0.UCOQ5J8VDBz9Cj8uSrfYXZXn7Bi1WvUDk.m5irJf63vRjYq	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	779-245-3115	male	1996-02-22	client	t	t	\N	t	0	0	0	0
552	Zane O'Reilly	fisher.reid@example.com	2026-01-26 21:17:37	$2y$12$EcnEzym1ORQ7sUGi12oXOOBGBhPrrcDTmYdkE3ozrd0H3AyUCbndm	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	(281) 921-9148	male	1972-06-01	client	t	t	\N	t	0	0	0	0
553	Deanna Raynor DVM	lbahringer@example.org	2026-01-26 21:17:38	$2y$12$qImBW5SduaJAUKszyTb67.Kc2h.t4pxk7zoOfSN9FFZk8sTt/6bNW	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	323-929-5553	other	1996-06-20	client	t	t	\N	t	0	0	0	0
554	Christy Gulgowski	knitzsche@example.com	2026-01-26 21:17:38	$2y$12$AU7mX6KQLYqLEPB9gIUfNuibyNH/gki4RPKCaY/VqGeakVKo504QO	\N	2026-01-26 21:20:18	2026-01-26 21:20:18	1-708-582-6373	other	1983-01-14	client	t	t	\N	t	0	0	0	0
555	Angelo Bergstrom	pwyman@example.net	2026-01-26 21:17:38	$2y$12$qEQMKxTkX5yTqXIYoB6Lgu1FtnWb9IdW8BkPkttyt5ctpK0VAzQQO	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	774-929-8955	male	1982-11-30	client	t	t	\N	t	0	0	0	0
556	Lilliana Kunze	aglae.orn@example.com	2026-01-26 21:17:38	$2y$12$6rxzcVF/CuJMO4nZb26upu1t9XAzCPd3tN2Vr98E2r4Ck02mQMzMO	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	+1-743-210-3567	male	1989-08-02	client	t	t	\N	t	0	0	0	0
557	Tomasa Wolff	audrey05@example.org	2026-01-26 21:17:39	$2y$12$HbZLpxCAYuDViUXWOEpQPOxzivhXxDzCfd8bSicosCw54w48wT7MK	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	(640) 393-5678	other	1983-10-15	client	t	t	\N	t	0	0	0	0
558	Tess Hamill	dbode@example.org	2026-01-26 21:17:39	$2y$12$IgHYFbbx1WHKqiInPn4KbO6XSvUbOksJ.iANxAJ9ufPfxASGv6qqS	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	1-864-814-5776	male	1977-02-22	client	t	t	\N	t	0	0	0	0
559	Mrs. Melissa Oberbrunner	fkiehn@example.org	2026-01-26 21:17:39	$2y$12$AItilmGFPUirgXAbuXUqBOqA35yXEqwWh.aDyCtZI9G/Q9aGa/T0q	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	341.887.2334	female	1990-01-13	client	t	t	\N	t	0	0	0	0
560	Alene Huels	ibotsford@example.com	2026-01-26 21:17:39	$2y$12$tEje2Ui8jcLz3mhxNd3XWee7btJnCXWwJuXqaqQxPCrL.HscbtPEy	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	+1-980-838-3297	other	1999-11-30	client	t	t	\N	t	0	0	0	0
561	Dr. Rollin Ferry V	aroberts@example.com	2026-01-26 21:17:39	$2y$12$3xzwcLsG8Rr99xFp5mpeaubXHOQvgxjWzfBzuuD654GQsBUHJ3nbW	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	(973) 699-8787	female	2001-01-14	client	t	t	\N	t	0	0	0	0
562	Jace Watsica	darion.christiansen@example.net	2026-01-26 21:17:40	$2y$12$6wzCBb8LgsMx7YARcN1SyOysdyif4cdrtkxpGldMeHnr.wSdfJCRm	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	718-896-1045	female	1983-09-30	client	t	t	\N	t	0	0	0	0
563	Ima Watsica	rutherford.alberto@example.net	2026-01-26 21:17:40	$2y$12$Wlt/BTXUAdzHkmM32AtLh.MtLqVlTW1/g3znlZ/MJDi.6O4RBMri2	\N	2026-01-26 21:20:19	2026-01-26 21:20:19	(202) 470-5331	female	2003-07-07	client	t	t	\N	t	0	0	0	0
564	Nathanael O'Conner III	ybraun@example.com	2026-01-26 21:17:40	$2y$12$gMPZEnAAhEIvm7XCrujlGelXY8kpg19IKTZkQe5Zlfc.PHfu790Da	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	+1-360-952-6262	male	2003-04-15	client	t	t	\N	t	0	0	0	0
565	Ismael Witting	ilebsack@example.org	2026-01-26 21:17:40	$2y$12$aReBc2n/9IeGMFLsTID8t.r/.t.v04G.caWjJmmSWaDSm2fzMv8GC	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	872-272-8028	other	1994-07-05	client	t	t	\N	t	0	0	0	0
566	Forrest Hirthe	albertha.larkin@example.net	2026-01-26 21:17:40	$2y$12$uwILdnA2WwWG9fLVvgZJ0uxLhdp8TfH8qMvLjoMFYWP3Z1aySOcaS	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	+1 (910) 682-5139	other	1994-01-07	client	t	t	\N	t	0	0	0	0
567	Nicholaus Tremblay IV	htorphy@example.net	2026-01-26 21:17:41	$2y$12$ZXp9vD3mfPYSwPPucjmBtOehdsxNBGPG7PfXptMqpAl93mAGolWk2	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	920.572.0974	male	2002-04-10	client	t	t	\N	t	0	0	0	0
568	Alan Rutherford	kihn.alia@example.org	2026-01-26 21:17:41	$2y$12$D80jM72LMg2iY2OCqf.X3.FMHkg1rRIMukfACD6EX6foohBtNke8q	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	+1 (828) 919-7364	male	1999-11-23	client	t	t	\N	t	0	0	0	0
569	Kristopher Bosco	bernhard.emily@example.com	2026-01-26 21:17:41	$2y$12$E0emANuN7TyRaJZpI1Rl5.1YcorYCGzB4k9/D3zDXkngkclNPWT.K	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	1-734-297-5501	other	1990-09-04	client	t	t	\N	t	0	0	0	0
570	Bertrand Tillman DDS	jacobson.russell@example.org	2026-01-26 21:17:41	$2y$12$YstPIYtiIUzpLN9LJbywOuVYXH2OLbpCKVI/hR8Y.LjoFLzsHQLh6	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	815.945.3237	other	1987-02-11	client	t	t	\N	t	0	0	0	0
571	Pinkie Anderson	elmira.herman@example.net	2026-01-26 21:17:41	$2y$12$Aa4tkBMOtrDuCc7oYaN/xucNXXL98ohnaWnEEh6NPHcT7o3TrqtTS	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	(351) 329-9295	female	1970-12-17	client	t	t	\N	t	0	0	0	0
572	Lavern Wisoky	hhermann@example.com	2026-01-26 21:17:42	$2y$12$939Lr/CTZvP6enzBxOGvpu/K/25zXKTZt8PIUXF.00EM4gB7g096C	\N	2026-01-26 21:20:20	2026-01-26 21:20:20	(843) 794-6919	male	2002-11-29	client	t	t	\N	t	0	0	0	0
573	Corbin Gaylord	vena.adams@example.com	2026-01-26 21:17:42	$2y$12$Xac66evo0EbIJ5P3Bp3ceeoUlA4qi5BrsupnMmMXzEO/1VcjDPELu	\N	2026-01-26 21:20:21	2026-01-26 21:20:21	+1-402-351-5781	other	1995-12-15	client	t	t	\N	t	0	0	0	0
574	River Sipes	hand.gardner@example.com	2026-01-26 21:17:42	$2y$12$3QYwFdqREU8ErAcvO8VNaeBBNvpioBE2e31kDEYYlGv5T7tFom4PK	\N	2026-01-26 21:20:21	2026-01-26 21:20:21	(551) 474-9631	male	1992-10-14	client	t	t	\N	t	0	0	0	0
575	Lorine Cummerata	bessie.runte@example.com	2026-01-26 21:17:42	$2y$12$CKrLQkxQhS0RYsYEMH7Ioe0UyWoAJEs4f8O8R6Zkx4IOWZq.iinMi	\N	2026-01-26 21:20:21	2026-01-26 21:20:21	+1-575-201-6631	other	1989-09-02	client	t	t	\N	t	0	0	0	0
576	Santa Ondricka	nitzsche.leonor@example.net	2026-01-26 21:17:43	$2y$12$rxzwRmb0JV65MJ55AvDK1erk5nv7lEX5H8jeCsAopfSfE2i0RFCKG	\N	2026-01-26 21:20:21	2026-01-26 21:20:21	(319) 784-4584	female	1984-01-27	client	t	t	\N	t	0	0	0	0
577	Malika Raynor	waelchi.abagail@example.net	2026-01-26 21:17:43	$2y$12$wqbnH5MBN6Fg4jVbx8I4LOZ3TYJ/8l/Wx3KAA6oIYAriJGFLCj7by	\N	2026-01-26 21:20:21	2026-01-26 21:20:21	+1.845.823.1722	other	1971-08-02	client	t	t	\N	t	0	0	0	0
578	Beatrice Wyman	dena.crooks@example.com	2026-01-26 21:17:43	$2y$12$xAAfHaRCeXJWYEjyUS4bjOImE./yWKPk46ngL904lMuMB0JY/WPkO	\N	2026-01-26 21:20:21	2026-01-26 21:20:21	516.849.3403	female	1973-02-16	client	t	t	\N	t	0	0	0	0
579	Anabel Barrows	jimmy55@example.net	2026-01-26 21:17:43	$2y$12$0BfT3ywPmsvyHIdgGGqYU.SNfUvf3WtDx9EkaktDx41X06FTLj6Xe	\N	2026-01-26 21:20:21	2026-01-26 21:20:21	+1-513-569-9526	female	1981-03-31	client	t	t	\N	t	0	0	0	0
580	Aida Glover	murray.aglae@example.org	2026-01-26 21:17:43	$2y$12$okPI9A1Q4WCbJOgy0KOFAem5aRCWIxBuSSw1pXfTHpX/ulqcNT3wq	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	+1-302-519-9242	female	1982-12-11	client	t	t	\N	t	0	0	0	0
581	Prof. Nathanial Littel MD	rogahn.brenna@example.com	2026-01-26 21:17:44	$2y$12$2ZN.CR.zdd9RvafWyrraPuijxM1Ol6D/TcpRXs68SnZK3qdUJLEvK	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	+18707923085	female	1984-04-26	client	t	t	\N	t	0	0	0	0
582	Justine Mohr	tracey.rath@example.net	2026-01-26 21:17:44	$2y$12$o7KgdJc0rG8iZLSzlf1py.bkXEJ1Hua2TkyTjuSldwOJPDVxuUroW	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	878-943-3637	male	1983-10-04	client	t	t	\N	t	0	0	0	0
583	Shanny Cremin I	taylor79@example.com	2026-01-26 21:17:44	$2y$12$T072gn7OfW2KFx7bD4i7IOVRf/8RdFjAQJYLG9ZIAX617QMYNAabG	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	(806) 910-4967	male	2000-04-18	client	t	t	\N	t	0	0	0	0
584	Kiley Ondricka V	enid26@example.net	2026-01-26 21:17:44	$2y$12$MEuasDZYZw0QTf2cILqUrOByhdqJI410HJsd6gUq9wxoYtnkKxvpq	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	616-792-3254	male	1994-06-11	client	t	t	\N	t	0	0	0	0
585	Dr. Lambert Dooley	katrine.jenkins@example.net	2026-01-26 21:17:45	$2y$12$QsYa0S6qKKu1RMzk4yrt7.IxmWGKErJmzcjY1qi0ysuogzSo8X3ku	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	1-458-324-3926	other	1970-08-15	client	t	t	\N	t	0	0	0	0
586	Prof. Sterling McCullough	sandy.bogan@example.com	2026-01-26 21:17:45	$2y$12$i56r66jvmbwB57pgLlKobOWiCm.cKoFYvNVaoE0DPiONjuT.it6wq	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	+1-380-615-5751	male	1983-02-11	client	t	t	\N	t	0	0	0	0
587	Margarita Wiegand	srohan@example.org	2026-01-26 21:17:45	$2y$12$muW6hSvIYWxp5hDAyrTZ6O68YNGJiUh9RtBIrNmn8SSbpaDCvw.MW	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	(234) 350-6417	female	1999-06-28	client	t	t	\N	t	0	0	0	0
588	Mr. Ephraim Borer	franecki.margarette@example.org	2026-01-26 21:17:45	$2y$12$CFfQyNZjvp87NB1EdAA9peHEfUpd/APiXuNeNrV31mGd8uCEAUYlW	\N	2026-01-26 21:20:22	2026-01-26 21:20:22	(617) 767-8398	female	1992-11-05	client	t	t	\N	t	0	0	0	0
589	Mrs. Myrtle Ratke	ukrajcik@example.org	2026-01-26 21:17:45	$2y$12$oxdxGNf1HPT9bbyGgS87aevF6STTb1W6Qy39zX7eTLx0RRqSXYXrS	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	907.886.9674	female	1985-04-25	client	t	t	\N	t	0	0	0	0
590	Filiberto Yundt	xmorissette@example.net	2026-01-26 21:17:46	$2y$12$kRFxAjlXWErRW/VYPetkBOKwdTU1GF72br2/pOwHiNUB9Kg5Yk8e2	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	+1 (585) 391-8489	male	1991-07-28	client	t	t	\N	t	0	0	0	0
591	Wilhelm Haley	itzel.ratke@example.net	2026-01-26 21:17:46	$2y$12$h.ig8.yDm8pP6ujsUfpe5O4qjixrLnHlhif6kcyk85s26ifLBj8CG	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	+13049180598	other	1971-05-08	client	t	t	\N	t	0	0	0	0
592	Dr. Hector Lebsack PhD	zmayert@example.com	2026-01-26 21:17:46	$2y$12$L2ckBZX3lLYjmaJ8i61ePu5QjqpiElV8z5zNsbgbfSrC7wWp/P/Sm	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	859.949.0433	male	2004-12-07	client	t	t	\N	t	0	0	0	0
593	Miss Valentine Schinner	nwalter@example.net	2026-01-26 21:17:46	$2y$12$ArP9VpGsYJiAFWviNJ45sOvWrPQ2WGGoJGqjBJWHd3Rof4PiwJioK	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	+17407650829	female	1990-02-06	client	t	t	\N	t	0	0	0	0
594	Jadon Rogahn Jr.	grayce.larkin@example.org	2026-01-26 21:17:46	$2y$12$AyYS0/rdmCxG.kFsZiEdyeMa75cgaPw94lje.NsPevASgBb9rr5j.	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	402-419-5311	other	1996-07-06	client	t	t	\N	t	0	0	0	0
595	Dedrick Klein	consuelo78@example.net	2026-01-26 21:17:47	$2y$12$L4WiBRTK9PRWDFLatmBrWuwf658/.n4Z2ZCL27NwGpGrMNoMOu.e2	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	+1-616-724-2761	male	1993-04-17	client	t	t	\N	t	0	0	0	0
596	Fay Hane	tierra.gutkowski@example.net	2026-01-26 21:17:47	$2y$12$39IG0HHFSoCnWpuEVPSu0ORjsIvbeqHvDUmKa1jskU7yDQfJcL6qq	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	1-380-553-1150	female	1978-01-03	client	t	t	\N	t	0	0	0	0
597	Mr. Alexis Lebsack	kling.archibald@example.net	2026-01-26 21:17:47	$2y$12$xRFSC4dYwgXRWS5Yti2yq..ikTFqtVdF0PPhsyOu7btSQOH8xymH6	\N	2026-01-26 21:20:23	2026-01-26 21:20:23	1-813-618-9975	female	1997-05-08	client	t	t	\N	t	0	0	0	0
598	Prof. Guy Stroman	abalistreri@example.org	2026-01-26 21:17:47	$2y$12$BC8jNExRq8nI7bLtwnUGueT7R98JVv3sUc6JiYBpuosREAJru.71W	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	(385) 698-0189	female	1989-09-22	client	t	t	\N	t	0	0	0	0
599	Russ Raynor Sr.	schuster.cordelia@example.net	2026-01-26 21:17:48	$2y$12$4j8ybK3LN7GvQF4QvYRuoObxE7R/zUF7pjRTs/RMzKuZDWlXOtWjC	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	+1.878.717.5756	female	1989-11-29	client	t	t	\N	t	0	0	0	0
600	Florida Steuber	tremayne16@example.net	2026-01-26 21:17:48	$2y$12$x6iDcrHoICiL8W85R235/OZQ673D1v71yPpv4A.eo5OXOPPgidvFm	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	+1-702-944-9212	male	1977-11-13	client	t	t	\N	t	0	0	0	0
601	Prof. Richard Cronin DVM	kyler.turcotte@example.org	2026-01-26 21:17:48	$2y$12$mWk81e1D62nvuXkEAeQj6.WjLVUbqwuPalEzYMLywm5MG2ZO4HX3.	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	1-810-906-3876	female	1996-09-05	client	t	t	\N	t	0	0	0	0
602	Joan Emard	delphine.mraz@example.com	2026-01-26 21:17:49	$2y$12$FBV.yLIuOZJI7hMP1pfA2Oe0Wm1.aPqEcYa2AMo6zUJCK/C3Q5M3C	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	(757) 255-9042	female	1997-07-22	client	t	t	\N	t	0	0	0	0
603	Shaun Wolff	emard.art@example.net	2026-01-26 21:17:49	$2y$12$IW5db3Yxdrn8FXhPtI1JvelBmKaTdkdQMhH15FHqZYBjsGFm5r7n.	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	+1-757-741-4179	other	1980-01-06	client	t	t	\N	t	0	0	0	0
604	Billie Upton IV	ardith.bartoletti@example.org	2026-01-26 21:17:49	$2y$12$qFNNgC1xa809ZljLOPX8P.4GVqWckyZ9YeSTBKoHLfu9X4R8weV5y	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	212-343-9519	female	1971-04-29	client	t	t	\N	t	0	0	0	0
605	Zita Lockman	cbergstrom@example.net	2026-01-26 21:17:49	$2y$12$I5Wq9Te0Lai0w3DysjbPgehkWS8o/w2PMFH/vlHdIRYBMdM8KBFr.	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	928.680.9995	male	1997-04-22	client	t	t	\N	t	0	0	0	0
606	Dawn Bins	ystrosin@example.com	2026-01-26 21:17:49	$2y$12$s.QuKrYv0AteNa6g7oqeveec906T8AWn2Tt/UZo4IhksQNJ6KMfMG	\N	2026-01-26 21:20:24	2026-01-26 21:20:24	(410) 721-7975	male	1986-04-06	client	t	t	\N	t	0	0	0	0
607	Yasmin Oberbrunner V	yklocko@example.net	2026-01-26 21:17:50	$2y$12$tbtCDUn9P/V2nSkuxnwRCuxjcXZRMvp.v7X6c9SEe1fac77loVo1O	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	585.712.4122	female	1983-11-24	client	t	t	\N	t	0	0	0	0
608	Quincy Kutch	mcdermott.alvah@example.net	2026-01-26 21:17:50	$2y$12$LFMjkPFOM0ZIbqz2FsU/G.Yxy1NwMeVlIFBWBsS.xXQDu/OZFPBTe	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	540.801.8149	other	1991-12-08	client	t	t	\N	t	0	0	0	0
609	Alford Rath	vhodkiewicz@example.net	2026-01-26 21:17:50	$2y$12$j/J5S5NcOcNV85tDHB/EOuT2caKBM9g5p1Mbok4k7TqtuU/yLAcGO	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	540-500-7567	other	1990-11-05	client	t	t	\N	t	0	0	0	0
610	Prof. Amalia Weissnat	everardo16@example.org	2026-01-26 21:17:50	$2y$12$NXOS8ogVqJd8YNXs6DDGReBq4TNBfAVeT8j6OMaPuiaZS2KSHBNgi	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	445.536.1172	female	2001-12-11	client	t	t	\N	t	0	0	0	0
611	Malvina Padberg	zmosciski@example.org	2026-01-26 21:17:50	$2y$12$db4S3bAxoW0X7pMHvSn2HuWx7HDdLpOsroaAYcDu150reygcPgP8G	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	1-409-947-7439	male	1997-11-10	client	t	t	\N	t	0	0	0	0
612	Kurtis Schiller	estrella25@example.com	2026-01-26 21:17:51	$2y$12$TgyjC8W0e.OUgv6zEmwrI.faZdzz8DvIprpT2kh9yAQrT3m.pG9nq	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	(520) 636-5625	female	1987-12-14	client	t	t	\N	t	0	0	0	0
613	Dan Schultz	carolyn06@example.com	2026-01-26 21:17:51	$2y$12$dr1U2XKmJLsNY3F5qBRBBeFG6bHI4/BIjUKt3m6xyi7Frg0JcCl.a	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	+1.640.225.4990	male	1998-12-31	client	t	t	\N	t	0	0	0	0
614	Dr. Erik Mann IV	franecki.kaylie@example.org	2026-01-26 21:17:51	$2y$12$.LT/7Cu5k1i6PtA5MJl38.FWZprkm8kRWLyn3GcJW3mFKY7EYFoq2	\N	2026-01-26 21:20:25	2026-01-26 21:20:25	+1 (563) 457-9964	other	1982-01-01	client	t	t	\N	t	0	0	0	0
615	Al Rippin	renner.vernon@example.com	2026-01-26 21:17:51	$2y$12$DUz3ma1XcBmJUf.Z90tGPe258MniXzeccEhJmswyFv4tvWugSKaxm	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	+15748719893	other	1996-04-28	client	t	t	\N	t	0	0	0	0
616	Jared White	elton03@example.com	2026-01-26 21:17:51	$2y$12$CKlU6fF9FRsV6Dkau4Y.ZOEERKhrlxiqI9RaFR/5dE2QNtSmgc/X.	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	+1-947-735-8961	other	1976-01-22	client	t	t	\N	t	0	0	0	0
617	Rick McLaughlin	ima56@example.org	2026-01-26 21:17:52	$2y$12$OHEs9TFt8eh6867T5qSA.umUVRPd3gTy9ok47ZhJLtsphqyUSd972	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	(309) 598-3269	female	2003-05-01	client	t	t	\N	t	0	0	0	0
618	Miss Rowena Keebler	doris13@example.com	2026-01-26 21:17:52	$2y$12$FZb4SVZNACBRO3PE4T4w2uuYqYWYeSafJ.ey/JC7GO8ZykB7TVVJ.	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	1-859-692-2069	female	1984-06-01	client	t	t	\N	t	0	0	0	0
619	Miss Skyla Denesik V	kade.murray@example.com	2026-01-26 21:17:52	$2y$12$GWApYFUhgV2WHwnpTotd6OiMQQ8L5GRKleECKIqHsp5CvqPLLJgiO	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	478-574-5009	female	1976-04-24	client	t	t	\N	t	0	0	0	0
620	Clemens Smitham	elinor.nader@example.net	2026-01-26 21:17:52	$2y$12$71vGl4KtlxL5YDiGVaAs4.vOsjf53v8AvjXOEqK47Z.MARSPljwMC	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	+17856551561	other	1977-06-07	client	t	t	\N	t	0	0	0	0
621	Arlo Kiehn	hintz.teresa@example.org	2026-01-26 21:17:53	$2y$12$4Mcdg83n57uHcRz/xDEeI.HrYNm1TsGtmVrEmAxNJI3tdoSSjU0mi	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	+1-626-833-2115	other	2002-12-24	client	t	t	\N	t	0	0	0	0
622	Prof. Carlee Bauch V	dickens.haylie@example.net	2026-01-26 21:17:53	$2y$12$VeytQE5xuv8qIm8j30CbGOMH1sBfbM2uyZZq0uomYtqyXMzlH7PMq	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	559.387.5498	female	2004-12-06	client	t	t	\N	t	0	0	0	0
623	Ms. Maggie Stanton Sr.	rowe.giuseppe@example.net	2026-01-26 21:17:53	$2y$12$htk89E1bphBZlkfoOKd7yuZG.yg9iSs4RtUfIGo6ErXilxba/Ar0G	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	818.809.2536	other	1983-08-07	client	t	t	\N	t	0	0	0	0
624	Anna White	lrutherford@example.com	2026-01-26 21:17:53	$2y$12$Sz2T0iND72aiEGfTt8eJCuzvL0TFd.LZFzyydAQCKrAnWyRwL2XsW	\N	2026-01-26 21:20:26	2026-01-26 21:20:26	+1-620-525-5247	female	2004-03-21	client	t	t	\N	t	0	0	0	0
625	Xander Kovacek	joana27@example.org	2026-01-26 21:17:53	$2y$12$aLbbbZD.fhpEj9C2NPSuCeT6uA.fY64rbVRoJoeY2XNRv/M3VXpBK	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	+1-941-764-7933	male	2001-02-10	client	t	t	\N	t	0	0	0	0
626	Ms. Tiffany Medhurst DVM	imogene.abshire@example.net	2026-01-26 21:17:54	$2y$12$.lnm8v6T6ABccu81TDW3cOqVZ83HyZfcteN3q0JYtxC.7l9amPhI6	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	865.612.8666	other	1979-06-19	client	t	t	\N	t	0	0	0	0
627	Otto Gottlieb	kailyn49@example.org	2026-01-26 21:17:54	$2y$12$E2TChG2TVqxqoohvi66UmesEkx.uzA9Y8igdPkxqPHfOVTETSMXpa	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	(989) 507-1090	female	1975-12-07	client	t	t	\N	t	0	0	0	0
628	Melyssa Russel	rippin.jerald@example.net	2026-01-26 21:17:54	$2y$12$sMHof67xNzpA1WeL.5pO4um.cCcD12Tzct.SPrM0/hj9n3mTs4T46	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	820.703.6896	male	1981-12-31	client	t	t	\N	t	0	0	0	0
629	Miss Michaela Frami	damion.schimmel@example.net	2026-01-26 21:17:54	$2y$12$VLy3gb.Am.gNdLrYBQG3pu6GU53K8FAsBTD.6B.tY1wqVOse/R91.	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	947-827-8217	male	1990-12-19	client	t	t	\N	t	0	0	0	0
630	Ms. Catalina Stanton II	dickens.aleen@example.net	2026-01-26 21:17:54	$2y$12$ohZAJvnasuPKhHPlBzHycehznv9CJ5OgraAxz7aSU4PgxODSgRuc6	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	539-748-1153	other	1999-01-12	client	t	t	\N	t	0	0	0	0
631	Carmelo Torp	kkerluke@example.net	2026-01-26 21:17:55	$2y$12$.bgXs6PuuMYiMoCZWnBOK.OSaujN0lWknYIwZQ/5J/mBbhvk90X0i	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	+1-475-338-1950	other	1970-08-12	client	t	t	\N	t	0	0	0	0
632	Stefan Eichmann	jritchie@example.com	2026-01-26 21:17:55	$2y$12$tsDO/2d96TKIKGlu5/Ez1eDyHzm2YoSZ26xG3uJlMBNhz3yz183YO	\N	2026-01-26 21:20:27	2026-01-26 21:20:27	458-706-9881	female	1991-09-12	client	t	t	\N	t	0	0	0	0
633	Dr. Guido Walter	kip.dibbert@example.org	2026-01-26 21:17:55	$2y$12$NQ.89yl2sPiDWCxDLL/c8eXYAp8Am6qPjpy5edYM4kXhDk0/uOmNi	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	609-413-3697	other	1992-12-22	client	t	t	\N	t	0	0	0	0
634	Geovany Carroll I	malcolm21@example.org	2026-01-26 21:17:55	$2y$12$7sCoaxWuIWRPW5awDe8ylOg2uT6WFiBbt.WeiubQ84.lOUVOVlM2W	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	629-576-0415	other	1981-10-11	client	t	t	\N	t	0	0	0	0
635	Nora Lemke	walter.doug@example.net	2026-01-26 21:17:55	$2y$12$jtXZGNiiauQb1LkqSdAsj.LpoOQfBDfiB5sxPEDSUA8MnU7JpudP6	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	279.931.7069	female	1973-12-08	client	t	t	\N	t	0	0	0	0
636	Dr. Bryon Watsica DVM	rklein@example.com	2026-01-26 21:17:56	$2y$12$WkG3ewv3xssr42SshRG/8ekjoDBN2JnecmadR.R1InN.xt8ic.hEa	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	+1.870.664.3721	female	1990-04-14	client	t	t	\N	t	0	0	0	0
637	Regan Kuvalis MD	tatyana02@example.org	2026-01-26 21:17:56	$2y$12$l74TZ0BILkZaYYUfYy50au.ceT5liD07yrMMdyV.6HDebs1/2/zDS	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	(469) 590-9314	female	1978-10-04	client	t	t	\N	t	0	0	0	0
638	Seth Reinger	rupton@example.com	2026-01-26 21:17:56	$2y$12$yccR4UptPhAlAfrKCDP1m.6tPhIb8JRflMxB3C5dl8FA2meRPSnGK	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	+1 (949) 326-3475	other	1986-08-09	client	t	t	\N	t	0	0	0	0
639	Lennie Spencer	julia63@example.org	2026-01-26 21:17:56	$2y$12$TCiGUFq.KUaXAAAYTDJ/Ru20EP4j5bXLryzOqD1pEswUTJ195P.jy	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	+1-620-300-8042	other	2002-10-29	client	t	t	\N	t	0	0	0	0
640	Braulio O'Kon Jr.	schowalter.bessie@example.net	2026-01-26 21:17:57	$2y$12$SK95qAm9sRX60j8.r2K7oe0ho6F6/HJ71u9TNFPjOGI4RabJdHU5u	\N	2026-01-26 21:20:28	2026-01-26 21:20:28	+1.678.337.5686	female	1979-01-28	client	t	t	\N	t	0	0	0	0
641	Caroline Mosciski	dorris92@example.org	2026-01-26 21:17:57	$2y$12$MNJb5YSDx4wk3HBQhnYFpul3SFy/lNgILhHSm7WEcLtMLLa63Gssi	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	+1-405-207-8214	other	1986-11-04	client	t	t	\N	t	0	0	0	0
642	Mr. Donald Goldner Jr.	abernathy.cali@example.org	2026-01-26 21:17:57	$2y$12$MFZMTfCXnaO3FeRx13kpm.HqkqYYNeEZD6hsRzxbzuvqbxFIv87uC	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	+15647487421	female	2004-12-21	client	t	t	\N	t	0	0	0	0
643	Cassandra O'Hara	nikita23@example.com	2026-01-26 21:17:57	$2y$12$QKF/GlB9D.BxLT4F2zp/F.u9rzIFPAk.Vmh4eKayIJfEPMfIunjcq	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	1-805-373-1467	male	1980-01-21	client	t	t	\N	t	0	0	0	0
644	Ms. Jennyfer Wilkinson I	ivolkman@example.org	2026-01-26 21:17:57	$2y$12$/OtogMmaMlG.pV7zpc3lpOn2/7FB3XZ0npvAJ.wfCXMCoLClz5cYa	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	+1 (979) 444-9715	male	1991-01-24	client	t	t	\N	t	0	0	0	0
645	Dr. Robyn Connelly DDS	keanu46@example.org	2026-01-26 21:17:58	$2y$12$f7bb/NyKjBH69PPHc6Q6Mu6pJ7qsEZxICZxHrENHfBwLdaEYblHd6	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	+1-848-670-6472	other	1997-04-12	client	t	t	\N	t	0	0	0	0
646	Dr. Cortez Denesik	orn.hailie@example.org	2026-01-26 21:17:58	$2y$12$Cs8aVDzITd/aJVfv95af5.o2SnJYyBTCQKZ7o3439EMk9FYrane7O	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	+1 (980) 227-7686	female	1991-12-09	client	t	t	\N	t	0	0	0	0
647	Toby Haag	bednar.israel@example.net	2026-01-26 21:17:58	$2y$12$RzTTNTjCS.l.m88QfjrvxuUiG7YwpaOhc8NA3UeTPMf0b2YKupc6.	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	+1 (629) 572-6878	female	1973-10-11	client	t	t	\N	t	0	0	0	0
648	Martine Feest	zschulist@example.net	2026-01-26 21:17:58	$2y$12$/hDWNHN7hvrTpLOBwds21.5./7JaChHWXYPLxkUMYKjRPVL5SehD.	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	+1 (240) 490-2715	female	2004-05-05	client	t	t	\N	t	0	0	0	0
649	Dr. Rubie McClure	frieda57@example.org	2026-01-26 21:17:58	$2y$12$UV5AurdlG3TLj8ErlpqLXO2H5mIB3nrGesqu6GAHZSgAOSwvCDqne	\N	2026-01-26 21:20:29	2026-01-26 21:20:29	1-586-555-2779	other	1976-03-01	client	t	t	\N	t	0	0	0	0
650	Mrs. Madelynn Berge PhD	dianna79@example.com	2026-01-26 21:17:59	$2y$12$H/P4b6/P88YfmYn2pk.PUOnG2rCadC3UZO3MWgkoNbUsibgJ4D5oa	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	(458) 257-0981	female	1970-08-23	client	t	t	\N	t	0	0	0	0
651	Golden Koelpin DDS	chadd.adams@example.net	2026-01-26 21:17:59	$2y$12$X4OgGn3BGcQ/t9rwVfjnC.ze8epFBZVJviKEhei9tas82bipQyCI2	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	+1-209-883-1142	female	2000-05-27	client	t	t	\N	t	0	0	0	0
652	Alvera Douglas	weston.parisian@example.net	2026-01-26 21:17:59	$2y$12$1ckfqesuZbFL9o6YzwZWHelOF.E9OabRP8G6HfLQdcC43M15ntwcG	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	(830) 567-6382	female	2004-04-06	client	t	t	\N	t	0	0	0	0
653	Prof. Jessyca Doyle	fbatz@example.org	2026-01-26 21:17:59	$2y$12$hn3ScUZIWY.INUHE3G8kLOfECrrG9mK.1kI9eHNV8FywX7wKVO1xq	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	1-786-710-1445	other	1999-04-17	client	t	t	\N	t	0	0	0	0
654	Estevan Abbott	juliana.schinner@example.net	2026-01-26 21:17:59	$2y$12$YZu5/MMEcLgzrH4urA0I9O.upNs9aajk.SP7y.wm5bomAIdrjRM9.	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	254-440-9886	male	2002-07-30	client	t	t	\N	t	0	0	0	0
655	Okey Schoen	frenner@example.com	2026-01-26 21:18:00	$2y$12$HM99iP8eRx9bJbCd15D/4.yPJPfDvq8QJP9QjFJleB28D9uEjxK0u	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	1-308-651-7932	female	1983-12-16	client	t	t	\N	t	0	0	0	0
656	Orland Reynolds	colton.jacobi@example.org	2026-01-26 21:18:00	$2y$12$eQ4HqhvVg5/syepXUqkw/.XAAEYLaBYPpi9jRDv2GKYOJISH3x8/2	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	+1 (551) 393-7336	female	1975-08-21	client	t	t	\N	t	0	0	0	0
657	Ms. Assunta King	damon57@example.org	2026-01-26 21:18:00	$2y$12$BM88PNcCXoumJyUkx.LyyObQW4515ONRuzT8FqZw6A2zoZCeRTOJG	\N	2026-01-26 21:20:30	2026-01-26 21:20:30	417.327.3423	male	1996-04-25	client	t	t	\N	t	0	0	0	0
658	Audreanne Herman	king.kurt@example.org	2026-01-26 21:18:00	$2y$12$x3IJ7CVYt5LljVKUP8DHVuu.0G3BEq6BUiOQA9UPcKRwo89CtK7ta	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	+1 (859) 675-1146	male	2001-04-18	client	t	t	\N	t	0	0	0	0
659	Lonnie Hettinger Sr.	irma.wolff@example.com	2026-01-26 21:18:01	$2y$12$Bl7J56JRI9/sgCpaJTvIPe2KJjixf1YTVC9h7D/01NIqmPkhxvvIa	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	1-520-782-4121	male	2000-01-16	client	t	t	\N	t	0	0	0	0
660	Miss Elfrieda Littel DDS	cboyle@example.net	2026-01-26 21:18:01	$2y$12$C9Hv3G5ABGhGrIuCcmzCk.mGt.0ItGYrgm8oNiNHjg3BVutEt/t/6	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	802.248.6628	female	1987-10-24	client	t	t	\N	t	0	0	0	0
661	Dr. Waylon Ernser DDS	elijah52@example.net	2026-01-26 21:18:01	$2y$12$fu0BUWkfFCJNstd3ckYwhOnCx2WxT6qmten.0shqHiw/xN4lckWIG	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	+1-707-321-2240	other	1985-03-27	client	t	t	\N	t	0	0	0	0
662	Jammie Howell	ulises97@example.org	2026-01-26 21:18:01	$2y$12$AefHdwSYGJVnSDikLoYCBey4mCvNVMjkukXYEEPONL7hy8Dd5Jgzq	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	+1-860-817-7085	male	1992-12-04	client	t	t	\N	t	0	0	0	0
663	Immanuel Kiehn	upagac@example.net	2026-01-26 21:18:01	$2y$12$sJydKMr8pNiHIASVUiU4telN55MB5CqlGZ/0sWH3E4Gk8Wg/6d5E6	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	+1.351.479.6213	female	1970-10-20	client	t	t	\N	t	0	0	0	0
664	Prof. Weston Kautzer PhD	mturner@example.net	2026-01-26 21:18:02	$2y$12$yO2cI1gmPlWP3VIMRET9Iudve/nL1zxmi5kP7PnRPhAdCtJpfiUty	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	463-842-4067	other	1998-10-08	client	t	t	\N	t	0	0	0	0
665	Roger Wunsch II	gaylord.corine@example.net	2026-01-26 21:18:02	$2y$12$yr8Flb.ZK7ak3Sxa5.a9lO2LnradK/YBYD6JhPSAfGDviprSa6dLu	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	283-974-8286	female	2002-03-15	client	t	t	\N	t	0	0	0	0
666	Barton Steuber	pasquale.schiller@example.net	2026-01-26 21:18:02	$2y$12$zz1AX3kI7Cw1UhKW7gS8ROZfiezu.MFk0tPeeU2lMjeWnSkJ07JjS	\N	2026-01-26 21:20:31	2026-01-26 21:20:31	559-345-6915	female	2002-01-19	client	t	t	\N	t	0	0	0	0
667	Antonia Brown	kimberly77@example.com	2026-01-26 21:18:02	$2y$12$5KPk3M8cUD7tWBuFhvFNvexgT5Kxrqasdytd3Bh6yoeAkuG89DhTS	\N	2026-01-26 21:20:32	2026-01-26 21:20:32	1-808-991-4923	other	2001-02-18	client	t	t	\N	t	0	0	0	0
668	Shea Reynolds	cielo.wunsch@example.com	2026-01-26 21:18:02	$2y$12$LxsBkE/BDhqNCJbUSDG3GuQ94iX99CmWNr2FN9jrQ4OSAzjZkcMHm	\N	2026-01-26 21:20:32	2026-01-26 21:20:32	1-878-584-9800	male	1991-07-02	client	t	t	\N	t	0	0	0	0
669	Dr. Edd Kessler DDS	ferry.ima@example.org	2026-01-26 21:18:03	$2y$12$ryBxytd0infestEpII2T..cqVpCxFZCPkHyOuCVveor.oVTXvN4lG	\N	2026-01-26 21:20:32	2026-01-26 21:20:32	+1-302-242-0356	female	1974-01-27	client	t	t	\N	t	0	0	0	0
670	Dr. Peter Gleichner	alebsack@example.org	2026-01-26 21:18:03	$2y$12$SsvoGZMTtj5.oEeGNDMdEedUIkE/OSXWrabbmeBWPB8/65Yh8wDFy	\N	2026-01-26 21:20:32	2026-01-26 21:20:32	786-892-0194	female	1976-12-06	client	t	t	\N	t	0	0	0	0
671	Lempi Hamill	halvorson.beryl@example.org	2026-01-26 21:18:03	$2y$12$zINGe3p/RE7ZgYtt/gpd2uJIwszTxY2cHCr3JVuSZaml.58T.C3xu	\N	2026-01-26 21:20:32	2026-01-26 21:20:32	1-765-401-2179	male	2004-03-01	client	t	t	\N	t	0	0	0	0
672	Lorena Rice	vzieme@example.com	2026-01-26 21:18:03	$2y$12$2w1ilN0ihvl69O2VQlz3S.HPM8A7Ax29n52dNRWVXMdGXDYJtuPZ2	\N	2026-01-26 21:20:32	2026-01-26 21:20:32	279-798-1721	other	1987-04-20	client	t	t	\N	t	0	0	0	0
673	Mr. Stanley West	dayna.collins@example.com	2026-01-26 21:18:04	$2y$12$semgEX8ugJ7ECXoiizztS.B9VEklEq9VvOtuGqgztrOElTrTMfE22	\N	2026-01-26 21:20:32	2026-01-26 21:20:32	(912) 803-3587	other	1993-03-16	client	t	t	\N	t	0	0	0	0
674	Janice Smitham	kristian.kohler@example.com	2026-01-26 21:18:04	$2y$12$N/7aV4dLF6vmrD6D8MGLlu17ToSpTzJS1bv4fMULkHUA2MHJTeqCy	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	(870) 843-5480	male	1988-03-02	client	t	t	\N	t	0	0	0	0
675	Lolita Stokes PhD	kasey20@example.org	2026-01-26 21:18:04	$2y$12$0BvGYAOMQ9Bw/4DXZEvYBOZG0x9/fFxBue3.5kHawPTf3brApsY7S	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	850-718-0152	other	1970-05-29	client	t	t	\N	t	0	0	0	0
676	Emery Huels Sr.	dare.ricardo@example.org	2026-01-26 21:18:04	$2y$12$4oxUmT59fD/KrWm/Ttlfeu0HufIiwz6NbzlwVw.E6pOkoGCfiK/uS	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	+1 (463) 588-0607	other	1987-01-19	client	t	t	\N	t	0	0	0	0
677	Eino Reinger DDS	sjacobson@example.com	2026-01-26 21:18:04	$2y$12$O4.CLK2uPX0oZZwORT69iuVM0bDJE5kXWBk8dEJjbWhMZitGkYq6C	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	1-845-965-5378	other	1995-06-17	client	t	t	\N	t	0	0	0	0
678	Quentin Christiansen	dave.oberbrunner@example.net	2026-01-26 21:18:05	$2y$12$jkOpOVAoWSHmD6MTXCXWcOuUfKOyGCOurhuH2XS6XPDkkwXWN3O/6	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	(669) 825-6450	other	1971-08-21	client	t	t	\N	t	0	0	0	0
679	Mallory Nitzsche	walker.prudence@example.org	2026-01-26 21:18:05	$2y$12$DP4heesZkCT9djVxa4Cp9.DO4Vs6LddBzSwjzKG4.QzAc5tV73sbe	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	360.529.6717	female	1979-05-10	client	t	t	\N	t	0	0	0	0
680	Valentine Heller II	goyette.florencio@example.org	2026-01-26 21:18:05	$2y$12$SvwejbAknn2VMFXykUHZYefIRaNGF7zUI/hLGCqoiKDSQpH4gCFyu	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	272.676.7616	male	1993-01-25	client	t	t	\N	t	0	0	0	0
681	Dr. Amparo Weissnat	mrodriguez@example.org	2026-01-26 21:18:05	$2y$12$17SP0GbqnJgDc1z0D1wKkuMSW95k.UUzI2Ny8UYP85GoC/Zl8GE9e	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	848-378-4292	other	1980-09-07	client	t	t	\N	t	0	0	0	0
682	Kallie Steuber DDS	jimmy.koepp@example.com	2026-01-26 21:18:05	$2y$12$VaLqYZJw2YoChEoOy7CrbeR..O/D1BGUvPOTBwoHPFEKY0gJI6GHe	\N	2026-01-26 21:20:33	2026-01-26 21:20:33	336-727-6617	female	1990-05-31	client	t	t	\N	t	0	0	0	0
683	Juana Smith	stiedemann.manley@example.net	2026-01-26 21:18:06	$2y$12$dz2rZkyfs9Kt8yQeJ98h0.ckCuSAQR5TGrYOscXYOJGbYl9Mpr/3C	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	1-314-306-0304	female	2003-06-27	client	t	t	\N	t	0	0	0	0
684	Jazmin Rolfson	brennon96@example.org	2026-01-26 21:18:06	$2y$12$uM2WBIC5NKeq9fj7wqYQpO6f8Ijggs.mKHxnlRnraYHwctMapQFJ.	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	+1-724-375-7003	female	1991-06-11	client	t	t	\N	t	0	0	0	0
685	Krista Anderson	fdicki@example.org	2026-01-26 21:18:06	$2y$12$qGnBuTh9LjyPG0R.RtIFI.0O3XG0BHWmxunN52XwAuMWljC7nNdQ.	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	425.800.8488	other	1978-12-08	client	t	t	\N	t	0	0	0	0
686	Prof. Hershel Ernser II	ebert.abbie@example.com	2026-01-26 21:18:06	$2y$12$Eo2LWqfW8PnP0rQxCoJtieHUqzso3sa7ytFDymx21anpWm12HuJYS	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	1-231-832-9341	other	1975-02-10	client	t	t	\N	t	0	0	0	0
687	Dr. Arvel Dietrich	melba12@example.org	2026-01-26 21:18:06	$2y$12$0Um1Dprm.3clFwdLJz641.2ZisxRSUFDPNsgAaNRk8XQaohNRgg.W	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	(681) 553-4689	male	1986-07-01	client	t	t	\N	t	0	0	0	0
688	Mrs. Dariana Okuneva	frederic.reichel@example.net	2026-01-26 21:18:07	$2y$12$Uf2a9as2DtndPbkWlAoHOOf1tSlCjFV7Uehe6SCvN8oPqgzGnc6Ou	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	928.287.1616	male	1972-03-02	client	t	t	\N	t	0	0	0	0
689	Dr. Travon Will Jr.	donnelly.adrian@example.org	2026-01-26 21:18:07	$2y$12$9MkUtKZXaI8PejfwUN6JxeJH.McSzubIaOnnHkVuTL.xwrVrC0xLG	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	651.578.0958	male	1997-03-13	client	t	t	\N	t	0	0	0	0
690	Henry Adams	scasper@example.org	2026-01-26 21:18:07	$2y$12$3qeruiAtKVI9AfUFC7GaGOhYZZmcyCipQiVinkPJ0ywQk6Cn4ArkC	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	412.669.4126	other	1972-03-28	client	t	t	\N	t	0	0	0	0
691	Marisa Miller	yvette84@example.org	2026-01-26 21:18:07	$2y$12$BX2Onw/fmOS2X1ciSEA8Ge1lbfMy6l29MfWH2zCf9aOe3Lyvwxzee	\N	2026-01-26 21:20:34	2026-01-26 21:20:34	(409) 466-8626	male	1987-12-05	client	t	t	\N	t	0	0	0	0
692	Ms. Eugenia Windler	gmckenzie@example.org	2026-01-26 21:18:08	$2y$12$i6S8On7jbfuELsRQQ7nRpeS6IjFTYTG5KYOoII8WGq5gq/0e93oyK	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	+1.580.819.8588	other	1983-05-16	client	t	t	\N	t	0	0	0	0
693	Rafaela Romaguera	alena53@example.org	2026-01-26 21:18:08	$2y$12$f97LC5zzDwwaf8YufJmhDu75evfYzZliK.yKxvoUVJPtrMMvK0Kta	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	1-925-240-2831	other	1970-07-19	client	t	t	\N	t	0	0	0	0
694	Rosina Romaguera	zane56@example.net	2026-01-26 21:18:08	$2y$12$OxW8SEIdCGwDRhqqXRTqL.1qtqqBi6eWM4pGoSY7RAlgVsWlP/RZ2	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	331-355-4803	female	1978-02-27	client	t	t	\N	t	0	0	0	0
695	Mr. Terence Barrows	fschultz@example.net	2026-01-26 21:18:08	$2y$12$TkbOsnD/5JLEsoJ0qSYbEOQx33Qar3Wy4/XreZQWTG1s0iWbM6vG6	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	+18568372357	other	1974-08-27	client	t	t	\N	t	0	0	0	0
696	Prof. Milton Blick IV	lbaumbach@example.org	2026-01-26 21:18:08	$2y$12$Ftuc30qBbKovGh8h9OWA9OAzYgmEyuMM.Em.FzGGkmRmlQls9WbrC	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	283-932-4122	other	1994-06-21	client	t	t	\N	t	0	0	0	0
697	Godfrey Stanton	windler.lucius@example.org	2026-01-26 21:18:09	$2y$12$rMlyTHMkPhSbuaN8U/3lyOXhBR/ZH.cYQSxat5x6Hyx/k.iulV252	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	+1-850-981-0177	female	1992-08-23	client	t	t	\N	t	0	0	0	0
698	Prof. Charlie Stamm	everett.borer@example.com	2026-01-26 21:18:09	$2y$12$NIjR9zyqTDXqs.KBsFgJWuyxerh5OK4XricoDEsuaVKnYoGFlQ2XW	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	1-860-240-1842	female	1979-03-06	client	t	t	\N	t	0	0	0	0
699	Nat Johnson DDS	davon75@example.net	2026-01-26 21:18:09	$2y$12$8pfh2mL4RqsNpCfiQMKEx.1q2nXqUlA6QedD3dhklPX8anxj61fvO	\N	2026-01-26 21:20:35	2026-01-26 21:20:35	+1.323.767.5591	male	1982-03-26	client	t	t	\N	t	0	0	0	0
700	Miss Jeanne Bashirian	sporer.diamond@example.net	2026-01-26 21:18:09	$2y$12$hHHqMJi5qfgB0ZtTD3.5ou5deRHZh9U5FjnyTGPVq50DqEPWpS4I6	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	618.868.7337	male	1994-10-07	client	t	t	\N	t	0	0	0	0
701	Elna Bergnaum PhD	margot85@example.net	2026-01-26 21:18:09	$2y$12$c4GD8NJzgLLCzhJzpvLaU.9MwQ8IQBAZ7yN0qfrWh/7GJa3SxrA6a	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	240.699.1168	other	1971-09-28	client	t	t	\N	t	0	0	0	0
702	Alivia Kohler	christy.hegmann@example.org	2026-01-26 21:18:10	$2y$12$abxkw/SmFakJP6SrLX7uyuLr5lOTPnKjxJ5w.4QDOQ7lazKxBx6i.	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	+1.681.660.2881	other	1986-01-11	client	t	t	\N	t	0	0	0	0
703	Barry Ullrich DVM	eden.goldner@example.com	2026-01-26 21:18:10	$2y$12$cmFfYPsAJRGpqv38q3EslO8ci5zplPZC60YlbG/Nwst2RSceAiHM2	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	(331) 707-5619	other	1974-07-02	client	t	t	\N	t	0	0	0	0
704	Johnson Nolan	marianna93@example.net	2026-01-26 21:18:10	$2y$12$d6K0xYC.l8UMq.qYr8xDTOaoI2EgkLNhF7uAtw.k1lbH81k6JLTtK	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	310.499.7485	male	1979-01-17	client	t	t	\N	t	0	0	0	0
705	Herman Daugherty	kim77@example.org	2026-01-26 21:18:10	$2y$12$geI6NZXXTBBFbjAKUz5Pq.hLQLRXLuI.W/Muy7.0KdkHZo5xMJeHe	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	606.258.5954	female	1981-08-06	client	t	t	\N	t	0	0	0	0
706	Kendra Hammes	layne10@example.org	2026-01-26 21:18:11	$2y$12$y.wRIQ9kVYgufP6QN0SxeOInMU3rCokeQ0cdsGrx3gQ8B/kQM2rNa	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	(559) 866-9736	other	1971-11-04	client	t	t	\N	t	0	0	0	0
707	Miss Patience Mayer	ipouros@example.net	2026-01-26 21:18:11	$2y$12$alj24Usq.liJrokVy80xDOQFBEvtGSYrH0xRsjgbaN83/lTHtK/Wi	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	+1-949-286-8055	other	1988-01-10	client	t	t	\N	t	0	0	0	0
708	Mr. Efren Zboncak III	ayana.zboncak@example.net	2026-01-26 21:18:11	$2y$12$Hi77iqTywnU5lMe31iK.7ew7dwcRA5Hgs339KftF6iw3TmLAxP0Fe	\N	2026-01-26 21:20:36	2026-01-26 21:20:36	971-392-7775	other	1993-12-31	client	t	t	\N	t	0	0	0	0
709	Ms. Jalyn Hoppe III	ignacio65@example.net	2026-01-26 21:18:11	$2y$12$rSgTIZBT8DBEkbN3a/mFmeKzNVlLD7q3UVQhMuqCgp91irc6KDZFS	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	669-767-4511	male	2002-05-28	client	t	t	\N	t	0	0	0	0
710	Dillon Mayert II	abartoletti@example.org	2026-01-26 21:18:11	$2y$12$3KQPCegKmYYgBMeXa3A4l.L1zrqw.zQdmnm1XVv5GPeO7ICUrvRa.	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	+12294538123	female	1981-10-24	client	t	t	\N	t	0	0	0	0
711	Hayley Ruecker MD	everett04@example.net	2026-01-26 21:18:12	$2y$12$rR.Xfiua8JpU4PvTKgiv6ul7n1nvVHviRzKeKxJF3absEXK1GQrFO	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	+19284103030	female	1984-10-23	client	t	t	\N	t	0	0	0	0
712	Brenna Ritchie	willie65@example.com	2026-01-26 21:18:12	$2y$12$mhrNBPrwX3Rs7yff3.cBPOx2HiDEPRwB9BzgiQiJ4voKwnZbqSGpm	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	(910) 813-3418	male	1992-10-09	client	t	t	\N	t	0	0	0	0
713	Prof. Dessie Effertz Jr.	efadel@example.com	2026-01-26 21:18:12	$2y$12$RPDFrJMamDEWRzBffgGO6uguosqnoCYiVCnirm2lshcid.9jaPAe.	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	1-254-324-4049	female	1981-08-12	client	t	t	\N	t	0	0	0	0
714	Harry Satterfield I	schmeler.lonzo@example.com	2026-01-26 21:18:12	$2y$12$gKA6g.gjV6XSXXoyIAUjaep9wQ3hTQ801SxdNgc6n38N77u4AWlby	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	+1.234.673.5878	other	1970-07-25	client	t	t	\N	t	0	0	0	0
715	Felicity Wiza	rebeka.abbott@example.net	2026-01-26 21:18:12	$2y$12$M0Wu1qtc6V6fEcYco3KtNO0/J7PLNHjaJosJd0kVx0UQyuhDvSqmG	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	1-520-413-5333	other	2001-08-25	client	t	t	\N	t	0	0	0	0
716	Julio Reichert	koreilly@example.org	2026-01-26 21:18:13	$2y$12$80jBc8d5idGWFMdQ/v3gSeE8Dcb7UyukJtYhN/CvgxfSLdcGY.00e	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	316-271-0401	male	1975-10-04	client	t	t	\N	t	0	0	0	0
717	Aliya Metz	rgoldner@example.net	2026-01-26 21:18:13	$2y$12$Wato9Gx1wApZyQfAX9UgfuP8tKu74qUvj454fTh7y4auuHHga0hVW	\N	2026-01-26 21:20:37	2026-01-26 21:20:37	1-478-355-3930	other	1997-09-14	client	t	t	\N	t	0	0	0	0
718	Nettie Von	sherwood.sauer@example.net	2026-01-26 21:18:13	$2y$12$ev4M9K4wbgcYgeq3m1X4W.oCbAsasYjcAI3ohZtOkPv4q2eACdKiy	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	1-276-442-2955	other	1970-04-13	client	t	t	\N	t	0	0	0	0
719	Robin Cronin	herta80@example.com	2026-01-26 21:18:13	$2y$12$rCFl9xRiLP0G5bQJ1PcqgeHlJ.QLJrIGF08bjYax2gj13rBhfZ44.	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	(845) 587-5663	other	1991-07-23	client	t	t	\N	t	0	0	0	0
720	Cheyenne Keebler MD	lester.hayes@example.com	2026-01-26 21:18:14	$2y$12$K6thfRDvP/7/QVkU9Hvphevaw504R.ntQdLQoF4gj6ZQY5jsUTxeC	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	+1-346-995-7771	other	1998-07-16	client	t	t	\N	t	0	0	0	0
721	Dr. Kaya Runolfsson I	sean65@example.org	2026-01-26 21:18:14	$2y$12$20peP.cihOaM1W6tJsv7sOsExsANwFC5/8qC2tjj.9AUyBm1cp6OG	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	614-558-1641	male	1971-07-26	client	t	t	\N	t	0	0	0	0
722	Vena Cormier	izaiah10@example.com	2026-01-26 21:18:14	$2y$12$C5/BkFIq3PHSWbf4ofVggOPzMScgOF34X02BCuqvuScX/fWa8ZpNy	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	+1-949-905-5662	female	2003-08-24	client	t	t	\N	t	0	0	0	0
723	Dr. Kirk Cummerata IV	yadira66@example.net	2026-01-26 21:18:14	$2y$12$GFWLYljg5PNydGOgIXugTuS11Hun/2rO3AqwvT643GFA.AB2yojc2	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	+18546798126	male	2002-09-16	client	t	t	\N	t	0	0	0	0
724	Tressa Walsh Jr.	beau.effertz@example.org	2026-01-26 21:18:14	$2y$12$xwJcG87.PQAg3MddUw3reuLh24ThQVpBKkjB1ngU8kCgj3OSH7WvG	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	+13049854613	other	1974-12-20	client	t	t	\N	t	0	0	0	0
725	Miss Arlie Flatley IV	koss.bill@example.com	2026-01-26 21:18:15	$2y$12$wPRlDC9fSqSWpynoN.osku/Pc0MLJlj10cCZby1Fl4N1G2RRhyq3y	\N	2026-01-26 21:20:38	2026-01-26 21:20:38	+16123140814	female	1980-05-16	client	t	t	\N	t	0	0	0	0
726	Ford Marvin	krajcik.myrna@example.org	2026-01-26 21:18:15	$2y$12$6A0UdADUVT4uKweuEFROBezrSaDBGsQ9JOt7PEbOfx21b/hNL58sa	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	(704) 782-6929	other	1988-10-13	client	t	t	\N	t	0	0	0	0
727	Carlee Kautzer III	jaskolski.kenyatta@example.com	2026-01-26 21:18:15	$2y$12$ebpKrRkJ9TkYKC0e5.Jt6O3r2.Yrtiyo3ujWUGaJ7k/pF6UkJDYZy	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	732-609-7983	male	1982-09-14	client	t	t	\N	t	0	0	0	0
728	Bartholome Gerlach	jaquelin35@example.com	2026-01-26 21:18:15	$2y$12$Civxz0WLUJOtlffU.1vEA.KeYQE.BPpT05uxN8xXlbtexC5yq34Dy	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	770-667-6929	male	1992-12-31	client	t	t	\N	t	0	0	0	0
729	Prof. Napoleon Bosco V	agislason@example.com	2026-01-26 21:18:15	$2y$12$NabfqbG.7pgCkEeExJ41jeCLiEb1hZFApSP5JKbDLUNpks7CM/7Fu	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	1-341-450-6697	male	1998-12-26	client	t	t	\N	t	0	0	0	0
730	Brennan Nader	jenkins.deontae@example.org	2026-01-26 21:18:16	$2y$12$yVuVGwHhwzy2p7KPmetsUelcdra8qfdBjG0hKTWCKFFaF059qYXnG	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	860.813.4510	female	2004-03-06	client	t	t	\N	t	0	0	0	0
731	Deonte Beer	henriette39@example.org	2026-01-26 21:18:16	$2y$12$h/wb9ecfKEBcN7G79wMuQOeZYk6GGy00lQzuiGPkZnjnBxFj/7EU2	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	+17479041302	female	1993-02-20	client	t	t	\N	t	0	0	0	0
732	Prof. Justina Feil I	luigi.daniel@example.net	2026-01-26 21:18:16	$2y$12$GKeeCvAV1bp4iz90oPSHJ.wrwov9.dqzWKd5lOpesYkBVo0aCcGrS	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	(908) 402-1169	female	1999-09-01	client	t	t	\N	t	0	0	0	0
733	Vada Dietrich	winfield.bashirian@example.org	2026-01-26 21:18:16	$2y$12$UChqkB9VkLZDtayT5ToOBOBf1vr8eivfNKASKuMkT8eLKxd.d4FNW	\N	2026-01-26 21:20:39	2026-01-26 21:20:39	(856) 317-1685	male	1974-03-21	client	t	t	\N	t	0	0	0	0
734	Elmo Stracke Jr.	jane36@example.net	2026-01-26 21:18:17	$2y$12$nA06V7p.cowcKtU/L1M/X.LcEdq74YnVT5xsqkEsN2O0Kf1l4uD5i	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	585-908-4795	other	1974-03-12	client	t	t	\N	t	0	0	0	0
735	Gladyce Herzog	sebastian99@example.net	2026-01-26 21:18:17	$2y$12$/VVCrVRWHJEmv27Zo6R.o.54e5CXXrMuNxuqRV9QPvppFmHB273z.	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	1-283-954-1057	other	1981-07-27	client	t	t	\N	t	0	0	0	0
736	Prof. Florida Effertz DVM	felicita.mante@example.org	2026-01-26 21:18:17	$2y$12$pF8pzEE3B0/YELgwZXPpQOgfHtdRwqoMEpcifQuWgwwaUMklI1waC	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	1-440-749-4739	male	2000-11-04	client	t	t	\N	t	0	0	0	0
737	Bernhard Treutel Sr.	donnelly.joshuah@example.org	2026-01-26 21:18:17	$2y$12$XbdmgFhUC9AbfRNHD/xjb.5RA4uu2/HpWMEnxgCk3zCQS8RkLM0ku	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	689.517.6995	other	2004-02-08	client	t	t	\N	t	0	0	0	0
738	Reynold Ondricka	aileen.koepp@example.org	2026-01-26 21:18:17	$2y$12$uIlBjNYVYli2sYEVjsxuFeKXIHWt7tE7QK1BwKuublNnFP/RBkhFS	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	+19205959759	female	1991-02-07	client	t	t	\N	t	0	0	0	0
739	Dion Gleason	jaydon.kling@example.com	2026-01-26 21:18:18	$2y$12$t6zEjTfgTwjpteFjjtSQ4u.hL64T5S7JEhQiDuzlopgugeE8XDDVu	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	1-415-526-9188	female	1997-01-25	client	t	t	\N	t	0	0	0	0
740	Gunnar Ullrich	luciano12@example.com	2026-01-26 21:18:18	$2y$12$u9qxnQsswFcUIbOT.hcio.B/RdsN4peN5ne7RJ.ospOx2mhAgjluS	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	380-440-0950	other	1972-07-18	client	t	t	\N	t	0	0	0	0
741	Dr. Gerard Friesen	lucienne30@example.net	2026-01-26 21:18:18	$2y$12$aA7goW2/g1.6CuGra5sX3uJq16iIOJJHMBlp3n.lgybShxAZCoqEO	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	+1.607.543.1087	female	1995-05-01	client	t	t	\N	t	0	0	0	0
742	Stone Halvorson	taya49@example.net	2026-01-26 21:18:18	$2y$12$H7p06I/hx5vjbqLrteJd9u8vyUZ.wAkHP5o./e/PMnVyd/VjNZys.	\N	2026-01-26 21:20:40	2026-01-26 21:20:40	207.370.3574	male	1999-08-24	client	t	t	\N	t	0	0	0	0
743	Ariane Stoltenberg	kelley45@example.org	2026-01-26 21:18:18	$2y$12$RxItKUGTZ2ZElTcirxgxBeKKuONOzn1.CDm87lgLj72ExznCid6GO	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	828.614.8648	female	1990-12-27	client	t	t	\N	t	0	0	0	0
744	Woodrow Turcotte	bosco.brown@example.net	2026-01-26 21:18:19	$2y$12$dzQpGzp.xxIXeedSa8zxOuzPWMdgBxQ4jMYNMj8W.Y0209V75IIe.	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	657-853-9077	male	1983-06-22	client	t	t	\N	t	0	0	0	0
745	Karen Kulas	tremaine.dietrich@example.com	2026-01-26 21:18:19	$2y$12$ihiwyehoTKUyvAslIE0cRe7FPq/dsfDLPot3DzOtSKBz.rF/S/rOS	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	+1.808.614.9730	male	1992-06-30	client	t	t	\N	t	0	0	0	0
746	Gerson Emmerich	rafael.hudson@example.com	2026-01-26 21:18:19	$2y$12$xdDqPW6.d5ik5SKlxY9rluyqwNvT.K7BbgBsRaEkn4ix6.ZQkt2ya	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	(765) 564-4954	other	1978-05-31	client	t	t	\N	t	0	0	0	0
747	Miss Alysa Reichel	metz.garland@example.com	2026-01-26 21:18:19	$2y$12$5/zGQCOtafKgA9g3KUFWi.gGT/4x7nydkBF638SFSIq4hLVnuEItu	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	+1-317-252-4735	male	1995-04-04	client	t	t	\N	t	0	0	0	0
748	Judge Skiles V	kailee.macejkovic@example.net	2026-01-26 21:18:20	$2y$12$DPL0wlHB5YhNopzSinItVO1KjnUZG97on32WZZLkcIBSRnEgVMjWe	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	(608) 325-0371	male	2002-08-03	client	t	t	\N	t	0	0	0	0
749	Emmalee Schumm	ankunding.keshawn@example.org	2026-01-26 21:18:20	$2y$12$1IcCCO05m3mzmNzyKXiDDO9kntrpdGtqRsfXNdiA2bqbPE61fcTM2	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	+1-567-791-9906	other	2003-05-17	client	t	t	\N	t	0	0	0	0
750	Adelle Vandervort	ogulgowski@example.net	2026-01-26 21:18:20	$2y$12$UfiYT3JS5.3s3//qt.N.g.l7Senbtl/hxyPjDVvGuUt2LVAOd/8OW	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	325.339.7520	female	1973-07-16	client	t	t	\N	t	0	0	0	0
751	Kenton Gibson	rickey.nitzsche@example.net	2026-01-26 21:18:20	$2y$12$DZB8raVtUIe8zkxHK4x9R.03Kvcys2WL0d7DY/eCTD4SDgdTqkz.e	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	770-668-0102	other	1991-09-30	client	t	t	\N	t	0	0	0	0
752	Andre Wilderman	murray.blaise@example.com	2026-01-26 21:18:20	$2y$12$rrFRC5BMrwRR3zbsjVD5nOw5QxuZ8vvzY1zD/sBYGlYTligkeNgxy	\N	2026-01-26 21:20:41	2026-01-26 21:20:41	1-925-917-1212	other	1991-08-27	client	t	t	\N	t	0	0	0	0
753	Kenneth Rolfson DVM	madelynn49@example.com	2026-01-26 21:18:21	$2y$12$wZNxmzkwC15IGUmFUXgaNeYDYnar6b9P9.x1dnZsoxOGTdCzE54Fu	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	1-732-545-4980	other	1992-12-04	client	t	t	\N	t	0	0	0	0
754	Una Monahan III	lesch.tom@example.com	2026-01-26 21:18:21	$2y$12$zhJ.mKOd5xD10T1gb/94R.8zCH80wbVwvqw07irrr7GvHvCpFgyjC	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	510.704.4449	female	2002-01-02	client	t	t	\N	t	0	0	0	0
755	Elsie Lubowitz Jr.	weber.tremaine@example.net	2026-01-26 21:18:21	$2y$12$jqeiOMN7tUMe5v.DIlLr9u2Wz38iDm.5GLnu/kGVzY0UeRNzRyk3q	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	301-984-1290	female	1991-01-25	client	t	t	\N	t	0	0	0	0
756	Harmony Terry	zmacejkovic@example.org	2026-01-26 21:18:21	$2y$12$cjjuhjtVsaOjcdP3vAqEJ.H670iQdZspYNo5brWRzfO.XQ04hScpm	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	+1-410-617-0612	female	1971-05-17	client	t	t	\N	t	0	0	0	0
757	Eliseo Glover	nannie00@example.org	2026-01-26 21:18:21	$2y$12$DIz1VxfGplf71Uhm3bWOX.MwkYzDc9VuOGoyGYR2iRghPtbeKfqPy	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	425-868-3511	female	1998-07-23	client	t	t	\N	t	0	0	0	0
758	Terrence Senger	john.kling@example.org	2026-01-26 21:18:22	$2y$12$8nBld5ka9cFGUzVYRZ/cOeFmlqjnAKxa6ShsWHD4A40NECDnKOfAS	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	1-276-638-3060	female	1985-05-17	client	t	t	\N	t	0	0	0	0
759	Talia Marvin	mekhi.walsh@example.net	2026-01-26 21:18:22	$2y$12$KbZA1DO/v.5lJHPNXAPmIOCQUEM.ltZQSZ7EZH1bcGYQSRScz6C6u	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	+1.223.581.8215	other	1997-12-20	client	t	t	\N	t	0	0	0	0
760	Clementina Flatley	ewell17@example.com	2026-01-26 21:18:22	$2y$12$rUlR7dMTydnJMCyUARwSaOPAz9Hz86nJwj2fckFaJVgeT9KMHmVX2	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	772.762.3429	other	1971-08-11	client	t	t	\N	t	0	0	0	0
761	Ms. Carmella Funk PhD	thiel.emily@example.org	2026-01-26 21:18:22	$2y$12$XA/hRtdY9WNawl2Vsdkik.ajrQH5nyHKpEiz5ZcFr8PPltkOp8JgW	\N	2026-01-26 21:20:42	2026-01-26 21:20:42	+1 (301) 509-5586	other	1975-06-29	client	t	t	\N	t	0	0	0	0
762	Prof. Edythe Tremblay	wilhelmine.wiza@example.net	2026-01-26 21:18:22	$2y$12$JG.RWEMHr1O.3V3nfhOtxObTzVH9NxPboyiCHFUHLsT8voV9Mzi8K	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	(573) 722-6536	female	1996-07-21	client	t	t	\N	t	0	0	0	0
763	Herminio Veum	aniya.krajcik@example.org	2026-01-26 21:18:23	$2y$12$3tCWuT6La611CGKelJnIyO9Zj9m5SqGdaUh0t1nLm7sg.C44E1EFa	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	1-302-498-2888	other	1972-07-29	client	t	t	\N	t	0	0	0	0
764	Myles Parisian	yarmstrong@example.net	2026-01-26 21:18:23	$2y$12$KP9slyS4u/vCCPNDX0jfoO35SF/AKyuVxw1MRSriKnayt7a3lfDEi	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	+1-570-247-5513	other	1987-12-26	client	t	t	\N	t	0	0	0	0
765	Kristina Lakin	emiller@example.org	2026-01-26 21:18:23	$2y$12$112AKuC9r5jpKETokxMGyOjGVELIAukCC0fmNva4OdLXgojQiWUbG	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	657.751.4006	female	1993-08-17	client	t	t	\N	t	0	0	0	0
766	Mossie Keebler	watsica.gene@example.net	2026-01-26 21:18:23	$2y$12$IfqDkY2/uDSabHaAmMjzUOy8aCWXvl6KLKz7XzglEsEy85LnxAWk2	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	+17346364582	male	1996-01-07	client	t	t	\N	t	0	0	0	0
767	Courtney Towne	bbogan@example.org	2026-01-26 21:18:24	$2y$12$ZrMVMSfiJLeZF9v1GdiJK.Ci9UafVjk7I34YC83J5yyq45rsQ.9iO	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	1-931-764-4925	other	1985-02-14	client	t	t	\N	t	0	0	0	0
768	Marlen Kuhn I	lucio56@example.org	2026-01-26 21:18:24	$2y$12$8zr1EeoW1nV473w3FvwxNun9ZiYtKPxr9ATLYm7agFaTHYbARW7X6	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	+1 (458) 754-8331	male	2003-04-08	client	t	t	\N	t	0	0	0	0
769	Ms. Rachael Erdman III	sabrina98@example.com	2026-01-26 21:18:24	$2y$12$nWDn7E4QuZPbven5F.pEIeLa2B7sisW.8pIuZbrcOha3NsSMh2zG.	\N	2026-01-26 21:20:43	2026-01-26 21:20:43	(330) 916-0474	other	2000-03-22	client	t	t	\N	t	0	0	0	0
770	Mae Block	cronin.lila@example.net	2026-01-26 21:18:24	$2y$12$etHQMFhC62cXVlLV1QmqZuFnsWQCXF0yMXQ1ep2g7iSGoxOe/OCii	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	1-757-871-3127	male	1975-03-21	client	t	t	\N	t	0	0	0	0
771	Melody Pacocha	kenton89@example.net	2026-01-26 21:18:24	$2y$12$naZ3Li8tTPVKZbxY5hOm6e8P4zwj.DFPwuJ7IZKfnqIjJQvusr5j2	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	(559) 210-1794	female	1994-09-21	client	t	t	\N	t	0	0	0	0
772	Dayne Wisoky	wcormier@example.org	2026-01-26 21:18:25	$2y$12$7cAwyjRA0y7G.TIcdf1TAOZLvK8ssY72Ccf9vo0pbgjuHVVv07o3m	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	551.701.1771	male	2001-07-28	client	t	t	\N	t	0	0	0	0
773	Mr. Nolan Koelpin DDS	winfield30@example.com	2026-01-26 21:18:25	$2y$12$ZXhNDVLFd.thlJQbLorJZ.Lro6zZPK4Pe0h1VzOW5dLYaY4JFw0Aa	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	+13603190092	male	1978-12-31	client	t	t	\N	t	0	0	0	0
774	Cara Bechtelar DVM	aniyah08@example.net	2026-01-26 21:18:25	$2y$12$CzDN187Ih0GfSydKKJaho.yGyXp8vQ0Y1NHV7StPWDMG9o4nDPSiK	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	1-520-994-3597	other	1993-09-05	client	t	t	\N	t	0	0	0	0
775	Christa Ziemann	vilma82@example.net	2026-01-26 21:18:25	$2y$12$VBZHSKGFvwZstBPmtfnxP.Og65pi3VNFk.5DRpc3WPEMjYU470prK	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	725-414-1852	other	1984-06-28	client	t	t	\N	t	0	0	0	0
776	Mr. Alvis Stokes Jr.	zboyer@example.org	2026-01-26 21:18:25	$2y$12$s7TwSam0CrLQjDomWRV3seF3TqxoTTulRYqsWUt0sTnFueo5Cicby	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	+1-803-806-4216	female	1976-07-21	client	t	t	\N	t	0	0	0	0
777	Ms. Gia Corkery II	brandi.greenfelder@example.com	2026-01-26 21:18:26	$2y$12$td7qqVdHbXx0xS1J4MepYeS/z/LDh.57oHK/f/60yawFJ4RogUisq	\N	2026-01-26 21:20:44	2026-01-26 21:20:44	1-832-632-7651	female	1973-06-05	client	t	t	\N	t	0	0	0	0
778	Brandi Gerlach I	wreichert@example.org	2026-01-26 21:18:26	$2y$12$/DO8FrUZcN668FTQMzv7KuBvwh9MV29C6sogwZTyTKYu2TFraW3X6	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	+1-219-273-6244	other	1989-02-10	client	t	t	\N	t	0	0	0	0
779	Kelsie Terry	durward44@example.com	2026-01-26 21:18:26	$2y$12$2sVixr4sGc106oDgSDBZkOjbeTSmdiJ0/jUksjUKBlCxEnS4id4rC	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	413-852-5919	other	1997-08-22	client	t	t	\N	t	0	0	0	0
780	Mrs. Daniela Hahn MD	jeremie.volkman@example.net	2026-01-26 21:18:26	$2y$12$svoP689GSPmmEbymwF/DhuXZd1QeSMWFJVRkQY5Jj0Ici/p8mMC5q	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	279-975-8889	other	1998-08-04	client	t	t	\N	t	0	0	0	0
781	Zack Monahan	ocrooks@example.com	2026-01-26 21:18:27	$2y$12$oN/emTgKRML7X3KZ3WUX2.ZnwAzTM3Jqq7mPO4ntKU44tFnCK0GA.	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	1-325-406-3030	other	1974-08-18	client	t	t	\N	t	0	0	0	0
782	Edwin Wilkinson DDS	brook03@example.net	2026-01-26 21:18:27	$2y$12$3ptwgQQ3Ano1iq5T2kag2uT1TQR3JkeUGKSgjWmDy895a7ncmWRZS	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	(812) 777-5682	male	1990-12-20	client	t	t	\N	t	0	0	0	0
783	Carrie Nolan	vroob@example.com	2026-01-26 21:18:27	$2y$12$FpeEkw4Pme1xH6qE38pvROfEhvno77H2GOi/kMKNpddXFG0r6eM5m	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	1-445-321-9780	female	1995-02-26	client	t	t	\N	t	0	0	0	0
784	Prof. Karlee Bartell DVM	darlene42@example.net	2026-01-26 21:18:27	$2y$12$O2pd9r7lf/Fv9.y6DV6XKumjQ1QEy1cT0YT173LSuePl5dW9Brhc.	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	(580) 690-6433	other	1982-05-13	client	t	t	\N	t	0	0	0	0
785	Macey Metz	conn.valerie@example.org	2026-01-26 21:18:27	$2y$12$HdK9ION6pDqt5CaIii9pp.WaNehuH2VRgjnwjZ8/fq67TDzeHEoeW	\N	2026-01-26 21:20:45	2026-01-26 21:20:45	+1.918.722.9015	male	1979-10-23	client	t	t	\N	t	0	0	0	0
786	Dangelo Wiza	ivory61@example.net	2026-01-26 21:18:28	$2y$12$majlVmDsAhYVEnpsbOsAQ.skfM/Zf8cyKGY/fNdzFMV4LtjYknPPe	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	820.982.3297	male	1973-07-31	client	t	t	\N	t	0	0	0	0
787	Paul Kohler	jakayla02@example.net	2026-01-26 21:18:28	$2y$12$xRdr0xWxdFeMOMklVBRQa.ybmm3tWZYkrsrfbaDfFaJ8mwKNc7BY6	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	+1.909.756.0043	other	1978-01-16	client	t	t	\N	t	0	0	0	0
788	Mrs. Marisa Nader PhD	areilly@example.org	2026-01-26 21:18:28	$2y$12$9niJIMIVz5v8xPl7dMyWQOykGvkXbqKIl43ufx/SgiRg5SKu6mNxq	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	+1.208.821.2931	female	1983-11-07	client	t	t	\N	t	0	0	0	0
789	Nathan Ferry	scotty.will@example.org	2026-01-26 21:18:28	$2y$12$5Pex7z007H3wbZ7YMxXu/.CzbvgWLSY6RT0yWwY0Z.wslyGnySOe2	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	+1-774-309-6559	other	1989-03-30	client	t	t	\N	t	0	0	0	0
790	Miss Dixie Dooley Jr.	jaskolski.benton@example.net	2026-01-26 21:18:28	$2y$12$Rf6eATJX9I7kz0xs8QbkveIU9GnR0ToQX11M/pJJelltuyDrr5z3m	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	(781) 833-5777	other	1997-02-24	client	t	t	\N	t	0	0	0	0
791	Johnny Monahan	harris.trycia@example.org	2026-01-26 21:18:29	$2y$12$CfQLtWczzqHR2zL0N2HlXe30rIdXmAAX0j7a8bAgnqNg.bH1hfCo6	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	+1.830.616.6364	other	2002-03-28	client	t	t	\N	t	0	0	0	0
792	Terrence Thompson	marian79@example.com	2026-01-26 21:18:29	$2y$12$QmYpvTYIk8ZZVX6si7i/F.sHt5RRHc5rFNrFxONmhwMKHNH3inofu	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	586-895-6737	other	1988-04-27	client	t	t	\N	t	0	0	0	0
793	Gino Kilback	torp.lura@example.net	2026-01-26 21:18:29	$2y$12$t9GbXdXWbvl24lGsfBMD6utNpIxhYzPxFEoUBbNib.RY0iutn9trW	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	+1.781.683.8725	female	1985-04-08	client	t	t	\N	t	0	0	0	0
794	Ana Wuckert DVM	leon37@example.net	2026-01-26 21:18:29	$2y$12$VGKrEaPNH/7eFUOoE.02Suin.ydvx4tLRmTPp.CIV7xvDIOTY9t02	\N	2026-01-26 21:20:46	2026-01-26 21:20:46	516-702-7663	male	1977-12-12	client	t	t	\N	t	0	0	0	0
795	Ervin Leuschke I	hoppe.shakira@example.com	2026-01-26 21:18:29	$2y$12$oyWKldCBm8Njs.C74n/qc.skHTLyRiMWzngJs6coSnp.KJNmLHp9G	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	361.865.3496	other	1996-08-17	client	t	t	\N	t	0	0	0	0
796	Warren Stoltenberg	hilario22@example.org	2026-01-26 21:18:30	$2y$12$C5CWm3kWusPs5Q593TKQde.FovPStkAkcrYDWKwd22riIl4eybm5W	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	+1-707-492-4837	female	1986-03-03	client	t	t	\N	t	0	0	0	0
797	Grover Bayer	donnie44@example.net	2026-01-26 21:18:30	$2y$12$e07awQRaa9k5r/DrDe.PVeYK3VJ3ASdO3Z2XpXur1pAUeCBacEYVu	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	763-461-1148	male	1982-01-24	client	t	t	\N	t	0	0	0	0
798	Ms. Elsa Langworth DDS	kailyn.carroll@example.com	2026-01-26 21:18:30	$2y$12$3p.tiTQxeSGCjxm.Xrft/.Xc61WbhdLe9rqReIwS0xm5z.ZC2.sBW	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	231.277.7478	other	1981-11-11	client	t	t	\N	t	0	0	0	0
799	Jazmyne Rath	colin80@example.net	2026-01-26 21:18:30	$2y$12$JFUK96kfcpy25yPb4mq8LePRK8cf8isdqxL7Jr8NrgRYSIgL1/sfW	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	628-745-5321	other	1980-10-06	client	t	t	\N	t	0	0	0	0
800	Chadd Shields	prippin@example.org	2026-01-26 21:18:31	$2y$12$RgtsAQdCKUFJkJGUyRxPx.0nR1KRuNIOcmlPMPkOzu/S7Ah6XhRJm	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	804.985.7703	male	2003-09-22	client	t	t	\N	t	0	0	0	0
801	Timothy Beahan II	corwin.antonio@example.com	2026-01-26 21:18:31	$2y$12$4GYLbq1rjdeykYcnDnVxeOY6UEnyIRZEHSexgPuCWnaz1NRjUXjwm	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	740.520.1166	female	2002-08-10	client	t	t	\N	t	0	0	0	0
802	Timothy Schuster	icie93@example.com	2026-01-26 21:18:31	$2y$12$1K2YBn6DNZIGWK/9Y3qtA.W97epEbzPcqmP8ihbzHiO9CuUFibnCy	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	+1-425-969-0846	male	1995-04-03	client	t	t	\N	t	0	0	0	0
803	Shaun Dicki	king.sterling@example.net	2026-01-26 21:18:31	$2y$12$ZBxUYRDccNuApxUTal7R3us5WxkEFLckiJM9ggHn6EeD8VYRgbvlO	\N	2026-01-26 21:20:47	2026-01-26 21:20:47	(907) 279-9643	male	1990-01-15	client	t	t	\N	t	0	0	0	0
804	Kory Murphy	luna04@example.org	2026-01-26 21:18:31	$2y$12$TJGWbw9X56Z0izihm1TkzeIAiKf4ti7h7/r0imnXt4CfdJtLTZNt2	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	+15138707992	male	1974-11-11	client	t	t	\N	t	0	0	0	0
805	Ms. Cathryn Zemlak	kiehn.giovanni@example.org	2026-01-26 21:18:32	$2y$12$7U3HUsdAso9Y46lmerpDGeBCOKE.eaC0af2alxzqdJfDJDIX7GJtG	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	+1-458-474-3296	female	2003-08-13	client	t	t	\N	t	0	0	0	0
806	Abel Flatley	pfannerstill.ivy@example.net	2026-01-26 21:18:32	$2y$12$Ny9B7xVizW0P9e4giC1uwup3t1Ghily28YIL3SCIS5bu6F4DQyC8.	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	+1 (813) 583-1553	female	1988-08-07	client	t	t	\N	t	0	0	0	0
807	Saige Balistreri	dicki.maddison@example.com	2026-01-26 21:18:32	$2y$12$rf8YJzy0DYzXY/4emrP1VeheuTuqRfHmY8lMUMLdR7qb8eli2MyUm	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	+1-341-556-8371	female	1973-11-20	client	t	t	\N	t	0	0	0	0
808	Estefania Bergstrom	faustino.bayer@example.com	2026-01-26 21:18:32	$2y$12$uOhiSokPTkhZWeutZI4/cePGmuQzTzJaEGwEuKHkELrhp7mCnmPEG	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	+19472222886	female	1970-10-18	client	t	t	\N	t	0	0	0	0
809	Randi Toy	pbednar@example.com	2026-01-26 21:18:32	$2y$12$Q.ICzJi8uJlAr3dyioMpQOPtL2BcstO50ggmkyKNpR2gFarEpA3gm	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	606-371-8136	other	1991-08-04	client	t	t	\N	t	0	0	0	0
810	Edwina Tromp	wiegand.delphine@example.org	2026-01-26 21:18:33	$2y$12$qqMMlu2xVeurVJ4niE7BQuHao9pYY7XfRqq2XcnTiEKv9EZNjfGuu	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	+1-256-896-7689	male	1993-12-30	client	t	t	\N	t	0	0	0	0
811	Demetris Bahringer	klein.isom@example.net	2026-01-26 21:18:33	$2y$12$upSyowBj9zJqPXzUgLj1reXpV/eG.rVlf7IWgBcZrlA6DKutjaP8m	\N	2026-01-26 21:20:48	2026-01-26 21:20:48	+12729253588	female	1997-01-22	client	t	t	\N	t	0	0	0	0
812	Hassan Boyle	ana67@example.com	2026-01-26 21:18:33	$2y$12$rgczE45KHWke7esuVRAboe4bVbo.T5oZp3EVxtamlCjjkUPqT8ncy	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	+1-231-627-9075	male	1971-11-12	client	t	t	\N	t	0	0	0	0
813	Maxwell Bernhard	ejohns@example.org	2026-01-26 21:18:33	$2y$12$3BduYn5jEi.YjnCKbN7gZuN5c36/MJQT6ejMvrei5wlbOyiLVoWLy	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	+1-435-771-3032	female	1989-09-13	client	t	t	\N	t	0	0	0	0
814	Olga Gleichner	qmckenzie@example.org	2026-01-26 21:18:33	$2y$12$VxkJgij4RHvbIfwmBAH2N.nOwTmlxAEu3DkxE9fnwMbQnw.OBOD2.	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	478.916.8619	other	1990-06-30	client	t	t	\N	t	0	0	0	0
815	Jesse Reinger	leann82@example.net	2026-01-26 21:18:34	$2y$12$SENdceQjUOCUsZbk8Jwtaupz3RcgjHpR6lbwMQNovvbNypk/u6gLm	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	534-509-3737	other	1985-05-03	client	t	t	\N	t	0	0	0	0
816	Alessandro Schmidt MD	braun.meaghan@example.net	2026-01-26 21:18:34	$2y$12$ihFboCOiyfGAkQdlNmLpSud16/3Gp7THxEousivNhW5ZNByT/3OS2	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	+1-662-619-8836	other	1981-10-05	client	t	t	\N	t	0	0	0	0
817	Joesph Ernser	ywunsch@example.net	2026-01-26 21:18:34	$2y$12$0bTuzmsMbK2m1KjStQxeAu.0AXnILifMccUr18oOk/QqXK/wWlYKi	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	1-947-356-5276	female	1977-12-11	client	t	t	\N	t	0	0	0	0
818	Layne Jacobson	georgiana.lebsack@example.com	2026-01-26 21:18:34	$2y$12$dx8KTcRCDfvUx2eh3JqRZ.uMmtnqy3fdmOdt9Nyp2txTTws6WitFu	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	(351) 307-2966	male	1985-05-19	client	t	t	\N	t	0	0	0	0
819	Mr. Marques Bailey	kathlyn79@example.com	2026-01-26 21:18:35	$2y$12$nKJYMAU9Vw.OysMu8/hU4eBz.BL5pwTOhKrCb1uFxaQmUdSlz6Zyy	\N	2026-01-26 21:20:49	2026-01-26 21:20:49	(318) 485-2654	other	1988-08-15	client	t	t	\N	t	0	0	0	0
820	Vince Kris	hyatt.katelin@example.com	2026-01-26 21:18:35	$2y$12$K2iJiT04yiepJ8WGy1ChUOkhKZ.zxyaIdtv.LMYXc7QfXJXY00hw.	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	(361) 851-0065	female	2004-10-02	client	t	t	\N	t	0	0	0	0
821	Jarret Quigley	rosemary86@example.com	2026-01-26 21:18:35	$2y$12$tSMnJTioLXUTMZLm0nsaFuWUp9trXHYKQjYwRxiEePlZ18dCo8a4a	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	+1 (386) 937-0523	male	1971-01-11	client	t	t	\N	t	0	0	0	0
822	Blaze Emmerich Jr.	hilma27@example.com	2026-01-26 21:18:35	$2y$12$C2A/CdOXR0mUssbDTRqtKOfDlL6RkH6l9ZPHWqzHBEy5iEX2dlmaG	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	732.709.4270	female	2003-06-17	client	t	t	\N	t	0	0	0	0
823	Ms. Asa Rau	sreichert@example.org	2026-01-26 21:18:35	$2y$12$bUztmxdXA0MEBfwnIO4ZAOMinF6scK3eM/1Uy2epSEzyl5xHblKmK	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	+1.757.781.0338	male	1983-11-07	client	t	t	\N	t	0	0	0	0
824	Dr. Taya Aufderhar III	gertrude94@example.com	2026-01-26 21:18:36	$2y$12$G1wLi2aingw8c0H9cF/QZ.KS2NsfcHcu1GobSf.TtyJkDLLzPEnNy	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	1-925-810-1382	female	1985-01-15	client	t	t	\N	t	0	0	0	0
825	Bennett Quitzon	trantow.melody@example.org	2026-01-26 21:18:36	$2y$12$PQb40m4YJu74NtVjKOGpY.y22xsyUh5EcTsR9PgwMuF1kQOYcpyFm	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	361.335.0636	other	1983-01-19	client	t	t	\N	t	0	0	0	0
826	Dasia Bailey	grimes.dawn@example.org	2026-01-26 21:18:36	$2y$12$x60CEmxmZAg0bqymhBWTxuf6qYaxZyhXp/A905fTTxoKbs0zWdNMi	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	+1.484.708.3478	female	1999-09-26	client	t	t	\N	t	0	0	0	0
827	Jamir Predovic V	carlo.fay@example.net	2026-01-26 21:18:36	$2y$12$1UcYxIXOK.FLXfKce1dQXuWoqWPGY3nI1zG.Na1hHzf9gFACbta3K	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	(601) 205-9982	other	1970-12-10	client	t	t	\N	t	0	0	0	0
828	Larue Lemke	bode.rachelle@example.net	2026-01-26 21:18:36	$2y$12$XfrbCQJpGAbXllK8Rf96c.rh9L8Ub69lWNcIXrJoU7c1qw801kX1O	\N	2026-01-26 21:20:50	2026-01-26 21:20:50	1-904-912-3669	female	2003-07-25	client	t	t	\N	t	0	0	0	0
829	Gillian Connelly	corwin.mathew@example.org	2026-01-26 21:18:37	$2y$12$osuYbTffeFgJSs1wBwWu4.I8EYb5DgsbXD8DQHYQiZezUdk6w9MAG	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	623.777.6015	female	2003-02-20	client	t	t	\N	t	0	0	0	0
830	Jaiden Corkery	armstrong.earlene@example.org	2026-01-26 21:18:37	$2y$12$dDY.zZMFp4zD4FoD7s.EV.5.PhMCh8r9IxGvEDVZ89GZnnSLJRW5O	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	+1.678.842.0968	female	2002-08-24	client	t	t	\N	t	0	0	0	0
831	Katelyn Runolfsson	goberbrunner@example.net	2026-01-26 21:18:37	$2y$12$IFwEcATHVINGD0QlcY5dK.2/DlljEl5rLCJBLD.regaLAOKczp98u	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	1-941-736-5804	female	1995-09-22	client	t	t	\N	t	0	0	0	0
832	Prof. Dakota Bode I	melvina.rohan@example.com	2026-01-26 21:18:37	$2y$12$QDIXB3Cm/CWFusU2aFciseogRRWh8nmdFX2r7tf9JdlLxhDWPTTni	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	+16602346195	female	2004-10-11	client	t	t	\N	t	0	0	0	0
833	Kamren Reilly	virginie10@example.com	2026-01-26 21:18:38	$2y$12$QcWLBGCzEFzdWRlysQwfMOYhOKTx2nd594lH.xVCJL9lDl3SCwpK6	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	+19187194733	male	1991-08-27	client	t	t	\N	t	0	0	0	0
834	Mathias White	demario.keebler@example.com	2026-01-26 21:18:38	$2y$12$RarWZbYiU7YOBpzGtbofTOHucHp3.2bCLRtbw3znvzGGBbC2KQ0xm	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	1-720-597-3159	female	1974-07-26	client	t	t	\N	t	0	0	0	0
835	Harold Pouros	eveline.feil@example.org	2026-01-26 21:18:38	$2y$12$E/RUZGnsEZ9.BUffpiRIVeQz86XKQuHsjuTUQkeLzC3s5BwBrxcVS	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	+1 (281) 910-6282	other	1992-03-23	client	t	t	\N	t	0	0	0	0
836	Hayden Moen	elisabeth35@example.org	2026-01-26 21:18:38	$2y$12$OYouB4iWnwAStFBuNRAzmOeOvl9tMR9cbRuUuXaS67wYxyb.IlPQa	\N	2026-01-26 21:20:51	2026-01-26 21:20:51	(502) 418-6174	male	1985-06-29	client	t	t	\N	t	0	0	0	0
837	Rosalind Boyle	npaucek@example.org	2026-01-26 21:18:38	$2y$12$OMJAIjRbKMPgrv/rq7/bauOcHSGfaqn6I.wgPtPcehXJTcqo8RTky	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	+1-330-269-8768	other	1989-04-09	client	t	t	\N	t	0	0	0	0
838	Doug Rau DDS	destany99@example.net	2026-01-26 21:18:39	$2y$12$B04p5lVUcfR7DxcNzI1m6uS/uDkJWq0Chn0AiXW4JL29YFtBsmk6C	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	+1-929-518-6034	female	1991-04-21	client	t	t	\N	t	0	0	0	0
839	Jerrod Kautzer	runte.xander@example.org	2026-01-26 21:18:39	$2y$12$XTUyCZTp8nfO6uU5EQqAKut0XcRLPBCms2kO2ZcNpHmwGPRZSIw2y	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	+1.248.242.1071	male	1997-08-10	client	t	t	\N	t	0	0	0	0
840	Prof. Royal Heaney	amelie.batz@example.org	2026-01-26 21:18:39	$2y$12$R/FXhij6wsVYNJ//0Nny6u20jGXaLaghQANQqT50ccJQmWu1J8MQa	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	956-628-7714	other	1999-01-01	client	t	t	\N	t	0	0	0	0
841	Oma Keebler	alia90@example.com	2026-01-26 21:18:39	$2y$12$IQHy7j/jdUnP1TA9BCLZuushUtGyQOVonjhKwIvKgoKP8Uf1Y268K	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	(959) 567-4600	male	2003-01-30	client	t	t	\N	t	0	0	0	0
842	Prof. Alfred Nienow	bennett.lebsack@example.com	2026-01-26 21:18:39	$2y$12$NgWDg18g6OCREqD0OLZjg.aOpmdlLF3GU3Fo4fMWA46RRUAlfwfXi	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	+1-785-643-8401	female	1984-03-26	client	t	t	\N	t	0	0	0	0
843	Dr. Merritt Carroll II	othiel@example.net	2026-01-26 21:18:40	$2y$12$qFypNeJQG0DPozH9EOgzEuNPBbvIBHaXVi9Pk3lW4Ru1qgxwBAafi	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	(458) 774-8636	male	1998-11-14	client	t	t	\N	t	0	0	0	0
844	Addison Reynolds	nkertzmann@example.org	2026-01-26 21:18:40	$2y$12$2DXtSzymKpLLr6QDVVSBV.0kM0sHlN8nic5CekS1W992BBOEvoZXK	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	(681) 257-9133	female	1986-12-27	client	t	t	\N	t	0	0	0	0
845	Kelli Nienow	wlynch@example.com	2026-01-26 21:18:40	$2y$12$YkP1kLRdh8OgJ1LvAMj5M.kNSvLc4jW0KdBAmyuRUaRhlWdlMzQta	\N	2026-01-26 21:20:52	2026-01-26 21:20:52	+14324263416	male	2001-02-11	client	t	t	\N	t	0	0	0	0
846	Lewis Morar PhD	sawayn.anjali@example.org	2026-01-26 21:18:40	$2y$12$xs1GtoL59Qn6XQH4qbo7xO2kCU8W0/Qa3mpjyfOchf1FA9GfnzsZa	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	+1-225-840-9087	female	1986-03-27	client	t	t	\N	t	0	0	0	0
847	Prof. Rylee Ward	bogan.franz@example.net	2026-01-26 21:18:40	$2y$12$DNYe.OJ9THKDhaAL2Nh4tuu07ykPKgcCUQBOfNAsusX.pY.uh8Cre	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	+1-949-634-8682	female	1989-03-31	client	t	t	\N	t	0	0	0	0
848	Sincere Hand	pacocha.julius@example.org	2026-01-26 21:18:41	$2y$12$o1V6tVpASzU/0WWCF/GXKeNSoW4rpo8s.n8QIzWZsei4bBWrKofIe	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	1-478-312-7472	female	2003-03-31	client	t	t	\N	t	0	0	0	0
849	Sasha Marks	labbott@example.com	2026-01-26 21:18:41	$2y$12$042WCSkEszab7Uarn1lcd./i.k0pIq4TreP5tehL1WpMxtQfHpFLW	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	+12702004416	male	1991-10-24	client	t	t	\N	t	0	0	0	0
850	Brandi Ebert	hhalvorson@example.net	2026-01-26 21:18:41	$2y$12$EZSyRlMs1vHIrjJQY.MyWe9wGcLPPW0.7OCQnaQZkSEwx3lUj5wyS	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	+1-352-841-6702	other	1990-09-23	client	t	t	\N	t	0	0	0	0
851	Freddie Mayer	rpowlowski@example.org	2026-01-26 21:18:41	$2y$12$dsWKW8Om7S6QcSlLraYHHOVwpA39CkN.dxKCy9NuldgodASO5chqK	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	1-747-964-0836	female	1979-12-20	client	t	t	\N	t	0	0	0	0
852	Kasey Prohaska	zlabadie@example.net	2026-01-26 21:18:42	$2y$12$zDzVmpffKa8WRRX6lU.LPOYGZq7nI8SEQ9dVfZKIIBUe6zG20Htyy	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	+1-726-345-4297	male	1977-04-09	client	t	t	\N	t	0	0	0	0
853	Joanny Lesch	rosalee.kling@example.org	2026-01-26 21:18:42	$2y$12$UJBcqCAZuqN2Sk77lmdowedmReXFbA2zInouyGdNA2SHp7XD3o886	\N	2026-01-26 21:20:53	2026-01-26 21:20:53	+1.516.876.3072	female	1998-03-16	client	t	t	\N	t	0	0	0	0
854	Mr. Winston Batz III	mkeebler@example.org	2026-01-26 21:18:42	$2y$12$3QTwTt.MluKjs33wnygkIuR7hLK4N5kPzoEaGVvRGxyv5ncov09Tq	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	520.337.5286	other	1987-09-23	client	t	t	\N	t	0	0	0	0
855	Cleta Roob	jwalsh@example.org	2026-01-26 21:18:42	$2y$12$NEJyUplMTadeKm0Qom5z8O6EiU1IVW943XWASeGtrP1PMod/wky5G	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	351-998-2714	other	2003-10-17	client	t	t	\N	t	0	0	0	0
856	Steve Spinka	timmy.keeling@example.org	2026-01-26 21:18:42	$2y$12$tjukhyrOn7PD7RUry1yOKe2/sivZAV/6D26s0.PVnXi0zy3UBwQjm	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	984-528-0709	female	1985-08-11	client	t	t	\N	t	0	0	0	0
857	Emery Emmerich	steuber.daniela@example.org	2026-01-26 21:18:43	$2y$12$J2.vbhVPJfmfM60nDTYaC.pJ3yOCtoRy.E/IOnR5viKKKhAhjUrya	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	+1-314-760-3694	other	1996-06-07	client	t	t	\N	t	0	0	0	0
858	Morton Tillman III	reinger.wyatt@example.com	2026-01-26 21:18:43	$2y$12$1TyTNokxGkiQurH/SueF5OSzZ/N2SgdMM6epr8wrkZMTX4RYLlNsC	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	1-848-959-3576	other	1994-06-07	client	t	t	\N	t	0	0	0	0
859	Lilly Kris	schowalter.king@example.org	2026-01-26 21:18:43	$2y$12$IWhD7tG2KgFgerSFpZ8IPO67wFSe98qZkluj5a27Re0j1rTrh5YUq	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	1-540-939-8504	male	2000-05-01	client	t	t	\N	t	0	0	0	0
860	Max Beier II	sawayn.nicole@example.com	2026-01-26 21:18:43	$2y$12$6JgR0gnXV2fhDJEYQl6ZUOd8pYvqD91a62HMqFk206lrJ/HEngbnG	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	917-633-5566	female	2004-07-01	client	t	t	\N	t	0	0	0	0
861	Bertha O'Conner	kara.bahringer@example.com	2026-01-26 21:18:43	$2y$12$e3pzrh7V6m9HSq839aHbXOmRhIpTNdQgD0vNExIQNClIlKH3Kc6qe	\N	2026-01-26 21:20:54	2026-01-26 21:20:54	(312) 484-8170	female	1999-07-03	client	t	t	\N	t	0	0	0	0
862	Graciela McGlynn	jackeline.marks@example.com	2026-01-26 21:18:44	$2y$12$N7Y4M56TLETmlLlJtrq.dOJkVqWMDHglrqX4.LjkGWXEC0AvdI4ou	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	1-317-366-7211	male	2000-10-16	client	t	t	\N	t	0	0	0	0
863	Morton Leffler	dejuan13@example.org	2026-01-26 21:18:44	$2y$12$voeARzIBVQVuD10pgN5Kpu/F3ZSkEztxD5OtxRbSNiB1qpzazB1JS	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	+1.980.399.4595	male	1984-11-25	client	t	t	\N	t	0	0	0	0
864	Sheila West IV	fadel.verdie@example.net	2026-01-26 21:18:44	$2y$12$pp6OIF9syPUmNLZ6TUIyaOpf/f55/xcs8trVS04842WgryihPdlFm	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	651.602.3323	other	1977-04-05	client	t	t	\N	t	0	0	0	0
865	Jazlyn Fisher	ruben.leffler@example.org	2026-01-26 21:18:44	$2y$12$.PC0mmwUVe6snmsrwx0ktOe8bg9K.mcwEOT9dr/v65b6yyZoxcMme	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	+19048260476	other	1981-08-30	client	t	t	\N	t	0	0	0	0
866	Justyn Howell	nyasia.hilpert@example.net	2026-01-26 21:18:45	$2y$12$rxA6m0HCEn0d9SXvcDdZL.XHx1TonVvK0gXxXiA2DKEeJqgMoSpGK	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	(925) 576-5012	male	1994-08-15	client	t	t	\N	t	0	0	0	0
867	Eileen Weimann I	egrimes@example.org	2026-01-26 21:18:45	$2y$12$h/ovci2EPoBLoHWUIkzsB.fXCFiTCXNzcbB0zqr5PKqFmDenbW4p.	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	(972) 530-8689	male	2000-08-09	client	t	t	\N	t	0	0	0	0
868	Jo Tromp II	sonny.langosh@example.net	2026-01-26 21:18:45	$2y$12$QebKxYwj6bqYmgSmPZgItu4gVRC6dE.iBUtyg14TUmhRudq34JJw.	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	1-830-899-6151	male	1986-11-11	client	t	t	\N	t	0	0	0	0
869	Prof. Wallace Nicolas V	trinity90@example.com	2026-01-26 21:18:45	$2y$12$TBU5s2kP5Ddmfh.LUiWNHOtaeTNaoNNPgPm3vsSpJiLAVifbqicCK	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	+1-918-223-8285	male	1992-02-05	client	t	t	\N	t	0	0	0	0
870	Garland Kling III	wyman.theodore@example.org	2026-01-26 21:18:45	$2y$12$YvwCnHSDdaayIPhcJLKvJOAbzX.b3rtyHfMnY6UZ0fmZUxT4f5eVe	\N	2026-01-26 21:20:55	2026-01-26 21:20:55	1-336-655-5435	male	1993-06-16	client	t	t	\N	t	0	0	0	0
871	Prof. Neva Schimmel	mariam07@example.org	2026-01-26 21:18:46	$2y$12$MpyYUZNSZxx0Fl5.bGYS9.9GtC8.xmzmrtndF.SnzkFbPJGD7RWXS	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	1-918-538-1600	male	1984-11-02	client	t	t	\N	t	0	0	0	0
872	Myriam Keebler	qankunding@example.com	2026-01-26 21:18:46	$2y$12$JwmWY4o9e2t6XqR/sGfCJOpaGlSgsPrLD6AHm0MFp/JbXyXXQfIRK	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	423.232.6673	male	2003-04-02	client	t	t	\N	t	0	0	0	0
873	Oma Berge	cdeckow@example.org	2026-01-26 21:18:46	$2y$12$Kh3xFNTOUa2DNFPvRWoFsOFx1GhHP8HohkTC.6PbQ5A8xqPzmKHky	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	630.894.2815	male	1987-07-06	client	t	t	\N	t	0	0	0	0
874	Erich Hills Sr.	ivory.paucek@example.net	2026-01-26 21:18:46	$2y$12$KbZGA71jo0.UhrzeoGr7yeKTvqOhtFmpLXB4Yrg5hh1qWJLpsrqFC	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	+1.804.413.6492	male	1973-12-30	client	t	t	\N	t	0	0	0	0
875	Ryley Cormier	emilio.johnson@example.com	2026-01-26 21:18:46	$2y$12$tjVGYOvw6GZTOufDl1cz7ukAwjdpaOsL.oIIEbzXl70IQPxIqMz/S	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	701.705.5136	other	1980-08-16	client	t	t	\N	t	0	0	0	0
876	Samara Dach	bashirian.shannon@example.org	2026-01-26 21:18:47	$2y$12$XRfowvGvXuE3pzJqfpHvrODsmwZ8vOo6eDnG7ni1LlFemz1ndQhhC	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	+1 (937) 537-0983	male	1987-07-21	client	t	t	\N	t	0	0	0	0
877	Benton Goyette	natasha43@example.org	2026-01-26 21:18:47	$2y$12$WwZwz4Xa9bAUYqryayPdGegL3WFLBvvvNeiDUhvFgVWEueHDOzNou	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	+14195079388	other	1994-06-04	client	t	t	\N	t	0	0	0	0
878	Prof. Linnea Hermiston I	felipa15@example.org	2026-01-26 21:18:47	$2y$12$oSASWpfPMaicENm32lY5kul0uW4kN2QrHVS9PH6kCub0T5piIpLvK	\N	2026-01-26 21:20:56	2026-01-26 21:20:56	(279) 494-2733	other	1986-07-02	client	t	t	\N	t	0	0	0	0
879	Laurine Rempel	chaz.oreilly@example.org	2026-01-26 21:18:47	$2y$12$gAA6S19EFcjCPPuiECD5xuNpjbRZllRcb75wb1PVgghTzhDorzL4O	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	832.951.9681	female	1985-07-03	client	t	t	\N	t	0	0	0	0
880	Willie Gislason	kertzmann.cristopher@example.org	2026-01-26 21:18:48	$2y$12$h0X2S7zben5VA5q98fnukevVHa1lo7kb9ZihTgZKhs/d45niuovSi	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	1-346-851-8873	male	1975-09-15	client	t	t	\N	t	0	0	0	0
881	Xzavier Sanford	josiah74@example.com	2026-01-26 21:18:48	$2y$12$2ltG8D1YSaNmH3I2AVfyAOjSQs03O6fNZyTRYxgSaFDMjoxfebTI.	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	1-662-359-7153	other	1980-02-05	client	t	t	\N	t	0	0	0	0
882	Laron Boehm	erica70@example.net	2026-01-26 21:18:48	$2y$12$Ot7Fdi.hbVaqY8U13AXr4.4HZpU5.EDDgccw3LcuQ0.HF1Qt/FqQ6	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	+17729238060	male	1976-02-07	client	t	t	\N	t	0	0	0	0
883	Tavares Ernser	smedhurst@example.org	2026-01-26 21:18:48	$2y$12$cM/Qj4A9WXHsRxc8Wq44O.PbQFvWGbJwK0LWFfzf1tJ.CvwywU9by	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	352-782-5318	male	1972-10-30	client	t	t	\N	t	0	0	0	0
884	Nels Bogan	huels.edmund@example.org	2026-01-26 21:18:48	$2y$12$rNWbnW35a3nBGrHxo15ZUeNPHPY1O0se1Yplz.TQfTKyw5QKgkYzK	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	+1-786-244-6537	male	1973-03-04	client	t	t	\N	t	0	0	0	0
885	Angela Kozey	koelpin.nikko@example.org	2026-01-26 21:18:49	$2y$12$SUnhcLPfKkP7yX03HA/Ye.LOt/0UeSmvDO..XRRfVbN60fj89cdFS	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	1-772-618-5167	female	2001-09-29	client	t	t	\N	t	0	0	0	0
886	Dudley Littel	rohan.jameson@example.net	2026-01-26 21:18:49	$2y$12$C.BKgRUkQH1.L0xBzUAycePuTWSANv6NLANn.bKydGfr4QdNdH3j.	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	+1-320-537-7117	other	1995-09-05	client	t	t	\N	t	0	0	0	0
887	Zora Heathcote V	imelda43@example.com	2026-01-26 21:18:49	$2y$12$EmgrNtTOGzvWiZLdK0vCquYG.gjWF2oMn/ia/WYECM5637qz0a1hW	\N	2026-01-26 21:20:57	2026-01-26 21:20:57	+1.516.328.1087	male	1999-07-05	client	t	t	\N	t	0	0	0	0
888	Eden Murray	lesly.fritsch@example.org	2026-01-26 21:18:49	$2y$12$9NZRly2M/Kp00KLwOVwhIup2XgM6P8rJXqkW0t4VFCWG9cehRuiOK	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	+1-657-465-7995	other	1988-05-12	client	t	t	\N	t	0	0	0	0
889	Lauriane Rosenbaum IV	arlie.gaylord@example.com	2026-01-26 21:18:49	$2y$12$epJi61i3vbFPOyFvIZGSGOmOxEsHjh/lg56zko0gwkAUyEUekC8KW	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	352.619.0730	other	2004-03-23	client	t	t	\N	t	0	0	0	0
890	Delbert Bernier V	zane.schimmel@example.org	2026-01-26 21:18:50	$2y$12$7xCV7xzOEy0fgSsi9VtwzegtElCfcF42ZYlKHgGaiKSYQZi4TkMh.	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	+19078348954	other	1980-03-21	client	t	t	\N	t	0	0	0	0
891	Nelda Schmitt I	wortiz@example.com	2026-01-26 21:18:50	$2y$12$MbIx/spPevcfP2e2FOHiguPuG0xIcGuEJFuRpg/8c5wAja6h98MWC	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	+1-609-621-5361	other	2003-08-03	client	t	t	\N	t	0	0	0	0
892	Rory Spencer	lera.cassin@example.com	2026-01-26 21:18:50	$2y$12$OAq89mPKBWWxSCMXoBNwU.6ycwblHKUvhNjeybGhldtIPh01YDG4y	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	+1.503.633.9569	male	1975-05-02	client	t	t	\N	t	0	0	0	0
893	Lessie Crooks Sr.	amanda.nitzsche@example.org	2026-01-26 21:18:50	$2y$12$co0HNdeCQcTkfINUBHYAhuB10xBjiALSvQz9vQ87TSZe7UvRlQM7G	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	+1-786-341-2909	female	1984-01-20	client	t	t	\N	t	0	0	0	0
894	Skylar O'Hara	jcrist@example.org	2026-01-26 21:18:50	$2y$12$hwr5mJE6ZdI/1lZat2ieFeEZ7XN8ne8jd5/3MKvFanIYnUNeUDMF2	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	(347) 686-7708	other	2002-01-01	client	t	t	\N	t	0	0	0	0
895	Colby Goodwin	isabel95@example.net	2026-01-26 21:18:51	$2y$12$Ijab0ydj3BEpnFNrbezi7ueoC7JY./hqCrniakGRkjgEYWdExfDKC	\N	2026-01-26 21:20:58	2026-01-26 21:20:58	(847) 712-3734	male	1987-10-22	client	t	t	\N	t	0	0	0	0
896	Sherwood Cruickshank I	delmer28@example.org	2026-01-26 21:18:51	$2y$12$O63GDkTfMa98vYWhTMBCx.XslaQlNk3u9ESCbmcU/kUbHOIX.gRP2	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	352.837.1296	female	1970-06-24	client	t	t	\N	t	0	0	0	0
897	Wyatt Prosacco	batz.devon@example.org	2026-01-26 21:18:51	$2y$12$B7.iq3hjwKFgblGD/HGs2uFR4uX9.5VbGlXV8VVNvUmQpZ7BeybEe	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	1-680-395-0519	male	1993-05-10	client	t	t	\N	t	0	0	0	0
898	Genoveva Gulgowski	hledner@example.org	2026-01-26 21:18:51	$2y$12$BgglrYzTQ821LrGwFS1Kw.GYGbNRAe25aOMF.7arx.QQP5.98tfI2	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	+1-720-584-8266	other	1998-06-10	client	t	t	\N	t	0	0	0	0
899	Dr. Darron Runte DDS	marta26@example.net	2026-01-26 21:18:52	$2y$12$SulxdzX4E9oo9Max9bvVFuNFpzfsCpQDNZCDvmoNNkuiz7ohyNMae	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	+1 (657) 698-5301	other	1976-06-27	client	t	t	\N	t	0	0	0	0
900	Wilfredo Muller DDS	rebecca.abshire@example.org	2026-01-26 21:18:52	$2y$12$HrJRltZNkDqYswRmGJG84eESRKRro5MLT9ZHLWYl5/n/AwWXt58am	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	828-328-3261	male	1998-05-21	client	t	t	\N	t	0	0	0	0
901	Bryce Heathcote	hschamberger@example.com	2026-01-26 21:18:52	$2y$12$Q9.M5Z/qrvTf9AvIIPRMSuV6i4A/BYdIn5vNArtDdqoL0UUz3NCYW	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	947.425.6339	female	1990-10-26	client	t	t	\N	t	0	0	0	0
902	Itzel Boehm	ali.christiansen@example.net	2026-01-26 21:18:52	$2y$12$xWKEMmL66gp8Lyv5MWHc0egUTLAn3XPqNR85FuNZgP.wYi4NthPHC	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	+1 (765) 420-7516	female	1979-10-17	client	t	t	\N	t	0	0	0	0
903	Gabe Schaefer	chance.wintheiser@example.com	2026-01-26 21:18:52	$2y$12$rsqvzBwoCWcl5y2K2sKqJ.KfmDkUkCC3os5xgraTipXJb9LiRsqQO	\N	2026-01-26 21:20:59	2026-01-26 21:20:59	828.636.8909	male	1970-12-12	client	t	t	\N	t	0	0	0	0
904	Vesta Thompson	katherine82@example.org	2026-01-26 21:18:53	$2y$12$1b5nIU0OBlddGQEWZS741.TrCrEHTFxds935rNCG5St5pV.CtG/me	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	1-920-216-5569	other	1972-10-07	client	t	t	\N	t	0	0	0	0
905	Floyd Parisian III	morissette.ursula@example.com	2026-01-26 21:18:53	$2y$12$DOGCkSyTkpG/nNZIL9Cfhuty8Viitsshhx6yKoLT/oaoh6xJ8Aso6	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	(704) 263-4056	female	1983-08-12	client	t	t	\N	t	0	0	0	0
906	Laverne Koch	demarco35@example.org	2026-01-26 21:18:53	$2y$12$DsZtKNSVdB9ED.4d5wIWeu.HOtL0aP3GJGR5OZBVXaN0ZSKMkKQg2	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	380.825.2333	female	1992-09-02	client	t	t	\N	t	0	0	0	0
907	Felicita Emmerich	carolanne83@example.net	2026-01-26 21:18:53	$2y$12$YaOf.1bl5ISuG.Dl1oS9tuUFZ0ibKNS9QP.HNz2UiGSYmg8lyjAx2	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	847.319.8467	female	1982-02-04	client	t	t	\N	t	0	0	0	0
908	Guy Schulist	berge.tanner@example.com	2026-01-26 21:18:53	$2y$12$Bc.6EPtz.K3NmKJJ0nO8SeKz5SDMYnKlkxjTz9mHJAyKQJEPcn5OW	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	567.678.8307	other	1978-03-25	client	t	t	\N	t	0	0	0	0
909	Matt Will IV	jbeatty@example.com	2026-01-26 21:18:54	$2y$12$7cUg0AlkO.CgZTbyF19swOPXV1v2d25Jn.FWJhZ.SlY.GbpU4x3XG	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	601-414-7159	male	1980-03-29	client	t	t	\N	t	0	0	0	0
910	Mr. Berta Reilly I	msimonis@example.org	2026-01-26 21:18:54	$2y$12$/LgHhTTYhTewyWyVb5pFjutBZrbCwUvqcVyjfAEEE3UN8cjfV4SpO	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	385.457.3147	other	1970-01-28	client	t	t	\N	t	0	0	0	0
911	Gardner Borer	caterina.kunde@example.org	2026-01-26 21:18:54	$2y$12$fLkfCQRDbawDfaEBH4xKr.EonBQGCm1xRpQUDbJ2UZVj3hvI4tfrW	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	423.561.1237	other	2000-07-04	client	t	t	\N	t	0	0	0	0
912	Alexys Goodwin	maximo10@example.net	2026-01-26 21:18:54	$2y$12$txYvlby3iNdE3NZR/XcHBO2JRZXoNP5veDIc9Tb7NbxFa5gwIebMS	\N	2026-01-26 21:21:00	2026-01-26 21:21:00	+19569778333	other	1985-08-14	client	t	t	\N	t	0	0	0	0
913	Prof. Annie Wisoky II	bosco.vivien@example.com	2026-01-26 21:18:55	$2y$12$M5sqBoK2k/qwy8AvYyMFEunglUE3PTMqH7i8y30HaozDl65SkFIjO	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	307-918-5269	male	1987-01-09	client	t	t	\N	t	0	0	0	0
914	Prof. Devonte Johnson DDS	prath@example.net	2026-01-26 21:18:55	$2y$12$LYCvN/B7Vc0fgH6iHTIfAeloEaYL.pBMf.L7RHuuHgN6YKK7QM2wu	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	203.296.7833	male	1982-07-09	client	t	t	\N	t	0	0	0	0
915	Kelli Lakin	rippin.davonte@example.org	2026-01-26 21:18:55	$2y$12$SSP90IHBRKkLzqw.8UECQ.Nrx00EsfjXDE/cQjIVXsFeACUEMflG2	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	347-347-1134	other	1982-06-07	client	t	t	\N	t	0	0	0	0
916	Megane Johnson DVM	ruben26@example.org	2026-01-26 21:18:55	$2y$12$LT8nZSldVDyNonMh8dOiP.jMNUwGTe6BH0GY617oG/FpZpzNxhKqa	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	(325) 637-1904	female	2000-10-05	client	t	t	\N	t	0	0	0	0
917	Einar Weber	sgoyette@example.com	2026-01-26 21:18:55	$2y$12$l5rk6ZubZi1ofThYHa.N.Oc3xPkxf4wZyMJWp7PTUMUDs5C24LJPK	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	+1 (520) 665-7186	male	2003-10-16	client	t	t	\N	t	0	0	0	0
918	Lenny Streich	gorczany.chris@example.org	2026-01-26 21:18:56	$2y$12$KGfhsbhsVhk9syOXvf7pceNwhXWiswEvy/gqMIU47aVkisXxtG8nW	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	+1-743-453-7385	other	1994-09-01	client	t	t	\N	t	0	0	0	0
919	Dr. Arielle Davis MD	crystel27@example.com	2026-01-26 21:18:56	$2y$12$3u3X2URrMUu8E3lXp8I7IuwK.dpeL0IosdG8.rT3dXfzDHJrXIDiu	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	+1.743.858.4878	other	1981-10-07	client	t	t	\N	t	0	0	0	0
920	Dr. Devyn Weissnat III	finn.bartoletti@example.com	2026-01-26 21:18:56	$2y$12$j9Dv.WzI6gAyxyODaKrOz.FameQ07ut6D83xUJZNo2E77zwtORQCa	\N	2026-01-26 21:21:01	2026-01-26 21:21:01	1-248-815-1279	female	1993-05-24	client	t	t	\N	t	0	0	0	0
921	Prof. Loyal Schultz	kgrady@example.org	2026-01-26 21:18:56	$2y$12$KKXtQySTCMP9CNcvzoR5aeIed1xBSiUkrgQwTI3qzU4QzOEQPh9aG	\N	2026-01-26 21:21:02	2026-01-26 21:21:02	1-469-775-2795	other	1970-11-20	client	t	t	\N	t	0	0	0	0
922	Mandy Collier	bartell.meagan@example.com	2026-01-26 21:18:56	$2y$12$s7UA5kOB4ixt32/v/zKXYuth6ESXRh11P4w6wCUpxbxt017I//gqa	\N	2026-01-26 21:21:02	2026-01-26 21:21:02	1-424-625-0088	female	1990-05-16	client	t	t	\N	t	0	0	0	0
923	Kennedy Kozey	bruen.pascale@example.com	2026-01-26 21:18:57	$2y$12$QnXem/cgZ.RP8E5eseGX0exUpcOG0VNhCww6k.HKbzgtqytAioLby	\N	2026-01-26 21:21:02	2026-01-26 21:21:02	+1-406-908-1597	male	1983-06-01	client	t	t	\N	t	0	0	0	0
924	Lamar Lind	aimee.schuppe@example.net	2026-01-26 21:18:57	$2y$12$D2rTsGPwwwiOU7lPFerAt.foaaVQtgAjs16BCT5xBRuOfUJ5uhLAK	\N	2026-01-26 21:21:02	2026-01-26 21:21:02	619.988.0857	female	1971-06-29	client	t	t	\N	t	0	0	0	0
925	Bennett Wilderman	cory.bogan@example.net	2026-01-26 21:18:57	$2y$12$76XpHC9QoAyXeFZDq9Nc5eT6n90tJX3SN0F6VgrLsRYI/6mRv3k66	\N	2026-01-26 21:21:02	2026-01-26 21:21:02	443-963-1851	other	1995-06-16	client	t	t	\N	t	0	0	0	0
926	Lois Volkman	evie.kunde@example.org	2026-01-26 21:18:57	$2y$12$rrtAQ06cAV6GGRbyBztJculGEcfkoNOfk1kw.Bi/Q5FlIHgp.n0VW	\N	2026-01-26 21:21:02	2026-01-26 21:21:02	+1-435-503-6726	other	1987-03-26	client	t	t	\N	t	0	0	0	0
927	Nina Weber	arvilla34@example.org	2026-01-26 21:18:57	$2y$12$ZixkQN3JQb5THCuIC8v3r.llImz/4OE37WuqyC9dUOEpdPg1qLgj6	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	(409) 915-1678	other	1994-08-12	client	t	t	\N	t	0	0	0	0
928	Pierce Smitham	krunolfsson@example.com	2026-01-26 21:18:58	$2y$12$7V0maHAkrfNtAwTTvbOBouGQ/Dh.qp2ppE2.LXosZHdbdlDyWWqxe	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	+1.859.874.5379	other	1988-03-04	client	t	t	\N	t	0	0	0	0
929	Eleanore Hyatt PhD	amiya43@example.com	2026-01-26 21:18:58	$2y$12$ywIyMa45PqctDCCk4KXUyO8VGl6IUebGowEnxrlbCrx9TM1R7EWNS	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	534-527-0214	male	1976-07-05	client	t	t	\N	t	0	0	0	0
930	Emanuel Wisoky	parker.bettie@example.net	2026-01-26 21:18:58	$2y$12$F7zOYyRPQ/6v0qeUL2mzye/dHkYRe1IuzAYrJqt/uc0f19iWk4Ily	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	+1.240.983.8108	male	1990-01-23	client	t	t	\N	t	0	0	0	0
931	Dock Casper	vquigley@example.org	2026-01-26 21:18:58	$2y$12$izLKFX9MTsd4UGTTCGZhROSrUmqP4l//BzDBDVrP6BFd8fFNkRqkW	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	(272) 980-1474	male	1993-08-26	client	t	t	\N	t	0	0	0	0
932	Prof. Daija Braun	breana.nienow@example.org	2026-01-26 21:18:59	$2y$12$WNrD3VRoZi6lED6MC2KLiuj33C8YJRkXaQsKr8JNxILlZ7jPNA0vi	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	1-916-876-4772	other	2002-09-27	client	t	t	\N	t	0	0	0	0
933	Andy Flatley	caden.bayer@example.org	2026-01-26 21:18:59	$2y$12$TCRdwLsgbmo5cL3Tp6108eEd8ea6/b8TtQm4gMELd6YPWapcD6D.O	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	+1 (678) 655-7386	male	1992-01-05	client	t	t	\N	t	0	0	0	0
934	Prof. Allan Huel	bahringer.rhea@example.com	2026-01-26 21:18:59	$2y$12$Ted4r1atv1NKzZOE5efsAObNWDqPyYfM2JX2Parp3N39vS8JQP9mm	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	+1.559.826.2522	female	1992-03-29	client	t	t	\N	t	0	0	0	0
935	Vernon Von	garrison41@example.net	2026-01-26 21:18:59	$2y$12$J1gEJFaOJ2UPeg/EN1QDb.Q7OD25fz/gPqsWXl5LVjezAyvbaVVqy	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	(386) 784-4709	female	1995-12-09	client	t	t	\N	t	0	0	0	0
936	Zander Nolan	simonis.rosina@example.net	2026-01-26 21:18:59	$2y$12$6B7accQCDaOP4SswN1XCY.2m4TJ/eqwRsjTfy3m0IUvxAVFxw2gFS	\N	2026-01-26 21:21:03	2026-01-26 21:21:03	+1 (754) 585-1262	male	2000-06-25	client	t	t	\N	t	0	0	0	0
937	Elian O'Kon DVM	annabelle.nicolas@example.org	2026-01-26 21:19:00	$2y$12$k/JLyQ.4WfYKJmpxqsoupeTp86fpinXm.jGOoVXi389LTN3uGXRlq	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	973-858-1152	other	1984-06-13	client	t	t	\N	t	0	0	0	0
938	Dr. Michael Berge	amara.schowalter@example.net	2026-01-26 21:19:00	$2y$12$1ZfNlzGEv3XmIfZj8voDVumS5u9waqy1WPCldb1xQe6ITNloEm1z6	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	(915) 672-6824	other	1970-09-11	client	t	t	\N	t	0	0	0	0
939	Keshawn Howe	wabshire@example.net	2026-01-26 21:19:00	$2y$12$3o7DmWPCBAtSMMXSAtJ8bOzFfldyXXyMHbob1A4X9M.yZqGQAl4xu	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	859-771-9911	male	1981-08-06	client	t	t	\N	t	0	0	0	0
940	Casey Adams	cormier.elisha@example.com	2026-01-26 21:19:00	$2y$12$.XBZdIWKqCjYnLVX7RDlT.I7GQGecverN3nESMjCnG5p02CJ7U4jy	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	+1-854-415-9253	other	2004-01-25	client	t	t	\N	t	0	0	0	0
941	Mae Legros	eichmann.lillie@example.org	2026-01-26 21:19:00	$2y$12$3ZGZf7TWh2nRicYGZgvvVOpfIpCf3btwc3NIyH0l0QmNtixRLrztS	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	+1-706-210-0133	male	1991-04-01	client	t	t	\N	t	0	0	0	0
942	Willow Rolfson	weichmann@example.net	2026-01-26 21:19:01	$2y$12$nNlkXgCaMiMVxgibKFZsue6aq0vKh35lqEKTNcLPxqyQ0SYv8K79q	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	520.864.4447	other	1996-03-02	client	t	t	\N	t	0	0	0	0
943	Dr. Shaniya King IV	kendra60@example.com	2026-01-26 21:19:01	$2y$12$kXXKvQIIqoV4S/C/tSqIj.AIG7vXhkUdxgyMJoKcuNT.uXMZcMRkG	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	352-834-0864	other	1981-09-27	client	t	t	\N	t	0	0	0	0
944	Prof. Jayden Hirthe IV	watsica.jason@example.com	2026-01-26 21:19:01	$2y$12$S1YeE01yQecvmgdjIbe8peudZVGwnOja6EMXRFW9hpa5Fz6z2tL52	\N	2026-01-26 21:21:04	2026-01-26 21:21:04	+18659766030	female	1997-08-09	client	t	t	\N	t	0	0	0	0
945	Annabell Metz	tspencer@example.org	2026-01-26 21:19:01	$2y$12$2KqH3wTM2lQDTUW5RkVE6.2/VKhHfgJ0YsuA0cH9Lepm9TpR8zZka	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	(470) 693-6627	male	1983-12-05	client	t	t	\N	t	0	0	0	0
946	Dr. Moriah Kulas PhD	sboyer@example.org	2026-01-26 21:19:02	$2y$12$IJZ6muoRfp/uMW10Okvda./mzuvrDC4VmTxNJ2j5uMCCA.2wFzzhi	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	+13155136564	male	1985-07-25	client	t	t	\N	t	0	0	0	0
947	Marcel Collier Sr.	dibbert.lilian@example.com	2026-01-26 21:19:02	$2y$12$SyEfEtgr3SrSD8UyzWFCpO1AIlVf/DeLJ.VJ/VdzRF3I3ZiRqkqvi	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	980-378-1281	male	1974-09-25	client	t	t	\N	t	0	0	0	0
948	Mr. Hardy Hodkiewicz	jstark@example.net	2026-01-26 21:19:02	$2y$12$TR9A/XySv16rqN796dZ26.tLHpJjfA6tYx5cTkPDzzYfrdqzrIsGq	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	1-629-840-5972	female	1999-07-30	client	t	t	\N	t	0	0	0	0
949	Mr. Elmo Jones	jaunita25@example.org	2026-01-26 21:19:02	$2y$12$PQSeggQmzRPGMKrn7v/BmOs6fFgJXpUva8KSfo91tViNeeUjXDo/W	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	480-281-7219	male	1991-03-24	client	t	t	\N	t	0	0	0	0
950	Shanelle Wintheiser	vbogisich@example.org	2026-01-26 21:19:02	$2y$12$EHL1vwyna6g2sDfnM/n7j.jWRxO4efpVvolNexv8CuSQGhq5/A1ve	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	+17546522153	male	1978-01-01	client	t	t	\N	t	0	0	0	0
951	Cameron Jaskolski	pgaylord@example.net	2026-01-26 21:19:03	$2y$12$WQ7p3qqjGbc5d/mA481uvOXeUtSLpf8kJjZixyfYEPlzrA7isQHQy	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	1-540-735-0796	other	1989-07-08	client	t	t	\N	t	0	0	0	0
952	Danial Cartwright	casey06@example.org	2026-01-26 21:19:03	$2y$12$IwUuyhjNgpxhEgsTmwM7oOrwRoBbCGkmUtNTetl1N7Jx3/mu8qkXO	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	1-636-247-1837	male	1994-07-21	client	t	t	\N	t	0	0	0	0
953	Keyon Murray	geoffrey.stiedemann@example.com	2026-01-26 21:19:03	$2y$12$54Y0JIByQqcTneEtEAmrvOt4L5SofAPrivHLIAN8ARlYJcTr7pf06	\N	2026-01-26 21:21:05	2026-01-26 21:21:05	+1-864-930-5055	female	1989-12-30	client	t	t	\N	t	0	0	0	0
954	Stone Balistreri MD	prohan@example.net	2026-01-26 21:19:03	$2y$12$u8smfMV45Q74unwNC4CpkuahfV3Zvn6fhz5OPLNcv/z2xus8MKLRS	\N	2026-01-26 21:21:06	2026-01-26 21:21:06	1-662-208-0214	other	1984-09-28	client	t	t	\N	t	0	0	0	0
955	Prof. Kaitlin Lebsack	oran18@example.com	2026-01-26 21:19:03	$2y$12$11q1f6G2L42NzYCMEHINV.a36Q6rHkAQnyLAxBzzsX/oF30QYZzLi	\N	2026-01-26 21:21:06	2026-01-26 21:21:06	610.898.8203	female	1973-01-26	client	t	t	\N	t	0	0	0	0
956	Lue O'Keefe	brendan62@example.org	2026-01-26 21:19:04	$2y$12$OMJ7VsGu4tUnFYSYGdm7iOctFm4RzUUC625PWwqyen5R2XyQNjyRi	\N	2026-01-26 21:21:06	2026-01-26 21:21:06	+1.920.938.8284	male	1976-12-10	client	t	t	\N	t	0	0	0	0
957	Prof. Lauretta Wintheiser I	carissa.rolfson@example.com	2026-01-26 21:19:04	$2y$12$hfvN4NheFTN3wWGusWOGGOPKYLVqLd93btb3JS2zxaR3N0FxQeh.W	\N	2026-01-26 21:21:06	2026-01-26 21:21:06	559.430.8183	male	1993-08-13	client	t	t	\N	t	0	0	0	0
958	Dr. Edmond Von MD	bkihn@example.com	2026-01-26 21:19:04	$2y$12$Gj/AWwEAwHjAUmq/v/xbT.v8tOqaKCsoVpsQECMCdn5ytvMGLkE7.	\N	2026-01-26 21:21:06	2026-01-26 21:21:06	+1-769-469-0971	female	1997-03-06	client	t	t	\N	t	0	0	0	0
959	Daryl Mayert	gerhard.aufderhar@example.org	2026-01-26 21:19:04	$2y$12$N9VsmxfWH4pxvPwqM0h2Tuh6xGNg2g8qS6veq0JExCGcQ5IGnJyRO	\N	2026-01-26 21:21:06	2026-01-26 21:21:06	1-828-766-5715	other	1981-04-22	client	t	t	\N	t	0	0	0	0
960	Miss Pauline Johnston	keaton.runolfsson@example.net	2026-01-26 21:19:04	$2y$12$K9uODuenynW5uBx.KtwC2uA88NwxNV1bEFCt7EZ855HFgRTAM.x2q	\N	2026-01-26 21:21:06	2026-01-26 21:21:06	+1-571-388-9472	female	1970-08-29	client	t	t	\N	t	0	0	0	0
961	Dr. Else Volkman MD	ashley71@example.org	2026-01-26 21:19:05	$2y$12$5Jt705kplkCVfFUHbgm6B.z35Qy2mkt9TcaCyNO4.OVvuAqKaYKe2	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	+1.828.582.2602	female	1994-07-26	client	t	t	\N	t	0	0	0	0
962	Gardner Jacobson DDS	paucek.alex@example.org	2026-01-26 21:19:05	$2y$12$1h56Jlr57GZ8QDp/54fz9exT3up5wDTfFOMHTxBpo.70rydQfEfvq	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	1-315-534-8209	female	1984-10-28	client	t	t	\N	t	0	0	0	0
963	Dolores Schoen	sheldon65@example.com	2026-01-26 21:19:05	$2y$12$N67E.IYUJ.AlqDfitOZ/DuSJfnsLQroKuiX48OzsZWTgSNyetHkEK	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	+18432338091	male	2004-09-25	client	t	t	\N	t	0	0	0	0
964	Lucio Rutherford DDS	robel.rashawn@example.net	2026-01-26 21:19:05	$2y$12$A87XlMjJc4KdPbMHYbi2ROQdffenyWt8UwVSqABNTWdKCFE3640iq	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	+1-781-755-5195	other	1998-09-16	client	t	t	\N	t	0	0	0	0
965	Prof. Gabe Tremblay V	wyman.hermann@example.org	2026-01-26 21:19:06	$2y$12$s7XKeMXsSRZnexYJBU70/eSN3NoSk4jxD2R6DsTmu0WFmlRGYrek6	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	+1.972.667.4512	other	1992-01-30	client	t	t	\N	t	0	0	0	0
966	Prof. Cordia Kunze DDS	maynard76@example.org	2026-01-26 21:19:06	$2y$12$TDm6GQUWJXoOhgcM7YT2ae9ZkvPF3SrEQx31yL.U90NbXs5JYi4i6	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	(517) 498-8864	other	1974-05-07	client	t	t	\N	t	0	0	0	0
967	Piper Nader	ckiehn@example.com	2026-01-26 21:19:06	$2y$12$cK.bOKXQzP44PtksiMp5xub4KGVsNqcB1ckvOM7epmpA/oPPFBUyu	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	631-339-0107	female	1980-02-13	client	t	t	\N	t	0	0	0	0
968	Jaida Weimann	hickle.richard@example.org	2026-01-26 21:19:06	$2y$12$qVVygWuckqQyEJdUJxYIQuppg98XDE0LxjKT2TCZYeYqf/MeAaP/S	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	224-234-2718	male	1975-06-15	client	t	t	\N	t	0	0	0	0
969	Prof. Judy Rogahn	xhessel@example.net	2026-01-26 21:19:06	$2y$12$Pvud0XG0p0Apojbw0wfKxuCWAy/vdMb2IPWLJBm3V7MriFwn/AuoK	\N	2026-01-26 21:21:07	2026-01-26 21:21:07	304-483-2317	female	1973-01-18	client	t	t	\N	t	0	0	0	0
970	Prof. Jarrod Metz	weber.zita@example.com	2026-01-26 21:19:07	$2y$12$n1rtPTyRO7P/YSJPmvDRcuwr4l7VfX4S5rbOZ56GyeKHZqcmvplDa	\N	2026-01-26 21:21:08	2026-01-26 21:21:08	+1-586-833-3696	male	1989-10-14	client	t	t	\N	t	0	0	0	0
971	Ms. Mariane Smitham III	max.krajcik@example.com	2026-01-26 21:19:07	$2y$12$f0n.FmqB8FpMJk00aU9HOe0QamFMhpi3JnLOWIWHqz02nG6QQh2pK	\N	2026-01-26 21:21:08	2026-01-26 21:21:08	+14345300694	other	1998-07-18	client	t	t	\N	t	0	0	0	0
972	Jennyfer Dickinson	jarred80@example.com	2026-01-26 21:19:07	$2y$12$Irs15RtBQlP.95PFAX7bO.8IjDMnbDgFh89TuADLo2Xj7OopoA/pm	\N	2026-01-26 21:21:08	2026-01-26 21:21:08	+16807374379	female	1997-12-06	client	t	t	\N	t	0	0	0	0
973	Emily Blick	pacocha.lisette@example.net	2026-01-26 21:19:07	$2y$12$APaV7./CQwGO9e5Td7/LK.P3oIbJ0348wOJEgD31Fugpj9sGRoWgK	\N	2026-01-26 21:21:08	2026-01-26 21:21:08	316.437.5257	female	1975-01-28	client	t	t	\N	t	0	0	0	0
974	Ari Johnston	emmerich.bonnie@example.net	2026-01-26 21:19:07	$2y$12$GO4cByOPZLi94b3MPcxjcOcBmRtFXiVvxfBDxDPoJYNCaavLc8qpG	\N	2026-01-26 21:21:08	2026-01-26 21:21:08	848-375-4970	other	1974-11-05	client	t	t	\N	t	0	0	0	0
975	Anika Shields	marley.mraz@example.org	2026-01-26 21:19:08	$2y$12$bfi4.Hc8gUTU2VIKppT8m.3wWhV5c7orD76ptjYTERoiYgeVMK9bm	\N	2026-01-26 21:21:08	2026-01-26 21:21:08	+1-469-243-1412	other	2000-06-08	client	t	t	\N	t	0	0	0	0
976	Alek Nienow	spacocha@example.org	2026-01-26 21:19:08	$2y$12$1.zYXYibgMWoALdqtzOlwOx3YR2GG6thaYs0C0DMg7ssOOrpv4qya	\N	2026-01-26 21:21:08	2026-01-26 21:21:08	+1 (838) 554-3696	other	1971-04-06	client	t	t	\N	t	0	0	0	0
977	Ms. Abbigail Hermiston	melisa.cole@example.net	2026-01-26 21:19:08	$2y$12$VF222UtQ90qP.9Xqy6.3v.62.8wPAKqp8270lYWtgqc5IwyM1KEMu	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	+1-341-317-1737	female	1990-02-19	client	t	t	\N	t	0	0	0	0
978	Dr. Madilyn Hermann	burdette65@example.com	2026-01-26 21:19:08	$2y$12$Y6385aeEhXE4Sb1o4c/f6O2L2Bmki9cp51PPdfJRhVAdai1aPfgWy	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	619.909.2174	other	1994-03-18	client	t	t	\N	t	0	0	0	0
979	Mrs. Angelina Franecki	uabernathy@example.com	2026-01-26 21:19:09	$2y$12$Yf8ENLZ3wMydY0ZvFAY/UOSPEVNUN9O7wnViHXK9IujQtoFPFp1Mu	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	+1-212-974-1109	other	1974-03-24	client	t	t	\N	t	0	0	0	0
980	Isabell Ortiz	claudine.murray@example.net	2026-01-26 21:19:09	$2y$12$YS/R2m/Mqccd1D8bLHhcSeu.YmTOgNO3gYzJ7ylwztRoysTEYYIUC	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	+1.360.522.8570	female	1971-02-13	client	t	t	\N	t	0	0	0	0
981	Dr. Maude Kiehn MD	robel.reba@example.net	2026-01-26 21:19:09	$2y$12$V3PE0Md4qkk.VII00CSwbuxMsfdcd2Iwk2jtxbgblG7k4KavcR3..	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	872-453-6259	female	1999-01-01	client	t	t	\N	t	0	0	0	0
982	Daren Cartwright	treutel.anabel@example.org	2026-01-26 21:19:09	$2y$12$HsvbwwcZmQ2GSKKKKfb8deAuerpneSwqwYGGa11INbNMspUnSGgHS	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	+1-562-932-3303	female	2001-09-17	client	t	t	\N	t	0	0	0	0
983	Katherine Gutkowski	bward@example.com	2026-01-26 21:19:09	$2y$12$bhB5PU2lsjLV0/jCgxsOzO0i2vV8vPNajI.wBPEtZHb7pOMVCfFUm	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	(508) 959-2849	male	1981-10-01	client	t	t	\N	t	0	0	0	0
984	Dr. Wayne Bergstrom	casey.davis@example.org	2026-01-26 21:19:10	$2y$12$AAr/YqBHZIGFZiUQwZMMteb/iin.gztfoTwC3teca7f1bEKZ7qbai	\N	2026-01-26 21:21:09	2026-01-26 21:21:09	(952) 200-2216	female	1987-12-15	client	t	t	\N	t	0	0	0	0
985	Rashad Bins	dare.lindsey@example.net	2026-01-26 21:19:10	$2y$12$k2ZwIyCmmWZ.vrX2mO0/3.WvHrrasqPVQAGwvxhwRhYzZ/8DyrhB6	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	+13165273087	female	1998-01-16	client	t	t	\N	t	0	0	0	0
986	Dr. Timothy Price IV	nicolas.bennie@example.org	2026-01-26 21:19:10	$2y$12$dqXtPUXL2hF.pXjAoTqlze0TBE4ORZa0Ci6JwrOhTTR2LMh9exCa6	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	220.603.4503	other	1995-11-24	client	t	t	\N	t	0	0	0	0
987	Ismael Goldner PhD	amaya42@example.com	2026-01-26 21:19:10	$2y$12$BZmPnbitXdR8Li6gqcj2j.BnMRe0woTZ9bSu2iTVILfR4/6gpU1rS	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	+19418780346	male	1986-06-26	client	t	t	\N	t	0	0	0	0
988	Joy Kemmer	ellsworth.kunze@example.net	2026-01-26 21:19:10	$2y$12$ZSrRgCGV8IACdn7caAypk.CGBCZredN9G3VAO.ZNS01/PllHqnE7.	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	1-864-450-3373	male	1992-02-14	client	t	t	\N	t	0	0	0	0
989	Prof. Deangelo Volkman	marilou15@example.com	2026-01-26 21:19:11	$2y$12$LbpH1DUyh52P7/VxTSw7SOI33aot5B/EVhDhv7OhFpwQALMqgUC6a	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	1-475-762-5965	other	1988-04-17	client	t	t	\N	t	0	0	0	0
990	Angel Witting DVM	hane.citlalli@example.com	2026-01-26 21:19:11	$2y$12$X4mifQAf.udfxCdQme1gSuxos4EE9MLt8T65J0t3tiMrXI/TQJ4lO	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	+1-678-510-1848	female	2000-09-14	client	t	t	\N	t	0	0	0	0
991	Leanne Mohr	mclaughlin.ardith@example.org	2026-01-26 21:19:11	$2y$12$WNRfuPSN6C1qqUXbDPfq1.swhfogwIDIVOgxVlI8j29gkktB1eNC.	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	1-562-523-9674	male	1989-08-21	client	t	t	\N	t	0	0	0	0
992	Frankie Kuhic DVM	lauren25@example.com	2026-01-26 21:19:11	$2y$12$bpg6d/4.LAGfJNgtVcKoc.69RGqYBw9NlL3ttOv//qLgFw57z2wbW	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	+1 (919) 931-5965	male	1989-11-09	client	t	t	\N	t	0	0	0	0
993	Garnet Franecki	iratke@example.com	2026-01-26 21:19:12	$2y$12$9oxNvGoQ2KfRSF7V.CAPWe9XsibC8nJGn9oOqjd6msozpaM4/hXOO	\N	2026-01-26 21:21:10	2026-01-26 21:21:10	256.950.1250	female	1987-01-08	client	t	t	\N	t	0	0	0	0
994	Sydnie Haley	white.payton@example.com	2026-01-26 21:19:12	$2y$12$19zFA8hV9xKHvmd0yS2x1uaGNj8HlZXluQl6.dNUKqqNn/HOsFRhC	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	(936) 775-7551	male	1973-12-09	client	t	t	\N	t	0	0	0	0
995	Dr. Florence Hammes	camden.smith@example.org	2026-01-26 21:19:12	$2y$12$5Tlr86q8U5VtTft5LHeqCe.zFZmuIiKm/9QV9yCkmQ8PSjZISaKKq	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	248-212-1412	other	1979-05-24	client	t	t	\N	t	0	0	0	0
996	Dr. Linda Conn III	agustin08@example.com	2026-01-26 21:19:12	$2y$12$6jDmSUD9sWhK5fm0zSp92uaNxmTaVRrICRub4NO.VXT6oDbkA7vEC	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	559-304-5326	female	1995-11-28	client	t	t	\N	t	0	0	0	0
997	Gerardo Kulas	qrohan@example.com	2026-01-26 21:19:12	$2y$12$3xXcCWPrvdoodL4YAd6ERezcU1zNc3jYoUtIe/GvHzZ1qVJEKwJYm	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	+1.364.610.5950	other	1977-03-03	client	t	t	\N	t	0	0	0	0
998	Mrs. Leilani Hauck DVM	dcormier@example.com	2026-01-26 21:19:13	$2y$12$FtTh5hHkDVUIk8ZdrLetPe8GL.YJ222Eb16FDxD/1lyPwXRiWUp1a	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	+1 (973) 893-2870	male	1976-12-16	client	t	t	\N	t	0	0	0	0
999	Marcus Keeling	alexie11@example.org	2026-01-26 21:19:13	$2y$12$eIYQM/oywv1Hk.L7f1yZr.WxBeTqta6tWWWTwnPQHyKe1MV3Af6eO	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	+15514261822	male	1979-12-27	client	t	t	\N	t	0	0	0	0
1000	Dr. Bobby O'Reilly	esteban.oreilly@example.com	2026-01-26 21:19:13	$2y$12$MbqIdusAMAQWC2hmfxlWIej8x6G682tFnx5oL5buQ4c3Esz9zB8Hy	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	907-900-9273	male	1970-07-25	client	t	t	\N	t	0	0	0	0
1001	Georgette Kuvalis	riley.heller@example.net	2026-01-26 21:19:13	$2y$12$YvpGHPcfPSgDnLU69ULiz.FLmKGI4b1ApRQs4uqKwKpE6.xP.ORQ2	\N	2026-01-26 21:21:11	2026-01-26 21:21:11	+1 (907) 673-1133	female	1983-01-08	client	t	t	\N	t	0	0	0	0
1002	Deshawn O'Reilly III	reed.harber@example.org	2026-01-26 21:19:13	$2y$12$u3m5LHuSv006/LmMHQFAoOE7RSS0Cm3ydaQkXfRPaao0ABldtKHou	\N	2026-01-26 21:21:12	2026-01-26 21:21:12	+1-307-249-7455	other	1971-04-28	client	t	t	\N	t	0	0	0	0
1003	Gino Windler	sister47@example.org	2026-01-26 21:19:14	$2y$12$Ys7UyvsHgRv5MF7Jy3wa0.rehbixGv.DySm7tfjGbKhS8hNilCfwK	\N	2026-01-26 21:21:12	2026-01-26 21:21:12	+1.364.498.6827	male	1989-03-21	client	t	t	\N	t	0	0	0	0
1004	Minnie Boyle	ivy.kuhn@example.com	2026-01-27 12:12:20	$2y$12$gcIFtRDRUvjogHeAThFcTemMi2v.6H5edXWlE9J4IGK5UGUk.HwLW	\N	2026-01-27 12:12:22	2026-01-27 12:12:22	+16197688327	female	1973-01-17	worker	t	t	\N	\N	0	0	0	0
1005	Oda Ledner	minnie.hettinger@example.com	2026-01-27 12:12:20	$2y$12$1j2dKHfTbiOSH/9/4luapuabWE9EgUlUVajv8R6.VD.05KOBQjYsC	\N	2026-01-27 12:12:22	2026-02-05 15:35:46	1-843-771-2748	female	1973-07-17	worker	t	f	\N	\N	0	0	0	0
1006	Glenna Dach I	olson.leilani@example.org	2026-01-27 12:12:20	$2y$12$QL8ADdRVx/dyg6YXhGKmDuBs5CXqvZmprN62zDmxvfmOSNQCxs2Yi	\N	2026-01-27 12:12:22	2026-02-05 15:35:50	(817) 265-2769	female	1998-08-27	worker	t	f	\N	\N	0	0	0	0
1007	Gavin Bosco I	wallace18@example.org	2026-01-27 12:12:20	$2y$12$nN3QDfguNya3AaUFVccl2.gWvELISpADTQz331IHPyYLfkhfCD2qm	\N	2026-01-27 12:12:22	2026-02-05 15:35:25	1-661-581-9005	other	1997-04-05	worker	t	f	\N	\N	0	0	0	0
1008	Keara Stanton	tbrakus@example.org	2026-01-27 12:12:20	$2y$12$J/TFGTzmjXLWluft4iRj2.VTnJBsh/1ENsKaVsJVZYybIafhI40i2	\N	2026-01-27 12:12:22	2026-02-05 15:35:21	646.829.7140	male	1983-11-14	worker	t	f	\N	\N	0	0	0	0
1009	Mr. Jeffrey Zulauf	kris93@example.org	2026-01-27 12:12:21	$2y$12$DwjPvqtWFHLrVlY0MZtBDuGYq2n0KT4VzgYYRV4PipQ6Im3Ts.xYq	\N	2026-01-27 12:12:22	2026-02-05 15:35:17	1-585-222-9564	female	1975-05-25	worker	t	f	\N	\N	0	0	0	0
1010	Jeanette Kuhlman	lawrence69@example.com	2026-01-27 12:12:21	$2y$12$7fqUE24n3HZzlpJ0xl.vveBh3/2kRlsNn49D2MgPVcRqzU4xCpsn.	\N	2026-01-27 12:12:22	2026-02-05 15:35:13	+1-442-740-3732	male	1987-06-10	worker	t	f	\N	\N	0	0	0	0
1011	Josephine Barrows	royce.hilpert@example.com	2026-01-27 12:12:21	$2y$12$SQZVXRC4OvmdlcmzJE0T0eWlGmhPzL0AKL4O0vGV9XAeW1owlR1Sa	\N	2026-01-27 12:12:22	2026-02-05 15:36:00	469.634.3381	female	1971-05-03	worker	t	f	\N	\N	0	0	0	0
1012	Prof. Demario Mills Jr.	vschuster@example.com	2026-01-27 12:12:21	$2y$12$a7fA2w1/H37TPl6gL2ahBe71tRwb0qMLBtLZjq..L/GTY7oqRdBMm	\N	2026-01-27 12:12:22	2026-02-05 15:36:03	+1 (574) 461-7103	female	1995-07-31	worker	t	f	\N	\N	0	0	0	0
1013	Create User	create@user.com	2026-01-27 16:16:19	$2y$12$STUyTQUK/.BN9hv8DxT3xurHSSkLQme7jCIOzbnjqZZrqSuHPU7FW	\N	2026-01-27 16:16:19	2026-01-27 16:16:19	+35923423	male	2026-01-05	admin	t	t	\N	\N	0	0	0	0
1014	New User	new@user.com	\N	$2y$12$5N4TABX0knI2Ezdvj8Douu.CZxtczMTM9xNA4NOp501SmPjB2Srqu	\N	2026-01-27 20:21:28	2026-01-27 20:21:28	+359345345	male	2026-01-06	client	f	t	\N	t	0	0	0	0
1015	New Userss	new@user2.com	\N	$2y$12$5Zst7rQ6w/XvMpwDlCV6N.BXaeT8vLk.RVg8P40AIGU6SIRkpAID6	\N	2026-01-27 20:22:46	2026-01-27 20:22:46	+56485345	female	2025-12-29	client	f	t	\N	t	0	0	0	0
1016	New Usersss	rwe@34w3.com	\N	$2y$12$agzlN8XGZ6dALbiUJ318fuo1vLtYdylQaDLUL0NNIB29XG3jUVm.6	\N	2026-02-01 15:42:28	2026-02-01 15:42:28	085445656	male	2026-01-27	client	f	t	\N	t	0	0	0	0
1017	Create User	ts@rwerw.com	\N	$2y$12$7QTt5tXzE5kN2jjGYUMw8OPQt7EQaI5yXHswjGG3qgwp20UIr9W9a	\N	2026-02-02 07:50:46	2026-02-02 07:50:46	088454	male	2026-01-26	client	f	t	\N	t	0	0	0	0
1019	Ventsislav Ivanov	ventsislav.ivanov89@gmail.com	\N	$2y$12$F2/d/PWsBu/5iE0OE7DRu.rmWSEeYB/SfN0nxfI1uzNe/aX0UG4Du	\N	2026-04-17 01:17:10	2026-04-17 01:17:10	0888747474	male	2026-04-21	client	f	t	\N	t	0	0	0	0
1020	Test Test	test@abv.bg	\N	$2y$12$IISMTRlogZlXAuU0X.MwVOnctug85cPQiEAEh.H5hDQ3olvGDwtAG	\N	2026-05-05 09:17:48	2026-05-05 09:17:48	0987654321	male	2026-04-27	client	f	t	\N	t	0	0	0	0
\.


--
-- TOC entry 4321 (class 0 OID 17639)
-- Dependencies: 305
-- Data for Name: worker_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_service (id, user_id, service_id, created_at, updated_at, price_override, duration_override) FROM stdin;
8	2	1	\N	\N	\N	\N
9	2	2	\N	\N	\N	\N
10	3	1	\N	\N	\N	\N
11	3	2	\N	\N	\N	\N
12	3	8	\N	\N	\N	\N
13	4	4	\N	\N	\N	\N
14	4	5	\N	\N	\N	\N
15	1004	3	\N	\N	\N	\N
\.


--
-- TOC entry 4281 (class 0 OID 17160)
-- Dependencies: 261
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-03-24 09:28:14
20211116045059	2026-03-24 09:28:14
20211116050929	2026-03-24 09:28:14
20211116051442	2026-03-24 09:28:14
20211116212300	2026-03-24 09:28:14
20211116213355	2026-03-24 09:28:14
20211116213934	2026-03-24 09:28:14
20211116214523	2026-03-24 09:28:14
20211122062447	2026-03-24 09:28:14
20211124070109	2026-03-24 09:28:14
20211202204204	2026-03-24 09:28:14
20211202204605	2026-03-24 09:28:14
20211210212804	2026-03-24 09:28:15
20211228014915	2026-03-24 09:28:15
20220107221237	2026-03-24 09:28:15
20220228202821	2026-03-24 09:28:15
20220312004840	2026-03-24 09:28:15
20220603231003	2026-03-24 09:28:15
20220603232444	2026-03-24 09:28:15
20220615214548	2026-03-24 09:28:15
20220712093339	2026-03-24 09:28:15
20220908172859	2026-03-24 09:28:15
20220916233421	2026-03-24 09:28:15
20230119133233	2026-03-24 09:28:15
20230128025114	2026-03-24 09:28:15
20230128025212	2026-03-24 09:28:15
20230227211149	2026-03-24 09:28:15
20230228184745	2026-03-24 09:28:15
20230308225145	2026-03-24 09:28:15
20230328144023	2026-03-24 09:28:15
20231018144023	2026-03-24 09:28:15
20231204144023	2026-03-24 09:28:15
20231204144024	2026-03-24 09:28:15
20231204144025	2026-03-24 09:28:15
20240108234812	2026-03-24 09:28:15
20240109165339	2026-03-24 09:28:15
20240227174441	2026-03-24 09:28:15
20240311171622	2026-03-24 09:28:15
20240321100241	2026-03-24 09:28:15
20240401105812	2026-03-24 09:28:15
20240418121054	2026-03-24 09:28:15
20240523004032	2026-03-24 09:28:15
20240618124746	2026-03-24 09:28:15
20240801235015	2026-03-24 09:28:15
20240805133720	2026-03-24 09:28:15
20240827160934	2026-03-24 09:44:45
20240919163303	2026-03-24 09:44:45
20240919163305	2026-03-24 09:44:45
20241019105805	2026-03-24 09:44:45
20241030150047	2026-03-24 09:44:45
20241108114728	2026-03-24 09:44:46
20241121104152	2026-03-24 09:44:46
20241130184212	2026-03-24 09:44:46
20241220035512	2026-03-24 09:44:46
20241220123912	2026-03-24 09:44:47
20241224161212	2026-03-24 09:44:47
20250107150512	2026-03-24 09:44:47
20250110162412	2026-03-24 09:44:47
20250123174212	2026-03-24 09:44:47
20250128220012	2026-03-24 09:44:47
20250506224012	2026-03-24 09:44:47
20250523164012	2026-03-24 09:44:47
20250714121412	2026-03-24 09:44:47
20250905041441	2026-03-24 09:44:47
20251103001201	2026-03-24 09:44:47
20251120212548	2026-03-24 09:44:47
20251120215549	2026-03-24 09:44:47
20260218120000	2026-03-24 09:44:47
\.


--
-- TOC entry 4283 (class 0 OID 17183)
-- Dependencies: 264
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- TOC entry 4285 (class 0 OID 17324)
-- Dependencies: 268
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- TOC entry 4289 (class 0 OID 17444)
-- Dependencies: 272
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- TOC entry 4290 (class 0 OID 17457)
-- Dependencies: 273
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4284 (class 0 OID 17316)
-- Dependencies: 267
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-03-24 09:28:46.979261
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-03-24 09:28:47.008946
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-03-24 09:28:47.016239
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-03-24 09:28:47.049954
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-03-24 09:28:47.083689
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-03-24 09:28:47.087505
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-03-24 09:28:47.091836
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-03-24 09:28:47.096157
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-03-24 09:28:47.099682
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-03-24 09:28:47.103162
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-03-24 09:28:47.106728
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-03-24 09:28:47.110534
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-03-24 09:28:47.115608
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-03-24 09:28:47.118918
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-03-24 09:28:47.122797
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-03-24 09:28:47.14966
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-03-24 09:28:47.153259
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-03-24 09:28:47.156672
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-03-24 09:28:47.160864
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-03-24 09:28:47.165562
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-03-24 09:28:47.168997
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-03-24 09:28:47.17353
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-03-24 09:28:47.188382
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-03-24 09:28:47.200741
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-03-24 09:28:47.204971
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-03-24 09:28:47.20861
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-03-24 09:28:47.212803
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-03-24 09:28:47.215766
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-03-24 09:28:47.218667
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-03-24 09:28:47.221941
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-03-24 09:28:47.224759
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-03-24 09:28:47.227619
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-03-24 09:28:47.230373
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-03-24 09:28:47.233186
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-03-24 09:28:47.23617
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-03-24 09:28:47.239495
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-03-24 09:28:47.24238
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-03-24 09:28:47.246003
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-03-24 09:28:47.249908
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-03-24 09:28:47.259291
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-03-24 09:28:47.26296
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-03-24 09:28:47.265941
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-03-24 09:28:47.26895
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-03-24 09:28:47.27197
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-03-24 09:28:47.274768
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-03-24 09:28:47.278572
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-03-24 09:28:47.289091
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-03-24 09:28:47.292787
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-03-24 09:28:47.295891
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-03-24 09:28:47.315609
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-03-24 09:28:47.319182
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-03-24 09:28:47.335701
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-03-24 09:28:47.336802
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-03-24 09:28:47.346556
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-03-24 09:28:47.348469
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-03-24 09:28:47.349656
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-04-08 13:15:23.602177
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-04-08 13:15:23.618372
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-03-24 09:28:47.353669
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-07-06 08:56:29.919682
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-07-06 08:56:29.967674
\.


--
-- TOC entry 4286 (class 0 OID 17334)
-- Dependencies: 269
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- TOC entry 4287 (class 0 OID 17383)
-- Dependencies: 270
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- TOC entry 4288 (class 0 OID 17397)
-- Dependencies: 271
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- TOC entry 4291 (class 0 OID 17467)
-- Dependencies: 274
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3676 (class 0 OID 16612)
-- Dependencies: 241
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 236
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 277
-- Name: appointment_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_history_id_seq', 185, true);


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 279
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 20, true);


--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 281
-- Name: business_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_hours_id_seq', 7, true);


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 285
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 287
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 290
-- Name: job_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_position_id_seq', 25, true);


--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 292
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 29, true);


--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 294
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 23, true);


--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 297
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 67, true);


--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 299
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 301
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 8, true);


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 304
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1020, true);


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 306
-- Name: worker_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_service_id_seq', 15, true);


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 263
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- TOC entry 3891 (class 2606 OID 16783)
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- TOC entry 3860 (class 2606 OID 16535)
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3946 (class 2606 OID 17115)
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- TOC entry 3948 (class 2606 OID 17113)
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3914 (class 2606 OID 16889)
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- TOC entry 3869 (class 2606 OID 16907)
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- TOC entry 3871 (class 2606 OID 16917)
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- TOC entry 3858 (class 2606 OID 16528)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 3893 (class 2606 OID 16776)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- TOC entry 3889 (class 2606 OID 16764)
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 3881 (class 2606 OID 16957)
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- TOC entry 3883 (class 2606 OID 16751)
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- TOC entry 3927 (class 2606 OID 17016)
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- TOC entry 3929 (class 2606 OID 17014)
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- TOC entry 3931 (class 2606 OID 17012)
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- TOC entry 3941 (class 2606 OID 17074)
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3924 (class 2606 OID 16976)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3935 (class 2606 OID 17038)
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- TOC entry 3937 (class 2606 OID 17040)
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- TOC entry 3918 (class 2606 OID 16942)
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 16518)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3855 (class 2606 OID 16694)
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3903 (class 2606 OID 16823)
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- TOC entry 3905 (class 2606 OID 16821)
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3910 (class 2606 OID 16837)
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3863 (class 2606 OID 16541)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3876 (class 2606 OID 16715)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3900 (class 2606 OID 16804)
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 3895 (class 2606 OID 16795)
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3845 (class 2606 OID 16877)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 3847 (class 2606 OID 16505)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3956 (class 2606 OID 17152)
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 3952 (class 2606 OID 17135)
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- TOC entry 3994 (class 2606 OID 17657)
-- Name: appointment_history appointment_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_history
    ADD CONSTRAINT appointment_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3997 (class 2606 OID 17659)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 4000 (class 2606 OID 17661)
-- Name: business_hours business_hours_day_of_week_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_hours
    ADD CONSTRAINT business_hours_day_of_week_unique UNIQUE (day_of_week);


--
-- TOC entry 4002 (class 2606 OID 17663)
-- Name: business_hours business_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_hours
    ADD CONSTRAINT business_hours_pkey PRIMARY KEY (id);


--
-- TOC entry 4006 (class 2606 OID 17665)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4004 (class 2606 OID 17667)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4008 (class 2606 OID 17669)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4010 (class 2606 OID 17671)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4012 (class 2606 OID 17673)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4014 (class 2606 OID 17675)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4016 (class 2606 OID 17677)
-- Name: job_positions job_position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT job_position_pkey PRIMARY KEY (id);


--
-- TOC entry 4018 (class 2606 OID 17679)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4021 (class 2606 OID 17681)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4023 (class 2606 OID 17683)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4026 (class 2606 OID 17685)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4028 (class 2606 OID 17687)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4031 (class 2606 OID 17689)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4033 (class 2606 OID 17691)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4036 (class 2606 OID 17693)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4039 (class 2606 OID 17695)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4041 (class 2606 OID 17697)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4043 (class 2606 OID 17699)
-- Name: worker_service worker_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_service
    ADD CONSTRAINT worker_service_pkey PRIMARY KEY (id);


--
-- TOC entry 4045 (class 2606 OID 17701)
-- Name: worker_service worker_service_user_id_service_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_service
    ADD CONSTRAINT worker_service_user_id_service_id_unique UNIQUE (user_id, service_id);


--
-- TOC entry 3992 (class 2606 OID 17528)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3962 (class 2606 OID 17191)
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- TOC entry 3959 (class 2606 OID 17164)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3983 (class 2606 OID 17490)
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- TOC entry 3970 (class 2606 OID 17332)
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- TOC entry 3986 (class 2606 OID 17466)
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 17323)
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- TOC entry 3967 (class 2606 OID 17321)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3976 (class 2606 OID 17344)
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- TOC entry 3981 (class 2606 OID 17406)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- TOC entry 3979 (class 2606 OID 17391)
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 3989 (class 2606 OID 17476)
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- TOC entry 3861 (class 1259 OID 16536)
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- TOC entry 3835 (class 1259 OID 16704)
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3942 (class 1259 OID 17119)
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- TOC entry 3943 (class 1259 OID 17118)
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- TOC entry 3944 (class 1259 OID 17116)
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- TOC entry 3949 (class 1259 OID 17117)
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- TOC entry 3836 (class 1259 OID 16706)
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3837 (class 1259 OID 16707)
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3879 (class 1259 OID 16785)
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- TOC entry 3912 (class 1259 OID 16893)
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- TOC entry 3867 (class 1259 OID 16873)
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 3867
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- TOC entry 3872 (class 1259 OID 16701)
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- TOC entry 3915 (class 1259 OID 16890)
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- TOC entry 3939 (class 1259 OID 17075)
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- TOC entry 3916 (class 1259 OID 16891)
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- TOC entry 3887 (class 1259 OID 16896)
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- TOC entry 3884 (class 1259 OID 16757)
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- TOC entry 3885 (class 1259 OID 16902)
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- TOC entry 3925 (class 1259 OID 17027)
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- TOC entry 3922 (class 1259 OID 16980)
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- TOC entry 3932 (class 1259 OID 17053)
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- TOC entry 3933 (class 1259 OID 17051)
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- TOC entry 3938 (class 1259 OID 17052)
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- TOC entry 3919 (class 1259 OID 16949)
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- TOC entry 3920 (class 1259 OID 16948)
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- TOC entry 3921 (class 1259 OID 16950)
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- TOC entry 3838 (class 1259 OID 16708)
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3839 (class 1259 OID 16705)
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3848 (class 1259 OID 16519)
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- TOC entry 3849 (class 1259 OID 16520)
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- TOC entry 3850 (class 1259 OID 16700)
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- TOC entry 3853 (class 1259 OID 16787)
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- TOC entry 3856 (class 1259 OID 16892)
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- TOC entry 3906 (class 1259 OID 16829)
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- TOC entry 3907 (class 1259 OID 16894)
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- TOC entry 3908 (class 1259 OID 16844)
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- TOC entry 3911 (class 1259 OID 16843)
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- TOC entry 3873 (class 1259 OID 16895)
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- TOC entry 3874 (class 1259 OID 17065)
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- TOC entry 3877 (class 1259 OID 16786)
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- TOC entry 3898 (class 1259 OID 16811)
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- TOC entry 3901 (class 1259 OID 16810)
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- TOC entry 3896 (class 1259 OID 16796)
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- TOC entry 3897 (class 1259 OID 16958)
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- TOC entry 3886 (class 1259 OID 16955)
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- TOC entry 3878 (class 1259 OID 16784)
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- TOC entry 3840 (class 1259 OID 16864)
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 3840
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- TOC entry 3841 (class 1259 OID 16702)
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- TOC entry 3842 (class 1259 OID 16509)
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- TOC entry 3843 (class 1259 OID 16919)
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- TOC entry 3954 (class 1259 OID 17159)
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- TOC entry 3957 (class 1259 OID 17158)
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- TOC entry 3950 (class 1259 OID 17141)
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- TOC entry 3953 (class 1259 OID 17142)
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- TOC entry 3995 (class 1259 OID 17702)
-- Name: appointments_client_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX appointments_client_id_index ON public.appointments USING btree (client_id);


--
-- TOC entry 3998 (class 1259 OID 17703)
-- Name: appointments_worker_id_starts_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX appointments_worker_id_starts_at_index ON public.appointments USING btree (worker_id, starts_at);


--
-- TOC entry 4019 (class 1259 OID 17704)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4024 (class 1259 OID 17705)
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- TOC entry 4029 (class 1259 OID 17706)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 4034 (class 1259 OID 17707)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4037 (class 1259 OID 17708)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 3960 (class 1259 OID 17529)
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- TOC entry 3990 (class 1259 OID 17530)
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 3963 (class 1259 OID 17533)
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- TOC entry 3968 (class 1259 OID 17333)
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- TOC entry 3971 (class 1259 OID 17350)
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- TOC entry 3984 (class 1259 OID 17491)
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- TOC entry 3977 (class 1259 OID 17417)
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- TOC entry 3972 (class 1259 OID 17382)
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- TOC entry 3973 (class 1259 OID 17498)
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- TOC entry 3974 (class 1259 OID 17351)
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- TOC entry 3987 (class 1259 OID 17482)
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- TOC entry 4078 (class 2620 OID 17196)
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- TOC entry 4079 (class 2620 OID 17436)
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- TOC entry 4080 (class 2620 OID 17500)
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- TOC entry 4081 (class 2620 OID 17501)
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- TOC entry 4082 (class 2620 OID 17370)
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- TOC entry 4047 (class 2606 OID 16688)
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4052 (class 2606 OID 16777)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4051 (class 2606 OID 16765)
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- TOC entry 4050 (class 2606 OID 16752)
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4058 (class 2606 OID 17017)
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4059 (class 2606 OID 17022)
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4060 (class 2606 OID 17046)
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4061 (class 2606 OID 17041)
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4057 (class 2606 OID 16943)
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4046 (class 2606 OID 16721)
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4054 (class 2606 OID 16824)
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4055 (class 2606 OID 16897)
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- TOC entry 4056 (class 2606 OID 16838)
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4048 (class 2606 OID 17060)
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4049 (class 2606 OID 16716)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4053 (class 2606 OID 16805)
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4063 (class 2606 OID 17153)
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4062 (class 2606 OID 17136)
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4069 (class 2606 OID 17709)
-- Name: appointment_history appointment_history_appointment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_history
    ADD CONSTRAINT appointment_history_appointment_id_foreign FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;


--
-- TOC entry 4070 (class 2606 OID 17714)
-- Name: appointment_history appointment_history_changed_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_history
    ADD CONSTRAINT appointment_history_changed_by_foreign FOREIGN KEY (changed_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4071 (class 2606 OID 17719)
-- Name: appointments appointments_changed_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_changed_by_foreign FOREIGN KEY (changed_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4072 (class 2606 OID 17724)
-- Name: appointments appointments_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4073 (class 2606 OID 17729)
-- Name: appointments appointments_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- TOC entry 4074 (class 2606 OID 17734)
-- Name: appointments appointments_worker_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_worker_id_foreign FOREIGN KEY (worker_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4075 (class 2606 OID 17739)
-- Name: users users_job_position_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_job_position_id_foreign FOREIGN KEY (job_position_id) REFERENCES public.job_positions(id) ON DELETE SET NULL;


--
-- TOC entry 4076 (class 2606 OID 17744)
-- Name: worker_service worker_service_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_service
    ADD CONSTRAINT worker_service_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- TOC entry 4077 (class 2606 OID 17749)
-- Name: worker_service worker_service_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_service
    ADD CONSTRAINT worker_service_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4064 (class 2606 OID 17345)
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4065 (class 2606 OID 17392)
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4066 (class 2606 OID 17412)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4067 (class 2606 OID 17407)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- TOC entry 4068 (class 2606 OID 17477)
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- TOC entry 4234 (class 0 OID 16529)
-- Dependencies: 239
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4245 (class 0 OID 16883)
-- Dependencies: 252
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4236 (class 0 OID 16681)
-- Dependencies: 243
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4233 (class 0 OID 16522)
-- Dependencies: 238
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4240 (class 0 OID 16770)
-- Dependencies: 247
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4239 (class 0 OID 16758)
-- Dependencies: 246
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4238 (class 0 OID 16745)
-- Dependencies: 245
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4246 (class 0 OID 16933)
-- Dependencies: 253
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4232 (class 0 OID 16511)
-- Dependencies: 237
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4243 (class 0 OID 16812)
-- Dependencies: 250
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4244 (class 0 OID 16830)
-- Dependencies: 251
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4235 (class 0 OID 16537)
-- Dependencies: 240
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4237 (class 0 OID 16711)
-- Dependencies: 244
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4242 (class 0 OID 16797)
-- Dependencies: 249
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4241 (class 0 OID 16788)
-- Dependencies: 248
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4231 (class 0 OID 16499)
-- Dependencies: 235
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4255 (class 0 OID 17514)
-- Dependencies: 275
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4248 (class 0 OID 17324)
-- Dependencies: 268
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4252 (class 0 OID 17444)
-- Dependencies: 272
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4253 (class 0 OID 17457)
-- Dependencies: 273
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4247 (class 0 OID 17316)
-- Dependencies: 267
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4249 (class 0 OID 17334)
-- Dependencies: 269
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4250 (class 0 OID 17383)
-- Dependencies: 270
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4251 (class 0 OID 17397)
-- Dependencies: 271
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4254 (class 0 OID 17467)
-- Dependencies: 274
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4256 (class 6104 OID 16430)
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 18
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 14
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 21
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 19
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 15
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 371
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 383
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 370
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 369
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 365
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 366
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 337
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 367
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 341
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 343
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 334
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 333
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 340
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 342
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 344
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 345
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 338
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 339
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 372
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 376
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 373
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 336
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 335
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 321
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 320
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 322
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 368
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 364
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 358
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 360
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 362
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 359
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 361
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 363
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 354
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 356
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 355
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 357
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 350
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 352
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 351
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 353
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 346
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 348
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 347
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 349
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 374
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 375
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 377
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 328
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 329
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 330
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 331
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 332
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 323
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 324
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 326
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 325
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 327
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 413
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 307
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 319
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 389
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 410
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 391
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 387
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 386
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 390
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 392
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 385
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 409
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 384
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 388
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 393
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 379
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 381
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 382
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 236
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE appointment_history; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.appointment_history TO anon;
GRANT ALL ON TABLE public.appointment_history TO authenticated;
GRANT ALL ON TABLE public.appointment_history TO service_role;


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 277
-- Name: SEQUENCE appointment_history_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.appointment_history_id_seq TO anon;
GRANT ALL ON SEQUENCE public.appointment_history_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.appointment_history_id_seq TO service_role;


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE appointments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.appointments TO anon;
GRANT ALL ON TABLE public.appointments TO authenticated;
GRANT ALL ON TABLE public.appointments TO service_role;


--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 279
-- Name: SEQUENCE appointments_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.appointments_id_seq TO anon;
GRANT ALL ON SEQUENCE public.appointments_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.appointments_id_seq TO service_role;


--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE business_hours; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.business_hours TO anon;
GRANT ALL ON TABLE public.business_hours TO authenticated;
GRANT ALL ON TABLE public.business_hours TO service_role;


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 281
-- Name: SEQUENCE business_hours_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.business_hours_id_seq TO anon;
GRANT ALL ON SEQUENCE public.business_hours_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.business_hours_id_seq TO service_role;


--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE cache; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cache TO anon;
GRANT ALL ON TABLE public.cache TO authenticated;
GRANT ALL ON TABLE public.cache TO service_role;


--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE cache_locks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cache_locks TO anon;
GRANT ALL ON TABLE public.cache_locks TO authenticated;
GRANT ALL ON TABLE public.cache_locks TO service_role;


--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categories TO anon;
GRANT ALL ON TABLE public.categories TO authenticated;
GRANT ALL ON TABLE public.categories TO service_role;


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 285
-- Name: SEQUENCE categories_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.categories_id_seq TO anon;
GRANT ALL ON SEQUENCE public.categories_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.categories_id_seq TO service_role;


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE failed_jobs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.failed_jobs TO anon;
GRANT ALL ON TABLE public.failed_jobs TO authenticated;
GRANT ALL ON TABLE public.failed_jobs TO service_role;


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 287
-- Name: SEQUENCE failed_jobs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.failed_jobs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.failed_jobs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.failed_jobs_id_seq TO service_role;


--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE job_batches; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.job_batches TO anon;
GRANT ALL ON TABLE public.job_batches TO authenticated;
GRANT ALL ON TABLE public.job_batches TO service_role;


--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE job_positions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.job_positions TO anon;
GRANT ALL ON TABLE public.job_positions TO authenticated;
GRANT ALL ON TABLE public.job_positions TO service_role;


--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 290
-- Name: SEQUENCE job_position_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.job_position_id_seq TO anon;
GRANT ALL ON SEQUENCE public.job_position_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.job_position_id_seq TO service_role;


--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE jobs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jobs TO anon;
GRANT ALL ON TABLE public.jobs TO authenticated;
GRANT ALL ON TABLE public.jobs TO service_role;


--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 292
-- Name: SEQUENCE jobs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.jobs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.jobs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.jobs_id_seq TO service_role;


--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.migrations TO anon;
GRANT ALL ON TABLE public.migrations TO authenticated;
GRANT ALL ON TABLE public.migrations TO service_role;


--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 294
-- Name: SEQUENCE migrations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.migrations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.migrations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.migrations_id_seq TO service_role;


--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE password_reset_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.password_reset_tokens TO anon;
GRANT ALL ON TABLE public.password_reset_tokens TO authenticated;
GRANT ALL ON TABLE public.password_reset_tokens TO service_role;


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE personal_access_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.personal_access_tokens TO anon;
GRANT ALL ON TABLE public.personal_access_tokens TO authenticated;
GRANT ALL ON TABLE public.personal_access_tokens TO service_role;


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 297
-- Name: SEQUENCE personal_access_tokens_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.personal_access_tokens_id_seq TO anon;
GRANT ALL ON SEQUENCE public.personal_access_tokens_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.personal_access_tokens_id_seq TO service_role;


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.roles TO anon;
GRANT ALL ON TABLE public.roles TO authenticated;
GRANT ALL ON TABLE public.roles TO service_role;


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 299
-- Name: SEQUENCE roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.roles_id_seq TO service_role;


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE services; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.services TO anon;
GRANT ALL ON TABLE public.services TO authenticated;
GRANT ALL ON TABLE public.services TO service_role;


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 301
-- Name: SEQUENCE services_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.services_id_seq TO anon;
GRANT ALL ON SEQUENCE public.services_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.services_id_seq TO service_role;


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE sessions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sessions TO anon;
GRANT ALL ON TABLE public.sessions TO authenticated;
GRANT ALL ON TABLE public.sessions TO service_role;


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 304
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.users_id_seq TO service_role;


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE worker_service; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.worker_service TO anon;
GRANT ALL ON TABLE public.worker_service TO authenticated;
GRANT ALL ON TABLE public.worker_service TO service_role;


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 306
-- Name: SEQUENCE worker_service_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.worker_service_id_seq TO anon;
GRANT ALL ON SEQUENCE public.worker_service_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.worker_service_id_seq TO service_role;


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 263
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- TOC entry 2444 (class 826 OID 16557)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2445 (class 826 OID 16558)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2443 (class 826 OID 16556)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2454 (class 826 OID 16636)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2453 (class 826 OID 16635)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- TOC entry 2452 (class 826 OID 16634)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2457 (class 826 OID 16591)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2456 (class 826 OID 16590)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2455 (class 826 OID 16589)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2449 (class 826 OID 16571)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2451 (class 826 OID 16570)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2450 (class 826 OID 16569)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2436 (class 826 OID 16494)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2437 (class 826 OID 16495)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2435 (class 826 OID 16493)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2439 (class 826 OID 16497)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2434 (class 826 OID 16492)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2438 (class 826 OID 16496)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2447 (class 826 OID 16561)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2448 (class 826 OID 16562)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2446 (class 826 OID 16560)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2442 (class 826 OID 16550)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2441 (class 826 OID 16549)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2440 (class 826 OID 16548)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 3671 (class 3466 OID 16575)
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- TOC entry 3674 (class 3466 OID 16654)
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- TOC entry 3670 (class 3466 OID 16573)
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- TOC entry 3675 (class 3466 OID 16657)
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- TOC entry 3672 (class 3466 OID 16576)
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- TOC entry 3673 (class 3466 OID 16577)
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

-- Completed on 2026-07-09 17:39:42 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict jJmkErVbxnZ0cr5E5NoO0CHW24QA3kMEsuh0aeFuxPbFRgRSDIZJ5uMdmXk3M4A

