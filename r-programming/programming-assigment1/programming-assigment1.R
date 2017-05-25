## Author: Paulo Batista
## University: Johns Hopkins
## Course: Data Science Specialization
## Module: R Programming
## Week: Week1

## pollutantmean v1
## Date: 25.05.2017

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ## set to allFiles all listed files into directory
  allFiles <- list.files(directory, pattern = "*.csv", full.names = TRUE)
  
  ## read all files and set it to df (data frame) variable
  df <- do.call("rbind", lapply(c(allFiles), function(fn) 
  data.frame(filename=fn, read.csv(fn, header = TRUE, sep = ","))))
  
  ## calculate the mean removing NA values based of Pollutant criteria
  b = id[1]+length(id)-1
  avg <- mean(df[[pollutant]][df$ID>=id[1] & df$ID<=b], na.rm = TRUE)
  
  ## Return Average of Pollutant  
  return(avg)

}

## Complete v1
## Date: 25.05.2017

complete <- function(directory, id = 1:332) {
  nobs = rep(1, length(id))
  fileId = rep(1, length(id))
  for (k in 1:length(id)){
    position = id[k]
    fileNum = sprintf("%03d", position)
    fileName = paste(directory, fileNum, sep = "/")
    fileNameType = paste(fileName, ".csv", sep = "")
    data <- read.csv(fileNameType)
    clData=na.omit(data)
    fileId[k] = fileNum
    nobs[k] = nrow(clData)
    
  }
  rtable <- data.frame(fileId, nobs)
  return(rtable)
}

