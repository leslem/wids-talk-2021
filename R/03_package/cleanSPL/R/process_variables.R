process_materialtype <- function(df) {
    return(stringr::str_to_lower(df[['materialtype']]))
}

process_publicationyear <- function(df){
    extracted_years <- stringr::str_extract_all(df[['publicationyear']], '\\d{4}')
    new_df <- data.frame(
        publicationyear_csv = sapply(extracted_years, FUN=paste0, collapse=','),
        publicationyear_earliest = sapply(extracted_years,
                                          FUN=function(x){ifelse(length(x) == 0,
                                                                 NA,
                                                                 min(as.numeric(x)))}),
        publicationyear_latest = sapply(extracted_years,
                                        FUN=function(x){ifelse(length(x) == 0,
                                                               NA,
                                                               max(as.numeric(x)))})
    )
    return(new_df)
}
