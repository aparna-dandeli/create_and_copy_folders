# Aparna K
# Code to create folders and move the input folders based on a input table

# Setup -------------------------------------------------------------------
library(R.utils)
setwd("E:/Aparna/Corridor/Control Road 2023/")

df <- read.csv("input.csv")
chk <- list.dirs(path ="./Downloads/",
                 full.names = FALSE, recursive= FALSE)



# copy files and folders based on input file df ---------------------------


for(i in 1: length(chk)){
  
  for (j in 1:nrow(df)) {
    
    if(dir.exists( paste0( "./Downloads/", chk[i], "/", df[j,1])))
      R.utils::copyDirectory( from = paste0( "./Downloads/", chk[i], "/", df[j,1]), 
                              to = paste0( "./Tagged/", chk[i],"/", df[j,2],"/", df[j,1]))
    
    else
      print(paste0( "./Downloads/", chk[i],"/", df[j,1],
                    " does not exists for location ", df[j,2]))
    
  }
}
  

