#!/usr/bin/env python3

# Just a quick script to get data from the Seattle Open Data API.
# Data details are here: https://data.seattle.gov/Community/Checkouts-by-Title/tmmm-ytt6
# Get two slices of the data on library checkouts to save to files.
# It would be polite to get an API key, but I'm only downloading the data once for this example.

import pandas as pd

from urllib.parse import urlencode

data_endpoint = 'https://data.seattle.gov/resource/tmmm-ytt6.csv?'
# Right now the latest data is from March 2021
# Use a limit of 37500000 because that's the maximum number of rows available in the dataset

# Example 1: data from Dec 2020
url1 = data_endpoint + urlencode({'$where': "checkoutyear = 2020 AND checkoutmonth = 12",
                                  '$limit': '37500000'
                                  })

data1 = pd.read_csv(url1)
data1.info()
data1.describe()
data1.to_csv("../data/spl_checkouts_2020_12.csv", index = False)

# Example 2: data from Dec 2019
url2 = data_endpoint + urlencode({'$where': "checkoutyear = 2019 AND checkoutmonth = 12",
                                  '$limit': '37500000'
                                  })

data2 = pd.read_csv(url2)
data2.info()
data2.describe()
data2.to_csv("../data/spl_checkouts_2019_12.csv", index = False)
