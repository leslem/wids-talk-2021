#!/usr/bin/env zsh

# Download SPL book checkout data
wget -O data/spl_checkouts.csv https://data.seattle.gov/resource/tmmm-ytt6.csv
head -n 20 data/spl_checkouts.csv > data/spl_checkouts_head.csv
# https://data.seattle.gov/Community/Checkouts-by-Title/tmmm-ytt6
