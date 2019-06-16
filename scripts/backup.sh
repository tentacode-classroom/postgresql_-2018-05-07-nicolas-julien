#!/bin/bash

rm -rf ./scripts/backup/
mkdir -p ./scripts/backup/

#Sauvegarde de la base de donnée github_events
pg_dump --username=super_admin github_events -f ./scripts/backup/github_events.sql

#Sauvegarde des roles uniquement
pg_dumpall --roles-only --username=super_admin -f ./scripts/backup/roles.sql
