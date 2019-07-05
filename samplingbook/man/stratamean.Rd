\name{stratamean}
\alias{stratamean}
\title{Stratified Sample Mean Estimation}
\description{
 The function \code{stratamean} estimates the population mean out of stratified samples either with or without consideration of finite population correction.
}
\usage{
stratamean(y, h, Nh, wh, level = 0.95, eae = FALSE)
}
\arguments{
  \item{y}{vector of target variable.}
  \item{h}{vector of stratifying variable.}
  \item{Nh}{vector of sizes of every stratum, which has to be supplied in alphabetical or numerical order of the categories of h.}
  \item{wh}{vector of weights of every stratum, which has to be supplied in alphabetical or numerical order of the categories of h.}
  \item{level}{coverage probability for confidence intervals. Default is \code{level=0.95}.}
  \item{eae}{\code{TRUE} for extensive output with the result in each and every stratum. Default is \code{eae=FALSE}.}
}
\details{
If the absolute stratum sizes \code{Nh} are given, the variances are calculated with finite population correction. Otherwise, if the stratum weights \code{wh} are given, the variances are calculated without finite population correction.
}
\value{
The function \code{stratamean} returns a value, which is a list consisting of the components
  \item{call}{is a list of call components: \code{y} target variable in sample data, \code{h} stratifying variable in sample data, \code{Nh} sizes of every stratum, \code{wh} weights of every stratum, \code{fpc} finite population correction, \code{level} coverage probability for confidence intervals}
  \item{mean}{mean estimate for population}
  \item{se}{standard error of the mean estimate for population}
  \item{ci}{vector of confidence interval boundaries for population}
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Shuai Shao and Juliane Manitz}
\seealso{\code{\link{Smean}}, \code{\link{Sprop}}}
\examples{
# random data
testy <- rnorm(100)
testh <- c(rep("male",40), rep("female",60))
stratamean(testy, testh, wh=c(0.5, 0.5))
stratamean(testy, testh, wh=c(0.5, 0.5), eae=TRUE)

# tax data
data(tax)
summary(tax)

nh <- as.vector(table(tax$Class))
wh <- nh/sum(nh)
stratamean(y=tax$diff, h=as.vector(tax$Class), wh=wh, eae=TRUE)
}
