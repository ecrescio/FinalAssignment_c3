library(tidyr)
library(dplyr)

select_variables<-function(dataframe){
  #This function selects only variables with mean and standard deviation of measures
   #and renames the variables
   sel<-vector()
   txtfile<-read.delim("./Data/features.txt",header=FALSE)
   sel<-grep("\\b-mean()\\b",txtfile$V1)
   sel<-append(sel,grep("\\b-std()\\b",txtfile$V1))
   newdf<-select(dataframe,sel)

   j<-1
   for(i in sel){
      name<-strsplit(as.character(txtfile$V1[i])," ")
      names(newdf)[j]<-name[[1]][2]
      j=j+1
   }
   newdf
}

#Reading data
test_data<-read.table("./Data/test/X_test.txt")
train_data<-read.table("./Data/train/X_train.txt")
test_labels<-read.table("./Data/test/Y_test.txt")
train_labels<-read.table("./Data/train/Y_train.txt")
subject_test<-read.table("./Data/test/subject_test.txt")
subject_train<-read.table("./Data/train/subject_train.txt")

#Checking common variables
intersect(names(test_data),names(train_data))
#Adding activity labels and subjects to the dataframes
test_data_labels<-mutate(test_data,"Activity"=test_labels$V1,"Subject"=subject_test$V1)
train_data_labels<-mutate(train_data,"Activity"=train_labels$V1,"Subject"=subject_train$V1)

#Merge the test data and train data
merged<-merge(test_data_labels,train_data_labels,all = TRUE)
#Select mean and std
#merged_selec<-select(merged,c("Subject","Activity",1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,
#                              240:241,253:254,266:271,345:350,424:429,503:504,516:517,
#                              529:530,542:543))

merged_selec<-select_variables(merged)

finaldf<-mutate(merged_selec,"Activity"=merged$Activity,"Subject"=merged$Subject)
#Renaming activities

finaldf[finaldf$Activity==1,67]<-"Walking" 
finaldf[finaldf$Activity==2,67]<-"Walking Upstairs"
finaldf[finaldf$Activity==3,67]<-"Walking Downstairs"
finaldf[finaldf$Activity==4,67]<-"Sitting"
finaldf[finaldf$Activity==5,67]<-"Standing"
finaldf[finaldf$Activity==6,67]<-"Laying"

#Creating the second dataframe


meandf<- finaldf %>% group_by(Subject,Activity)  %>% summarise_all(funs(mean))
print("Data frame with mean values created. Type meandf to see it")
#Writing on file the tidy data 
write.table(finaldf,"tidy_data.txt",row.name=FALSE,quote=FALSE) 

