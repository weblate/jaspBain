context("Library: bainOneSample")

# This test file was auto-generated from a JASP example file.
# The JASP file is stored in tests/testthat/jaspfiles/library/.

test_that("BainTTestBayesianOneSample results match", {

  # Load from JASP example file
  jaspFile <- testthat::test_path("jaspfiles", "library", "bainOneSample.jasp")
  opts <- jaspTools::analysisOptions(jaspFile)
  dataset <- jaspTools::extractDatasetFromJASPFile(jaspFile)

  # Run analysis
  set.seed(1)
  results <- jaspTools::runAnalysis("BainTTestBayesianOneSample", dataset, opts)

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesPlots"]][["collection"]][["bainContainer_descriptivesPlots_postnumb"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-1_figure-1_postnumb")

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(240, 27.8574275457606, 29.45, 12.5879998643857, 0.81255189728045,
     31.0425724542394, "postnumb"))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list("", 24.7153302558384, 8.20513218398786, "postnumb", 0.860336678663424,
     0.0348098394703907, 0.104853481866185, "H0: Equal", "H1: Bigger",
     "H2: Smaller"))

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_posteriorProbabilityPlot"]][["collection"]][["bainContainer_posteriorProbabilityPlot_postnumb"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-1_figure-2_postnumb")

})

