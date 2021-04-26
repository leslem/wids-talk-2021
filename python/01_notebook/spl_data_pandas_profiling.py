#!/usr/bin/env python3

import numpy as np
import pandas as pd

from pandas_profiling import ProfileReport


# ## 1. Read in the data
data_file = '../../data/spl_checkouts_2020_12.csv'
spl_checkouts = pd.read_csv(data_file)

profile = ProfileReport(spl_checkouts, title = "SPL Checkouts Dec 2020 profiling report")
profile.to_file('spl_checkouts_2020_12_profiling_report.html')
