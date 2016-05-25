# Getting and Cleaning Data
## Course Project

## Introduction
This repository is created for my work on the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. In this project, data is downloaded from an online source, merge different sets of data, extract the relevant features, tidy up the data set and write the output to a text file using R.

## In this repository you fill find following files:
- README.md
- run_analysis.R: R Script for the project.
- CodeBook.md: Describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Steps to use on this project

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, then it will generate a new file ```tiny_data.txt``` in your working directory.

## Dependencies

```run_analysis.R``` file will help you to install the dependencies automatically. It depends on ```dplyr```. 
