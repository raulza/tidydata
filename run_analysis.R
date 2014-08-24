# script to read UCR data and create a tidy data set
# raw data is in a couple of separate subdirectories
  library(reshape2)
  library(plyr)

# first let us read some basic files that have variable information
    # code and names for activities
    activity <- read.table("./activity_labels.txt")
    names(activity) <- c("actID", "actName")
    # variable names for both datasets
    var_names <- read.table("./features.txt")
    # let us create of list of vars that include mean or std as requested, 79 total
    var_lst <- grep("mean|std", var_names[,2])
    
# now let's start with the test set
    # read actual data, three files, test data, subject id and activitiy id
    test_data <- read.table("./test/X_test.txt", sep="")
    names(test_data) <- var_names[,2]
    # include only relevant variables
    test_data <- test_data[,var_lst]
    # read subject id data and activity
    test_subj <- read.table("./test/subject_test.txt")    
    names(test_subj) <- "subject"
    test_activ <- read.table("./test/y_test.txt")
    names(test_activ) <- "activityID"
    # create complete set with subject and activity
    test_data <- cbind(test_subj,test_activ,test_data)

# now the training set, same stuff as above
    # read actual data
    train_data <- read.table("./train/X_train.txt", sep="")
    names(train_data) <- var_names[,2]
    # include only relevant vars
    train_data <- train_data[,var_lst]
    # read subject id data and activity
    train_subj <- read.table("./train/subject_train.txt")
    names(train_subj) <- "subject"
    train_activ <- read.table("./train/y_train.txt")
    names(train_activ) <- "activityID"
    # create file with subject and activity
    train_data <- cbind(train_subj,train_activ,train_data)
    
# subjects doing test did not do trainining and viceversa. so we can use rbind to merge the two sets; we do not need merge 
    my_set <- rbind(train_data,test_data)
    
# let is now create variable for activity strings and recode, use lower case chars
    my_set$activity <- NA
    for (i in 1:nrow(activity)) {
      my_set$activity[my_set$activityID==i] <- as.character(tolower(activity$actName[i])) 
    }

# delete activityID column
    my_set$activityID <- NULL
      
# clean var names a bit
    clean_names <- gsub("-","", names(my_set))
    clean_names <- gsub("\\(","", clean_names)
    clean_names <- gsub("\\)","", clean_names)
    clean_names <- gsub("mean","", clean_names)
    clean_names <- gsub("std","s", clean_names)
    names(my_set) <- clean_names
    
# let us now reshape data by acvitify for every individual for each variable and its mean

    melted <- melt(my_set,id.vars=c("subject","activity"),variable.name="measure")
    tidy <- ddply(melted, c("activity", "subject", "measure"), summarize, mean = mean(value))
    
# write the tidy set to text file
    write.table(tidy,file="./tidy.txt",row.names=FALSE)
    
    
    
    
    
    