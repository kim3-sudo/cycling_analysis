### Cycling Analysis
### Josh Katz & Sejin Kim
### STAT 306 S21 @ Kenyon College

# Load modules
library(dplyr)
library(mosaic)
library(lubridate)
library(car)

# Read data in
tourOfTheAlps <- readRDS(url('https://github.com/kim3-sudo/cycling_analysis_data/blob/main/rds/tour_of_the_alps.rds?raw=true'))

# Convert timestamps to seconds
## Pre-allocate vector
timesecVector <- numeric(length(1:nrow(tourOfTheAlps)))
## Fill that vector
for (row in 1:nrow(tourOfTheAlps)) {
  seconds <- 0
  splitTime <- unlist(strsplit(tourOfTheAlps[row, "time"], ":"))
  hoursToSeconds <- as.numeric(splitTime[[1]]) * 3600
  minutesToSeconds <- as.numeric(splitTime[[2]]) * 60 # This line is returning an error but the loop runs right, double-check?
  seconds <- hoursToSeconds + minutesToSeconds + as.numeric(splitTime[[3]])
  timesecVector[row] <- as.numeric(seconds)
}
## Put vector on dataset
tourOfTheAlps$timesec <- timesecVector

timediffsecVector <- numeric(length(1:nrow(tourOfTheAlps)))
for (row in 1:nrow(tourOfTheAlps)) {
  tryCatch(
    expr = {
      seconds <- 0
      splitTime <- unlist(strsplit(tourOfTheAlps[row, "timediff"], ":"))
      hoursToSeconds <- as.numeric(splitTime[[1]]) * 3600
      minutesToSeconds <- as.numeric(splitTime[[2]]) * 60 # This line is returning an error but the loop runs right, double-check?
      seconds <- hoursToSeconds + minutesToSeconds + as.numeric(splitTime[[3]])
      timediffsecVector[row] <- as.numeric(seconds)
    },
    error = function(e) {
      print('oopsie i made a fucky wucky a wittle oopsie doopsie')
    }
  )
}
tourOfTheAlps$timediffsec <- timediffsecVector
stageXtimediffsec <- tally(timediffsec ~ stage, data =  filter(tourOfTheAlps, timediffsec != 0))
supertuckVector <- logical(length(1:nrow(tourOfTheAlps)))
for (row in 1:nrow(tourOfTheAlps)) {
  if (tourOfTheAlps[row, "year"] == 2021) {
    supertuckVector[row] <- as.logical(FALSE)
  } else if (tourOfTheAlps[row, "year"] != 2021) {
    supertuckVector[row] <- as.logical(TRUE)
  }
}
tourOfTheAlps$supertuck <- supertuckVector
supertuckData <- tally(timediffsec ~ supertuck, data = filter(tourOfTheAlps, timediffsec != 0))

car::qqPlot(filter(tourOfTheAlps, supertuck == FALSE)$timediffsec, main = "Normal Q-Q Plot without supertucks", ylab = "Time difference from winner (secs)")
car::qqPlot(filter(tourOfTheAlps, supertuck != FALSE)$timediffsec, main = "Normal Q-Q Plot with supertucks", ylab = "Time difference from winner (secs)")
