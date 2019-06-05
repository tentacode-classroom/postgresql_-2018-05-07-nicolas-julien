DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events;

CREATE TABLE events (
	event_id serial,
	type varchar(255),
	actor_id bigint(20),
	repo_id bigint(20),
	PRIMARY KEY (`event_id`),
	KEY `actor` (`actor_id`),
	KEY `repo_id` (`repo_id`)
);

CREATE TABLE watch_events (
 	watch_event_id serial
) INHERITS (events);

CREATE TABLE push_events (
	push_event_id serial,
) INHERITS (events);

CREATE TABLE actor(
	actor_id serial,
	login varchar(45) NOT NULL,
	display_login varchar(45) NOT NULL,
	url varchar(255) NOT NULL,
	avatar_url varchar(255) NOT NULL
)

CREATE TABLE repo(
	repo_id serial,
	name varchar(255) NOT NULL
	url varchar(255) NOT NULL
)

INSERT INTO events ('', 'commit', '1', '5')
INSERT INTO actor ('', 'Michel', 'Michel', 'http:\/\/www.michel.com')
