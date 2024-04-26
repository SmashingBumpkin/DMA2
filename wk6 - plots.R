# Load required libraries
library(ggplot2)  # For creating visualizations

# Dataset: Iris
data(iris)

# Scatter plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Scatter Plot of Sepal Length vs. Sepal Width", x = "Sepal Length", y = "Sepal Width")


# A scatter plot shows the relationship between two numeric variables.
# In this example, we plot Sepal Length against Sepal Width and use different colors to distinguish the different species of Iris flowers.

# Bar plot
ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar() +
  labs(title = "Bar Plot of Iris Species", x = "Species", y = "Count")


# A bar plot visualizes the distribution or frequency of a categorical variable.
# In this example, we plot the count of each Iris species using different fill colors.

# Line plot
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species, group = Species)) +
  geom_line() +
  labs(title = "Line Plot of Petal Length vs. Petal Width", x = "Petal Length", y = "Petal Width")


ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species, group = Species)) +
  geom_point() +
  labs(title = "Line Plot of Petal Length vs. Petal Width", x = "Petal Length", y = "Petal Width")


# A line plot shows the relationship between two numeric variables, connecting the data points with lines.
# In this example, we plot Petal Length against Petal Width and use different colors to distinguish the different species.

# Box plot
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Box Plot of Sepal Length by Species", x = "Species", y = "Sepal Length")


# A box plot visualizes the summary statistics of a numeric variable within different categories.
# In this example, we plot the distribution of Sepal Length for each Iris species using different fill colors.

# Heatmap
matrix_data <- cor(iris[, 1:4])  # Calculate correlation matrix
library(reshape2)
ggplot(data = melt(matrix_data), aes(x = Var2, y = Var1, fill = value)) +
 geom_tile() +
  labs(title = "Heatmap of Correlation Matrix", x = "Variable 2", y = "Variable 1", fill = "Correlation")
# A heatmap displays the patterns and relationships within a matrix of values.
# In this example, we plot the correlation matrix of the numeric variables in the Iris dataset, with darker colors representing higher correlations.


# Pairwise scatter plot matrix
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid(Species ~ .) +
  labs(title = "Pairwise Scatter Plot Matrix", x = "Sepal Length", y = "Sepal Width")
