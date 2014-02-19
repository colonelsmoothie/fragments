# suppose you want to sort by a column in a data frame

# declare data frame - var1 not in alphabetical order
mydf <- data.frame(var1=c("c","b","a"),var2=c(1,2,3))
mydf

# sort by var1 using order() function
mydf <- mydf[order(mydf$var1),]
mydf
