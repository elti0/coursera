corr <- function(directory, threshold = 0) {
  files_list <- list.files(directory, full.names=TRUE)
  com <- complete(directory)
  ids <- com[com$nobs > threshold, ]
  dat <- data.frame()
  output <- vector()
  for (i in ids$id){
    dat <- read.csv(files_list[i])
    clean_data <- dat[complete.cases(dat),]
    output <- append(output, cor(clean_data$sulfate, clean_data$nitrate))
    }
  return(output)
}