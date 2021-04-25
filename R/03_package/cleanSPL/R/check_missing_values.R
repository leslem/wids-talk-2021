#' Check varnames in df for missing values
#'
#' @param df Data frame containing variables to check for missing values.
#' @param varnames Character vector of variable names from df
#'                 to check for missing values.
#'
#' @return Named vector where names are varnames and values are
#'         the count of missing values for the variable.
#' @export
#'
#' @importFrom magrittr "%>%"
check_missing_values <- function(df, varnames=NULL) {
    if (!is.null(varnames))
    {
        df <- df %>% dplyr::select(all_of(varnames))
    }
    missing <- apply(df, MARGIN=2,
                     FUN=function(x){sum(is.na(x))})
    return(missing)
}
