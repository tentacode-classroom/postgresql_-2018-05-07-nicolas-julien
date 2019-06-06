DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events;

CREATE TABLE actor(
	id serial PRIMARY KEY,
	login varchar(45),
	display_login varchar(45),
	gravatar_id int,
	url varchar(255),
	avatar_url varchar(255)
);

INSERT INTO actor (login, display_login, gravatar_id, url, avatar_url) VALUES ('Neerfix', 'Neerfix', NULL, 'https://www.github.com/Neerfix/', 'https://avatars1.githubusercontent.com/u/13368283?s=88&v=4');
SELECT * FROM actor;

CREATE TABLE repo(
	id serial PRIMARY KEY,
	name varchar(255),
	url varchar(255)
);
INSERT INTO repo (name, url) VALUES ('Portfolio', 'https://www.github.com/Neerfix/Portfolio');
SELECT * FROM repo;

CREATE TABLE events (
	id serial PRIMARY KEY,
	type varchar(255),
	actor_id int REFERENCES actor,
	repo_id int REFERENCES repo
);
INSERT INTO events (type, actor_id, repo_id) VALUES ('push', '1', '1');
SELECT * FROM events;

CREATE TABLE issue_events (
 	issue_title varchar(80),
	comment_count int,
	action varchar(255)
) INHERITS ("events");
INSERT INTO issue_events (type, actor_id, repo_id, issue_title, comment_count, action) VALUES ('issue', 1, 1, 'Remarques étape 4', '1', 'open');
SELECT * FROM issue_events;

CREATE TABLE push_events (
	branch_name varchar(80),
	commit_count int
) INHERITS ("events");
INSERT INTO push_events (type, actor_id, repo_id, branch_name, commit_count) VALUES ('push', 1, 1, 'Update repo', '4');
SELECT * FROM push_events;
