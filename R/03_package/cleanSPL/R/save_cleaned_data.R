#' Save cleaned data to file(s) named based on the original file name
#'
#' @param clean_df Data frame containing cleaned data to save
#' @param original_path Path to original data file that has been cleaned
#' @param save_rds bool; whether to save data to an RDS file
#' @param save_csv book; whether to save data to a CSV file
#'
#' @return Returns NULL; saves data to the current working dir with a filename
#'         based on original_path.
#' @export
save_cleaned_data <- function(clean_df, original_path, save_rds=TRUE, save_csv=TRUE, cleaned_modifier='_cleaned') {
    outfile_prefix <- tools::file_path_sans_ext(basename(original_path))
    if (save_rds) {saveRDS(cleaned,
                           file = paste0(outfile_prefix, cleaned_modifier, ".rds"))}
    if (save_csv) {write.csv(cleaned,
                             file = paste0(outfile_prefix, cleaned_modifier, ".csv"),
                             row.names=FALSE)}
    return(NULL)
}
