if(!file.exists("./Accelerometer")){dir.create("./Accelerometer")}
fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Accelerometer/dataset.zip")

#Load data
dataset<-unzip("dataset.zip")   

x.test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y.test<-read.table("./UCI HAR Dataset/test/y_test.txt")
sub.test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

x.train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y.train<-read.table("./UCI HAR Dataset/train/y_train.txt")
sub.train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

activitylabel<-read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
predata<-rbind(x.test,x.train)  

subject<-rbind(sub.test,sub.train)

y<-rbind(y.test,y.train)

# 2. Extracts the measurements on the mean and standard deviation for each measurement.
features<-read.table("./UCI HAR Dataset/features.txt")

#2.1 Make syntactically valid feature names.
names<-make.names(features[,2])    

#2.2 Return the indices of where the text is found
meanstd<-grep("(mean|std)", names, value=F)

sel.dat<-predata[,meanstd]
data<-cbind(subject,y,sel.dat)

# 3. Label the data set with descriptive variable names.
#3.1 Returns the values
meanstdval<-grep("(mean|std)",names,value=T)
colnames(data)<-c("subject","activity",meanstdval)

# 4. Use descriptive activity names to name the activities in the data set
# Attach value labels 1=WALKING, 2=...
data$activity<-factor(data$activity, levels=activitylabel$V1, labels=activitylabel$V2)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each
# activity and each subject
dataMelt<-melt(data, id=c("subject","activity"), measure. vars=meanstdval)
newdata<-dcast(dataMelt, subject + activity ~ variable, mean)

#Finally:
#write.table(newdata,"c:/Users/Datos/Documents/Accelerometer/mydata.txt",row.names=F)

