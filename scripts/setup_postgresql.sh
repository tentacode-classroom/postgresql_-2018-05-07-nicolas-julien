#Ajout du repsository

echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.li$

#import de la clés de syndchronisation

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
     sudo apt-get update

#Installation de postgresQL

apt-get install postgresql-11


