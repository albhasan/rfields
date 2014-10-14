#test_Estimator.R
library(testthat)
library(rfields)

# Test empty object
expect_that(length(new("Estimator")), equals(0))



# New object
knownPosition
valueSubset
unknownPosition

#estimator01 <- new("Estimator", )
#function(.Object, knownPosition, valueSubset, unknownPosition)