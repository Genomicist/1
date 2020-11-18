test_that("distributionplot test", {
    #Tests if the function gives a warning when Scale is not properly defined
    expect_output(distributionplot("testdata/campylobacter.csv","2","test_output"),'continuous by default')
    #Tests if the function gives an error when the input name is not csv file format.
    expect_error(distributionplot('testdata/giardia','con','test_output2'))
    #Tests if the output file corresponds to a reference file. The reference file is created when running test() for the first time.
    expect_known_output(distributionplot("testdata/campylobacter.csv","con","test_output3"),here("testdata","test_output3.ref"))
})
