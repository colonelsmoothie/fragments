library(ggplot2)
library(MASS)

bacteria2 <- bacteria[which(names(bacteria) != "ID")]

for(i in 1:length(bacteria2)){
  print(ggplot(bacteria2,aes_string(x=names(bacteria2[i]))) + 
          geom_histogram())