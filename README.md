There are four parts in the code to get the new tidy data set as requested.

Part 1: The codes in this part was used to load the training and test datasets into R. 
(i)   A character vector was created for all the feature names by using 'features.txt'.  
(ii)  The subjects and activity was appended to the training/test dataset. 
(iii) In order to separate the training and test data, a new variable called  ‘group’ was created with two levels - ‘training’ and ‘test’.


Part 2: The codes in this part is used to perform data manipulation. 
(iv)  Training and test datasets were merged to a large table. 
(v)   The sample size was checked, roughly 70% for training and 30% for test, consistent with the README file for the data. 
(vi)  To extracts only the measurements on the mean and standard deviation for each measurement ‘grep’ function was used.  
(vii) Only future names with ‘mean()’ and ‘std()’ were kept - ‘meanFreq’ was ignored here.

Part 3: Here we performed descriptive activity names to name the activities in the data set. 
(viii) Inner join was applied here to append descriptive activity names to dataset by using the lookup table ‘activity_labels.txt’.

Part 4: Here we created a second, independent tidy data set with the average of each variable for each activity and each subject. 
(ix) The average value for all the columns ONLY based on activity and subject - training and test data were mixed here. 
(x) All the columns were renamed; added “mean” at the end of their names for the columns that were averaged. 
(xi) The final output is a .txt file with subject, activity name and the average value of each variable for each activity and each subject.