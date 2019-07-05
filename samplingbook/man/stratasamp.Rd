\name{stratasamp}
\alias{stratasamp}
\title{Sample Size Calculation for Stratified Sampling}
\description{
 The function \code{stratasamp} calculates the sample size for each stratum depending on type of allocation.
}
\usage{
stratasamp(n, Nh, Sh = NULL, Ch = NULL, type = 'prop')
}
\arguments{
  \item{n}{positive integer specifying sampling size.}
  \item{Nh}{vector of population sizes of each stratum.}
  \item{Sh}{vector of standard deviation in each stratum.}
  \item{Ch}{vector of cost for a sample in each stratum.}
\item{type}{type of allocation. Default is \code{type='prop'} for proportional, alternatives are \code{type='opt'} for optimal and \code{type='costopt'} for cost-optimal.}
}
\value{
The function \code{stratasamp} returns a matrix, which lists the strata and the sizes of observation depending on type of allocation.
}
\references{
Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Shuai Shao and Juliane Manitz}
\seealso{\code{\link{stratamean}}, \code{\link{stratasize}}, \code{\link{sample.size.mean}}}
\examples{
#random proportional stratified sample
stratasamp(n=500, Nh=c(5234,2586,649,157))
stratasamp(n=500, Nh=c(5234,2586,649,157), Sh=c(251,1165,8035,24725), type='opt')
}
