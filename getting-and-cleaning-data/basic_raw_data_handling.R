fileUrl <- "http://download.inep.gov.br/microdados/microdados_censo_superior_2014.zip"
download.file(fileUrl, destfile="censo_superior_2014.zip")

censo <- read.table("dm_curso.csv", sep = ",", header = TRUE)


## Reading excel files

colIndex <- 2:3
rowIndex <- 1:4

cameraDataSubset <- read.xlsx("data.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)