#' Check data types match expected
#'
#' @param df Data frame to check column types for
#' @param expected_types Named vector with colname = datatype pairs;
#'                       datatype should be the result of typeof() on the column
#'
#' @return NULL if all data types match; data frame describing mismatches if not
#' @export
#' @importFrom magrittr "%>%"
check_data_types <- function(df, expected_types)
{
    observed_types <- sapply(df, typeof)
    type_comparison <- data.frame(
        colname = names(observed_types),
        observed = unname(observed_types),
        expected = unname(expected_types[names(observed_types)])
    )
    type_mismatches <- type_comparison %>% dplyr::filter(observed != expected)
    if (nrow(type_mismatches) > 0)
    {
        return(type_mismatches)
    } else {return(NULL)}
}
