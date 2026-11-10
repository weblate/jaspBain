context("Library: bainSem")

# This test file was auto-generated from a JASP example file.
# The JASP file is stored in tests/testthat/jaspfiles/library/.

test_that("BainSemBayesian (analysis 1) results match", {

  # Load from JASP example file
  jaspFile <- testthat::test_path("jaspfiles", "library", "bainSem.jasp")
  opts <- jaspTools::analysisOptions(jaspFile)[[1]]
  dataset <- jaspTools::extractDatasetFromJASPFile(jaspFile)

  # Run analysis
  set.seed(1)
  results <- jaspTools::runAnalysis("BainSemBayesian", dataset, opts)

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(1, "H1"))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(240, 0.64333395195267, 0.710450838060892, 0.0342439384792943,
     0.777567724169114, "A=~Ab", 240, 0.763294388565954, 0.811402927163143,
     0.0245456237852651, 0.859511465760333, "A=~Al", 240, 0.794122580016282,
     0.837093624928895, 0.0219244053725288, 0.880064669841508, "A=~Af",
     240, 0.876972737684905, 0.906133263733766, 0.0148780928011307,
     0.935293789782627, "A=~An", 240, 0.628742928761158, 0.698041432162551,
     0.0353570289801294, 0.767339935563943, "A=~Ar", 240, 0.837424920259227,
     0.873117007119151, 0.0182105830216572, 0.908809093979076, "A=~Ac",
     240, 0.707618804453303, 0.765839653093138, 0.0297050604496174,
     0.824060501732973, "B=~Bb", 240, 0.568799850146867, 0.647669783233517,
     0.0402405012075558, 0.726539716320166, "B=~Bl", 240, 0.760416046900686,
     0.810184863734923, 0.0253927200840463, 0.859953680569161, "B=~Bf",
     240, 0.853115564416809, 0.887898658040638, 0.0177468024403481,
     0.922681751664468, "B=~Bn", 240, 0.65407782323115, 0.720567689980902,
     0.033924024764851, 0.787057556730655, "B=~Br", 240, 0.781930329495032,
     0.828200406721732, 0.0236076160540057, 0.874470483948433, "B=~Bc"
    ))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(701.82657416512, 91.0045799206182, 1, 0.989130975861606, 0.998577173890746,
     "H1", "", "", "", 0.010869024138394, "", "Hu", "", 0.129668187655726,
     "", "", 0.00142282610925446, "Hc"))

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_pathDiagram"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-1_figure-1_path-diagram")

  table <- results[["results"]][["legendTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list("A=~Ab &gt; .6 &amp; A=~Al &gt; .6 &amp; A=~Af &gt; .6 &amp; A=~An &gt; .6 &amp; A=~Ar &gt; .6 &amp; A=~Ac &gt;.6 &amp; B=~Bb &gt; .6 &amp; B=~Bl &gt; .6 &amp; B=~Bf &gt; .6 &amp; B=~Bn &gt; .6 &amp; B=~Br &gt; .6 &amp; B=~Bc &gt;.6",
     "H1"))

})

test_that("BainSemBayesian (analysis 2) results match", {

  # Load from JASP example file
  jaspFile <- testthat::test_path("jaspfiles", "library", "bainSem.jasp")
  opts <- jaspTools::analysisOptions(jaspFile)[[2]]
  dataset <- jaspTools::extractDatasetFromJASPFile(jaspFile)

  # Run analysis
  set.seed(1)
  results <- jaspTools::runAnalysis("BainSemBayesian", dataset, opts)

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(1, 2.49926936194093, 9.61854856740096, "H1", 0.400116936264686,
     1, 3.84854418410156, "H2", 0.103965789951842, 0.259838513516625,
     1, "H3"))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(240, 0.644241710461666, 0.711205262171606, 0.0341657052058812,
     0.778168813881546, "A=~Ab", 240, 0.763763716399118, 0.811775527594914,
     0.0244962721634212, 0.859787338790711, "A=~Al", 240, 0.794960085571802,
     0.837770094339868, 0.0218422425645299, 0.880580103107934, "A=~Af",
     240, 0.877193064147482, 0.906287870649154, 0.014844561803772,
     0.935382677150826, "A=~An", 240, 0.629537995249503, 0.698701975059689,
     0.0352883932336222, 0.767865954869876, "A=~Ar", 240, 0.83789531039245,
     0.873484275245374, 0.0181579687859803, 0.909073240098297, "A=~Ac",
     240, 0.707718711855143, 0.765919627657576, 0.0296948904477402,
     0.824120543460009, "B=~Bb", 240, 0.568915623633037, 0.647765958992103,
     0.0402305021832174, 0.726616294351169, "B=~Bl", 240, 0.760495386365102,
     0.810246502727717, 0.02538368906523, 0.859997619090331, "B=~Bf",
     240, 0.853011513842821, 0.88780309732995, 0.0177511340828505,
     0.922594680817078, "B=~Bn", 240, 0.653863674319233, 0.720382072541199,
     0.03393858190592, 0.786900470763165, "B=~Br", 240, 0.782027721686604,
     0.828276665034914, 0.0235968332648537, 0.874525608383224, "B=~Bc",
     240, 0.729997143600537, 0.788751775228554, 0.0299774037132647,
     0.84750640685657, "A~B", 240, -0.0926531058198003, -0.00047860604697555,
     0.0470286701693937, 0.0916958937258492, "A~age", 240, -0.107692732546452,
     -0.0155271511198025, 0.0470241199091614, 0.0766384303068467,
     "A~peabody"))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(50.2904553874894, 50.2904553874894, 0.66485704713561, 0.656182095064754,
     0.656573242721993, "H1", 20.1220629329981, 20.1220629329981,
     0.266020564753887, 0.262549569509052, 0.262706074311294, "H2",
     5.47863134380569, 5.22848692139821, 0.0691223881105029, 0.068220489865662,
     0.0682611558408346, "H3", "", "", "", 0.0130478455605314, "",
     "Hu", "", 0.95434180423724, "", "", 0.0124595271258784, "Hc"
    ))

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_pathDiagram"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-2_figure-1_path-diagram")

  table <- results[["results"]][["legendTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list("A~B &gt; A~peabody = A~age = 0", "H1", "A~B &gt; A~peabody &gt; A~age = 0",
     "H2", "A~B &gt; A~peabody &gt; A~age &gt; 0", "H3"))

})

test_that("BainSemBayesian (analysis 3) results match", {

  # Load from JASP example file
  jaspFile <- testthat::test_path("jaspfiles", "library", "bainSem.jasp")
  opts <- jaspTools::analysisOptions(jaspFile)[[3]]
  dataset <- jaspTools::extractDatasetFromJASPFile(jaspFile)

  # Run analysis
  set.seed(1)
  results <- jaspTools::runAnalysis("BainSemBayesian", dataset, opts)

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_bayesFactorMatrix"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(1, 82.9725000731376, "H1", 0.0120521859546058, 1, "H2"))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_descriptivesTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(115, 0.381341176620643, 0.531813744650272, 0.076773129106727,
     0.6822863126799, "postnumb~prenumb.1", 115, 0.065118411347484,
     0.230979720241261, 0.0846246717807418, 0.396841029135038, "postnumb~peabody.1",
     115, 0.181822711674788, 0.61184250948288, 0.219401887585708,
     1.04186230729097, "postnumb~1.1", 125, 0.515320235225808, 0.637881043952246,
     0.062532173903797, 0.760441852678683, "postnumb~prenumb.2",
     125, -0.0907111260686206, 0.062981992255771, 0.0784162972058177,
     0.216675110580162, "postnumb~peabody.2", 125, 0.47440014538772,
     0.966070060702074, 0.250856607158388, 1.45773997601643, "postnumb~1.2"
    ))

  table <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_mainResultsTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list(13.7330959741576, 13.7330959741576, 0.98809133943697, 0.921770296556907,
     0.91590126016686, "H1", 0.151089420137186, 0.165513826412997,
     0.0119086605630299, 0.011109347021536, 0.0110386123035888, "H2",
     "", "", "", 0.0671203564215567, "", "Hu", "", 1.095469333741,
     "", "", 0.0730601275295515, "Hc"))

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_pathDiagram"]][["collection"]][["bainContainer_pathDiagram_pathDiagram1"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-3_figure-1_group-1")

  plotName <- results[["results"]][["bainContainer"]][["collection"]][["bainContainer_pathDiagram"]][["collection"]][["bainContainer_pathDiagram_pathDiagram2"]][["data"]]
  testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
  jaspTools::expect_equal_plots(testPlot, "analysis-3_figure-2_group-2")

  table <- results[["results"]][["legendTable"]][["data"]]
  jaspTools::expect_equal_tables(table,
    list("postnumb~prenumb.1 = postnumb~prenumb.2 &amp; postnumb~peabody.1 = postnumb~peabody.2",
     "H1", "postnumb~prenumb.1 &lt; postnumb~prenumb.2 &amp; postnumb~peabody.1 &lt; postnumb~peabody.2",
     "H2"))

})

