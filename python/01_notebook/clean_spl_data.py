#!/usr/bin/env python3

import numpy as np
import pandas as pd


# Read in data
data_file = '../../data/spl_checkouts_2020_12.csv'
spl_checkouts = pd.read_csv(data_file)

# Examine data
spl_checkouts.info()
spl_checkouts.describe()


# Fix data types
