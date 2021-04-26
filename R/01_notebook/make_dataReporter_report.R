library(dataReporter)
library(dplyr)
library(stringr)

data_file <- "../../data/spl_checkouts_2020_12.csv"
original <- read.csv(data_file, stringsAsFactors = FALSE)
makeDataReport(original)
