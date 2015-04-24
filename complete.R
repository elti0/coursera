complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  for (i in id) {
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  name_col <- c("id", "nobs")
  #output <- matrix(nrow=0, ncol = 2, dimnames = list(NULL,names))
  output <- data.frame()
  sub_set <- data.frame()
  for (i in id){
    nobs <- sum(complete.cases(dat[dat$ID == i,]))
    output <- rbind(output,c(i,nobs))
  }
  names(output) <- name_col
  return(output)
}