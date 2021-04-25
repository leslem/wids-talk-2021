#' Check allowed values for categorical variables
#'
#' Does not account for allowed values that are not observed.
#'
#' @param df Data frame of categorical variables to check values of
#' @param allowed_values A list where names are colnames and items
#'                       are vectors of allowed values for the column
#'
#' @return A list where names are colnames and items are vectors of
#'         unexpected values observed in the data from df.
#'         If no unexpected values are observed, return NULL.
check_allowed_values_categorical <- function(df, allowed_values)
{
    unexpected_values <- lapply(names(allowed_values), function(var){
        observed <- unique(df[[var]])
        unexpected <- setdiff(observed, allowed_values[[var]])
        return(unexpected)
    })
    unexpected_counts <- sapply(unexpected_values, FUN=length)
    if (all(unexpected_counts == 0)){
        return(NULL)
    } else {
        return(unexpected_values)
    }
}
