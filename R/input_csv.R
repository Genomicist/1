library(tidyverse)
library(here)

input_csv <- function(Csv){
  if(!str_detect(Csv,regex('.csv',ignore_case = TRUE))){
    stop('The table is not a csv file, please check the file')
  }
  read.csv(here(Csv))
}
