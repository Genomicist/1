#' Reading a string containing the relative path of the input csv file and returns the dataframe containing the data within the csv.
#'
#' @param Csv IN QUOTES: Relative path to the 'gene_presence_absence.csv' Roary output file.

input_csv <- function(Csv){
  if(!stringr::str_detect(Csv,stringr::regex('.csv',ignore_case = TRUE))){
    stop('The table is not a csv file, please check the file')
  }
  read.csv(here::here(Csv))
}
