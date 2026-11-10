context("Library: bainPairedSamples")

# This test file was auto-generated from a JASP example file.
# The JASP file is stored in tests/testthat/jaspfiles/library/.

test_that("BainTTestBayesianPairedSamples results match", {

  # Load from JASP example file
  jaspFile <- testthat::test_path("jaspfiles", "library", "bainPairedSamples.jasp")
  opts <- jaspTools::analysisOptions(jaspFile)
  dataset <- jaspTools::extractDatasetFromJASPFile(jaspFile)

  # Run analysis
  set.seed(1)
  results <- jaspTools::runAnalysis("BainTTestBayesianPairedSamples", dataset, opts)

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesPlots"]][["collection"]][["bainContainer_descriptivesPlots_postnumb - prenumb"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-1_figure-1_postnumb-prenumb")

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(240, 7.48733943597818, 8.69166666666667, 9.51923473009165, 0.61446395963807,
     9.89599389735516, "postnumb - prenumb"))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list("", 2.76244529575384e-43, 276.004579526015, "postnumb - prenumb",
     2.76244529575384e-43, 1, 1.00086936981184e-45, "H0: Equal",
     "H1: Bigger", "H2: Smaller"))

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_posteriorProbabilityPlot"]][["collection"]][["bainContainer_posteriorProbabilityPlot_postnumb - prenumb"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-1_figure-2_postnumb-prenumb")

})

