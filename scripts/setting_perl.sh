#!/bin/bash


locale-gen fr_FR.UTF-8

dpkg-reconfigure locales

echo "#Locales
export LANGUAGE=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8" > ~/.bashrc


source ~/.bashrc
