#test_Field.R
library(testthat)
library(rfields)

expect_that(length(new("Field")), equals(0))