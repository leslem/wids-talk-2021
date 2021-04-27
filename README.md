# Data cleaning for lazy people (with high standards)

Code examples for my talk at [Women in Data Science Puget Sound 2021](https://www.widspugetsound.org/bios-abstracts-2021).

You can find my slides [here](https://docs.google.com/presentation/d/1F34bKLPONMHuVlyBO8H66y6zxxqtyN8Vb6KVDYF5XCo/edit?usp=sharing)

## Title: Data cleaning for lazy people (with high standards): how to automate data cleaning responsibly

### Abstract: 

While data cleaning is crucial to achieving quality analysis results, data scientists continually bemoan the amount of time they spend on this crucial task. My talk will cover the elements of data cleaning and provide a spectrum of possible ways to automate cleaning while maintaining data quality.

### Description: 

What can go wrong when you don't address common data cleaning issues? Which parts of data cleaning can and can't be automated responsibly? Are there existing tools for automating data cleaning? Join me for a discussion of one of the most crucial, but under-appreciated, tasks in data science. 

Using examples in R and Python, I'll describe several different strategies for automating data cleaning, from notebook templates to custom cleaning functions to pipelining approaches. I'll finish by providing best practices for automating data cleaning, such as: data preservation, reproducibility, repeatability, and documentation. By the end of this talk you'll know how to get the most out of the time you spend on data cleaning.

## Four design patterns for automating data cleaning

1. Reproducible script or notebook
1. Generalized template
1. Package or module
1. Pipeline

## Project organization

```
├── data:               SPL data files (not tracked) and script to fetch the data
├── R:                  All example files in R
│   ├── 01_notebook:    Examples of design pattern 1, a reproducible script/notebook
│   ├── 02_template:    Examples of design pattern 2, a generalized template script/notebook
│   ├── 03_package:     Examples of design pattern 3, a custom package for cleaning data
│   │   └── cleanSPL:   R package with custom functions for cleaning the SPL data files
│   ├── 04_pipeline:    (incomplete) Examples of design pattern 4, a pipeline for batch data cleaning
│   └── renv:           Reproducible package library for this R project
└── python:             All example files in python
    ├── 01_notebook:    (incomplete) Examples of design pattern 1, a reproducible script/notebook
    ├── 02_template:    (incomplete) Examples of design pattern 2, a generalized template script/notebook
    ├── 03_package:     (incomplete) Examples of design pattern 3, a custom module for cleaning data
    └── 04_pipeline:    (incomplete) Examples of design pattern 4, a pipeline for batch data cleaning
```

## How to run example scripts yourself

* Clone the repository: `git clone git@github.com:leslem/wids-talk-2021.git`

### Python

* Set up a virtual environment with the required packages and activate it:

```
# With virtualenvwrapper
mkvirtualenv myenv -r python/requirements.txt
workon myenv

# With venv
python3 -m venv path/to/myenv
source path/to/myenv/bin/activate
pip install -r requirements.txt

# With conda
conda env create --name myenv --file python/requirements.txt
conda activate myenv
```

* Run a script from the command line from the same directory: `./spl_data_pandas_profiling.py`

You can see a script that runs all of the python data cleaning example scripts at `python/run_python_examples.py`

### R

* Open the R project file `R/wids-talk-2021.Rproj` with RStudio or navigate to the R directory in your favorite R interactive environment.
* Restore the `renv` library: `renv::restore()`
* Knit an Rmarkdown (.Rmd) report: `rmarkdown::render('01_notebook/clean_spl_data.Rmd')`
* Load the R package for data cleaning from example 03 from within an interactive R environment: `devtools::load_all('03_package/cleanSPL')`
* Run an R script from the command line: `Rscript --vanilla 03_package/clean_spl_data.R ../data/spl_checkouts_2020_12.csv`

You can see a script that runs all of the R data cleaning example scripts at `R/run_R_examples.R`
