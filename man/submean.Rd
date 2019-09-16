\name{submean}
\alias{submean}
\title{Sub-sample Mean Estimation}
\description{
 The function \code{submean} estimates the population mean out of sub-samples (two-stage samples) either with or without consideration of finite population correction in both stages.
}
\usage{
submean(y, PSU, N, M, Nl, m.weight, n.weight, method = 'simple', level = 0.95)
}
\arguments{
  \item{y}{vector of target variable.}
  \item{PSU}{vector of grouping variable which indicates the primary unit for each sample element.}
  \item{N}{positive integer specifying population size}
  \item{M}{positive integer specifying the number of primary units in the  population.}
  \item{Nl}{vector of sample sizes in each primary unit, which has to be specified in alphabetical or numerical order of the categories of l.}
  \item{m.weight}{vector of primary sample unit weights, which has to be specified in alphabetical or numerical order of the categories of l.}
  \item{n.weight}{vector of secondary sample unit weights in each primary sample unit, which has to be specified in alphabetical or numerical order of the categories of l.}
  \item{method}{estimation method. Default is "simple", alternative is "ratio".}
  \item{level}{coverage probability for confidence intervals. Default is \code{level=0.95}.}
}
\details{
If the absolute sizes \code{M} and \code{Nl} are given, the variances are calculated with finite population correction. Otherwise, if the weights \code{m.weight} and \code{n.weight} are given, the variances are calculated without finite population correction.
}
\value{
The function \code{submean} returns a value, which is a list consisting of the components
  \item{call}{is a list of call components: \code{y} target variable in sample data, \code{PSU} gouping variable in sample data, \code{N} population size, \code{M} number of primary population units, \code{fpc} finite population correction, \code{method} estimation method, \code{level} coverage probability for confidence intervals}
  \item{mean}{mean estimate for population}
  \item{se}{standard error of the mean estimate for population}
  \item{ci}{vector of confidence interval boundaries for population}
}

\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2011): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Shuai Shao and Juliane Manitz}
\seealso{\code{\link{Smean}}, \code{\link{stratamean}}}
\examples{
y <- c(23,33,24,25,72,74,71,37,42)
psu <- as.factor(c(1,1,1,1,2,2,2,3,3))
# with finite population correction
submean(y, PSU=psu, N=700, M=23, Nl=c(100,50,75), method='ratio')
# without finite population correction
submean(y, PSU=psu, N=700, m.weight=3/23, n.weight=c(4/100,3/50,2/75), method='ratio')

# Chinese wage data
data(wage)
summary(wage)
submean(wage$Wage,PSU=wage$Region, N=990, M=33, Nl=rep(30,14))
}
