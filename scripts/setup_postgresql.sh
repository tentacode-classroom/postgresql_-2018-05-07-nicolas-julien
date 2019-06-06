#!/bin/bash

#Ajout du repsository
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" | sudo tee --append /etc/apt/sources.list.d/pgdg.list

#import de la clés de syndchronisation

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

#Installation de postgresQL 11

sudo apt-get install postgresql-11 -y

echo "Your Psql version is :"
psql --version

echo "Starting postgresql server.."

sudo service postgresql start
sudo service postgresql status

echo "Setup postgresQL finish"
