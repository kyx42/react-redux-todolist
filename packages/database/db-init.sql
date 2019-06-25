CREATE EXTENSION IF NOT EXISTS tablefunc ;

DROP TABLE IF EXISTS public.user CASCADE;
DROP TABLE IF EXISTS public.game CASCADE;
DROP TABLE IF EXISTS public.gamespace CASCADE;
DROP TABLE IF EXISTS public.gamespace_users CASCADE;
DROP TABLE IF EXISTS public.game_account CASCADE;

-----------
-- TABLES
-----------

CREATE TABLE public.user (
	id serial PRIMARY KEY NOT NULL,
	first_name character varying,
	email character varying NOT NULL UNIQUE,
	last_name character varying,
	password character varying NOT NULL,
	nickname character varying NOT NULL,
	username character varying NOT NULL UNIQUE,
	isConnected bool NOT NULL DEFAULT 'false'
) WITH (OIDS = FALSE) TABLESPACE pg_default;

CREATE TABLE public.game (
	id serial PRIMARY KEY  NOT NULL,
	name character varying NOT NULL UNIQUE,
	description TEXT NOT NULL,
	image_path character varying NOT NULL UNIQUE,
	url character varying
) WITH (OIDS=FALSE) TABLESPACE pg_default;

CREATE TABLE public.gamespace (
	id serial PRIMARY KEY NOT NULL,
	id_game bigint NOT NULL UNIQUE,
	CONSTRAINT fk__gamespace__id_game__game__id FOREIGN KEY (id_game) REFERENCES public.game(id) ON DELETE CASCADE
) WITH (OIDS=FALSE) TABLESPACE pg_default;

CREATE TABLE public.gamespace_users (
	id serial PRIMARY KEY NOT NULL,
	id_user bigint NOT NULL UNIQUE,
	id_gamespace bigint NOT NULL,
	CONSTRAINT fk__gamespace_users__id_user__user__id FOREIGN KEY (id_user) REFERENCES public.user(id) ON DELETE CASCADE,
	CONSTRAINT fk__gamespace_users__id_gamespace__gamespace__id FOREIGN KEY (id_gamespace) REFERENCES public.gamespace(id) ON DELETE CASCADE
) WITH (OIDS=FALSE) TABLESPACE pg_default;
