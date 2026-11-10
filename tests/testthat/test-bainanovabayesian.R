context("Bain ANOVA")

# ==================================================================================================

# library(bain)
# data("sesamesim")
# set.seed(100)
# sesamesim$site <- as.factor(sesamesim$site)
# tt <- lm(age ~ site -1, sesamesim)
# bainResult <- bain(tt,"site1 = site2 = site3 = site4 = site5;
#                         site1 < site2 < site3 < site4 < site5;
#                         site1 > site2 > site3 > site4 > site5", fraction = 1)

options <- jaspTools::analysisOptions("BainAnovaBayesian")
options$dependent <- "age"
options$fixedFactors <- "site"
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$bayesFactorPlot <- TRUE
options$descriptivesPlot <- TRUE
options$seed <- 100
options$fraction <- 1
options$model <- "site1 = site2 = site3 = site4 = site5;site1 < site2 < site3 < site4 < site5;site1 > site2 > site3 > site4 > site5"
set.seed(1)
results <- jaspTools::runAnalysis("BainAnovaBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 151.738689499398, 7407.41986137818, "H1", 0.00659027703019649, 1,
			 48.8378337167388, "H2", 0.000128867468381812, 0.020475928678574, 1, "H3"))
})

test_that("Descriptives Plot matches", {
	plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesPlots"]][["data"]]
	testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
	jaspTools::expect_equal_plots(testPlot, "descriptives-plot")
})

test_that("Descriptive Statistics table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(60, 48.2744318767126, 49.8666666666667, 7.46169123980563, 0.812379616418173,
			 51.4589014566207, "site1", 55, 49.2096922729294, 50.8727272727273,
			 5.69942994373137, 0.848502836233587, 52.5357622725252, "site2",
			 64, 50.489575293814, 52.03125, 5.6791703787152, 0.786583181296488,
			 53.5729247061861, "site3", 43, 49.5377791422723, 51.4186046511628,
			 5.77446166585718, 0.959622484763091, 53.2994301600533, "site4",
			 18, 47.7596569623255, 50.6666666666667, 7.00420042042, 1.48319547056542,
			 53.5736763710078, "site5"))
})

test_that("Bain ANOVA table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(404.653666701285, 404.653666701285, 0.99332570108029, 0.990893300577126,
			 0.990908453263251, "H1", 2.70591193899018, 2.66792066023777,
			 0.00654629155133326, 0.00653026135816901, 0.00653036121856833, "H2",
			 0.0542131832880014, 0.0546281531591227, 0.000128007368376805,
			 0.000127693911081872, 0.000127695863770172, "H3", "", "", "",
			 0.0024487441536236, "", "Hu", "", 0.993379709978302, "", "",
			 0.00243348965441062, "Hc"))
})

test_that("Posterior Probabilities plot matches", {
	plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_posteriorProbabilityPlot"]][["data"]]
	testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
	jaspTools::expect_equal_plots(testPlot, "posterior-probabilities")
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("site1 = site2 = site3 = site4 = site5", "H1", "site1 &lt; site2 &lt; site3 &lt; site4 &lt; site5",
			 "H2", "site1 &gt; site2 &gt; site3 &gt; site4 &gt; site5", "H3"
			))
})

# ==================================================================================================

# library(bain)
# data("sesamesim")
# set.seed(900)
# sesamesim$site <- as.factor(sesamesim$site)
# tt <- lm(postnumb ~ site -1, sesamesim)
# bainResult <- bain(tt,"site1 =site2=site3=site4=site5;
#               site3 < site4 < site1 < site5 < site2", fraction = 4)

options <- jaspTools::analysisOptions("BainAnovaBayesian")
options$dependent <- "postnumb"
options$fixedFactors <- "site"
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$seed <- 900
options$fraction <- 1
options$model <- "site1 = site2 = site3 = site4 = site5;site3 < site4 < site1 < site5 < site2"
set.seed(1)
results <- jaspTools::runAnalysis("BainAnovaBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 1.5926902664359e-13, "H1", 6301624795663.32, 1, "H2"))
})

test_that("Descriptive Statistics table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(60, 26.8299066659707, 29.6666666666667, 11.4265030412376, 1.44735312642066,
			 32.5034266673626, "site1", 55, 36.018918993238, 38.9818181818182,
			 12.9907244816801, 1.51171103752476, 41.9447173703984, "site2",
			 64, 20.4408189400293, 23.1875, 11.3611353669163, 1.40139363867712,
			 25.9341810599707, "site3", 43, 21.9746619169075, 25.3255813953489,
			 8.94086639626362, 1.70968421097174, 28.6765008737902, "site4",
			 18, 26.5430307468571, 31.7222222222222, 8.511622196638, 2.64249318672075,
			 36.9014136975874, "site5"))
})

test_that("Bain ANOVA table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1.15146657084113e-11, 1.15146657084113e-11, 1.59269026643565e-13,
			 1.57096098370134e-13, 1.58426482533593e-13, "H1", 184.835501844539,
			 72.5611029418947, 0.999999999999841, 0.986356868505771, 0.994618896873291,
			 "H2", "", "", "", 0.0136431314940717, "", "Hu", "", 0.39257124425655, "", "",
			 0.00538110312655109, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("site1 = site2 = site3 = site4 = site5", "H1", "site3 &lt; site4 &lt; site1 &lt; site5 &lt; site2",
			 "H2"))
})

# ==================================================================================================
