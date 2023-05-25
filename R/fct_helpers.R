#' helpers
#'
#' @description Adds number to all numeric values
#'
#' @return df with added numbers
#'
#' @noRd

add_number_to_df <- function(df, number = 5){
  df %>%
    mutate(dplyr::across(where(is.numeric), ~ .x + number))
}

