#test_Position.R
library(testthat)
library(rfields)

expect_that(length(new("Position")), equals(0))