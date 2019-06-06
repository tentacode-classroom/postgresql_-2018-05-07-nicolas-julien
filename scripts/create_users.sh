#!/bin/bash

#On ce connecte à la base de donnée et on execute le fichier SQL dans /sql

sudo -u postgres psql -f ../sql/create_users.sql




# création du fichier .pgpass + ajout identifiants
touch ~/.pgpass
chmod 0600 ~/.pgpass 
echo "*:*:*:super_admin:12345" > ~/.pgpass
echo "*:*:github_events:github_events:12345" >> ~/.pgpass

# connexion utilisateur super_admin
psql --username super_admin -c "SELECT 'Vous etes en super-admin';"

# connexion utilisateur github_events
psql --username github_events -c "SELECT 'votre uttilsateur est github';"

echo "Creation de super-admin et de github terminer"
