print("okdsfnokjsfno")
print("Ok ln2okln2, ln 2 ")
getwd()
setwd("C:/Users/Charl/OneDrive/Documents/GitHub/DMA2")
getwd()
#install.packages('X')
library(ggplot2)
library(datasets)

summary(iris)
head(iris, n= 10) # start of dataset
tail(iris) # end of dataset
plot(iris$Sepal.Length)
hist(iris$Sepal.Length)

plot(iris$Sepal.Length,iris$Sepal.Width)

iris[1:10, "Sepal.Length"]
iris$Sepal.Length

num = 7
num
num <- 5 # <- is the same as =
num = num + 3
num

name <- "Walter"
length(name)

class(num)
class(name)

ones = c(11,2,2,2,3,23,2,3,23,2,3,23,2) # creates array
ones[0]

v <- c(1,2,3,4)
v[3]

v = c(1, "chelsea")
v

v = c(name = "Jeff", height = 4)
v

mat <- matrix(c(1,0,0,0,1,0,0,0,1,1,0,1), ncol = 3)
mat
seq(1,10, length = 10)
jeff = seq(1,10, length = 5)#starting at 1, going to 10, 5 steps
jeff

jef = seq(1,length = 15, by = 2)
jef

rep(10,20)
rep(jeff,5)
rep(NA, 10) # repeat NOT AVAILABLE (or Null) 10 times

seqs <- rep(1:10,10)
seqs >= 3

any(seqs > 11) # checks if any value in seqs is gretar than 11

all(seqs >=1)# checks if all value in seqs is gretar than 5

our_names <- c("Chelsea", "John", "Jim", "Bianca", "Amy", "John", "Jake", "Tony", "Sam")
our_names = ifelse(our_names == "John", "J-Money", our_names)
our_names
which(our_names == "J-Money")

our_names == "J-Money"
our_names[our_names != "J-Money"]
