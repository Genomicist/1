#' Reading a string containing the relative path of the input csv file and returns the dataframe containing the data within the csv.
#'
#' @export

input_csv <- function(Csv){
  if(!str_detect(Csv,regex('.csv',ignore_case = TRUE))){
    stop('The table is not a csv file, please check the file')
  }
  read.csv(here(Csv))
}
