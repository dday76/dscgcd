run_analysis <- function(outcome, num = "best") {
    ## Function actions: tidy data and create 2 tables
    ## first table is tidy data only related to means and std devs
    ## second table provides each for each subject and variable
   
    ### Step 1: Read all the data into R 
    # This is normally cumbersome but we're not doing optimization.
    # See codebook for philosophy and file usages.
    # All normal read.table without qualifications; seems fine.

    ft <- read.table("./UCI HAR Dataset/features.txt")
    al <- read.table("./UCI HAR Dataset/activity_labels.txt")

    tts <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    ttx <- read.table("./UCI HAR Dataset/test/X_test.txt")
    tty <- read.table("./UCI HAR Dataset/test/y_test.txt")

    tns <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    tnx <- read.table("./UCI HAR Dataset/train/X_train.txt")
    tny <- read.table("./UCI HAR Dataset/train/y_train.txt")

    ### Now we want descriptive names on the x fouiles
    # We get that from the features file; same for train and test
    # The variable names should be descriptive, and I think they are.
    # There are no spaces and the - and caps and () are fine as is.
    # We'll give the others names later.
        
    names(tnx) <- ft$V2 #V2 is just second column on default import
    names(ttx) <- ft$V2

    ### now we'll make one table of each data
    # That means train/test, then subject then activity, then x data
    # Then fix header names; only need first three; x is ok
    # Then rbind to have train and test in one file
    
    tna <- cbind("train",tns,tny,tnx)
    names(tna)[1:3] <- c('type','subject','activitynum')
    tta <- cbind("test",tts,tty,ttx)
    names(tta)[1:3] <- c('type','subject','activitynum')
    cbd <- rbind(tna,tta)

    ### Then merge in the activity data; merge last because it reorders the data
    # first merge then fix column order back to type,subject,activity,x
    # then add a column name for activity
    
    options(warn=-1) # merge creates warning but also creates cbd2... so I just ignore it.
    cbd2 <- merge(cbd,al,by.x="activitynum",by.y="V1")
    options(warn=0) # turn warnings back on... any help on this?
    cbd3 <- cbind(cbd2[,2:3],cbd2[,565],cbd2[,4:564])
    names(cbd3)[3] <- 'activity'
    
    ### now we have column names and we can remove unneeded ones
    # I'm jut doing this last as cbd2 has all the data and then we reduce from there.
    # Then remove all not related to mean or std dev, as requested (keep 1st 3)
    # See grading note in codebook - angle Means excluded and meanFreq included
    # See grading note in codebook - names left as-is because they're best as-is
    
     keep <- c(1:3,grep("([m][e][a][n])|([s][t][d])",names(cbd3)))
     
     cbd4 <- cbd3[,keep] # final result of question 1-4
     head(cbd4[,1:5]) # comment after this to take a quick look at cbd4
    
     ### Now to get to question 5, average of subject-activity
     # first create subject.activity field; then rearrange
     # the requirement is only subject.activity, so we can drop type.
     # aggregate by mean gives us what we're looking for.
     # Then we add a descriptive name for the first column
     
     cbd5 <- cbd4
     cbd5$subject.activity <- paste(cbd5$subject,cbd4$activity,sep=".")
     cbd5b <- cbd5[,c(83,4:82)]
     cbd5c <- aggregate(cbd5b[, 2:80], list(cbd5b$subject.activity), mean)
     names(cbd5c)[1] <- "subject.activity.group"
     cbd5c # final result for question 5
     head(cbd5c[,1:5]) # provides a quick look at cbd5c final result
     write.table(cbd5c,file="tidy5.txt",row.names=FALSE)
     
     # I thought it best not to just print cdb4 or cdb5c to screen...      
}