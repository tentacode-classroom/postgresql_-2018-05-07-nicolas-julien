#!/bin/bash


echo "Telechargement du json"
wget https://data.gharchive.org/2018-05-07-15.json.gz

echo "Extraction du Json"
gunzip  2018-05-07-15.json.gz -y

echo "Deplacement du json"
cp 2018-05-07-15.json ../json/2018-05-07-15.json
rm â2018-05-07-15.json



nano  ../json/2018-05-07-15.json
