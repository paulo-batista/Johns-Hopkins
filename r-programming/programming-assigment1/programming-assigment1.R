pollutantmean <- function(directory, pollutant, idv = 1:332) {
  allFiles <- list.files(directory, pattern = "*.csv", full.names = TRUE)
  df <- do.call("rbind", lapply(c(allFiles), function(fn) 
  data.frame(filename=fn, read.csv(fn, header = TRUE, sep = ","))))
  df = df[complete.cases(df),]
  avg = mean(df[[pollutant]][df$ID==idv])
  return(avg)
}