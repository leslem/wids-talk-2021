#' Check varnames in df for empty character strings
#'
#' @param df Data frame containing variables to check for empty string values.
#' @param varnames Character vector of variable names from df
#'                 to check for empty string values values.
#'
#' @return Named vector where names are varnames and values are
#'         the count of empty string values for the variable.
#' @export
#'
#' @importFrom magrittr "%>%"
check_empty_strings <- function(df, varnames=NULL) {
    if (!is.null(varnames))
    {
        df <- df %>% dplyr::select(all_of(varnames))
    }
    missing <- apply(df, MARGIN=2,
                     FUN=function(x){sum(x == '')})
    return(missing)
}
