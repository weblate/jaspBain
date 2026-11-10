context("Bain Linear Regression")

# ==================================================================================================

# library(bain)
# data("sesamesim")
# set.seed(100)
# tt <- lm(age ~ peabody + prenumb + postnumb + funumb, sesamesim)
# bainResult <- bain(tt,"peabody < 0 & prenumb > 0;peabody = 0 & postnumb = 0;postnumb > 0 & funumb > 0",
#                standardize = FALSE, fraction = 1)

options <- jaspTools::analysisOptions("BainRegressionLinearBayesian")
options$dependent <- "age"
options$covariates <- c("peabody", "prenumb", "postnumb", "funumb")
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$bayesFactorPlot <- TRUE
options$seed <- 100
options$fraction <- 1
options$model <- "peabody < 0 & prenumb > 0;peabody = 0 & postnumb = 0;postnumb > 0 & funumb > 0"
set.seed(1)
results <- jaspTools::runAnalysis("BainRegressionLinearBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 0.0332409523501628, 0.456965666915111, "H1", 30.0833739498773, 1,
			 13.7470690400624, "H2", 2.18834821169566, 0.0727427786305395, 1, "H3"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(240, -0.0486909406866819, 0.0098236736503201, 0.0298549436614947,
			 0.0683382879873221, "peabody", 240, 0.0633098838945105, 0.167649321189282,
			 0.0532353849957385, 0.271988758484053, "prenumb", 240, -0.046805449165961,
			 0.0420375226466934, 0.045328879771994, 0.130880494459348, "postnumb",
			 240, -0.0355734195087463, 0.00669477754047435, 0.0215658029344553,
			 0.048962974589695, "funumb"))
})

test_that("Bain Linear Regression table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1.27737935661342, 1.17361916984077, 0.0300555527346566,
			 0.029305070703886, 0.0295766900129236, "H1", 35.3064243610644,
			 35.3064243610644, 0.904172432186933, 0.881595400612596, 0.889766625858382,
			 "H2", 3.99748742610207, 2.5682874115328, 0.0657720150784106,
			 0.0641296990684638, 0.0647240966976583, "H3", "", "", "", 0.0250099278778557,
			 "", "Hu", "", 0.632213747584936, "", "", 0.0159325874310363, "Hc"))
})

test_that("Posterior Probabilities plot matches", {
	plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_posteriorProbabilityPlot"]][["data"]]
	testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
	jaspTools::expect_equal_plots(testPlot, "posterior-probabilities")
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("peabody &lt; 0 &amp; prenumb &gt; 0", "H1", "peabody = 0 &amp; postnumb = 0",
			 "H2", "postnumb &gt; 0 &amp; funumb &gt; 0", "H3"))
})

# ==================================================================================================

# library(bain)
# data("sesamesim")
# set.seed(900)
# tt <- lm(postnumb ~ prenumb + funumb + peabody, sesamesim)
# bainResult <- bain(tt,"prenumb = funumb = peabody = 0;prenumb > 0 & funumb > 0 & peabody > 0 ",
#                standardize = FALSE, fraction = 2)

options <- jaspTools::analysisOptions("BainRegressionLinearBayesian")
options$dependent <- "postnumb"
options$covariates <- c("prenumb", "funumb", "peabody")
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$seed <- 900
options$fraction <- 2
options$model <- "prenumb = funumb = peabody = 0;prenumb > 0 & funumb > 0 & peabody > 0"
set.seed(1)
results <- jaspTools::runAnalysis("BainRegressionLinearBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 4.93057122691304e-63, "H1", 2.12379228030716e+62, 1, "H2"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(240, 0.494098974883348, 0.621254756578272, 0.0648765909465239,
			 0.748410538273196, "prenumb", 240, 0.131783988339985, 0.187566866610198,
			 0.0284611751594524, 0.24334974488041, "funumb", 240, -0.0015190588748946,
			 0.0818592041766284, 0.0425407118238907, 0.165237467228151, "peabody"
			))
})

test_that("Bain Linear Regression table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(8.64985149525571e-62, 8.64985149525571e-62, 4.93057122691304e-63,
			 4.6646762733537e-63, 4.92503532253631e-63, "H1", 937.983604008773,
			 18.3704878314347, 1, 0.948375074045519, 0.998877228596453, "H2", "", "", "",
			 0.0516249259544814, "", "Hu", "", 0.0195850841666342, "", "",
			 0.00112277140354703, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("prenumb = funumb = peabody = 0", "H1", "prenumb &gt; 0 &amp; funumb &gt; 0 &amp; peabody &gt; 0",
			 "H2"))
})

# ==================================================================================================

# library(bain)
# data("sesamesim")
# set.seed(900)
# tt <- lm(postnumb ~ prenumb + funumb + peabody, sesamesim)
# bainResult <- bain(tt,"prenumb = funumb = peabody = 0;prenumb > 0 & funumb > 0 & peabody > 0 ",
#                standardize = TRUE, fraction = 3)

options <- jaspTools::analysisOptions("BainRegressionLinearBayesian")
options$dependent <- "postnumb"
options$covariates <- c("prenumb", "funumb", "peabody")
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$seed <- 900
options$fraction <- 3
options$standardized <- TRUE
options$model <- "prenumb = funumb = peabody = 0;prenumb > 0 & funumb > 0 & peabody > 0"
set.seed(1)
results <- jaspTools::runAnalysis("BainRegressionLinearBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 2.68421368638488e-164, "H1", 4.161965662084e+163, 1, "H2"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(240, 0.425136718359189, 0.523997033619579, 0.0504398632016646,
			 0.622857348879969, "prenumb", 240, 0.214535343365429, 0.302738216498521,
			 0.0450022928119215, 0.390941089631612, "funumb", 240, -0.000932877627413217,
			 0.104533362133664, 0.0538102947773436, 0.209999601894741, "peabody"
			))
})

test_that("Bain Linear Regression table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1.05833115528577e-162, 1.05833115528577e-162, 2.68421368638488e-164,
			 2.61781873208312e-164, 2.68314544905412e-164, "H1", 2755.5212097652,
			 44.0473792740756, 1, 0.977801150341825, 0.999602029698242, "H2", "", "", "",
			 0.0221988496581751, "", "Hu", "", 0.0159851352687752, "", "",
			 0.00039797030175817, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("prenumb = funumb = peabody = 0", "H1", "prenumb &gt; 0 &amp; funumb &gt; 0 &amp; peabody &gt; 0",
			 "H2"))
})

# ==================================================================================================
