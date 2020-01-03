require(samplingbook)
require(testthat)

context('chapter 4: PPS sampling')

### toy data -----------------------------------------------------------

test_that('toy example page 126: pps sampling sampford', {
  
  data <- data.frame(id=1:7, z=c(1.8, 2, 3.2, 2.9, 1.5, 2, 2.2))
  set.seed(178209)
  pps_sampford <- pps.sampling(z=data$z, n=2, method="sampford")
  
  expect_equal(pps_sampford$sample, c(3,7), tolerance=0.1)
  expect_equal(pps_sampford$PI, 
               matrix(nr=2,nc=2, data=c(0.4103, 0.0728, 0.0728, 0.2821)), 
               tolerance=0.01)
  })

test_that('toy example page 127: pps sampling tille', {
  
  data <- data.frame(id=1:7, z=c(1.8, 2, 3.2, 2.9, 1.5, 2, 2.2))
  set.seed(178209)
  pps_tille <- pps.sampling(z=data$z, n=2, method="tille")
  
  expect_equal(pps_tille$sample, c(1,3), tolerance=0.1)
  expect_equal(pps_tille$PI, 
               matrix(nr=2,nc=2, data=c(0.2308, 0.0596, 0.0596, 0.4103)), 
               tolerance=0.01)
})

test_that('toy example page 127: pps sampling midzuno', {
  
  data <- data.frame(id=1:7, z=c(1.8, 2, 3.2, 2.9, 1.5, 2, 2.2))
  set.seed(178209)
  pps_midzuno <- pps.sampling(z=data$z, n=2, method="midzuno")
  
  expect_equal(pps_midzuno$sample, c(3,4), tolerance=0.1)
  expect_equal(pps_midzuno$PI, 
               matrix(nr=2,nc=2, data=c(0.4103, 0.0897, 0.0897, 0.3718)), 
               tolerance=0.01)
})

test_that('toy example page 128: pps sampling madow', {
  
  data <- data.frame(id=1:7, z=c(1.8, 2, 3.2, 2.9, 1.5, 2, 2.2))
  set.seed(178209)
  expect_warning(pps_madow <- pps.sampling(z=data$z, n=2, method="madow"), "Systematic Sample with zeros in 'PI'" )
  
  expect_equal(pps_madow$sample, c(3,6), tolerance=0.1)
  expect_equal(pps_madow$PI, 
               matrix(nr=2,nc=2, data=c(0.4103, 0.2308, 0.2308, 0.2564)), 
               tolerance=0.01)
})

### influenza data -------------------------------------------------

test_that('influenza data example page 128/132: pps sampling/htestimate', {
  
  # PPS sample
  data("influenza")
  set.seed(108506)
  pps <- pps.sampling(z = influenza$population, n=20, method = "midzuno")
  sample <- influenza[pps$sample,]
  N <- nrow(influenza)
  PI <- pps$PI

  expect_equal(pps$sample, c(35, 83, 107, 109, 130, 140, 157, 210, 219, 223, 257, 273, 290, 294, 324, 342, 361, 371, 418, 423))

  # yates and grundy
  est.yg <- htestimate(sample$cases, N=N, PI=PI, method = "yg")
  
  expect_equal(est.yg$mean, 40.4, tolerance=0.1)
  expect_equal(est.yg$se, 8.06, tolerance=0.01)
  
  # horvitz thomson
  est.ht <- htestimate(sample$cases, N=N, PI=PI, method = "ht")
  
  expect_equal(est.ht$mean, 40.4, tolerance=0.1)
  expect_equal(est.ht$se, 8.23, tolerance=0.01)

  # hansen hurwitz
  pk <- pps$pik[pps$sample]
  est.hh <- htestimate(sample$cases, N=N, pk=pk, method = "hh")
  
  expect_equal(est.hh$mean, 40.4, tolerance=0.1)
  expect_equal(est.hh$se, 8.53, tolerance=0.01)

  # hajek
  est.ha1 <- htestimate(sample$cases, N=N, pk=pk, pik=pps$pik, method = "ha")
  
  expect_equal(est.ha1$mean, 40.4, tolerance=0.1)
  expect_equal(est.ha1$se, 8.26, tolerance=0.01)
  
  expect_warning(est.ha2 <- htestimate(sample$cases, N=N, pk=pk, method = "ha"), "Without input of 'pik' just approximative calculation of Hajek method is possible.")
  
  expect_equal(est.ha2$mean, 40.4, tolerance=0.1)
  expect_equal(est.ha2$se, 8.24, tolerance=0.01)
  
})

