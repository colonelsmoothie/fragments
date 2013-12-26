# Code used to generate a plot with two y-axes via ggplot2. This isn't considered good statistical practice but the code is here should clients demand it.
# All the work was done by "koskhe" at http://rpubs.com/kohske/dual_axis_in_ggplot2
# I only made minor cosmetic changes to suit my purposes

library(ggplot2)
library(gtable)
library(grid)
library(MASS)

## Import birthwt dataset for plotting, get average birthweight by age
birthwt2 <- birthwt
birthwt2 <- aggregate(bwt~age,FUN=mean,data=birthwt2,na.action=na.pass)


grid.newpage()

# two plots
p1 <- ggplot(birthwt, aes(x=age)) + geom_histogram(colour="black",fill="grey")+ ggtitle("I <3 Dismal Science !!!!")+ theme_bw()+
  theme(plot.title=element_text(size=rel(1.5), lineheight=.9, family="Times",
                                face="bold"), panel.grid.major.y = element_blank(), panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.minor.x = element_blank()) 
p2 <- ggplot(birthwt2, aes(age, bwt)) + geom_line(colour = "blue",size=1) + theme_bw() %+replace% 
  theme(panel.background = element_rect(fill = NA), panel.grid.major.y = element_blank(), panel.grid.major.x = element_blank(),panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.minor.x = element_blank())  

# extract gtable
g1 <- ggplot_gtable(ggplot_build(p1))
g2 <- ggplot_gtable(ggplot_build(p2))

# overlap the panel of 2nd plot on that of 1st plot
pp <- c(subset(g1$layout, name == "panel", se = t:r))
g <- gtable_add_grob(g1, g2$grobs[[which(g2$layout$name == "panel")]], pp$t, 
                     pp$l, pp$b, pp$l)

# axis tweaks
ia <- which(g2$layout$name == "axis-l")
ga <- g2$grobs[[ia]]
ax <- ga$children[[2]]
ax$widths <- rev(ax$widths)
ax$grobs <- rev(ax$grobs)
ax$grobs[[1]]$x <- ax$grobs[[1]]$x - unit(1, "npc") + unit(0.15, "cm")
g <- gtable_add_cols(g, g2$widths[g2$layout[ia, ]$l], length(g$widths) - 1)
g <- gtable_add_grob(g, ax, pp$t, length(g$widths) - 1, pp$b)

# draw it
grid.draw(g)