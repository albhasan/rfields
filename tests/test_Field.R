#test_Field.R
library(testthat)
library(sp)
library(rfields)

# Test empty object
expect_that(length(new("Field")), equals(0))


# General stuff
wgs84 <- CRS("+proj=longlat +datum=WGS84")
coords <- matrix(rnorm(10 * 4, mean = 0, sd = 1), ncol = 4)
position2D <- SpatialPoints(coords = coords[, 1:2], proj4string = wgs84)
position3D <- SpatialPoints(coords = coords[, 1:3], proj4string = wgs84)
extent2D.sp <- bbox(position2D)
extent3D.sp <- bbox(position3D)
value <- coords[, 4]

# Test new object
#newfield2D <- new("Field", extent = extent2D.sp, value = )
#(.Object, , , , estimator)

