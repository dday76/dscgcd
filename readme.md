# Get clean data from UCI Samsung data
This file explains what is in the repository and the purpose of the files.
The code file itself has additional commentary, and the codebook is present too for other details.
This file lists each file and the purpose of the assignment to ensure requirements are met.

## Assignment Requirements
* Tidy data, which I (and CRAN) interpret to mean: 1 variable per column, 1 observation per line, each observational unit forms a table.
* Everything in github, with everything being: ReadMe, updated Codebook with units, transforming code, and final output.
* Original work, and this is my original work.
* Code to create one data set from the test and train data, assuming those raw data are in the working directory
* Single data set should have the mean and sd for each measurement, not each measurement
* Descriptive activity names and variable names
* Second tidy data set with a table of subject vs variable with average results.

## Grading Notes
Also included briefly in codebook and code: I included mean(), meanFreq(), and std() features but not the angle-based Mean features.
That was my best estimate of the requirement. I could have added or excluded whatever, but I just made my best guess.
cbd4, for 1-4, and cbd5c, for 5, are the 'deliverables'. 
But there wasn't a specific output format requested, so I just output a brief header of cdb5c.
Question 5 requested 'a' second data set, so I did the averages by student+activity, not one for student and one for activity.
I didn't change any of the feature names. They seemed long and cumbersome, but that seemed better than making up my own. They're fine.

## Raw Data
Data is drawn from the link below which provides a link to the data folder and data set description.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data Description Page asserts 561 attributes and 10,299 instances.
Also that features are normalized and bounded -1 to 1, inclusive, and each feature vector is a row.
Data relate to activities walking, walking up and down stairs, sitting, standing, laying [sic, they mean lying].
Aside from unzipping and excluding the inertials folder, the data are unmanipulated.

Data folder includes:
* README.txt and attribute files: activity_labels.txt,features_info.txt,features.txt
* 2 folders, test and train, each with inertial signals, subject_, x_, and y_ folders.
* Inertials signals folders are irrelevant for this purpose and have been left out here. (also per thoughtfulbloke.)

## Repository Contents
* Readme.md - This file.
* Codebook.md - How I got from the raw data to the tidy data and what that tidy data looks like.
* r_analysis.R - code file to create a tidy data set from the raw data in the working directory, and a second tidy data set of averages.
* raw_data within its folder "UCI HAR Dataset".
* tidy5.txt - requested question 5 output
