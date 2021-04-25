#! /usr/bin/env Rscript
# Use the custom data-cleaning package to clean the SPL data

library(dplyr)
devtools::load_all(path="cleanSPL")

args <- commandArgs(trailingOnly=TRUE)
data_file <- args[1]  
# data_file <- '../../data/spl_checkouts_2020_12.csv'
original <- read.csv(data_file, stringsAsFactors = FALSE)

expected_data_types <- c(
    usageclass      = 'character',
    checkouttype    = 'character',
    materialtype    = 'character',
    checkoutyear    = 'integer',
    checkoutmonth   = 'integer',
    checkouts       = 'integer',
    title           = 'character',
    creator         = 'character',
    subjects        = 'character',
    publisher       = 'character',
    publicationyear = 'integer'
)
unexpected_data_types <- check_data_types(original, expected_data_types)

categorical_allowed_values <- list(
    usageclass = c('Digital', 'Physical'),
    checkouttype = c('OverDrive', 'Horizon'),
    checkoutyear = c(2020),
    checkoutmonth = c(12),
    # This list is from the 2019 file so is missing some values observed in the 2020 file
    materialtype = c(
        'EBOOK',
        'BOOK',
        'SOUNDDISC',
        'AUDIOBOOK',
        'VIDEODISC',
        'REGPRINT',
        'VIDEO',
        'KIT',
        'ER, SOUNDDISC',
        'UNSPECIFIED',
        'MAP',
        'MUSIC',
        'SOUNDREC',
        'ER',
        'LARGEPRINT',
        'SOUNDDISC, VIDEODISC',
        'CR',
        'ER, VIDEODISC',
        'ATLAS',
        'MIXED',
        'REGPRINT, SOUNDDISC',
        'ER, NONPROJGRAPH',
        'SOUNDCASS, SOUNDDISC',
        'VIDEOCASS',
        'MUSICSNDREC',
        'VIDEOCART',
        'SOUNDCASS',
        'VISUAL',
        'REGPRINT, VIDEOREC',
        'NOTATEDMUSIC',
        'VIDEOREC',
        'FLASHCARD, SOUNDDISC',
        'SOUNDCASS, SOUNDDISC, SOUNDREC'
    )
)
unexpected_categorical_values <- check_allowed_values_categorical(original, categorical_allowed_values)

numeric_allowed_mins <- c(
    checkoutyear = 2020,
    checkoutmonth = 12,
    checkouts = 0
)
numeric_allowed_maxes <- c(
    checkoutyear = 2020,
    checkoutmonth = 12,
    checkouts = 200
)
unexpected_numeric_values <- check_allowed_values_numeric(original, numeric_allowed_mins, numeric_allowed_maxes)

unique_key_variables <- setdiff(colnames(original), c('checkouts', 'subjects'))
original <- original %>% arrange(title, creator, desc(checkouts))
unexpected_duplicates <- check_duplicates(original, unique_key_variables)

# missing_value_counts <- check_missing_values(
#     original,varnames = c('checkouts', 'title', 'checkoutmonth', 'checkoutyear'))
missing_value_counts <- check_missing_values(original)

empty_string_counts <- check_empty_strings(
    original,
    varnames = names(expected_data_types)[expected_data_types == 'character']
)

cleaned <- data.table::copy(original)
cleaned <- remove_duplicates(cleaned, unexpected_duplicates$duplicates_to_remove)
nrow(original)
nrow(cleaned)
check_duplicates(cleaned, unique_key_variables)

cleaned$materialtype <- process_materialtype(cleaned)
cleaned <- cbind(cleaned, process_publicationyear(cleaned))
dplyr::glimpse(cleaned)

save_cleaned_data(cleaned, data_file)
