dummy <- c()
dummy$Name <- as.factor(c("level1","level1","level2","level2", NA, NA))
dummy$V1 <- c(1,2,3,4,5,6)
dummy$V2 <- c(7,8,9,10,11,12)
dummy


dummy.agg <- aggregate(cbind(V1,V2)~Name, FUN=sum,data=dummy,na.action=na.pass)
# run this, notice <NA> is not one of the aggregated levels:
dummy.agg


### addNA adds NA as a factor level
dummy$Name <- addNA(dummy$Name)
dummy.agg <- aggregate(cbind(V1,V2)~Name, FUN=sum,data=dummy,na.action=na.pass)
dummy.agg

### if passing a transformed vector to aggregate(), make sure to use addNA as well

#wrong
transformed.name <- substr(dummy$Name,5,6)
transformed.name
dummy.agg <- aggregate(cbind(V1,V2)~transformed.name, FUN=sum,data=dummy,na.action=na.pass)
dummy.agg

#right
transformed.name <- as.factor(substr(dummy$Name,5,6))
transformed.name <- addNA(transformed.name)
dummy.agg <- aggregate(cbind(V1,V2)~transformed.name, FUN=sum,data=dummy,na.action=na.pass)
dummy.agg
