### formats factor levels to integers after cut is applied to a continuous variable
library(plyr)
x <- factor(c("[0,5.34241234]","(5.34241234,20.35648)","[0,5.34241234]","[0,5.34241234]","(5.34241234,20.35648)","(5.34241234,20.35648)","(5.34241234,20.35648)",NA,NA,NA))
lvl.rfmt <- function(lvl.input){
  lwr <- as.character(round(as.numeric(substr(lvl.input,2,sapply(gregexpr(pattern=',',lvl.input),"[[",1)-1))))
  uppr <- as.character(round(as.numeric(substr(lvl.input,sapply(gregexpr(pattern=',',lvl.input),"[[",1)+1,nchar(lvl.input)-1))))

  inside <- paste(lwr,uppr,sep=', ')

  l.delim <- substr(lvl.input,1,1)
  r.delim <- substr(lvl.input,nchar(lvl.input),nchar(lvl.input))

  paste(l.delim,inside,r.delim,sep="")
}

lvl.rfmt(levels(x))

x
x <- mapvalues(x,from=levels(x),to=lvl.rfmt(levels(x)))
x
x <- addNA(x)
x
