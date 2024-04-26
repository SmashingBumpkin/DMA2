setwd("C:/Users/Charl/OneDrive/Documents/GitHub/DMA2")
getwd()

library(ggplot2)
library(datasets)

grades = c(26, 28, 22, 23, 18, 31, 30)
mean(grades)
sd(grades) #sdev stdev standard deviation

ident <- matrix(c(1,0,0,0,1,0,0,0,1), ncol = 3,
                byrow = T)
ident
ident + 1
ident + 1:3 # adds range by rows
ident[1,2] <- 999 # assigns value
ident
t(ident) #transpose

v <- c(1,2,3)

#matrix multiplication
v %*% ident

ident %*% t(ident)

library(datasets)
summary(iris)
summary(ident) #this is "logarithmic binning" - data science slang for the cool kids who get some data about a frame
head(iris)

d <- data.frame(ident) # turn matrix into data frame
class(d)
d
names(d) <- c("Jeff","Juff","Joff") # give column names to data frame
d

set.seed(42) #Sets a seed to create repeatable random numbers

height <- rnorm(10,mean = 170, sd = 20) # creates 10 data points, mean 170, sd 20
weight <- rnorm(10, mean = 150, sd = 20)# creates 10 data points, mean 150, sd 20
head(height)

#height and weight are rounded to 4dp
height <- round(height, 2) # rounds height to 2dp

hw <- data.frame(h = height, w = weight)
head(hw)

head(hw$h) # access specific attribute from data frame

newguy <- c(140.123,100) #data.frame(height = 140, weight = 100)
hw <- rbind(hw,newguy)
hw

age <- rnorm(12,25,2)
hw$age <- age #or cbind(hw,age)
cbind(hw,age)

my_funct <- function(arg = 2){ #function syntax
  #do Stuff
  print("Im functioning")
  return(arg**2)
}
#my_funct("Jeff") #throws error since requires number
my_funct(3)
my_funct()



#CLASSES---------------------------------------
histo <- hist(iris$Sepal.Length) # create histogram object
str(histo)
class(histo)
summary(histo)


a <- lm(iris$Sepal.Length~iris$Sepal.Width) 
# creates a linear model relating length to width
str(a)

summary(a)
plot(a)
#Q-Q residuals shows what's not described so well by the model

plot(iris)


#Loops In R...grudgingly.
#if-----------------------------------------
if (1 == 1){
  a <- TRUE
} else {
  a <- FALSE
}

#else if
b <- 11
if (b%%2 == 0){
  print("even")
} else if (b%%3 == 0){
  print("divisible by 3")
} else {
  print("crappy number")
}

x <- 2
while (x < 5){
  print("hello")
  x <- x + 1
}

#for-----------------------------------------
#what do you think this will output?
for (i in 1:10){
  print(paste0(rep("!",i)))
}


#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#That being said, try not to use loops when you can use
#VECTORIZATION

i <- 1:20
j <- rep(NA,length(i))

#instead of...
for (n in i){
  j[i] <- i*11
}

#try...
j <- i*11

#instead of...
letters <- c("a","b", "c","d","e","f","g","h","i","j","k")
vowLets <- c()
vowels <- c("a","e","i","o","u")


for (let in letters){
  if (let %in% vowels){
    vowLets <- c(vowLets,TRUE) #WARNING: memory inefficient
  } else {
    vowLets <- c(vowLets, FALSE) #WARNING: memory inefficient
  }
}

#try...
vowLets2 <- ifelse(letters %in% vowels, TRUE, FALSE)
vowLets2


#apply()-------------------------------------
mat <- matrix(c(1,2,3,4,7,4,2,5,7), nrow = 3)
apply(mat,2,mean) #gets mean of teh second col

my_fun <- function(column){
  return(max(column))
}

apply(mat,1,my_fun)


age <- round(rnorm(10,40,10)) #years
height <- round(rnorm(10,140,20)) #cm?
weight <- round(rnorm(10,170,35)) #lbs

people <- data.frame(age = age, height = height, weight = weight)
head(people)
lapply(people,mean) #note, returns a LIST


peopleMAT <- as.matrix(people)
peopleMAT

apply(peopleMAT,2,mean) #not a list!

