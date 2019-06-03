#!/bin/bash

#Ajout du repsository

echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list

#import de la clés de syndchronisation

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
     sudo apt-get update

#Installation de postgresQL

sudo apt-get install postgresql-11 | psql --version
