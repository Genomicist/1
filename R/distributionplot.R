#' Gene number distribution plot across a given number of genomes in a population.
#'
#' @param Csv IN QUOTES: Relative path to the 'gene_presence_absence.csv' Roary output file.
#' @param Scale IN QUOTES: The choosing for continuous ('con') or log ('log') scale. Default as 'con'.
#' @param Name IN QUOTES: The name of the saved output plot. The plot will be automatically saved in PNG format thus no need to specify extension.
#'
#' @return
#' A plot showing the distribution of genes present in a given number of genomes in a population
#' @export
#'
#' @import dplyr
#'          ggplot2
#'
#' @examples
#' distributionplot("testdata/campylobacter.csv","con","test_campy")
#'
distributionplot <- function(Csv,Scale,Name) {
  Table <- input_csv(Csv)
  if(Scale!="con" & Scale!="log"){
    print('Scale is neither "con" or "log", scaling in continuous by default')
  }
  #Cleaning the table to discard unuseful columns. Summarises the number of individuals that each gene is absent in, and subtracting it by the total number of individuals to get the presence.
  presence <- Table %>%
    select (!c(1:14)) %>%
    na_if("") %>%
    rowwise %>%
    summarise (presence= ncol(Table)- 14 - sum(is.na(c_across(everything())))) %>%
    count (presence)
  #Making a ggplot with the scale depending on the arguement "Scale".
    plot1 <- presence %>% ggplot2::ggplot(aes(presence,n) )+
    geom_col()+
    xlab('Number of isolates that a gene is present in')+
    ylab('Number of genes')+
    ggtitle("Gene presence distribution")+
    theme_minimal()+
    if(Scale =="log"){
      scale_y_log10()
    }else{
      scale_y_continuous()}
  ggsave(here::here('results',paste(Name,".png",sep='')),plot = plot1)
  return(plot1)
}
