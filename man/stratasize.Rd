\name{stratasize}
\alias{stratasize}
\title{Sample Size Determination for Stratified Sampling}
\description{
 The function \code{stratasize} determinates the total size of stratified samples depending on type of allocation and determinated by specified precision.
}
\usage{
stratasize(e, Nh, Sh, level = 0.95, type = 'prop')
}
\arguments{
  \item{e}{positive number specifying sampling precision.}
  \item{Nh}{vector of population sizes in each stratum.}
  \item{Sh}{vector of standard deviation in each stratum.}
  \item{level}{coverage probability for confidence intervals. Default is \code{level=0.95}.}
  \item{type}{type of allocation. Default is \code{type='prop'} for proportional, alternative is \code{type='opt'} for optimal.}
}
\value{
The function \code{stratasize} returns a value, which is a list consisting of the components
  \item{call}{is a list of call components: \code{e} specified precision, \code{Nh} population sizes of every stratum, \code{Sh} standard diviation of every stratum, \code{method} type of allocation, \code{level} coverage probability for confidence intervals.}
  \item{n}{determinated total sample size.}
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2011): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Shuai Shao}
\seealso{\code{\link{stratasamp}}, \code{\link{stratamean}}}
\examples{
#random proportional stratified sample
stratasize(e=0.1, Nh=c(100000,300000,600000), Sh=c(1,2,3))

#random optimal stratified sample
stratasize(e=0.1, Nh=c(100000,300000,600000), Sh=c(1,2,3), type="opt")
}
