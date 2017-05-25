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

  
  nobs <- function(id) {
    path <- file.path(directory, paste(sprintf("%03d", as.numeric(id)), ".csv", sep=""))
    return (sum(complete.cases(read.csv(path))))
  }
  return (data.frame(id=id, nobs=sapply(id, nobs)))
}

## Correlations v1
## Date: 25.05.2017


corr <- function(directory, threshold = 0) {

  tcorr <- function(fname) {
    data <- read.csv(file.path(directory, fname))
    nobs <- sum(complete.cases(data))
    if (nobs > threshold) {
      return (cor(data$nitrate, data$sulfate, use="complete.obs"))
    }
  }
  tcorrs <- sapply(list.files(directory), tcorr) #get all correlations + NULLs
  tcorrs <- unlist(tcorrs[!sapply(tcorrs, is.null)]) #remove NULLs
  return (tcorrs)
}