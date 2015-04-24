pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  for (i in id) {
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  round(mean(dat[, pollutant], na.rm = TRUE ),3)
}