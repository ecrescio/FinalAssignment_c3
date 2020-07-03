---
title: "CodeBook"
author: "Elisabetta Crescio"
date: "3/7/2020"
output: html_document
---

Instrunctions to interpret the variables in tidy_data.txt file:

-The data contains the measurement data arranged in 68 columns (variables) and 10299 rows.
-The first 33 columns represent the variables referring to mean of measurements of the original data set. 
-The columns from 34 to 66 represent the variables referring to standard deviation of measurements of the original data set.
-The name of the variables is the same as the name shown in file Data/features.txt. For example, the first column refers to variable: tBodyAcc-mean()-X. The column number 66 corresponds to variable: fBodyBodyGyroJerkMag-std().
-Column 67 corresponds to the Activity. There are 6 possible activities:
 WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING
-Last column, #68, correspond the Subject, i.e. the person who registered the measurements. There are 30 people, so the value for Subject is a number from 1 to 30. 

