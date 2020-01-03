require(samplingbook)
require(testthat)

context('chapter 3: model-based sampling')

### mbes with toy data ---------------------------------

test_that('toy example page 85: mbes "diff" estimation', {
  data(pop)
  data <- pop[c(1,2,5),]
  est <- mbes(formula = Y~X, data=data, aux=15,N=5, method="diff", level=0.95)
  
  expect_equal(est$diff$mean, 14.3, tolerance=0.1)
  expect_equal(est$diff$se, 0.5578, tolerance=0.1)
  expect_equal(est$diff$ci[1], 13.2, tolerance=0.1)
  expect_equal(est$diff$ci[2], 15.4, tolerance=0.1)
})

test_that('toy example page 86: mbes "ratio" estimation', {
  data(pop)
  data <- pop[c(1,2,5),]
  est <- mbes(formula = Y~X, data=data, aux=15,N=5, method="ratio", level=0.95)
  
  expect_equal(est$ratio$mean, 14.3, tolerance=0.1)
  expect_equal(est$ratio$se, 0.6512, tolerance=0.1)
  expect_equal(est$ratio$ci[1], 13.026, tolerance=0.1)
  expect_equal(est$ratio$ci[2], 15.5787, tolerance=0.1)
})

test_that('toy example page 86: mbes "regr" estimation', {
  data(pop)
  data <- pop[c(1,2,5),]
  est <- mbes(formula = Y~X, data=data, aux=15,N=5, method="regr", level=0.95)
  
  expect_equal(as.numeric(est$regr$mean), 14.5, tolerance=0.1)
  expect_equal(est$regr$se, 0.2582, tolerance=0.1)
  expect_equal(as.numeric(est$regr$ci[1]), 13.9939, tolerance=0.1)
  expect_equal(as.numeric(est$regr$ci[2]), 15.0061, tolerance=0.1)
  
  expect_equal(as.numeric(coef(est$regr$model)[1]), -4.25, tolerance=0.1)
  expect_equal(as.numeric(coef(est$regr$model)[2]), 1.25, tolerance=0.1)
})

### mbes with money data ------------------------------------

test_that('money example page 87: mbes "all" estimation', {
  data(money)
  mu.X <- mean(money$X)
  data <- money[which(!is.na(money$y)),]
  est <- mbes(formula = y~X, data=data, aux=mu.X, N=13, method="all", level=0.95)
  
  # simple 
  expect_equal(est$simple$mean, 33.1, tolerance=0.1)
  expect_equal(est$simple$se, 4.0872, tolerance=0.1)
  expect_equal(est$simple$ci[1], 25.0663, tolerance=0.1)
  expect_equal(est$simple$ci[2], 41.088, tolerance=0.1)
  
  # diff
  expect_equal(est$diff$mean, 36.0062, tolerance=0.1)
  expect_equal(est$diff$se, 2.1998, tolerance=0.1)
  expect_equal(est$diff$ci[1], 33.3768, tolerance=0.1)
  expect_equal(est$diff$ci[2], 40.3778, tolerance=0.1)

  # ratio
  expect_equal(est$ratio$mean, 37.0546, tolerance=0.1)
  expect_equal(est$ratio$se, 1.8764, tolerance=0.1)
  expect_equal(est$ratio$ci[1], 33.38, tolerance=0.1)
  expect_equal(est$ratio$ci[2], 40.73, tolerance=0.1)
  
  # regression
  expect_equal(as.numeric(est$regr$mean), 37.57, tolerance=0.1)
  expect_equal(est$regr$se, 2.0042, tolerance=0.1)
  expect_equal(as.numeric(est$regr$ci[1]), 33.64, tolerance=0.1)
  expect_equal(as.numeric(est$regr$ci[2]), 41.49, tolerance=0.1)
  
  expect_equal(as.numeric(coef(est$regr$model)[1]), -4.25, tolerance=0.1)
  expect_equal(as.numeric(coef(est$regr$model)[2]), 1.50, tolerance=0.1)
})

### mbes with election data ------------------------------------

test_that('election example page 89: mbes "regr" estimation', {

  data(election)
  N <- nrow(election)
  set.seed(97396)
  sample <- election[sort(sample(1:N, size = 20)),]
  X.mean <- mean(election$SPD_02)
  est <- mbes(SPD_05 ~ SPD_02, data=sample, aux=X.mean, N=N, method="regr")
  
  # regression for SPD
  expect_equal(as.numeric(est$regr$mean), 0.3341, tolerance=0.1)
  expect_equal(est$regr$se, 0.0079, tolerance=0.01)
  expect_equal(as.numeric(est$regr$ci[1]), 0.3187, tolerance=0.1)
  expect_equal(as.numeric(est$regr$ci[2]), 0.3496, tolerance=0.1)
  
#  expect_equal(as.numeric(coef(est$regr$model)[1]), -0.02110, tolerance=0.1)
#  expect_equal(as.numeric(coef(est$regr$model)[2]), 0.99199, tolerance=0.1)
  
  # additional covariate
  X.mean2 <- c(mean(election$SPD_02), mean(election$GREEN_02))
  est2 <- mbes(SPD_05 ~ SPD_02 + GREEN_02, data=sample, aux=X.mean2, N=N, method="regr")
  
  # regression for SPD
  expect_equal(as.numeric(est$regr$mean), 0.3466, tolerance=0.1)
  expect_equal(est$regr$se, 0.0063, tolerance=0.01)
  expect_equal(as.numeric(est$regr$ci[1]), 0.3342, tolerance=0.1)
  expect_equal(as.numeric(est$regr$ci[2]), 0.3589, tolerance=0.1)
  
})
