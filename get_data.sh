#!/usr/bin/env zsh

# Download SPL book checkout data
wget -O data/spl_checkouts.csv https://data.seattle.gov/resource/tmmm-ytt6.csv
head -n 20 data/spl_checkouts.csv > data/spl_checkouts_head.csv
# https://data.seattle.gov/Community/Checkouts-by-Title/tmmm-ytt6

# Download The Met data
wget -P data https://media.githubusercontent.com/media/metmuseum/openaccess/master/MetObjects.csv
head -n 20 data/MetObjects.csv > data/MetObjects_head.csv

# Download the MoMA data
wget -P data https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv
