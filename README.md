# PostgresQL Nicolas Notararigo/ Julien Bonnanfant



## Instalation de PostgresQL 

Exécutez le script suivant

```Shell
./scritps/setup_postresql.sh 
```

Ce script va allez chercher le repo, installez postgresQL puis le lancer.



## Importation du Json venant de github

Ensuite pour récurperer les evenements de GitHub du 7 Mai 2018 à 15h, on va le télécharger et l'extraire, puis le deplacer dans /json

```shell
./scritps/import_github.sh
```



## Création des tables de données

Créations table, actor, repo, events, push_events

```
./scritps/create_event_database
```



## Configuration de postgresQL

Changemement sur le port 1234 et ajout de la memoire de travail sur 100Mb

```shell
./scritps/update_configuration
```



## Création des différents utilisateurs 

Création de super-admin et de l'uttilisateurs github

```shell
./scritps/create_users
```



## Configuration PgAdmin4

```shell
./scripts/pg_admin_install.sh
```

