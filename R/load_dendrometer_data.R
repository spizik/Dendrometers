#' load_dendrometer_data
#'
#' return data.frame
#' 
#' @param data_folder input data folder
#' @param definies output format (list or data.frame)
#' @keywords load data
#' @export
#' @examples
#' load_dendrometer_data()
load_dendrometer_data<-function(data_folder,output_format="data.frame"){
  
  # # testing files
  # data_folder="Dendrometer_data/Eustaska"
  # output_format="data.frame"
  
  # load file names of dataset for site
  files<-list.files(data_folder)
  
  # initialize output list
  output<-list()
  
  # for cycle for data loading
  for(i in files){
    # using file names to label list elements
    # print(i)
    output[[i]]<-read.xlsx(paste0(data_folder,"/",i))
  }
  
  # changing output file type if necessary
  if(output_format=="list") output<-output
  if(output_format=="data.frame"){ 
    output<-do.call(rbind.fill,output)
    rownames(output)<-c(1:nrow(output))  
  }
  
  return(output)
}