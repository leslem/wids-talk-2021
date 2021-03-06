% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_duplicates.R
\name{check_duplicates}
\alias{check_duplicates}
\title{Check dataframe for unexpected duplicates}
\usage{
check_duplicates(df, unique_key_variables)
}
\arguments{
\item{df}{Data frame to check for duplicates.}

\item{unique_key_variables}{Variables from the df that should uniquely specify
a data record. Other variables won't be considered
when looking for unexpected duplicates.}
}
\value{

}
\description{
Check dataframe for unexpected duplicates
}
