\name{sample.size.mean}
\alias{sample.size.mean}
\title{Sample Size Calculation for Mean Estimation}
\description{
The function \code{sample.size.mean} returns the sample size needed for mean estimations either with or without consideration of finite population correction.
}
\usage{
sample.size.mean(e, S, N = Inf, level = 0.95)
}
\arguments{
  \item{e}{positive number specifying the precision which is half width of confidence interval}
  \item{S}{standard deviation in population}
  \item{N}{positive integer for population size. Default is \code{N=Inf}, which means that calculations are carried out without finite population correction.}
  \item{level}{coverage probability for confidence intervals. Default is \code{level=0.95}.}
}
\value{
The function \code{sample.size.mean} returns a value, which is a list consisting of the components
  \item{call}{is a list of call components: \code{e} precision, \code{S} standard deviation in population, and \code{N} integer for population size}
  \item{n}{estimate of sample size}
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Juliane Manitz}
\seealso{\code{\link{Smean}}, \code{\link{sample.size.prop}}}
\examples{
# sample size for precision e=4
sample.size.mean(e=4,S=10,N=300)
# sample size for precision e=1
sample.size.mean(e=1,S=10,N=300)
}
