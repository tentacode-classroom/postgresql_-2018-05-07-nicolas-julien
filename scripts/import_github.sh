#!/bin/bash

echo -e "\033[0;36m Téléchargement du json \033[0m"
wget https://data.gharchive.org/2018-05-07-15.json.gz

echo -e "\033[0;36m Extraction du Json \033[0m"
gunzip  2018-05-07-15.json.gz -f

echo -e "\033[0;36m Déplacement du json \033[0m"
mkdir -p ./scripts/ressources/
mv 2018-05-07-15.json  ./scripts/ressources/github_data.json
rm 2018-05-07-15.json.gz

head  ./scripts/ressources/data_github.json
echo -e "\033[0;36m Json importé \033[0m"
