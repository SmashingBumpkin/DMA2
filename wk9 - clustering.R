seg.raw <- read.csv('http://goo.gl/qw303p')
head(seg.raw)

plot(density(seg.raw$income))
#we can see there are 2 peaks, probably gaussian

seg.df <- seg.raw[,-7] #remove column 7
head(seg.df)

seg.summ <- function(data, groups) {
  aggregate(data, list(groups), function(x) mean(as.numeric(x)))  
}

seg.summ(seg.df, seg.raw$Segment)

c(1,2,3) - c(2,3,2)
sum((c(1,2,3) - c(2,3,2))^2)
sqrt(sum((c(1,2,3) - c(2,3,2))^2))
dist(rbind(c(1,2,3), c(2,3,2)))
library(cluster)
seg.quantitative <- seg.df[, -c(2, 5:7)]
head(seg.quantitative)
seg.dist <- daisy(seg.quantitative)       # daisy works with mixed data types
as.matrix(seg.dist)[1:4, 1:4] 
seg.hc <- hclust(seg.dist, method="complete")
plot(seg.hc)
plot(cut(as.dendrogram(seg.hc), h=0.5)$lower[[1]])
seg.df[c(101, 107), ]  # similar
seg.df[c(278, 294), ]  # similar
seg.df[c(173, 141), ]  # less similar
cor(cophenetic(seg.hc), seg.dist)

seg.hc.segment <- cutree(seg.hc, k=4)     # membership vector for 4 groups
table(seg.hc.segment)

seg.summ(seg.df, seg.hc.segment)

plot(jitter(as.numeric(seg.df$gender)) ~ 
       jitter(as.numeric(seg.df$subscribe)), 
     col=seg.hc.segment, yaxt="n", xaxt="n", ylab="", xlab="")
axis(1, at=c(1, 2), labels=c("Subscribe: No", "Subscribe: Yes"))
axis(2, at=c(1, 2), labels=levels(seg.df$gender))

seg.df.num <- seg.df
seg.df.num$gender    <- ifelse(seg.df$gender=="Male", 0, 1)
seg.df.num$ownHome   <- ifelse(seg.df$ownHome=="ownNo", 0, 1)
seg.df.num$subscribe <- ifelse(seg.df$subscribe=="subNo", 0, 1)
head(seg.df.num)

boxplot(seg.df.num$income ~ seg.k$cluster, 
        xlab="Income", ylab="Segment", horizontal=TRUE)

set.seed(96743)        # because starting assignments are random
seg.k <- kmeans(seg.df.num, centers=4)
library(cluster)
clusplot(seg.df, seg.k$cluster, color=TRUE, shade=TRUE, 
         labels=4, lines=0, main="K-means cluster plot")
#Fools errand, there aren;t clusters



library(randomForest)
set.seed(98040)
seg.rf <- randomForest(Segment ~ ., data=seg.df.train, ntree=3000)
