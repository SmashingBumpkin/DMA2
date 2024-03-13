# Libraries
# Load the necessary libraries for the script
# The 'datasets' library provides access to various built-in datasets in R,
# allowing us to easily load and work with these datasets.
library(datasets)

# The 'MASS' library contains functions related to statistical modeling, such as
# fitting linear and generalized linear models, clustering, and more.
library(MASS)

# The 'ggplot2' library is a powerful data visualization library in R,
# which enables the creation of high-quality and customizable plots and charts.
library(ggplot2)

# mtcars dataset
# Display the first few rows of the mtcars dataset
# The 'mtcars' dataset is a built-in dataset in R, which contains information
# about various car models. By using the 'head()' function, we can view the
# first few rows of the dataset to get a quick overview of its structure and contents.
head(mtcars)
summary(mtcars)
plot(density(mtcars$mpg)) #plots density function of mpg
plot(mtcars$mpg, mtcars$wt, main = "MPG vs Weight", xlab = "Miles per Gallon", ylab = "Weight")

hist(mtcars$mpg, main = "Histogram of Miles per Gallon", xlab = "Miles per Gallon", ylab = "Count")

t.test(mtcars$mpg ~ mtcars$am, var.equal = TRUE)
#compares the two groups

t.sim <- function(v1, v2, ns, lim) {
  n <- 50000  # The number of iterations to simulate the distribution of sample means
  sds <- sd(c(v1, v2))  # Calculate the standard deviation of the combined samples
  mu <- mean(c(v1, v2))  # Calculate the mean of the combined samples
  meanDIFF <- rep(NA, n)  # Initialize an empty vector to store the differences in sample means
  # Perform the simulation of sample means
  for (i in 1:n) {
    g <- rnorm(ns, mu, sds)  # Generate a random sample 'g' from a normal distribution with mean 'mu' and standard deviation 'sds'
    k <- rnorm(ns, mu, sds)  # Generate another random sample 'k' from the same distribution
    meanDIFF[i] <- mean(g) - mean(k)  # Calculate the difference in sample means and store it in the vector
  }
  # Plotting the histogram of the differences in sample means
  hist(meanDIFF, xlim = c(-lim, lim))  # Create a histogram to visualize the distribution of sample means
  ourDIFF <- mean(v1) - mean(v2)  # Calculate the difference in means for the original samples
  segments(ourDIFF, 0, ourDIFF, 10000, col = "red")  # Add a red vertical line to the histogram representing the difference in means of the original samples
}

# Apply custom function to the mtcars dataset
# This line applies the custom function 't.sim' to the 'mtcars' dataset with specific arguments.
# It compares the 'mpg' (miles per gallon) values for two groups in the 'mtcars' dataset based on the 'am' variable.
# The first argument, 'mtcars[mtcars$am == 0, "mpg"]', represents the 'mpg' values for the group where 'am' equals 0 (automatic transmission).
# The second argument, 'mtcars[mtcars$am == 1, "mpg"]', represents the 'mpg' values for the group where 'am' equals 1 (manual transmission).
# The third argument, '20', specifies the sample size for each iteration of the simulation.
# The fourth argument, '10', defines the range of the x-axis in the resulting histogram.

t.sim(
  mtcars[mtcars$am == 0, "mpg"],  # Select 'mpg' values for the group with automatic transmission
  mtcars[mtcars$am == 1, "mpg"],  # Select 'mpg' values for the group with manual transmission
  20,  # Set the sample size for each iteration to 20
  10   # Set the range of the x-axis in the histogram to -10 to 10
)

gg <- ggplot(mtcars, aes(x = mpg, y = wt, color = factor(cyl)))
gg + geom_point() +
  # Customize plot labels
  # 'labs' function is used to customize the plot labels.
  # 'title = "MPG vs Weight"' sets the title of the plot as "MPG vs Weight",
  # 'x = "Miles per Gallon"' sets the label for the x-axis as "Miles per Gallon",
  # 'y = "Weight"' sets the label for the y-axis as "Weight".
  labs(title = "MPG vs Weight", x = "Miles per Gallon", y = "Weight") +
  geom_abline(intercept = 0 + 37.2851/5.3445, slope = -1/5.3, color = "red")

######EXERCISE 1
#Linear Regression Exercise: 
#Perform a linear regression analysis using MPG as the dependent variable
#and weight (wt) as the independent variable. 
#Provide an interpretation of the coefficients
a <- lm(mtcars$mpg~mtcars$wt) 
summary(a)

######EXERCISE 2
#Use ggplot2 to create a visualization that combines multiple variables 
#(e.g., MPG, cylinder count, and weight) in a creative way.

mygg <- ggplot(mtcars,aes(x = hp/wt, y= qsec, col=am))
mygg + geom_point()
