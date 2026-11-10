context("Bain ANCOVA")

# ==================================================================================================

# library(bain)
# data("sesamesim")
# set.seed(100)
# sesamesim$site <- as.factor(sesamesim$site)
# tt <- lm(age ~ site+peabody+prenumb+postnumb+funumb-1, sesamesim)
# bainResult <- bain(tt,"site1 = site2 = site3 = site4 = site5;
#                         site1 < site2 < site3 < site4 < site5;
#                         site1 > site2 > site3 > site4 > site5", fraction = 1)

options <- jaspTools::analysisOptions("BainAncovaBayesian")
options$dependent <- "age"
options$fixedFactors <- "site"
options$covariates <- c("peabody", "prenumb", "postnumb", "funumb")
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$bayesFactorPlot <- TRUE
options$descriptivesPlot <- TRUE
options$seed <- 100
options$fraction <- 1
options$model <- "site1 = site2 = site3 = site4 = site5;site1 < site2 < site3 < site4 < site5;site1 > site2 > site3 > site4 > site5"
set.seed(1)
results <- jaspTools::runAnalysis("BainAncovaBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 0.0138359886722565, 67000.9825454438, "H1", 72.2752832260673, 1,
			 4842514.98989674, "H2", 1.2324795914782e-05, 1.75999142693628e-07, 1, "H3"))
})

test_that("Adjusted Means plot matches", {
	plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesPlots"]][["data"]]
	testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
	jaspTools::expect_equal_plots(testPlot, "adjusted-means")
})

test_that("Coefficients for Groups plus Covariates table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(60, 47.996998358907, 49.470232843929, 0.751664059463699, 50.9434673289511,
			 "site1", 55, 46.0602043737956, 47.8562155128899, 0.91634905195247,
			 49.6522266519841, "site2", 64, 52.9297945198661, 54.4143247835134,
			 0.757427317724733, 55.8988550471606, "site3", 43, 50.7941602448355,
			 52.4831836355637, 0.861762463010012, 54.1722070262918, "site4",
			 18, 47.6044724127278, 50.1889163156235, 1.31861805792427, 52.7733602185193,
			 "site5", 240, 0.00400716421086952, 0.0687595426462479, 0.0330375348456078,
			 0.133511921081626, "peabody", 240, 0.0810760411118373, 0.185400315885238,
			 0.0532276488732942, 0.289724590658639, "prenumb", 240, -0.000745866258043515,
			 0.0874049918617715, 0.0449757540521855, 0.175555849981586, "postnumb",
			 240, -0.039651059202616, 0.00053405154186734, 0.0205029842698429,
			 0.0407191622863507, "funumb"))
})

test_that("Bain ANCOVA table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(0.000105084311355764, 0.000105084311355764, 0.0136471638496271,
			 0.000104305784791424, 0.000102852927093839, "H1", 0.00754366520102897,
			 0.00759499836585521, 0.986352632464347, 0.00753696311491431,
			 0.00743797670427479, "H2", 1.28608075123845e-09, 1.29514269130519e-09,
			 1.73521214331422e-07, 1.28554751028547e-09, 1.26764133566952e-09, "H3", "",
			 "", "", 0.99235875399239, "", "Hu", "", 1.01341071884284, "", "",
			 0.992459109998326, "Hc"))
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
# tt <- lm(postnumb ~ site+prenumb+funumb-1, sesamesim)
# bainResult <- bain(tt,"site1 = site2 = site3 = site4 = site5; 
#               (site1, site3, site4) < (site2, site5)", fraction = 1)

options <- jaspTools::analysisOptions("BainAncovaBayesian")
options$dependent <- "postnumb"
options$fixedFactors <- "site"
options$covariates <- c("prenumb", "funumb")
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$seed <- 900
options$fraction <- 1
options$model <- "site1 = site2 = site3 = site4 = site5;(site1, site3, site4) < (site2, site5)"
set.seed(1)
results <- jaspTools::runAnalysis("BainAncovaBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 0.000143148890768521, "H1", 6985.73348791817, 1, "H2"))
})

test_that("Coefficients for Groups plus Covariates table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(60, 25.4137483833314, 27.4900972831131, 1.05938114993933, 29.5664461828948,
			 "site1", 55, 32.1234899760836, 34.3533531246737, 1.13770618551105,
			 36.5832162732638, "site2", 64, 25.866699539707, 27.9637950358383,
			 1.06996634258228, 30.0608905319696, "site3", 43, 24.6157064736522,
			 27.0489049018369, 1.24145058142776, 29.4821033300216, "site4",
			 18, 28.2756928301543, 32.0207748935292, 1.91079126602102, 35.765856956904,
			 "site5", 240, 0.511117765271733, 0.621794061201558, 0.0564685355459723,
			 0.732470357131384, "prenumb", 240, 0.131745579989435, 0.18492114241481,
			 0.0271308875289635, 0.238096704840186, "funumb"))
})

test_that("Bain ANCOVA table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(0.00140342160354945, 0.00140342160354945, 0.000143128402096524,
			 0.000135954220331965, 0.000149662835869667, "H1", 198.031798413799,
			 9.80392929358305, 0.999856871597903, 0.907323221968343, 0.994833983343027,
			 "H2", "", "", "", 0.0925468957188637, "", "Hu", "", 0.0495068437094995, "",
			 "", 0.00502360727575814, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("site1 = site2 = site3 = site4 = site5", "H1", "(site1, site3, site4) &lt; (site2, site5)",
			 "H2"))
})

# ==================================================================================================
