library(tidyverse)
library(here)

distributionplot <- function(csv,scale,name) {
  if(!str_detect(Csv,regex('.csv',ignore_case = TRUE))){
    stop('The table is not a csv file, please check the file')
  }
  if(Scale!="con" & Scale!="log"){
    print('Scale is neither "con" or "log", scaling in continuous by default')
  }
  Table <- read.csv(here(Csv))
  #Cleaning the table to discard unuseful columns. Summarises the number of individuals that each gene is absent in, and subtracting it by the total number of individuals to get the presence.
  presence <- Table %>%
    select (!c(1:14)) %>%
    na_if("") %>%
    rowwise %>%
    summarise (presence= ncol(Table)- 14 - sum(is.na(c_across(everything())))) %>%
    count (presence)
  #Making a ggplot with the scale depending on the arguement "Scale".
    plot <- presence %>% ggplot(aes(presence,n) )+
    geom_col()+
    xlab('Number of isolates that a gene is present in')+
    ylab('Number of genes')+
    ggtitle("Gene presence distribution")+
    theme_minimal()+
    if(Scale =="log"){
      scale_y_log10()
    }else{
      scale_y_continuous()}
    print(plot)
  ggsave(here::here('assignment-1b',paste(Name,".png",sep='')),plot = last_plot())
}
