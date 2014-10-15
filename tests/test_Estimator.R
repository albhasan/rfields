#test_Estimator.R
library(testthat)
library(rfields)

# Test empty object
expect_that(length(new("Estimator")), equals(0))

# Test new object
len <- 10
wgs84 <- CRS("+proj=longlat +datum=WGS84")
coords <- matrix(rnorm(len * 4, mean = 0, sd = 1), ncol = 4)

instantknown <- (Sys.time() + (sample(1:(len * 10), len, replace = FALSE) * 3600))[1:(len/2)]
position2Dknown <- SpatialPoints(coords = coords[, 1:2], proj4string = wgs84)[1:(len/2)]
position3Dknown <- SpatialPoints(coords = coords[, 1:3], proj4string = wgs84)[1:(len/2)]
instantunknown <- (Sys.time() + (sample(1:(len * 10), len, replace = FALSE) * 3600))[(len/2):len]
position2Dunknown <- SpatialPoints(coords = coords[, 1:2], proj4string = wgs84)[(len/2):len]
position3Dunknown <- SpatialPoints(coords = coords[, 1:3], proj4string = wgs84)[(len/2):len]
extent2Dknown.sp <- bbox(position2Dknown)
extent3Dknown.sp <- bbox(position3Dknown)

instantknown.list <- list(instantknown)
position2Dknown.list <- list(position2Dknown)
position3Dknown.list <- list(position3Dknown)
pos2Dinstantknown.list <- list(position2Dknown.list, instantknown.list)
pos3Dinstantknown.list <- list(position3Dknown.list, instantknown.list)
instantunknown.list <- list(instantunknown)
position2Dunknown.list <- list(position2Dunknown)
position3Dunknown.list <- list(position3Dunknown)
pos2Dinstantunknown.list <- list(position2Dunknown.list, instantunknown.list)
pos3Dinstantunknown.list <- list(position3Dunknown.list, instantunknown.list)

positionInstantknown <- new("Position", coords = instantknown.list)
position2Dknown <- new("Position", coords = position2Dknown.list)
position3Dknown <- new("Position", coords = position3Dknown.list)
position2Dinstantknown <- new("Position", coords = pos2Dinstantknown.list)
position3Dinstantknown <- new("Position", coords = pos3Dinstantknown.list)
positionInstantunknown <- new("Position", coords = instantunknown.list)
position2Dunknown <- new("Position", coords = position2Dunknown.list)
position3Dunknown <- new("Position", coords = position3Dunknown.list)
position2Dinstantunknown <- new("Position", coords = pos2Dinstantunknown.list)
position3Dinstantunknown <- new("Position", coords = pos3Dinstantunknown.list)

valueSet <- rnorm(len/2, mean = 0, sd = 1)
valueSet.int <- as.integer(valueSet * 1000)
valueSet.dou <- as.double(valueSet * 1000)
valueSet.log <- as.logical(rbinom(len/2, 1, 0.5))
valueSet.cha <- paste("a", valueSet.int)
valueSet.int.list <- list(valueSet.int)
valueSet.dou.list <- list(valueSet.dou)
valueSet.log.list <- list(valueSet.log)
valueSet.cha.list <- list(valueSet.cha)

value.int <- new(Class = "Value", valueSet = valueSet.int.list)
value.dou <- new(Class = "Value", valueSet = valueSet.dou.list)
value.log <- new(Class = "Value", valueSet = valueSet.log.list)
value.cha <- new(Class = "Value", valueSet = valueSet.cha.list)
# TODO value.pos  - positions as values?????

estimator01 <- new(Class = "Estimator", knownPosition = positionInstantknown, valueSubset = value.int, unknownPosition = positionInstantunknown)
estimator02 <- new(Class = "Estimator", knownPosition = positionInstantknown, valueSubset = value.dou, unknownPosition = positionInstantunknown)
estimator03 <- new(Class = "Estimator", knownPosition = positionInstantknown, valueSubset = value.log, unknownPosition = positionInstantunknown)
estimator04 <- new(Class = "Estimator", knownPosition = positionInstantknown, valueSubset = value.cha, unknownPosition = positionInstantunknown)
estimator05 <- new(Class = "Estimator", knownPosition = position2Dknown, valueSubset = value.int, unknownPosition = position2Dunknown)
estimator06 <- new(Class = "Estimator", knownPosition = position2Dknown, valueSubset = value.dou, unknownPosition = position2Dunknown)
estimator07 <- new(Class = "Estimator", knownPosition = position2Dknown, valueSubset = value.log, unknownPosition = position2Dunknown)
estimator08 <- new(Class = "Estimator", knownPosition = position2Dknown, valueSubset = value.cha, unknownPosition = position2Dunknown)
estimator09 <- new(Class = "Estimator", knownPosition = position3Dknown, valueSubset = value.int, unknownPosition = position3Dunknown)
estimator10 <- new(Class = "Estimator", knownPosition = position3Dknown, valueSubset = value.dou, unknownPosition = position3Dunknown)
estimator11 <- new(Class = "Estimator", knownPosition = position3Dknown, valueSubset = value.log, unknownPosition = position3Dunknown)
estimator12 <- new(Class = "Estimator", knownPosition = position3Dknown, valueSubset = value.cha, unknownPosition = position3Dunknown)
estimator13 <- new(Class = "Estimator", knownPosition = position2Dinstantknown, valueSubset = value.int, unknownPosition = position2Dinstantunknown)
estimator14 <- new(Class = "Estimator", knownPosition = position2Dinstantknown, valueSubset = value.dou, unknownPosition = position2Dinstantunknown)
estimator15 <- new(Class = "Estimator", knownPosition = position2Dinstantknown, valueSubset = value.log, unknownPosition = position2Dinstantunknown)
estimator16 <- new(Class = "Estimator", knownPosition = position2Dinstantknown, valueSubset = value.cha, unknownPosition = position2Dinstantunknown)
estimator17 <- new(Class = "Estimator", knownPosition = position3Dinstantknown, valueSubset = value.int, unknownPosition = position3Dinstantunknown)
estimator18 <- new(Class = "Estimator", knownPosition = position3Dinstantknown, valueSubset = value.dou, unknownPosition = position3Dinstantunknown)
estimator19 <- new(Class = "Estimator", knownPosition = position3Dinstantknown, valueSubset = value.log, unknownPosition = position3Dinstantunknown)
estimator20 <- new(Class = "Estimator", knownPosition = position3Dinstantknown, valueSubset = value.cha, unknownPosition = position3Dinstantunknown)
