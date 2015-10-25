# xdatatest<-read.csv("./UCI HAR Dataset/test/X_test.txt",header=FALSE, sep='')

# 1.tidy data set as described below
#2.a link to a Github repository with your script for performing the analysis, and
#3.a codebook that describes the variables, the data, and any transformation or work that you performed
#to clean up the data called CodeBook.md.
#You should also include a readme.md in the repo with your scripts



xdatatest<-read.csv("./UCI HAR Dataset/test/X_test.txt",header=FALSE, sep='')
ydatatest<-read.csv("./UCI HAR Dataset/test/Y_test.txt",header=FALSE, sep='',col.names = "activity")
xdatatrain<-read.csv("./UCI HAR Dataset/train/X_train.txt",header=FALSE, sep='')
ydatatrain<-read.csv("./UCI HAR Dataset/train/Y_train.txt",header=FALSE, sep='',col.names="activity")
features<-read.csv("./UCI HAR Dataset/features.txt",header=FALSE, sep='')
activityf<-read.csv("./UCI HAR Dataset/activity_labels.txt",header=FALSE, sep='')


testcomb<-cbind(ydatatest,xdatatest)
traincomb<-cbind(ydatatrain, xdatatrain)
# ncol(testcomb)
#ncol(traincomb)

# 1. Mergining the data

totcomb<-rbind(traincomb,testcomb)
labels<-as.character(features$V2)

names(totcomb)<-c("activity", labels)
totcombdf<-as.data.frame(totcomb)


# 2. Extrating mean and standard deviation variables
totcombdf <- totcombdf[, !duplicated(colnames(totcombdf))]
prefinal<-totcombdf[,grep("(mean|std)\\()",colnames(totcombdf))]
activity<-totcombdf$activity
final<-cbind(activity,prefinal)



# 3. Use descriptive names for the acitvity names to name the activities in the above dataset
final$activity[final$activity==1]<-as.character(activityf[1,2])
final$activity[final$activity==2]<-as.character(activityf[2,2])
final$activity[final$activity==3]<-as.character(activityf[3,2])
final$activity[final$activity==4]<-as.character(activityf[4,2])
final$activity[final$activity==5]<-as.character(activityf[5,2])
final$activity[final$activity==6]<-as.character(activityf[6,2])
# 4. Appropriately labels the data set with descriptive names
names(final)<-gsub("tBody","timebody", colnames(final))
names(final)<-gsub("fBody","frequencybody",colnames(final))
names(final)<-gsub("Acc","acceleration",colnames(final))
names(final)<-gsub("Gyro","gyroscope",colnames(final))
names(final)<-gsub("Jerk","jerk",colnames(final))
names(final)<-gsub("Mag","mag",colnames(final))
names(final)<-gsub("tGravity","timeGravity",colnames(final))



# 5. From the data set in step 4, creates a second, independent tidy data set with the averages of each
# variable for each actitity and each subject.


subjecttrain<-read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE, sep='',col.names="subject")
subjecttest<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE, sep='',col.names="subject")
subjects<-rbind(subjecttrain,subjecttest)

final<-cbind(subjects,final)
tidyfinal <- ddply(final, c("subject","activity"), numcolwise(mean))
write.table(tidyfinal, file = "tidyfinal.txt", sep =" ", row.name = FALSE)
#Her skal være en write funktion.