#' Check dataframe for unexpected duplicates
#'
#' @param df Data frame to check for duplicates.
#' @param unique_key_variables Variables from the df that should uniquely specify
#'                             a data record. Other variables won't be considered
#'                             when looking for unexpected duplicates.
#'
#' @return
#' @export
#'
#' @importFrom magrittr "%>%"
check_duplicates <- function(df, unique_key_variables) {
    # Check for duplicates
    first_dups <- duplicated(df %>% select(all_of(unique_key_variables)))
    if (sum(first_dups) > 0)
    {
        last_dups <- duplicated(df %>% select(all_of(unique_key_variables)), fromLast=TRUE)
        all_dups <- which(first_dups | last_dups)
        return(list(
            all_duplicated = all_dups,
            # If you pass the df in sorted with your preferred records to keep at the top,
            # then duplicates_to_remove will specify the indexes of rows to remove.
            duplicates_to_remove = which(first_dups)
        ))
    } else {return(NULL)}
}
