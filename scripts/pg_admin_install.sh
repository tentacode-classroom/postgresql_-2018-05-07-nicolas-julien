#Executer le sql
sudo -u postgres psql -f ./sql/pg_admin_install.sql
 

#Redemarer postgresql

sudo service postgresql restart 

