DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events;

DROP TABLE IF EXISTS events;
CREATE TABLE events (
  name varchar(255)
);
SELECT * FROM events;
