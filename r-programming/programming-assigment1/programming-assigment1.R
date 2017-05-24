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
  
  print (id[1])
  print (id[1]+length(id))
  b = id[1]+length(id)
  
  
  avg <- mean(df[[pollutant]][df$ID>=id[1] & df$ID<b])
    
  return(avg)
  
}