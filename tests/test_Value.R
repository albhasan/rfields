#test_Value.R
library(testthat)
library(rfields)

# Test empty object
expect_that(length(new("Value")), equals(0))

# Test new object
#nv <- value(valueSet = valueSet) # TODO: Not working!
len <- 10
valueSet <- rnorm(len, mean = 0, sd = 1)
valueSet.int <- as.integer(valueSet * 1000)
valueSet.dou <- as.double(valueSet * 1000)
valueSet.log <- as.logical(rbinom(len, 1, 0.5))
valueSet.cha <- paste("a", valueSet.int)

wgs84 <- CRS("+proj=longlat +datum=WGS84")
coords <- matrix(rnorm(len * 4, mean = 0, sd = 1), ncol = 4)
instant <- rep(as.POSIXct(Sys.time()), len)
position2D <- SpatialPoints(coords = coords[, 1:2], proj4string = wgs84)
position3D <- SpatialPoints(coords = coords[, 1:3], proj4string = wgs84)
extent2D.sp <- bbox(position2D)
extent3D.sp <- bbox(position3D)
instant.list <- list(instant)
position2D.list <- list(position2D)
position3D.list <- list(position3D)
pos2Dinstant.list <- list(position2D.list, instant.list)
pos3Dinstant.list <- list(position3D.list, instant.list)
position01 <- new("Position", coords = instant.list)
position02 <- new("Position", coords = position2D.list)
position03 <- new("Position", coords = position3D.list)
position04 <- new("Position", coords = pos2Dinstant.list)
position05 <- new("Position", coords = pos3Dinstant.list)

valueSet.int.list <- list(valueSet.int)
valueSet.dou.list <- list(valueSet.dou)
valueSet.log.list <- list(valueSet.log)
valueSet.cha.list <- list(valueSet.cha)
valueSet.po1.list <- list(position01)
valueSet.po2.list <- list(position02)
valueSet.po3.list <- list(position03)
valueSet.po4.list <- list(position04)
valueSet.po5.list <- list(position05)

newValue01 <- new(Class = "Value", valueSet = valueSet.po1.list)
newValue02 <- new(Class = "Value", valueSet = valueSet.po2.list)
newValue03 <- new(Class = "Value", valueSet = valueSet.po3.list)
newValue04 <- new(Class = "Value", valueSet = valueSet.po4.list)
newValue05 <- new(Class = "Value", valueSet = valueSet.po5.list)
newValue06 <- new(Class = "Value", valueSet = valueSet.int.list)
newValue07 <- new(Class = "Value", valueSet = valueSet.dou.list)
newValue08 <- new(Class = "Value", valueSet = valueSet.log.list)
newValue09 <- new(Class = "Value", valueSet = valueSet.cha.list)
