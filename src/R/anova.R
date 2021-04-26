### Cycling Analysis
### Josh Katz & Sejin Kim
### STAT 306 S21 @ Kenyon College

# Load modules
library(dplyr)
library(mosaic)
library(lubridate)
library(strsplit)

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

# Data are clearly non-normal
# Use Kruskal-Wallis instead
kruskal.test(timesec ~ stage, data = tourOfTheAlps)
kruskal.test(timesec ~ stage, data = filter(tourOfTheAlps, year == 2021 | year == 2019))
kruskal.test(timesec ~ stage, data = filter(tourOfTheAlps, year == 2021 | year == 2018))
kruskal.test(timesec ~ stage, data = filter(tourOfTheAlps, year == 2021 | year == 2017))
kruskal.test(timesec ~ stage, data = filter(tourOfTheAlps, year == 2019 | year == 2018))
kruskal.test(timesec ~ stage, data = filter(tourOfTheAlps, year == 2029 | year == 2017))
# NOT TRUSTWORTHY - distributions are not necessarily equivalent - that's why we used discrete distributions and a chisq test!