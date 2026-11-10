context("Library: bainIndependentSamples")

# This test file was auto-generated from a JASP example file.
# The JASP file is stored in tests/testthat/jaspfiles/library/.

test_that("BainTTestBayesianIndependentSamples results match", {

  # Load from JASP example file
  jaspFile <- testthat::test_path("jaspfiles", "library", "bainIndependentSamples.jasp")
  opts <- jaspTools::analysisOptions(jaspFile)
  dataset <- jaspTools::extractDatasetFromJASPFile(jaspFile)

  # Run analysis
  set.seed(1)
  results <- jaspTools::runAnalysis("BainTTestBayesianIndependentSamples", dataset, opts)

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesPlots"]][["collection"]][["bainContainer_descriptivesPlots_postnumb"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-1_figure-1_postnumb")

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(115, 1, 27.709094405675, 30.095652173913, 13.0578832229393, 1.21765388908315,
     32.4822099421511, "postnumb", 125, 2, 26.7239441460813, 28.856,
     12.1620138400333, 1.08780358758431, 30.9880558539187, ""))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list("", 7.46360279491736, 25.8769996680743, "postnumb", 0.852785435403624,
     0.11425922022329, 0.0329553443730861, "H0: Equal", "H1: Bigger",
     "H2: Smaller"))

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_posteriorProbabilityPlot"]][["collection"]][["bainContainer_posteriorProbabilityPlot_postnumb"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-1_figure-2_postnumb")

})

