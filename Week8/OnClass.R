# Week 8 Data Science Practice
#grace natalie sipayung_24001916

#load Libraries
library(dplyr)
library(readr)

student_data <- read.csv("C:/Users/agest/Documents/DataScience/Week8/student_data.csv")

#Data Manipulation
student_fail <- student_data %>% 
  filter(final_exam_mark < 40)

# filter students who passed and sort them from highest to lowest mark
student_passed_ranked <- student_data %>% 
  filter(final_exam_mark > 40) %>% 
  arrange(desc(final_exam_mark))

# select only the specific columns we need to view
student_subset <- student_data %>% 
  select(student_id, coursework_mark, final_exam_mark)

# create a new column for Total Mark using a formula
student_data <- student_data %>% 
  mutate(Total_Mark = coursework_mark + (final_exam_mark / 200 * 100))

# Descriptive Statistics (Using built-in Iris Dataset)
data("iris")
df <- iris 

#show the structure and summary of the dataset
str(df)
summary(df)

#calculate specific statistics for Sepal Length
stats_sepal <- list(
  min = min(df$Sepal.Length),
  max = max(df$Sepal.Length),
  mean = mean(df$Sepal.Length),
  median = median(df$Sepal.Length),
  sd = sd(df$Sepal.Length),
  var = var(df$Sepal.Length)
)
print(stats_sepal)

#Data Visualization
hist(df$Sepal.Length, main = "Histogram of Sepal Length", 
     xlab = "Sepal Length (cm)", col = "lightblue", border = "black")

#create a Boxplot grouped by Species
boxplot(Sepal.Length ~ Species, data = df, 
        main = "Sepal Length by Species", 
        col = c("lightgreen", "lightpink", "lightyellow"))

#handling Outliers
outlier_data <- c(30, 24, 26, 28, 29, 28, 27, 26, 32, 34, 13, 15, 14, 
                  31, 29, 28, 24, 25, 30, 34, 35, 27, 30, 34, 44, 48)

#calculate the normal range boundaries using the Interquartile Range (IQR)
Q1 <- quantile(outlier_data, 0.25)
Q3 <- quantile(outlier_data, 0.75)
IQR_val <- IQR(outlier_data)

lower_extreme <- Q1 - 1.5 * IQR_val
upper_extreme <- Q3 + 1.5 * IQR_val

#drop the outliers completely
data_dropped <- outlier_data[outlier_data >= lower_extreme & outlier_data <= upper_extreme]

#replace outliers with the mean (average) value
data_mean_capped <- outlier_data
avg <- round(mean(data_mean_capped))
data_mean_capped[data_mean_capped < lower_extreme] <- avg
data_mean_capped[data_mean_capped > upper_extreme] <- avg

#cap the outliers at the extreme boundaries
data_capped <- outlier_data
data_capped[data_capped < lower_extreme] <- lower_extreme
data_capped[data_capped > upper_extreme] <- upper_extreme