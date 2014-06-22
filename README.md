# getdata-004 | Course Project | Overview

## Files

[run_analysis.R] {https://github.com/JiMinitaur/getdata-003-course-project/blob/master/run_analysis.R}

* includes the hook to load the data subsets, and the code to combine them, before the tidy data file.
* processing and loading are handled in other files.

[project_meta_tables.r] {https://github.com/JiMinitaur/getdata-003-course-project/blob/master/project_meta_tables.r}

* provides loaders for the global metadata tables, features and activities, that identify columns and row types respectively.

[project_datasets.R] {https://github.com/JiMinitaur/getdata-003-course-project/blob/master/project_datasets.r}

* provides loader functions which merge the datasets from their component files in their respective folders.

[code book] {https://github.com/JiMinitaur/getdata-003-course-project/blob/master/getdata-004-project-codebook.md}

Provides details about the variables in the tidy data set

[tidy data set] {https://github.com/JiMinitaur/getdata-003-course-project/blob/master/getdata-004-project-tidy-data.csv}

The output data generated with run_analysis.r

## Process

* ***project_meta_tables.r*** preps the column and row identifiers

* ***run_analysis.r*** uses ***project_datasets.r*** to compile each data set into a table.  This includes binding the metatable data to each dataset.

* ***run_analysis.r*** rbinds the two data sets to create the complete set

* ***run_analysis.r*** uses aggregate(...) to mean all of the values, split by their identity columns (subject and activity).
