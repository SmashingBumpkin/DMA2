# Load required libraries

library(ggplot2)  # For creating visualizations
library(reshape2) # For reshaping data

# Dataset: Iris
data(iris)

# Histogram
hist(iris$Sepal.Length, main = "Histogram", xlab = "Sepal Length", ylab = "Frequency")

# The histogram shows the distribution of the Sepal Length variable.
# It provides information about the frequency or count of different Sepal Length values.

# Probability Density Function (PDF)
ggplot(data.frame(x = iris$Sepal.Length), aes(x = x)) +
  stat_function(fun = dnorm, args = list(mean = mean(iris$Sepal.Length), sd = sd(iris$Sepal.Length)), color = "blue") +
  labs(title = "PDF", x = "Sepal Length", y = "Density")

# Cumulative Density Function (CDF)
ggplot(data.frame(x = iris$Sepal.Length), aes(x = x)) +
  stat_function(fun = pnorm, args = list(mean = mean(iris$Sepal.Length), sd = sd(iris$Sepal.Length)), color = "red") +
  labs(title = "CDF", x = "Sepal Length", y = "Probability")

# Complementary Cumulative Density Function (CCDF) {the reverse of CDF}
ggplot(data.frame(x = iris$Sepal.Length), aes(x = x)) +
  stat_function(fun = function(x) 1 - pnorm(x, mean = mean(iris$Sepal.Length), sd = sd(iris$Sepal.Length)), color = "green") +
  labs(title = "CCDF", x = "Sepal Length", y = "Probability")

# Box plot
boxplot(iris$Sepal.Length, main = "Box Plot")

# QQ plot
qqnorm(iris$Sepal.Length) #Compares sepal length against the normal distribution
#If the points 100% follow the diagonal, the distribution is perfectly normal
qqline(iris$Sepal.Length)
