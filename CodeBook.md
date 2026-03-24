---
title: "Untitled"
author: "ramya"
date: "`r Sys.Date()`"
output: html_document
editor_options: 
  markdown: 
    wrap: 72
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

\`\`\`

The rweek3_course_project_run.R script performs the data preparation and
then followed by the 5 steps required as described in the course
project’s definition.

**1.Download the dataset**

-   Dataset downloaded and extracted under the folder called UCI HAR
    Dataset

**2. Assign each data to variables**

-    features - The features selected for this database come from the accelerometer and gyroscope
    3-axial raw signals tAcc-XYZ and tGyro-XYZ.

-   activities - List of activities performed when the corresponding measurements were taken
    and its codes (labels)

-   subject_test - contains test data of 9/30 volunteer test subjects being observed

-   x_test - contains recorded features test data

-   y_test - contains test data of activities’code labels

-   subject_train -  contains train data of 21/30 volunteer subjects being observed

-   x_train -contains the recorded features train data

-   y_train - contains train data of activity code labels

**3. Merges the training and the test sets to create one data set**

-   X  is created by merging x_train and x_test using rbind() function

-   Y s created by merging y_train and y_test using rbind() function

-   Subject is created by merging subject_train and subject_test using rbind() function

-   Merged_Data is created by merging Subject,Y and X using cbind() function

**4.Extracts only the measurements on the mean and standard deviation
for each measurement**

-   TidyData is created by subsetting Merged_Data, selecting only columns: subject, code and the
-   measurements on the mean and standard deviation (std) for each measurement

**5.Uses descriptive activity names to name the activities in the data
set**

-   Entire numbers in code column of the TidyData replaced with
-   corresponding activity taken from second column of the activities variable

**6.Appropriately labels the data set with descriptive variable names**

-   code column in TidyData renamed into activities
-   All Acc in column’s name replaced by Accelerometer,Gyro in column’s name replaced by
    Gyroscope,BodyBody in column’s name replaced by Body,Mag in column’s name replaced by Magnitude,start with character f in
    column’s name replaced by Frequency,All start with character t in column’s name replaced by Time

**7.From the data set in step 4, creates a second, independent tidy data
set with the average of each variable for each activity and each
subject**

-   FinalData is created by sumarizing TidyData taking the means of each variable for each activity and each
    subject, after groupped by subject and activity. Export FinalData into FinalData.txt file

\`\`\`
