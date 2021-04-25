#' Check allowed values for numeric variables
#'
#' @param df Data frame containing numeric variables to check
#' @param allowed_min Named vector where names are colnames and values are
#'                    the allowed minimum value for the variable.
#' @param allowed_max Named vector where names are colnames and values are
#'                    the allowed maximum value for the variable.
#'
#' It is not required that allowed_min and allowed_max have the same set of
#' colnames specified to check (their names don't have to be the same set
#' of colnames).
#'
#' @return NULL if no unexpected values are found. Otherwise, a dataframe
#'         specifying count below the min or above the max for each variable.
#' @export
check_allowed_values_numeric <- function(df, allowed_min, allowed_max) {
    unexpected_values <- data.frame(
        colname = unique(c(names(allowed_min), names(allowed_max))),
        below_min = NA,
        above_max = NA
    )
    for (var in names(allowed_min))
    {
        below_min_count <- sum(df[[var]] < allowed_min[var])
        if (below_min_count > 0){
            unexpected_values$below_min[unexpected_values$colname == var] <- below_min_count
        }
    }
    for (var in names(allowed_max))
    {
        above_max_count <- sum(df[[var]] > allowed_max[var])
        if (above_max_count > 0){
            unexpected_values$above_max[unexpected_values$colname == var] <- above_max_count
        }
    }
    if (all(is.na(unexpected_values[c('below_min', 'above_max')])))
    {
        return(NULL)
    } else {return(unexpected_values)}
}
