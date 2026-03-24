setwd("~/Assignment/UCI HAR Dataset/week3courseraproject/")
library(dplyr)

features<-read.table("features.txt",col.names = c("n","functions"))
activities<-read.table("activity_labels.txt",col.names = c("code","activity"))
subject_test<-read.table("test/subject_test.txt",col.names = "subject")
x_test <- read.table("test/X_test.txt",col.names = features$functions)
y_test <- read.table("test/y_test.txt",col.names = "code")

subject_train<-read.table("train/subject_train.txt",col.names = "subject")
x_train <- read.table("train/X_train.txt",col.names = features$functions)
y_train <- read.table("train/y_train.txt",col.names = "code")


#1.merging

x<-rbind(x_train,x_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
merged_data<-cbind(subject,y,x)


#2.extract only the measurements on the mean & sd for each measurement
tidy_data<-merged_data %>% select(subject,code,contains("mean"),contains("std"))

#3.uses descriptive activity names to name the activities in the dataset
tidy_data$code<-activities[tidy_data$code,2]

#4.appropriately labelsthe datasetb with descriptive variable names
names(tidy_data)[2]<-"activity"
names(tidy_data)<-gsub("Acc","Accelerometer",names(tidy_data))
names(tidy_data)<-gsub("Gyro","Gyroscope",names(tidy_data))
names(tidy_data)<-gsub("BodyBody","Body",names(tidy_data))
names(tidy_data)<-gsub("Mag","Magnitude",names(tidy_data))
names(tidy_data)<-gsub("^t","Time",names(tidy_data))
names(tidy_data)<-gsub("^f","Frequency",names(tidy_data))
names(tidy_data)<-gsub("^tBody","TimeBody",names(tidy_data))
names(tidy_data)<-gsub("-mean()","Mean",names(tidy_data),ignore.case = TRUE)
names(tidy_data)<-gsub("-std()","STD",names(tidy_data),ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()","Frequency",names(tidy_data),ignore.case = TRUE)
names(tidy_data)<-gsub("angle","Angle",names(tidy_data))
names(tidy_data)<-gsub("gravity","Gravity",names(tidy_data))

#5.creatiny second dataset eith avg of each variable foe each activity and each subject

final_data<-tidy_data%>%
  group_by(subject,activity)%>%
  summarise_all(funs(mean))

write.table(final_data,"finaldata.txt",row.names = FALSE)

