The data in file `ActivityAverages.txt` contains average accelerometer and gyroscope readings for a group of 30 volunteers that performed various activities while wearing a smartphone on the waist. This data was obtained by performing analysis from `run_analysis.R` (documented in `README.md`) on the original *Human Activity Recognition Using Smartphones Dataset* data set available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), with the full description of the data available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data in `ActivityAverages.txt` contains the following columns:
- `Subject` contains identifiers of the subject who carried out the experiment, and are integers ranging between 1 and 30.
- `Activity` contains strings describing activities that a particular subject was performing, and is one of *LAYING*, *SITTING*, *STANDING*, *WALKING*, *WALKING_DOWNSTAIRS*, *WALKING_UPSTAIRS*.
- All the other columns are named in the format *Meas_Op_I*, where:
  - *Meas* indicates a particular measurement obtained, where the first letter indicates whether the measurement is in the time domain (*t*) or Fourier transformed (*f*); e.g. *tBodyAcc* is the body acceleration. More detailed description of these features is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
  - *Op* is the particular operation that was performed on the raw sensor data collected in the 2.56 sec windows: *mean* indicates the mean, and *std* the standard deviation. These operations were already performed in the original data set.
  - *I* in some of the column names indicates the direction, e.g. whether the movement was in the *X*, *Y* or *Z* direction.
  - Each column contains measurements (in gravity units of *g*) specified in the column name (extracted from the original data) that have been averaged for each activity and for each subject. 