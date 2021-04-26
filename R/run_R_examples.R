renv::restore()

# Render the example reproducible report
setwd('01_notebook')
rmarkdown::render('clean_spl_data.Rmd')

# Render the report auto-built by dataReporter
# Building this report takes several minutes and you have to wait at two steps
source('make_dataReporter_report.R')


# Render the template report for both data files
setwd('../02_template')
data_files <- c(
    '../../data/spl_checkouts_2019_12.csv',
    '../../data/spl_checkouts_2020_12.csv'
)

for (ff in data_files){
    rmarkdown::render(
        'spl_data_cleaning_template.Rmd',
        output_file = paste0(basename(ff), '_report.html'),
        params = list(data_file = ff, author = 'Leslie Emery')
    )
}

# Run the script that uses a package to clean the data
setwd('../03_package/')
for (ff in data_files){
    system(paste("Rscript clean_spl_data.R", ff))
}
