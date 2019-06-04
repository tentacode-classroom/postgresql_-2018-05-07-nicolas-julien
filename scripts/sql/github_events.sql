DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events;

DROP TABLE IF EXISTS events;
CREATE TABLE events (
  event_id serial,
  type varchar(255),
  actor_id bigint(20),
  repo_id bigint(20),
  PRIMARY KEY (`event_id`),
  KEY `actor` (`actor_id`),
  KEY `repo_id` (`repo_id`)
);

DROP TABLE IF EXISTS watch_events;
CREATE TABLE watch_events (
  watch_event_id serial,
) INHERITS (events);

DROP TABLE IF EXISTS push_events;
CREATE TABLE push_events (
  push_event_id serial,
) INHERITS (events);

DROP TABLE IF EXISTS actor
CREATE TABLE actor(
  actor_id serial,
)

DROP TABLE IF EXISTS repo
CREATE TABLE repo(
  repo_id serial,
)
