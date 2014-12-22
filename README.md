# Getting and Cleaning Data - Course Project

## Introduction

Contained here is an analysis script, output data, and documentation required for the course project of the December 2014 instance of the Coursera class "Getting and Cleaning Data".

The project's requirements were to get a public data set (here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and do some simple cleanup of the data. We were to combined some of the files offered in the data set, and reduce the data into a "tidy" representation. More info on "tidy data" can be found here: http://vita.had.co.nz/papers/tidy-data.pdf

## Files Included

### `README.md`

This file.

### `tidy_data.txt`

This is an output file containing the tidy data set that is computed by `run_analysis.R`. It can be read back into R with the following command: 
```R
tidy_data = read.table(file="tidy_data.txt", header = TRUE)
```

### `Codebook.md`

File describing the methods used to clean up the data, and also explains the variables contained in the tidy data set.

### `run_analysis.R`

An R script that can be used to convert the raw data from the 'UCI HAR Dataset' into the tidy data set contained in the `tidy_data.txt` file. When executed, this script assumes that the raw data set is contained in a relative directory called `./UCI HAR Dataset`. If your raw data lives somewhere else, you can modify the variable `dataPath` at the top of `run_analysis.R`.


