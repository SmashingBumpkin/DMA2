
# Load required libraries
library(ggplot2)  # For creating visualizations

# Generate a sequence of values
x <- seq(0, 10, length.out = 100)



######### NORMAL DISTRIBUTION ###########

normal_pdf <- dnorm(x, mean = 5, sd = 2)
#plots probability density function
ggplot(data.frame(x = x, y = normal_pdf), aes(x = x, y = y)) +
  geom_line(color = "blue") +
  labs(title = "Normal Distribution", x = "x", y = "PDF")


normal_cdf <- pnorm(x, mean = 5, sd = 2)
#probability X <= x, the cumulative density function CDF
ggplot(data.frame(x = x, y = normal_cdf), aes(x = x, y = y)) +
  geom_line(color = "red") +
  labs(title = "Normal Distribution", x = "x", y = "CDF")

normal_ccdf <- 1 - normal_cdf
#probability X >= x, the complementary cumulative density function CCDF
ggplot(data.frame(x = x, y = normal_cdf), aes(x = x, y = y)) +
  geom_line(color = "red") +
  labs(title = "Normal Distribution", x = "x", y = "CDF")




######### UNIFORM DISTRIBUTION ###########

# Uniform Distribution (ie P = 1/(b-a))
uniform_pdf <- dunif(x, min = 2, max = 8)
ggplot(data.frame(x = x, y = uniform_pdf), aes(x = x, y = y)) +
  geom_line(color = "blue") +
  labs(title = "Uniform Distribution", x = "x", y = "PDF")

#CDF and CCDF of uniform
uniform_cdf <- punif(x, min = 2, max = 8)
ggplot(data.frame(x = x, y = uniform_cdf), aes(x = x, y = y)) +
  geom_line(color = "red") +
  labs(title = "Uniform Distribution", x = "x", y = "CDF")

uniform_ccdf <- 1 - uniform_cdf
ggplot(data.frame(x = x, y = uniform_ccdf), aes(x = x, y = y)) +
  geom_line(color = "green") +
  labs(title = "Uniform Distribution", x = "x", y = "CCDF")



######### EXPONENTIAL DISTRIBUTION ###########
exponential_pdf <- dexp(x, rate = 0.5)

#PDF
ggplot(data.frame(x = x, y = exponential_pdf), aes(x = x, y = y)) +
  geom_line (color = "blue") +
  labs(title = "Exponential Distribution", x = "x", y = "PDF")

#CDF
exponential_cdf <- pexp(x, rate = 0.5)
ggplot(data.frame(x = x, y = exponential_cdf), aes(x = x, y = y)) +
  geom_line(color = "red") +
  labs(title = "Exponential Distribution", x = "x", y = "CDF")

#CCDF
exponential_ccdf <- 1 - exponential_cdf
ggplot(data.frame(x = x, y = exponential_ccdf), aes(x = x, y = y)) +
  geom_line(color = "green") +
  labs(title = "Exponential Distribution", x = "x", y = "CCDF")



######### CHI-SQUARED DISTRIBUTION ###########
# The CCDF (Complementary Cumulative Distribution Function) of the Exponential Distribution gives the probability that a value from the distribution is greater than a given value.

# Chi-Squared Distribution
df <- 4  # Degrees of freedom
chi_squared_pdf <- dchisq(x, df = df)
ggplot(data.frame(x = x, y = chi_squared_pdf), aes(x = x, y = y)) +
  geom_line(color = "blue") +
  labs(title = "Chi-Squared Distribution (df = 4)", x = "x", y = "PDF")

#CDF
chi_squared_cdf <- pchisq(x, df = df)
ggplot(data.frame(x = x, y = chi_squared_cdf), aes(x = x, y = y)) +
  geom_line(color = "red") +
  labs(title = "Chi-Squared Distribution (df = 4)", x = "x", y = "CDF")

#CCDF
chi_squared_ccdf <- 1 - chi_squared_cdf
ggplot(data.frame(x = x, y = chi_squared_ccdf), aes(x = x, y = y)) +
  geom_line(color = "green") +
  labs(title = "Chi-Squared Distribution (df = 4)", x = "x", y = "CCDF")



######### STUDENTS T-DISTRIBUTION ###########
# The CCDF of the Chi-Squared Distribution gives the probability that a value from the distribution is greater than a given value.

# Student's t-Distribution
df <- 6  # Degrees of freedom

#pdf
t_pdf <- dt(x, df = df)
ggplot(data.frame(x = x, y = t_pdf), aes(x = x, y = y)) +
  geom_line(color = "blue") +
  labs(title = "Student's t-Distribution (df = 6)", x = "x", y = "PDF")

#CDF
t_cdf <- pt(x, df = df)
ggplot(data.frame(x = x, y = t_cdf), aes(x = x, y = y)) +
  geom_line(color = "red") +
  labs(title = "Student's t-Distribution (df = 6)", x = "x", y = "CDF")

#CCDF
t_ccdf <- 1 - t_cdf#
ggplot(data.frame(x = x, y = t_ccdf), aes(x = x, y = y)) +
  geom_line(color = "green") +
  labs(title = "Student's t-Distribution (df = 6)", x = "x", y = "CCDF")



##########EXERCISE 1
# 
# - **Objective**: Examine the distribution of Sepal Length in the iris dataset.
# - **Task**: Assuming Sepal Length follows a normal distribution, plot its PDF 
#using the actual mean and standard deviation of Sepal Length in the iris dataset. 
#Overlay the actual histogram of Sepal Length to compare the empirical distribution 
#with the theoretical normal distribution. Discuss any deviations observed.
library(ggplot2)
library(datasets)

# Calculate mean and standard deviation of Sepal.Length
mean_sepal_length <- mean(iris$Sepal.Length)
sd_sepal_length <- sd(iris$Sepal.Length)

# Generate a sequence of values
x <- seq(4, 8, length.out = 100)
sepal_length_normal_pdf <- dnorm(x, mean = mean_sepal_length, sd = sd_sepal_length)

# Create a dataframe for the normal distribution curve
df_normal <- data.frame(x = x, y = sepal_length_normal_pdf)

#Do a ks test to check how well the data fits to a standard
ks_result_norm <- ks.test(iris$Sepal.Length, "pnorm", mean = mean(iris$Sepal.Length),
                     sd = sd(iris$Sepal.Length))

df = 5
chi_squared_cdf <- dchisq(x, df=df)
ggplot(data.frame(x = x, y = chi_squared_cdf), aes(x = x, y = y)) +
  geom_line(color = "red") +
  labs(title = "Chi-Squared Distribution (df = 4)", x = "x", y = "CDF")
ks_result_chisq <- ks.test(iris$Sepal.Length, "pchisq", df = 4)

# Plot histogram and normal distribution
ggplot() +
  geom_histogram(data = iris, aes(x = Sepal.Length, y = ..density..), bins = 10, fill = "lightblue", color = "black") +
  geom_line(data = df_normal, aes(x = x, y = y), color = "blue") +
  labs(title = "Sepal Length Distribution and Normal Distribution", x = "Sepal Length", y = "Density") +
  theme_minimal()

#Note that the first half of the data is quite skewed in comparison
#to the PDF



##########EXERCISE 2
library(ggplot2)
library(datasets)

# Generate a sequence of values
x <- seq(2, 4.4, length.out = 50)
sepal_width_uniform_pdf <- dunif(x, min = 2, max = 4.4)

# Create a dataframe for the normal distribution curve
df_uniform <- data.frame(x = x, y = sepal_width_uniform_pdf)

# Plot histogram and normal distribution
ggplot() +
  geom_histogram(data = iris, aes(x = Sepal.Width, y = ..density..), bins = 10, fill = "lightblue", color = "black") +
  geom_line(data = df_uniform, aes(x = x, y = y), color = "blue") +
  labs(title = "Sepal Length Distribution and Normal Distribution", x = "Sepal Width", y = "Density") +
  theme_minimal()

#Note that the first half of the data is quite skewed in comparison
#to the PDF


##########EXERCISE 3
#   ### Exercise 3: Exponential Distribution and Flower Characteristics
#   
#   - **Objective**: Explore an exponential distribution fitting for time-related flower data.
# - **Task**: Imagine a scenario where the time between the flowering of one iris
#and the next follows an exponential distribution. Choose either the Sepal Length
#or Petal Length as a proxy for flowering time. Estimate the rate parameter 
#(\(\lambda\)) as the inverse of the mean of your chosen variable. Plot the PDF 
#and discuss the implications if flowering times indeed followed this distribution.
x = iris$Sepal.Length
x = sort(x)
mean_x = mean(x)
lambda = 1/mean_x
exponential_pdf <- dexp(x, rate = lambda)
df_uniform <- data.frame(x = x, y = exponential_pdf)
ggplot() +
  geom_histogram(data = iris, aes(x = Sepal.Length, y = ..density..), bins = 10, fill = "lightblue", color = "black") +
  geom_line(data = df_uniform, aes(x = x, y = exponential_pdf), color = "blue") +
  labs(title = "Sepal Length Distribution and Normal Distribution", x = "Sepal Width", y = "Density") +
  theme_minimal()
