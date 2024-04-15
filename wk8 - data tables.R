# Load required library
library(data.table)

# Example 1: Creating a data.table
dt <- data.table(
  id = c(1, 2, 3, 4, 5,6),
  name = c("John", "Jane", "Mike", "Emily", "David","David"),
  age = c(25, 32, 28, 36, 41,69)
)

#dt[ *row filtering*, *column operations*, *group by*]

# Example 2: Filtering rows based on a condition
filtered_dt <- dt[age > 30]
filtered_dt


selected_cols <-dt[,.(id,name)]
selected_cols

#Order by the age
sorted_dt <- dt[order(age)]
sorted_dt

#Selects the mean of all the people with the same name
aggregated_dt <- dt[, .(mean_age = mean(age)), by=name  ]
aggregated_dt

dt2 <- data.table(
  id = c(2, 4, 6),
  salary = c(50000, 60000, 55000)
)

#table join using id as the key
merged_dt <- dt[dt2, on = "id"]
merged_dt

#adds 1 to age of everyone over 30
dt <-dt[age > 30, age := age + 1]
dt


#adds 1 to age of everyone over 30
dt <-dt[,can_vote  := age >25]
dt


#rep is repeating the value "2001" by the number of rows
dt[, birth_year := rep("2001", nrow(dt))]

#Not needed without the repeat
dt[, birth_year := 2024 - age ]
dt


grouped_dt <- dt[, .(mean_age = mean(age), max_age = max(age), min_age = min(age)), by = name]
grouped_dt

# Example 9: Handling missing values by replacing them with a default value
dt[is.na(age), age := 0]
dt

# Example 10: Chaining operations using the data.table syntax
result <- dt[age > 30][, .(mean_age = mean(age)), by = name]
result

#this is the same as:
result <- dt[age > 30, .(mean_age = mean(age)), by=name]
result

v <- data.frame("id" = 6, "name" = "John", "age" = 41)#... etc
v <- data.frame("id" = 7, "name" = "Joon", "age" = 13)#... etc
dt <- rbind(dt, v, fill=T)
dt
dt[, age_category := ifelse(age < 30, ifelse(age<18,"Kid","Young"), "Adult")]

setwd("C:/Users/Charl/Documents/GitHub/DMA2/data tables in R")

large_dt <- fread("LEZ_4_large_dataset.csv")

ncol(large_dt)
colnames(large_dt)

large_dt[,.N, by=type]

fwrite(dt, "LEZ_4_Output.csv")

unique_dt <- unique(dt)

column_sum = dt[,cum_sum:=cumsum(age)]
# Example 15: Creating a new column based on conditions
dt[, age_category := ifelse(age < 30, ifelse(age<18,"Kid","Young"), "Adult")]

# Example 16: Sampling a specified number of rows from a data.table
sample_dt <- dt[sample(.N, 3)]

# Example 17: Merging multiple data.tables based on a common column
dt3 <- data.table(
  id = c(2, 4, 6),
  occupation = c("Engineer", "Teacher", "Doctor")
)

#MERGING
#merged_multiple_dt <- merge(dt, dt2, dt3, by = "id")

# Example 18: Calculating the rank of a column within each group
dt[, rank := frank(age, ties.method = "dense")]
dt
