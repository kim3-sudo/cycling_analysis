### Cycling Analysis
### Josh Katz & Sejin Kim
### STAT 306 S21 @ Kenyon College

# Load modules
library(dplyr)
library(mosaic)
library(lubridate)
library(strsplit)
library(distr)
library(parallel)

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

# Generate a Discrete Distribution for Total Time in 2021 stage 5
stage5_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-5')$timesec))
stage5_2021_ac
plot(stage5_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2021 Stage 5")

# Generate a Discrete Distribution for Total Time in 2021 stage 4
stage4_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-4')$timesec))
stage4_2021_ac
plot(stage4_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2021 Stage 4")

# Generate a Discrete Distribution for Total Time in 2021 stage 3
stage3_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-3')$timesec))
stage3_2021_ac
plot(stage3_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2021 Stage 3")

# Generate a Discrete Distribution for Total Time in 2021 stage 2
stage2_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-2')$timesec))
stage2_2021_ac
plot(stage2_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2021 Stage 2")

# Generate a Discrete Distribution for Total Time in 2021 stage 1
stage1_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-1')$timesec))
stage1_2021_ac
plot(stage1_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2021 Stage 1")

# Generate a Discrete Distribution for Total Time in 2019 stage 5
stage5_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-5')$timesec))
stage5_2019_ac
plot(stage5_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2019 Stage 5")

# Generate a Discrete Distribution for Total Time in 2019 stage 4
stage4_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-4')$timesec))
stage4_2019_ac
plot(stage4_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2019 Stage 4")

# Generate a Discrete Distribution for Total Time in 2019 stage 3
stage3_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-3')$timesec))
stage3_2019_ac
plot(stage3_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2019 Stage 3")

# Generate a Discrete Distribution for Total Time in 2019 stage 2
stage2_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-2')$timesec))
stage2_2019_ac
plot(stage2_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2019 Stage 2")

# Generate a Discrete Distribution for Total Time in 2019 stage 1
stage1_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-1')$timesec))
stage1_2019_ac
plot(stage1_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2019 Stage 1")

# Generate a Discrete Distribution for Total Time in 2018 stage 5
stage5_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-5')$timesec))
stage5_2018_ac
plot(stage5_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2018 Stage 5")

# Generate a Discrete Distribution for Total Time in 2018 stage 4
stage4_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-4')$timesec))
stage4_2018_ac
plot(stage4_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2018 Stage 4")

# Generate a Discrete Distribution for Total Time in 2018 stage 3
stage3_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-3')$timesec))
stage3_2018_ac
plot(stage3_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2018 Stage 3")

# Generate a Discrete Distribution for Total Time in 2018 stage 2
stage2_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-2')$timesec))
stage2_2018_ac
plot(stage2_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2018 Stage 2")

# Generate a Discrete Distribution for Total Time in 2018 stage 1
stage1_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-1')$timesec))
stage1_2018_ac
plot(stage1_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Total Time in TOTA 2018 Stage 1")

# Try a pearson's chisq test for homogeneity of proportions (in this case, independence between distributions)
## Create a 2D dataframe for chisq test - timesec ~ stage
stageXtimesec <- tally(timesec ~ stage, data =  filter(tourOfTheAlps, timesec != 0))
chisq.test(stageXtimesec)
# Need to simulate distribution because of low expected counts in many cells
chisq.test(stageXtimesec, simulate.p.value = TRUE, B = 10000)
# More simulation increases computation time, this line may take several minutes to run!
chisq.test(stageXtimesec, simulate.p.value = TRUE, B = 100000)
# Alternatively, employ parallel processing - THIS WILL ABSOLUTELY PIN YOUR SYSTEM!
library(parallel)
# Must use sockets because Windows
numCores <- detectCores()
print(paste('Using', numCores, 'cores'))
computeCluster <- makeCluster(numCores)
## Recreate objects and reevaluate chisq tests
clusterEvalQ(computeCluster, {
  library(mosaic)
})
clusterEvalQ(computeCluster, tourOfTheAlps <- readRDS(url('https://github.com/kim3-sudo/cycling_analysis_data/blob/main/rds/tour_of_the_alps.rds?raw=true')))
clusterEvalQ(computeCluster, {
  timesecVector <- numeric(length(1:nrow(tourOfTheAlps)))
  for (row in 1:nrow(tourOfTheAlps)) {
    tryCatch(
      expr = {
        seconds <- 0
        splitTime <- unlist(strsplit(tourOfTheAlps[row, "time"], ":"))
        hoursToSeconds <- as.numeric(splitTime[[1]]) * 3600
        minutesToSeconds <- as.numeric(splitTime[[2]]) * 60 # This line is returning an error but the loop runs right, double-check?
        seconds <- hoursToSeconds + minutesToSeconds + as.numeric(splitTime[[3]])
        timesecVector[row] <- as.numeric(seconds)
      },
      error = function(e) {
        print('oopsie i made a fucky wucky a wittle oopsie doopsie')
      }
    )
  }
  tourOfTheAlps$timesec <- timesecVector
  stageXtimesec <- tally(timesec ~ stage, data =  filter(tourOfTheAlps, timesec != 0))
})
clusterEvalQ(computeCluster, result <- chisq.test(stageXtimesec, simulate.p.value = TRUE, B = 100000))
clusterEvalQ(computeCluster, print(result))
stopCluster(computeCluster)

# Reanalyze all with time differences instead of pure time
# Convert timestamps to seconds
## Pre-allocate vector
timediffsecVector <- numeric(length(1:nrow(tourOfTheAlps)))
## Fill that vector
for (row in 1:nrow(tourOfTheAlps)) {
  seconds <- 0
  splitTime <- unlist(strsplit(tourOfTheAlps[row, "timediff"], ":"))
  hoursToSeconds <- as.numeric(splitTime[[1]]) * 3600
  minutesToSeconds <- as.numeric(splitTime[[2]]) * 60 # This line is returning an error but the loop runs right, double-check?
  seconds <- hoursToSeconds + minutesToSeconds + as.numeric(splitTime[[3]])
  timediffsecVector[row] <- as.numeric(seconds)
}
## Put vector on dataset
tourOfTheAlps$timediffsec <- timediffsecVector

# Generate a Discrete Distribution for Time Diffs in 2021 stage 5
stage5_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-5')$timediffsec))
stage5_2021_ac
plot(stage5_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2021 Stage 5")

# Generate a Discrete Distribution for Time Diffs in 2021 stage 4
stage4_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-4')$timediffsec))
stage4_2021_ac
plot(stage4_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2021 Stage 4")

# Generate a Discrete Distribution for Time Diffs in 2021 stage 3
stage3_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-3')$timediffsec))
stage3_2021_ac
plot(stage3_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2021 Stage 3")

# Generate a Discrete Distribution for Time Diffs in 2021 stage 2
stage2_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-2')$timediffsec))
stage2_2021_ac
plot(stage2_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2021 Stage 2")

# Generate a Discrete Distribution for Time Diffs in 2021 stage 1
stage1_2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2021/stage-1')$timediffsec))
stage1_2021_ac
plot(stage1_2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2021 Stage 1")

# Generate a Discrete Distribution for Time Diffs in 2019 stage 5
stage5_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-5')$timediffsec))
stage5_2019_ac
plot(stage5_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2019 Stage 5")

# Generate a Discrete Distribution for Time Diffs in 2019 stage 4
stage4_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-4')$timediffsec))
stage4_2019_ac
plot(stage4_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2019 Stage 4")

# Generate a Discrete Distribution for Time Diffs in 2019 stage 3
stage3_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-3')$timediffsec))
stage3_2019_ac
plot(stage3_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2019 Stage 3")

# Generate a Discrete Distribution for Time Diffs in 2019 stage 2
stage2_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-2')$timediffsec))
stage2_2019_ac
plot(stage2_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2019 Stage 2")

# Generate a Discrete Distribution for Time Diffs in 2019 stage 1
stage1_2019_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2019/stage-1')$timediffsec))
stage1_2019_ac
plot(stage1_2019_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2019 Stage 1")

# Generate a Discrete Distribution for Time Diffs in 2018 stage 5
stage5_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-5')$timediffsec))
stage5_2018_ac
plot(stage5_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2018 Stage 5")

# Generate a Discrete Distribution for Time Diffs in 2018 stage 4
stage4_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-4')$timediffsec))
stage4_2018_ac
plot(stage4_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2018 Stage 4")

# Generate a Discrete Distribution for Time Diffs in 2018 stage 3
stage3_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-3')$timediffsec))
stage3_2018_ac
plot(stage3_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2018 Stage 3")

# Generate a Discrete Distribution for Time Diffs in 2018 stage 2
stage2_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-2')$timediffsec))
stage2_2018_ac
plot(stage2_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2018 Stage 2")

# Generate a Discrete Distribution for Time Diffs in 2018 stage 1
stage1_2018_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, stage == 'tour-of-the-alps/2018/stage-1')$timediffsec))
stage1_2018_ac
plot(stage1_2018_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for Time Diffs in TOTA 2018 Stage 1")

# Try a pearson's chisq test for homogeneity of proportions (in this case, independence between distributions)
## Create a 2D dataframe for chisq test - timediffsec ~ stage
stageXtimediffsec <- tally(timediffsec ~ stage, data =  filter(tourOfTheAlps, timediffsec != 0))
chisq.test(stageXtimediffsec)
# Need to simulate distribution because of low expected counts in many cells
chisq.test(stageXtimediffsec, simulate.p.value = TRUE, B = 10000)
# More simulation increases computation time, this line may take several minutes to run!
chisq.test(stageXtimediffsec, simulate.p.value = TRUE, B = 100000)
# Alternatively, employ parallel processing - THIS WILL ABSOLUTELY PIN YOUR SYSTEM!
library(parallel)
# Must use sockets because Windows
numCores <- detectCores()
print(paste('Using', numCores, 'cores'))
computeCluster <- makeCluster(numCores)
## Recreate objects and reevaluate chisq tests
clusterEvalQ(computeCluster, {
  library(mosaic)
})
clusterEvalQ(computeCluster, tourOfTheAlps <- readRDS(url('https://github.com/kim3-sudo/cycling_analysis_data/blob/main/rds/tour_of_the_alps.rds?raw=true')))
clusterEvalQ(computeCluster, {
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
})
clusterEvalQ(computeCluster, result <- chisq.test(stageXtimediffsec, simulate.p.value = TRUE, B = 100000))
clusterEvalQ(computeCluster, print(result))
stopCluster(computeCluster)

# Create a distribution for supertuck and no-supertuck (2021 vs everything else)
tota2021_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, year == '2021')$timediffsec))
tota2021_ac
plot(tota2021_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for TOTA 2021 (w/o supertuck)")

totaallelse_ac <- DiscreteDistribution(supp = c(filter(tourOfTheAlps, year != 2021)$timediffsec))
totaallelse_ac
plot(totaallelse_ac, panel.first = grid(lwd = 2), lwd = 3, main = "Discrete Distribution for TOTA 2021 (w/ supertuck)")

# Test those distributions
## Create a new column for supertuck
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
result <- chisq.test(supertuckData)
print(result)
# With a simulation because of low values
result <- chisq.test(supertuckData, simulate.p.value = TRUE, B = 10000)
print(result)
# And with multicore simulation for 100K replicates
numCores <- detectCores()
print(paste('Using', numCores, 'cores'))
computeCluster <- makeCluster(numCores)
clusterEvalQ(computeCluster, {
  library(mosaic)
})
clusterEvalQ(computeCluster, tourOfTheAlps <- readRDS(url('https://github.com/kim3-sudo/cycling_analysis_data/blob/main/rds/tour_of_the_alps.rds?raw=true')))
clusterEvalQ(computeCluster, {
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
})
clusterEvalQ(computeCluster, {
  result <- chisq.test(supertuckData, simulate.p.value = TRUE, B = 100000)
})
clusterEvalQ(computeCluster, {
  print(result)
})
stopCluster(computeCluster)