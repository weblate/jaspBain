context("Bain SEM")

# ==================================================================================================

# library(bain)
# library(lavaan)
# data("sesamesim")
# model1 <- '
#     A =~ Ab + Al + Af + An + Ar + Ac 
#     B =~ Bb + Bl + Bf + Bn + Br + Bc 
# '
# fit1 <- sem(model1, data = sesamesim, std.lv = TRUE)
# hypotheses1 <-
#   " A=~Ab > .6 & A=~Al > .6 & A=~Af > .6 & A=~An > .6 & A=~Ar > .6 & A=~Ac >.6 & 
#     B=~Bb > .6 & B=~Bl > .6 & B=~Bf > .6 & B=~Bn > .6 & B=~Br > .6 & B=~Bc >.6"
# set.seed(100)
# bainResult <- bain(fit1,hypotheses1,fraction=3,standardize=FALSE)

options <- jaspTools::analysisOptions("BainSemBayesian")
options$syntax <- list(modelOriginal = "A =~ Ab + Al + Af + An + Ar + Ac; B =~ Bb + Bl + Bf + Bn + Br + Bc")
options$bayesFactorMatrix <- TRUE
options$descriptives <- TRUE
options$bayesFactorPlot <- TRUE
options$fixedFactors <- ""
options$pathDiagram <- TRUE
options$pathDiagramEstimates <- TRUE
options$pathDiagramLegend <- TRUE
options$seed <- 100
options$fraction <- 1
options$model <- "A=~Ab > .6 & A=~Al > .6 & A=~Af > .6 & A=~An > .6 & A=~Ar > .6 & A=~Ac >.6 & B=~Bb > .6 & B=~Bl > .6 & B=~Bf > .6 & B=~Bn > .6 & B=~Br > .6 & B=~Bc >.6"
set.seed(1)
results <- jaspTools::runAnalysis("BainSemBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, "H1"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(240, 3.27234343764435, 3.88479958570525, 0.312483368516908, 4.49725573376614,
			 "A=~Ab", 240, 8.33433831455942, 9.58335890609077, 0.637267113775285,
			 10.8323794976221, "A=~Al", 240, 2.94916536411092, 3.36743845907787,
			 0.21340856172166, 3.78571155404482, "A=~Af", 240, 9.71650568863459,
			 10.9063769996814, 0.607088354904675, 12.0962483107283, "A=~An",
			 240, 1.50072596736168, 1.78966463397027, 0.147420395929568,
			 2.07860330057886, "A=~Ar", 240, 3.91023942823756, 4.42382724638746,
			 0.262039416132655, 4.93741506453737, "A=~Ac", 240, 3.80014730487737,
			 4.43337130535907, 0.323079406293428, 5.06659530584077, "B=~Bb",
			 240, 4.14813162554953, 5.05396312117863, 0.462167418776154,
			 5.95979461680774, "B=~Bl", 240, 2.77927605023721, 3.19986341663871,
			 0.214589334150548, 3.62045078304022, "B=~Bf", 240, 7.61169331094648,
			 8.58805986628854, 0.498155355426691, 9.56442642163061, "B=~Bn",
			 240, 1.68630422453705, 1.99705693902588, 0.158550216708065,
			 2.30780965351471, "B=~Br", 240, 3.21686768601433, 3.68521736226071,
			 0.238958307367204, 4.15356703850708, "B=~Bc"))
})

test_that("Bain Structural Equation Model table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(49588018862032.9, 26.9633533509598, 1, 0.96423890985286,
			 0.999999999999979, "H1", "", "", "", 0.0357610901471398, "", "Hu", "",
			 5.44633654462113e-13, "", "", 2.10524760488996e-14, "Hc"))
})

test_that("Path Diagram plot matches", {
	plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_pathDiagram"]][["data"]]
	testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
	jaspTools::expect_equal_plots(testPlot, "path-diagram")
})

test_that("Posterior Probabilities plot matches", {
	plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_posteriorProbabilityPlot"]][["data"]]
	testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
	jaspTools::expect_equal_plots(testPlot, "posterior-probabilities")
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("A=~Ab &gt; .6 &amp; A=~Al &gt; .6 &amp; A=~Af &gt; .6 &amp; A=~An &gt; .6 &amp; A=~Ar &gt; .6 &amp; A=~Ac &gt;.6 &amp; B=~Bb &gt; .6 &amp; B=~Bl &gt; .6 &amp; B=~Bf &gt; .6 &amp; B=~Bn &gt; .6 &amp; B=~Br &gt; .6 &amp; B=~Bc &gt;.6",
			 "H1"))
})

# ==================================================================================================

# library(bain)
# library(lavaan)
# data("sesamesim")
# model1 <- '
#     A =~ Ab + Al + Af + An + Ar + Ac 
#     B =~ Bb + Bl + Bf + Bn + Br + Bc 
# '
# fit1 <- sem(model1, data = sesamesim, std.lv = TRUE)
# hypotheses1 <-
#   " A=~Ab > .6 & A=~Al > .6 & A=~Af > .6 & A=~An > .6 & A=~Ar > .6 & A=~Ac >.6 & 
#     B=~Bb > .6 & B=~Bl > .6 & B=~Bf > .6 & B=~Bn > .6 & B=~Br > .6 & B=~Bc >.6"
# set.seed(100)
# bainResult <- bain(fit1,hypotheses1,fraction=3,standardize=TRUE)

options <- jaspTools::analysisOptions("BainSemBayesian")
options$syntax <- list(modelOriginal = "A =~ Ab + Al + Af + An + Ar + Ac;B =~ Bb + Bl + Bf + Bn + Br + Bc")
options$fixedFactors <- ""
options$descriptives <- TRUE
options$pathDiagram <- TRUE
options$pathDiagramEstimates <- TRUE
options$pathDiagramLegend <- TRUE
options$fraction <- 3
options$standardized <- TRUE
options$bayesFactorMatrix <- TRUE
options$seed <- 100
options$model <- "A=~Ab > .6 & A=~Al > .6 & A=~Af > .6 & A=~An > .6 & A=~Ar > .6 & A=~Ac >.6 & B=~Bb > .6 & B=~Bl > .6 & B=~Bf > .6 & B=~Bn > .6 & B=~Br > .6 & B=~Bc >.6"
set.seed(1)
results <- jaspTools::runAnalysis("BainSemBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, "H1"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(240, 0.64333395195267, 0.710450838060892, 0.0342439384792943,
			 0.777567724169114, "A=~Ab", 240, 0.763294389121051, 0.811402927163144,
			 0.0245456235020474, 0.859511465205236, "A=~Al", 240, 0.794122580016282,
			 0.837093624928895, 0.0219244053725287, 0.880064669841508, "A=~Af",
			 240, 0.87697273671862, 0.906133263733766, 0.0148780932941424,
			 0.935293790748912, "A=~An", 240, 0.628742929808782, 0.698041432162551,
			 0.0353570284456176, 0.76733993451632, "A=~Ar", 240, 0.837424918998691,
			 0.873117007119151, 0.0182105836647997, 0.908809095239612, "A=~Ac",
			 240, 0.70761880452078, 0.765839653093138, 0.0297050604151892,
			 0.824060501665495, "B=~Bb", 240, 0.568799849404187, 0.647669783233517,
			 0.0402405015864809, 0.726539717062846, "B=~Bl", 240, 0.760416045819062,
			 0.810184863734924, 0.0253927206359054, 0.859953681650785, "B=~Bf",
			 240, 0.853115564416809, 0.887898658040638, 0.0177468024403481,
			 0.922681751664468, "B=~Bn", 240, 0.654077822367593, 0.720567689980902,
			 0.0339240252054494, 0.787057557594212, "B=~Br", 240, 0.781930329495031,
			 0.828200406721732, 0.0236076160540057, 0.874470483948433, "B=~Bc"
			))
})

test_that("Bain Structural Equation Model table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(701.82657416512, 91.0045799206182, 1, 0.989130975861606,
			 0.998608743135113, "H1", "", "", "", 0.010869024138394, "", "Hu", "",
			 0.129668187655726, "", "", 0.0013912568648869, "Hc"))
})

test_that("Path Diagram plot matches", {
	plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_pathDiagram"]][["data"]]
	testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
	jaspTools::expect_equal_plots(testPlot, "path-diagram-2")
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("A=~Ab &gt; .6 &amp; A=~Al &gt; .6 &amp; A=~Af &gt; .6 &amp; A=~An &gt; .6 &amp; A=~Ar &gt; .6 &amp; A=~Ac &gt;.6 &amp; B=~Bb &gt; .6 &amp; B=~Bl &gt; .6 &amp; B=~Bf &gt; .6 &amp; B=~Bn &gt; .6 &amp; B=~Br &gt; .6 &amp; B=~Bc &gt;.6",
			 "H1"))
})

# ==================================================================================================

# library(bain)
# library(lavaan)
# data("sesamesim")
# model2 <- '
#     A  =~ Ab + Al + Af + An + Ar + Ac 
#     B =~ Bb + Bl + Bf + Bn + Br + Bc
#     A ~ B + age + peabody
# '
# fit2 <- sem(model2, data = sesamesim, std.lv = TRUE)
# hypotheses2 <- "A~B > A~peabody = A~age = 0; 
#                 A~B > A~peabody > A~age = 0; 
#                 A~B > A~peabody > A~age > 0"
# set.seed(100)
# bainResult <- bain(fit2, hypotheses2, fraction = 3, standardize = TRUE)

options <- jaspTools::analysisOptions("BainSemBayesian")
options$syntax <- list(modelOriginal = "A  =~ Ab + Al + Af + An + Ar + Ac;B =~ Bb + Bl + Bf + Bn + Br + Bc;A ~ B + age + peabody")
options$fixedFactors <- ""
options$descriptives <- TRUE
options$fraction <- 3
options$standardized <- TRUE
options$bayesFactorMatrix <- TRUE
options$seed <- 100
options$model <- "A~B > A~peabody = A~age = 0;A~B > A~peabody > A~age = 0;A~B > A~peabody > A~age > 0"
set.seed(1)
results <- jaspTools::runAnalysis("BainSemBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 2.49926936194093, 9.61854856740096, "H1", 0.400116936264686, 1,
			 3.84854418410156, "H2", 0.103965789951842, 0.259838513516625, 1, "H3"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(240, 0.644241711285877, 0.711205262171606, 0.0341657047853577,
			 0.778168813057335, "A=~Ab", 240, 0.763763717638553, 0.811775527594915,
			 0.0244962715310449, 0.859787337551277, "A=~Al", 240, 0.79496008776583,
			 0.837770094339868, 0.0218422414451072, 0.880580100913906, "A=~Af",
			 240, 0.877193065218932, 0.906287870649154, 0.0148445612571037,
			 0.935382676079376, "A=~An", 240, 0.629537994692769, 0.69870197505969,
			 0.0352883935176754, 0.76786595542661, "A=~Ar", 240, 0.837895312747232,
			 0.873484275245373, 0.0181579675845388, 0.909073237743515, "A=~Ac",
			 240, 0.707718711787465, 0.765919627657576, 0.0296948904822706,
			 0.824120543527688, "B=~Bb", 240, 0.568915624375763, 0.647765958992103,
			 0.0402305018042685, 0.726616293608442, "B=~Bl", 240, 0.760495386365103,
			 0.810246502727717, 0.02538368906523, 0.859997619090331, "B=~Bf",
			 240, 0.853011516899862, 0.88780309732995, 0.017751132523107,
			 0.922594677760037, "B=~Bn", 240, 0.653863673320625, 0.720382072541199,
			 0.0339385824154234, 0.786900471761773, "B=~Br", 240, 0.782027722082918,
			 0.828276665034914, 0.023596833062649, 0.87452560798691, "B=~Bc",
			 240, 0.729997142131881, 0.788751775228554, 0.029977404462593,
			 0.847506408325226, "A~B", 240, -0.0926531058197054, -0.000478606046975506,
			 0.0470286701693453, 0.0916958937257544, "A~age", 240, -0.10769273254603,
			 -0.0155271511198026, 0.047024119908946, 0.0766384303064246,
			 "A~peabody"))
})

test_that("Bain Structural Equation Model table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(50.2904553874153, 50.2904553874153, 0.66485704713561, 0.656182095064754,
			 0.656573242721993, "H1", 20.1220629329981, 20.1220629329981,
			 0.266020564753887, 0.262549569509052, 0.262706074311294, "H2",
			 5.47863134380569, 5.22848692139821, 0.0691223881105029, 0.068220489865662,
			 0.0682611558408346, "H3", "", "", "", 0.0130478455605314, "", "Hu", "",
			 0.95434180423724, "", "", 0.0124595271258784, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("A~B &gt; A~peabody = A~age = 0", "H1", "A~B &gt; A~peabody &gt; A~age = 0",
			 "H2", "A~B &gt; A~peabody &gt; A~age &gt; 0", "H3"))
})

# ==================================================================================================

# library(bain)
# library(lavaan)
# data("sesamesim")
# model2 <- '
#     A  =~ Ab + Al + Af + An + Ar + Ac 
#     B =~ Bb + Bl + Bf + Bn + Br + Bc
#     A ~ B + age + peabody
# '
# fit2 <- sem(model2, data = sesamesim, std.lv = TRUE)
# hypotheses2 <- "A~B > A~peabody = A~age = 0; 
#                 A~B > A~peabody > A~age = 0; 
#                 A~B > A~peabody > A~age > 0"
# set.seed(100)
# bainResult <- bain(fit2, hypotheses2, fraction = 3, standardize = FALSE)

options <- jaspTools::analysisOptions("BainSemBayesian")
options$syntax <- list(modelOriginal = "A  =~ Ab + Al + Af + An + Ar + Ac;B =~ Bb + Bl + Bf + Bn + Br + Bc;A ~ B + age + peabody")
options$fixedFactors <- ""
options$descriptives <- TRUE
options$fraction <- 3
options$bayesFactorMatrix <- TRUE
options$seed <- 100
options$model <- "A~B > A~peabody = A~age = 0;A~B > A~peabody > A~age = 0;A~B > A~peabody > A~age > 0"
set.seed(1)
results <- jaspTools::runAnalysis("BainSemBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 6.43753311465331, 41.7112126118562, "H1", 0.155339006757693, 1,
			 6.47937833778467, "H2", 0.0239743689378082, 0.154335793940056, 1, "H3"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(240, 1.97776463189764, 2.39194578953625, 0.211320800231846, 2.80612694717485,
			 "A=~Ab", 240, 5.02018110926225, 5.89871306151199, 0.448238824376105,
			 6.77724501376173, "A=~Al", 240, 1.77583990662079, 2.07359460158627,
			 0.15191845223388, 2.37134929655174, "A=~Af", 240, 5.83194029212427,
			 6.71305697054837, 0.449557586452726, 7.59417364897246, "A=~An",
			 240, 0.907164198528249, 1.1017689666239, 0.0992899714641013,
			 1.29637373471954, "A=~Ar", 240, 2.35075889927942, 2.72333757649134,
			 0.190094654876709, 3.09591625370326, "A=~Ac", 240, 3.80065355470598,
			 4.43383291130091, 0.323056628381624, 5.06701226789583, "B=~Bb",
			 240, 4.14894152081647, 5.05471337859965, 0.462136990744625,
			 5.96048523638284, "B=~Bl", 240, 2.77954352142843, 3.20010329873907,
			 0.214575257825122, 3.6206630760497, "B=~Bf", 240, 7.61072801303948,
			 8.58713247359074, 0.498174695174508, 9.563536934142, "B=~Bn",
			 240, 1.68576714827575, 1.99654229693431, 0.158561662923354,
			 2.30731744559286, "B=~Br", 240, 3.21724343103262, 3.6855573294566,
			 0.238940053040763, 4.15387122788059, "B=~Bc", 240, 1.03048850664578,
			 1.28354041258156, 0.12911048770887, 1.53659231851735, "A~B",
			 240, -0.0240141524531994, -0.00012404673537286, 0.0121890534245877,
			 0.0237660589824537, "A~age", 240, -0.010927740449043, -0.00157515580214843,
			 0.00477181454387254, 0.00777742884474616, "A~peabody"))
})

test_that("Bain Structural Equation Model table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(50.2923775087579, 50.2923775087579, 0.847951037111107, 0.833891272894049,
			 0.833965618503109, "H1", 7.81236796969338, 7.81236796969338,
			 0.131719871883995, 0.129535842075269, 0.129547390848338, "H2",
			 1.2122456559013, 1.20572801315449, 0.0203290910048988, 0.0199920170303805,
			 0.019993799419441, "H3", "", "", "", 0.0165808680003015, "", "Hu", "",
			 0.994623496718611, "", "", 0.0164931912291125, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("A~B &gt; A~peabody = A~age = 0", "H1", "A~B &gt; A~peabody &gt; A~age = 0",
			 "H2", "A~B &gt; A~peabody &gt; A~age &gt; 0", "H3"))
})

# ==================================================================================================

# library(bain)
# library(lavaan)
# data("sesamesim")
# model3 <- '
#     postnumb ~ prenumb + peabody 
# '
# sesamesim$sex <- factor(sesamesim$sex, labels = c("boy", "girl"))
# fit3 <- sem(model3, data = sesamesim, std.lv = TRUE, group = "sex")
# hypotheses3 <-
#   "postnumb~prenumb.boy = postnumb~prenumb.girl & postnumb~peabody.boy = postnumb~peabody.girl;
#    postnumb~prenumb.boy < postnumb~prenumb.girl & postnumb~peabody.boy < postnumb~peabody.girl"
# set.seed(100)
# bainResult <- bain(fit3, hypotheses3, fraction = 3, standardize = TRUE)

options <- jaspTools::analysisOptions("BainSemBayesian")
options$syntax <- list(modelOriginal = "postnumb ~ prenumb + peabody")
options$fixedFactors <- "sex"
options$descriptives <- TRUE
options$fraction <- 3
options$standardized <- TRUE
options$bayesFactorMatrix <- TRUE
options$seed <- 100
options$model <- "postnumb~prenumb.1 = postnumb~prenumb.2 & postnumb~peabody.1 = postnumb~peabody.2;postnumb~prenumb.1 < postnumb~prenumb.2 & postnumb~peabody.1 < postnumb~peabody.2"
set.seed(1)
results <- jaspTools::runAnalysis("BainSemBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 82.9725000731376, "H1", 0.0120521859546058, 1, "H2"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(115, 0.381341176620643, 0.531813744650272, 0.0767731291067271,
			 0.682286312679901, "postnumb~prenumb.1", 115, 0.0651184115362507,
			 0.230979720241261, 0.0846246716844304, 0.396841028946271, "postnumb~peabody.1",
			 115, 0.181822711674788, 0.61184250948288, 0.219401887585708,
			 1.04186230729097, "postnumb~1.1", 125, 0.515320235060605, 0.637881043952246,
			 0.0625321739880859, 0.760441852843887, "postnumb~prenumb.2",
			 125, -0.0907111262668841, 0.0629819922557709, 0.0784162973069744,
			 0.216675110778426, "postnumb~peabody.2", 125, 0.47440014333607,
			 0.966070060702074, 0.250856608205168, 1.45773997806808, "postnumb~1.2"
			))
})

test_that("Bain Structural Equation Model table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(13.7330959747582, 13.7330959747582, 0.98809133943697, 0.921770296556907,
			 0.91590126016686, "H1", 0.151089420137186, 0.165513826412997,
			 0.0119086605630299, 0.011109347021536, 0.0110386123035888, "H2", "", "", "",
			 0.0671359946108844, "", "Hu", "", 1.09564075608577, "", "",
			 0.0730876407385372, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("postnumb~prenumb.1 = postnumb~prenumb.2 &amp; postnumb~peabody.1 = postnumb~peabody.2",
			 "H1", "postnumb~prenumb.1 &lt; postnumb~prenumb.2 &amp; postnumb~peabody.1 &lt; postnumb~peabody.2",
			 "H2"))
})

# ==================================================================================================

# library(bain)
# library(lavaan)
# data("sesamesim")
# model3 <- '
#     postnumb ~ prenumb + peabody 
# '
# sesamesim$sex <- factor(sesamesim$sex, labels = c("boy", "girl"))
# fit3 <- sem(model3, data = sesamesim, std.lv = TRUE, group = "sex")
# hypotheses3 <-
#   "postnumb~prenumb.boy = postnumb~prenumb.girl & postnumb~peabody.boy = postnumb~peabody.girl;
#    postnumb~prenumb.boy < postnumb~prenumb.girl & postnumb~peabody.boy < postnumb~peabody.girl"
# set.seed(100)
# bainResult <- bain(fit3, hypotheses3, fraction = 3, standardize = FALSE)

options <- jaspTools::analysisOptions("BainSemBayesian")
options$syntax <- list(modelOriginal = "postnumb ~ prenumb + peabody")
options$fixedFactors <- "sex"
options$descriptives <- TRUE
options$fraction <- 3
options$bayesFactorMatrix <- TRUE
options$seed <- 100
options$model <- "postnumb~prenumb.1 = postnumb~prenumb.2 & postnumb~peabody.1 = postnumb~peabody.2;postnumb~prenumb.1 < postnumb~prenumb.2 & postnumb~peabody.1 < postnumb~peabody.2"
set.seed(1)
results <- jaspTools::runAnalysis("BainSemBayesian", "sesame.csv", options)


test_that("Bayes Factor Matrix table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(1, 111.72382936208, "H1", 0.00895064200457322, 1, "H2"))
})

test_that("Coefficients for Parameters table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(115, 0.449638568174712, 0.659515898444714, 0.107082238207175,
			 0.869393228714715, "postnumb~prenumb.1", 115, 0.0461151379966759,
			 0.172521784646813, 0.0644943721656198, 0.298928431296951, "postnumb~peabody.1",
			 115, 3.00540206217884, 7.95455581288439, 2.5251248439991, 12.9037095635899,
			 "postnumb~1.1", 125, 0.54866213529346, 0.723232023081061, 0.0890679059230611,
			 0.897801910868663, "postnumb~prenumb.2", 125, -0.0752470144627417,
			 0.0520870201618504, 0.0649675379899767, 0.179421054786442, "postnumb~peabody.2",
			 125, 6.49955071273804, 11.7022656461761, 2.65449517158296, 16.9049805796142,
			 "postnumb~1.2"))
})

test_that("Bain Structural Equation Model table results match", {
	table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list(15.5219994860316, 15.5219994860316, 0.99112876127737, 0.931640564569923,
			 0.923223696445589, "H1", 0.120611589516138, 0.138931860594638,
			 0.00887123872262986, 0.00827878432782599, 0.00826344479702324, "H2", "", "",
			 "", 0.0600242855902893, "", "Hu", "", 1.15161755157184, "", "",
			 0.0685016058298068, "Hc"))
})

test_that("Hypothesis Legend table results match", {
	table <- results[["results"]][["legendTable"]][["data"]]
	jaspTools::expect_equal_tables(table,
		list("postnumb~prenumb.1 = postnumb~prenumb.2 &amp; postnumb~peabody.1 = postnumb~peabody.2",
			 "H1", "postnumb~prenumb.1 &lt; postnumb~prenumb.2 &amp; postnumb~peabody.1 &lt; postnumb~peabody.2",
			 "H2"))
})

# ==================================================================================================
