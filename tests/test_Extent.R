#test_Extent.R
library(testthat)
library(rfields)

expect_that(length(new("Extent")), equals(0))