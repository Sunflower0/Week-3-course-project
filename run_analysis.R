	library(reshape)
	library(plyr)
	
	run_analysis <- function(){

	## Getting and Cleaning Data Course Project

	## Read data from ./UCI HAR dataset/
	## activity_labels.txt: 6 obs. of  2 variables
	## features.txt: 561 obs. of  2 variables

	## Read data from ./UCI HAR dataset/train/
	## subject_train: 7352 obs. of  1 variable
	## y_train: 7352 obs. of  1 variable
	## X_train:  7352 obs. of  561 variables 

	## Read data from ./UCI HAR dataset/test/
	## subject_train: 2947 obs. of  1 variable
	## y_test: 2947 obs. of  1 variable
	## X_test: 2947 obs. of  561 variables

	activity_labels <- read.table("./UCI HAR dataset/activity_labels.txt")
	features <- read.table("./UCI HAR dataset/features.txt")

	X_train <- read.table("./UCI HAR dataset/train/X_train.txt")
	label_train <- read.table("./UCI HAR dataset/train/y_train.txt")
	subject_train <- read.table("./UCI HAR dataset/train/subject_train.txt")

	X_test <- read.table("./UCI HAR dataset/test/X_test.txt")
	label_test <- read.table("./UCI HAR dataset/test/y_test.txt")
	subject_test <- read.table("./UCI HAR dataset/test/subject_test.txt")

	##Merge the two datasets: train & test

	X_all <- rbind(X_train, X_test)	
	s_X_all <- X_all[grepl("mean|std", features$V2)]
	s_features <- grep("mean|std", features$V2, value = TRUE) 
	sub_X_all <- s_X_all[!grepl("meanFreq", s_features)]
	
	label_all <- rbind(label_train, label_test)
	subject_all <- rbind(subject_train, subject_test)

  	##subset mean and standard deviation from original datasets
	##remove all punctuation characters
	##gsub("[[:punct:]]", " ", x)

	sub_features <- grep("mean|std", features$V2,value= TRUE)
	sf <- sub_features[!grepl("meanFreq", sub_features)]
	sf1 <- gsub("[[:punct:]]","",sf)
	names(sub_X_all)<- sf1
	names(label_all)<- "label"
	names(subject_all)<- "subject" 

	data_total <- cbind(sub_X_all, label_all, subject_all)
	data_label <- split(data_total, data_total$label)
	
	activities <- paste(1:6, activity_labels[,2], sep="")
	a <- paste("0", 1:9,sep="")
	row_names <- paste("Subject",c(a, 10:30), sep="")

	##split dataset by "label" and "subject" and calculate average of each colume variable

	for(i in 1:6){
		x <- data_label[[i]]
		x1 <- split(x, x$subject)
		ave_subject <- NULL
		for(j in 1:30){
			x2 <- x1[[j]]
			x3 <- sapply(x2,ave)
			ave_subject <- rbind(ave_subject, x3[1,1:79])
		}
		row.names(ave_subject) <- row_names		
		if(i==1) ave_list <- list(ave_subject)
		else     ave_list <- rbind(ave_list,list( ave_subject))
		
		}
	names(ave_list) <- activities
	m_ave_list <- ldply(ave_list, melt)
	names(m_ave_list)<- c("label","subject","variable","value")
	t_ave_list <- cast(m_ave_list, label + subject ~ variable)

	##write the tidy data to "a.txt" under ./Working Directory

	write.table(t_ave_list,"a.txt",row.name=FALSE)
	}	
	


















