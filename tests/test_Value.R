#test_Value.R
library(testthat)
library(rfields)

expect_that(length(new("Value")), equals(0))