library(ggplot2)
library(reshape2)

path = "C:/Users/rfzheng/Desktop/Udacity/R/average_usage"
target_col = "kWh"
index_col = "Time"
setwd(path)


#loop through all csv files in the given path
csv_files = list.files(pattern="*.csv")
size_temp = length(csv_files)

main <- function(){
  if (size_temp >0){
    
    # loop throught all csv files
    for(i in 1:size_temp){
      # main
      result <- parse_file(i, csv_files[i])
      next
    }
    return(result)
  } 
}


# parse data
parse_file <- function(index, f_name){
  db <- fetch_data(f_name)
  if(index == 1){
    # set up for first time
    db_all <<- db
    
  }
  #normalise dataset
  db_all[[f_name]] <<- norm(db[,f_name])
  return(db_all)
}

fetch_data <-function(f_name){
  db_raw = read.csv(f_name)
  dic_db = list(db_raw$Time)
  index_Time <- grep(target_col, colnames(db_raw))
  #fetch target column
  db <- aggregate(db_raw[, index_Time], dic_db, mean)
  #rename fetched database
  colnames(db)[1] <- index_col
  colnames(db)[2] <- f_name
  #sort data by on index
  db <- db[order(db$Time),]
  return(db)
}


# normlise data in percentage format
norm <- function(col_val){
  db_sum = sum(col_val)
  col_val / db_sum
}

# Plot graph
draw_graph <- function(){
  db_tran <- melt(db_all, id.vars=index_col)
  ggplot(db_tran, aes(db_tran[,index_col],value, col=variable), geom = "line") +
    geom_point()
}
 
#extract file name
rename_file <- function(f_name){
  
  return(result)
}

main()
draw_graph()



