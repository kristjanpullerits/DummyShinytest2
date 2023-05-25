library(shinytest2)

test_that("{shinytest2} recording: DummyShinytest2", {
  app <- AppDriver$new(name = "DummyShinytest2", height = 817, width = 1407)
  # rlang::warn(paste0("`in_file` should be the path to the file, relative to the app's tests/testthat directory.\n",
  #     "Remove this warning when the file is in the correct location."))
  app$upload_file(in_file = "testfile.csv")
  app$expect_download("download")
})
