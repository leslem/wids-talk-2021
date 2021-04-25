#' Remove duplicate records from a dataframe
#'
#' @param df Data frame to remove duplicates from
#' @param dup_idx Indexes of records (rows) to remove from the df.
#'
#' @return df with the specified rows removed.
#' @export
remove_duplicates <- function(df, dup_idx) {
    return(df[-dup_idx, ])
}
