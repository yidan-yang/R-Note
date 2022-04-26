# data anonymize ####
library(data.table)
library(digest)
library(knitr)
library(dplyr)

# anonymize function
anonymize <- function(x, algo="crc32"){
  unq_hashes <- vapply(unique(x), function(object) digest(object, algo=algo), 
                       FUN.VALUE="", USE.NAMES=TRUE)
  unname(unq_hashes[x])
}

# load in data: sleep
data1 <- sleep
# convert data frame to data table, anonymize function only valid for data table
setDT(data1)
# choose cols to encrypt
cols_to_encrypt <- c("ID")
# backup original data
data1_org <- copy(data1)
# copy col ID for check
data1new <- data1 %>% dplyr::mutate(ID_copy = ID)

# anonymize
data1new[, (cols_to_encrypt) := lapply(.SD, anonymize), .SDcols = cols_to_encrypt, with= FALSE]

# check
data1new

#==========================================#
# check duplicated ID
ID_occur <- data.frame(table(data1new$ID_copy))
# ID occur more than once
ID_occur_more_than_once <- ID_occur[ID_occur$Freq > 1,]
# check
check1 <- data1new %>% dplyr::filter(ID_copy == 2)
check1

# 4/25