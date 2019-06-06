DROP DATABASE IF EXISTS super_admin;
DROP ROLE IF EXISTS super_admin;
DROP ROLE IF EXISTS github_events;

CREATE ROLE super_admin LOGIN PASSWORD '12345' SUPERUSER;
CREATE DATABASE super_admin OWNER super_admin;

CREATE ROLE github_events LOGIN PASSWORD '12345';
ALTER DATABASE github_events OWNER TO github_events
