#!/usr/bin/env python3

import numpy as np
import pandas as pd

# Read in data
met_objects = pd.read_csv("data/spl_checkouts.csv", nrows=20)

# Examine data
met_objects.info()