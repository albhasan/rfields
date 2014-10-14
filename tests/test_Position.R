#test_Position.R
library(testthat)
library(rfields)

expect_that(length(new("Position")), equals(0))

# Test new object
len <- 10
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

