\name{mbes}
\alias{mbes}
\title{Model Based Estimation}
\description{
mbes is used for model based estimation of population means using auxiliary variables. Difference, ratio and regression estimates are available. 
}
\usage{
mbes(formula, data, aux, N = Inf, method = 'all', level = 0.95, ...)
}
\arguments{
  \item{formula}{object of class \code{formula} (or one that can be coerced to that class): symbolic description for connection between primary and secondary information}
  \item{data}{data frame containing variables in the model}
  \item{aux}{known mean of auxiliary variable, which provides secondary information}
  \item{N}{positive integer for population size. Default is \code{N=Inf}, which means that calculations are carried out without finite population correction.}
  \item{method}{estimation method. Options are \code{'simple','diff','ratio','regr','all'}. Default is \code{method='all'}.}
  \item{level}{coverage probability for confidence intervals. Default is \code{level=0.95}.}
  \item{\dots}{further options for linear regression model}
}
\details{
The option \code{method='simple'} calculates the simple sample estimation without using the auxiliary variable. 
The option \code{method='diff'} calculates the difference estimate, \code{method='ratio'} the ratio estimate, and \code{method='regr'} the regression estimate which is based on the selected model. The option \code{method='all'} calculates the simple and all model based estimates. 
For methods \code{'diff'}, \code{'ratio'} and \code{'all'} the formula has to be \code{y~x} with \code{y} primary and \code{x} secondary information. 
For method \code{'regr'}, it is the symbolic description of the linear regression model. In this case, it can be used more than one auxiliary variable. Thus, \code{aux} has to be a vector of the same length as the number of auxiliary variables in order as specified in the formula.
}
\value{
The function \code{mbes} returns an object, which is a list consisting of the components
  \item{call}{is a list of call components: \code{formula} formula, \code{data} data frame, \code{aux} given value for mean of auxiliary variable, \code{N} population size, \code{type} type of model based estimation and \code{level} coverage probability for confidence intervals}
  \item{info}{is a list of further information components: \code{N} population size, \code{n} sample size, \code{p} number of auxiliary variables, \code{aux} true mean of auxiliary variables in population and \code{x.mean} sample means of auxiliary variables}
  \item{simple}{is a list of result components, if \code{method='simple'} or \code{method='all'} is selected: \code{mean} mean estimate of population mean for primary information, \code{se} standard error of the mean estimate, and \code{ci} vector of confidence interval boundaries} 
  \item{diff}{is a list of result components, if \code{method='diff'} or \code{method='all'} is selected: \code{mean} mean estimate of population mean for primary information, \code{se} standard error of the mean estimate, and \code{ci} vector of confidence interval boundaries} 
  \item{ratio}{is a list of result components, if \code{method='ratio'} or \code{method='all'} is selected: \code{mean} mean estimate of population mean for primary information, \code{se} standard error of the mean estimate, and \code{ci} vector of confidence interval boundaries} 
  \item{regr}{is a list of result components, if \code{type='regr'} or \code{type='all'} is selected: \code{mean} mean estimate of population mean for primary information, \code{se} standard error of mean estimate, \code{ci} vector of confidence interval boundaries, and \code{model} underlying linear regression model}
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Juliane Manitz}
\seealso{\code{\link{Smean}}, \code{\link{Sprop}}}
\examples{
## 1) simple suppositious example
data(pop)
# Draw a random sample of size=3
set.seed(802016)
data <- pop[sample(1:5, size=3),]
names(data) <- c('id','x','y')
# difference estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='diff', level=0.95)
# ratio estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='ratio', level=0.95)
# regression estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='regr', level=0.95)

## 2) Bundestag election
data(election)
# draw sample of size n = 20
N <- nrow(election)
set.seed(67396)
sample <- election[sort(sample(1:N, size=20)),]
# secondary information SPD in 2002
X.mean <- mean(election$SPD_02)
# forecast proportion of SPD in election of 2005
mbes(SPD_05 ~ SPD_02, data=sample, aux=X.mean, N=N, method='all')
# true value
Y.mean <- mean(election$SPD_05)
Y.mean
# Use a second predictor variable
X.mean2 <- c(mean(election$SPD_02),mean(election$GREEN_02))
# forecast proportion of SPD in election of 2005 with two predictors
mbes(SPD_05 ~ SPD_02+GREEN_02, data=sample, aux=X.mean2, N=N, method= 'regr')

## 3) money sample
data(money)
mu.X <-  mean(money$X)
x <- money$X[which(!is.na(money$y))]
y <- na.omit(money$y)
# estimation
mbes(y~x, aux=mu.X, N=13, method='all')

## 4) model based two-phase sampling with mbes() 
id <- 1:1000
x <- rep(c(1,0,1,0),times=c(10,90,70,830))
y <- rep(c(1,0,NA),times=c(15,85,900))
phase <- rep(c(2,1), times=c(100,900))
data <- data.frame(id,x,y,phase)
# mean of x out of first phase
mean.x <- mean(data$x)
mean.x
N1 <- length(data$x) 
# calculation of estimation for y 
est.y <- mbes(y~x, data=data, aux=mean.x, N=N1, method='ratio')
est.y
# correction of standard error with uncertaincy in first phase
v.y <- var(data$y, na.rm=TRUE)
se.y <- sqrt(est.y$ratio$se^2 + v.y/N1)
se.y
# corrected confidence interval
lower <- est.y$ratio$mean - qnorm(0.975)*se.y
upper <- est.y$ratio$mean + qnorm(0.975)*se.y
c(lower, upper)
}
