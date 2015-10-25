

if(!("data.table" %in% installed.packages()[,"Package"])) {
  install.packages("data.table")
}

if(!("dplyr" %in% installed.packages()[,"Package"])) {
  install.packages("dplyr")
}


#step1

library(data.table)

y_train<-fread(file.path("UCI HAR Dataset/train/y_train.txt"))
x_train<-fread(file.path("UCI HAR Dataset/train/X_train.txt"))
sub_train<-fread(file.path("UCI HAR Dataset/train/subject_train.txt"))


y_test<-fread(file.path("UCI HAR Dataset/test/y_test.txt"))
x_test<-fread(file.path("UCI HAR Dataset/test/X_test.txt"))
sub_test<-fread(file.path("UCI HAR Dataset/test/subject_test.txt"))

train<-cbind(sub_train,y_train,x_train)
test<-cbind(sub_test,y_test,x_test)

complete.file<-rbind(train,test)

features <- fread(file.path("UCI HAR Dataset/features.txt"))

features[,dup:=duplicated(V2)]

features[dup==TRUE,V2:=as.character(V1)]

features.name<-features[,V2]

names(complete.file)<-c("subjectid","numactivity",features.name)

rm(features)
rm(test)
rm(train)
rm(sub_test)
rm(sub_train)
rm(y_test)
rm(y_train)
rm(x_test)
rm(x_train)
rm(features.name)

#step2

library(dplyr)

complete<-tbl_df(complete.file)

complete<-select(complete,subjectid,numactivity,contains("mean"),contains("std"),-contains("angle"),-contains("Freq"))

rm(complete.file)


#step 3

activity <- read.table(file.path("UCI HAR Dataset/activity_labels.txt"))
activity<-data.table(activity)
names(activity)<-c("numactivity","activity")
setkey(activity,numactivity)

complete <- data.table(complete)
setkey(complete,numactivity)

complete <- merge(activity,complete)
complete <- select(complete,-numactivity)

#step4

complete.names <- names(complete)

changename <- function(x) {
  n <- length(x)
  for (i in 3:n) {
    x[i] <- tolower(x[i])
    x[i] <-sub("acc","acceleration",x[i])
    x[i] <-sub("tbody","timebody",x[i])
    x[i] <-sub("tgravity","timegravity",x[i])
    x[i] <-sub("-mean()-","mean",x[i],fixed=TRUE)
    x[i] <-sub("-mean()","mean",x[i],fixed=TRUE)
    x[i] <-sub("-std()-","std",x[i],fixed=TRUE)
    x[i] <-sub("-std()","std",x[i],fixed=TRUE)
    x[i] <-sub("mag","magnitude",x[i])
    x[i] <-sub("f","frequency",x[i])
    x[i] <-sub("bodybody","body",x[i])
  }
  return(x)      
}

new.names <- changename(complete.names)
names(complete) <- new.names

#step 5

completeVF <- group_by(complete,activity,subjectid)
completeVF <- summarise_each(completeVF,funs(mean),everything())

write.table(completeVF,file="tidydata.txt",row.names = FALSE)