DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events;

CREATE TABLE actor(
	actor_id serial,
	login varchar(45) NOT NULL,
	display_login varchar(45) NOT NULL,
	url varchar(255) NOT NULL,
	avatar_url varchar(255) NOT NULL
);

CREATE TABLE repo(
	repo_id serial,
	name varchar(255) NOT NULL
	url varchar(255) NOT NULL
);

CREATE TABLE events (
	id serial PRIMARY KEY,
	type varchar(255),
	actor_id bigint(20),
	repo_id bigint(20)
);

CREATE TABLE watch_events (
 	watch_event_id serial
) INHERITS (events);

CREATE TABLE push_events (
	push_event_id serial,
) INHERITS (events);
