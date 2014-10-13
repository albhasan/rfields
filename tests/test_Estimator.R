#test_Estimator.R
library(testthat)
library(rfields)

expect_that(length(new("Estimator")), equals(0))