The script `run.analysis.R` does the following (bulletpoints describe the chunks of code in between the commments in the script):

* We first load in all the train and test data (measurements, subjects and activities), specifying `colClasses` and `comment.char` to speed up loading.
* The train and test data are then merged.
* Then we load in the description of features and activities.
* Out of all the features, we extract only those that contain `mean()` or `std()` in their names.
* Using the numeric labels of the relevant features, we then choose only the columns in the raw (merged) data with the relevant features. We then remove `()` from the feature names and convert `-` to `_`, and use these strings as column names in the new data set (so we can refer to these columns via `$`).
* We then add to this data set a column with the subject IDs and a column with activities, replacing the numerical activity labels with their names.
* We then make the Subject and Activity columns factors and use `dplyr::group_by` to group the data set by subjects and activities. `dplyr::summarise_each` is then called with function `mean`, performing the mean on every column, in every group, creating the final, tidy data set.
* This data set is then written to a file `ActivityAverages.txt`, description of which is given in the code book `CodeBook.md`