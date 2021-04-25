#' Check data types match expected
#'
#' @param df Data frame to check column types for
#' @param expected_types Named vector with colname = datatype pairs;
#'                       datatype should be the result of typeof() on the column
#'
#' @return TRUE if all datatype match; FALSE if not
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
    data_type_mismatches <- data_type_comparison %>% dplyr::filter(observed != expected)
    if (nrow(data_type_mismatches) > 0)
    {
        print(data_type_mismatches)
        return(FALSE)
    } else {return(TRUE)}
}
