# Set up the renv library
renv::init('R')

# Install the packages I'll be using in this project
renv::install(packages = c(
    'data.table',
    'dataReporter',
    'devtools',
    'dplyr',
    'ggplot2',
    'knitr',
    'magrittr',
    'rmarkdown',
    'stringr',
    'usethis'
))

# Save the current state of my renv library to the lockfile
renv::snapshot()

# Load the existing lockfile
renv::restore()
