pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  
  ## v <- vector()
  allFiles <- list.files(directory, pattern = "*.csv", full.names = TRUE)
  df <- do.call("rbind", lapply(c(allFiles), function(fn) 
  data.frame(filename=fn, read.csv(fn, header = TRUE, sep = ","))))
  df <- df[complete.cases(df),]

 ## for (i in id) {
 ##   d <- df[,pollutant]
 ##   v <- c(v, d)
 ## }  
  
  
  
  avg <- mean(df[[pollutant]][df$ID>=id[1] & df$ID<=id[2]])
    
  return(avg)
  
}