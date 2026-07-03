library(dplyr)
library(readr)

student_data <- read.csv("C:/Users/agest/Documents/DataScience/Week8/student_data.csv")
View(student_data)

# 1. Show the details of students whose final_exam_mark is greater than 80%.

data1 <- filter(student_data,final_exam_mark>80)
View(data1)

#2.	Arrange the dataset in ascending order based on course_work_mark.

data2 <- student_data %>% arrange(coursework_mark)
View(data2)

#3.	Display only the student name and final_exam_mark attributes from the dataset.  

data3 <- student_data %>% select(student_name,final_exam_mark)
View(data3)

#4.	Specify the number of rows and columns in the dataset.  

nrow(student_data)
ncol(student_data)

#5.	Explain how to obtain the details of the given dataset using R. Show the dataset details based on the R query you execute.  

summary(student_data)

#6.	How can you identify and detect outliers in the given dataset? Explain and demonstrate using R. 

boxplot(student_data$final_exam_mark, student_data$coursework_mark, main="boxplot")


#from the result of my boxplot there's no value below lower extreme and over upper extreme
#and no outliers in the datasets