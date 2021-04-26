source('../../renv/activate.R')
library(usethis)

# setwd('devel/wids-talk-2021')
create_package(path='R/03_package/cleanSPL')
file.remove('R/03_package/cleanSPL/.gitignore')

use_r('check_data_types', open=FALSE)
use_r('check_allowed_values_categorical', open=FALSE)
use_r('check_allowed_values_numeric', open=FALSE)
use_r('check_duplicates', open=FALSE)
use_r('check_missing_values', open=FALSE)
use_r('check_empty_strings', open=FALSE)

use_r('remove_duplicates', open=FALSE)
use_r('process_publicationyear', open=FALSE)
use_r('process_materialtype', open=FALSE)

use_r('save_cleaned_data', open=FALSE)

use_package('dplyr')
use_package('stringr')
use_package('magrittr')

devtools::document()
devtools::check()
