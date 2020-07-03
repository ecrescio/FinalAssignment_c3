---
title: "README"
author: "Elisabetta Crescio"
date: "3/7/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

INSTRUCTIONS on how to run the analysis.
All the analysis is performed in a unique script, named run_analysis.R

To be able to run the script you shout put the original data files in a folder named "Data" in the directory from where you run the script.

To produce the tidy_data.txt file, please run the run_analysis.R script and the file will be produced
in your working directory. 
The script produces also a dataframe with the mean of each variable for each activity and each subject, named "meandf".