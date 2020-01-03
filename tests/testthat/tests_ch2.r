require(samplingbook)
require(testthat)

context('chapter 2: simple samples')

# Smean
test_that('toy example page 51: mean estimation', {
  data(pop)
  Y <- pop$Y
  y <- c(9,10,18)   #set.seed(93456); sample(x=Y, size=3)
  est <- Smean(y=y, N=length(Y))

  expect_equal(est$mean, 12.3, tolerance=0.1)
  expect_equal(est$se, 1.8, tolerance=0.1)
  expect_equal(est$ci[1], 8.8, tolerance=0.1)
  expect_equal(est$ci[2], 15.9, tolerance=0.1)
})

# Sprop

test_that('toy example page 53: proportion estimation', {

  est1 <- Sprop(m=45, n=100, N=300)

  expect_equal(est1$p, 0.45, tolerance=0.01)
  expect_equal(est1$se, 0.0408, tolerance=0.001)
  expect_equal(est1$nr$approx[1], 111)
  expect_equal(est1$nr$approx[2], 159)
  expect_equal(est1$nr$exact[1], 110)
  expect_equal(est1$nr$exact[2], 161)

  est2 <- Sprop(m=2, n=100, N=300)
  
  expect_equal(est2$p, 0.02, tolerance=0.01)
  expect_equal(est2$se, 0.0115, tolerance=0.001)
  expect_equal(est2$nr$approx[1], 0)
  expect_equal(est2$nr$approx[2], 12)
  expect_equal(est2$nr$exact[1], 2)
  expect_equal(est2$nr$exact[2], 19)
  
})

test_that('election poll example page 54: proportion estimation 2', {
  
  est3 <- Sprop(m=302, n=1206, N=Inf)

  expect_equal(est3$p, 0.2504, tolerance=0.01)
  expect_equal(est3$se, 0.0125, tolerance=0.001)
  expect_equal(est3$ci$bin, c(0.226, 0.275), tolerance=0.001)
  expect_equal(est3$ci$cp, c(0.226, 0.276), tolerance=0.001)
  expect_equal(est3$ci$ac, c(0.227, 0.276), tolerance=0.001)

  est4 <- Sprop(m=133, n=1206, N=Inf)
  
  expect_equal(est4$p, 0.1103, tolerance=0.01)
  expect_equal(est4$se, 0.009, tolerance=0.001)
  expect_equal(est4$ci$bin, c(0.0926, 0.128), tolerance=0.001)
  expect_equal(est4$ci$cp, c(0.0932, 0.1293), tolerance=0.001)
  expect_equal(est4$ci$ac, c(0.0938, 0.1292), tolerance=0.001)
  
})

test_that('edge cases: proportion estimation', {
  
  expect_warning(est5 <- Sprop(m = 10, n = 20, N = 20), "Standard error is 'NA'")

  expect_equal(est5$p, 0.5, tolerance=0.01)
  expect_equal(est5$nr$approx, c(10,10))
  expect_equal(est5$nr$exact, c(10,10))

  est6 <- Sprop(m = 50, n = 60, N = 61)

  expect_equal(est6$p, 0.833, tolerance=0.01)
  expect_equal(est6$se, 0.00621, tolerance=0.0001)
  expect_equal(est6$nr$approx, c(51,51))
  expect_equal(est6$nr$exact, c(50,51))
  
})
