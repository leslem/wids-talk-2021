#!/usr/bin/env python3

import numpy as np
import pandas as pd


# ## 1. Read in the data
data_file = '../../data/spl_checkouts_2020_12.csv'
spl_checkouts = pd.read_csv(data_file)

# Examine data
spl_checkouts.info()
spl_checkouts.describe()

# ## 2. Validate the data

# ## 3. Correct the invalid values

# ## 4. Adjust the inconvenient values

# ## 5. Add new features/variables
