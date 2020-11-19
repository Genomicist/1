#' Reading a string containing the relative path of the input csv file and returns the dataframe containing the data within the csv.
#'

input_csv <- function(Csv){
  if(!stringr::str_detect(Csv,stringr::regex('.csv',ignore_case = TRUE))){
    stop('The table is not a csv file, please check the file')
  }
  read.csv(here::here(Csv))
}
