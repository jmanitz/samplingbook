\name{htestimate}
\alias{htestimate}
\title{Horvitz-Thompson Estimator}
\description{Calculates Horvitz-Thompson estimate with different methods for variance estimation such as Yates and Grundy, Hansen-Hurwitz and Hajek.}
\usage{
htestimate(y, N, PI, pk, pik, method = 'yg')
}
\arguments{
  \item{y}{vector of observations}
  \item{N}{integer for population size}     
  \item{PI}{square matrix of second order inclusion probabilities with \code{n} rows and cols. It is necessary to be specified for variance estimation by methods \code{'ht'} and \code{'yg'}.}
  \item{pk}{vector of first order inclusion probabilities of length \code{n} for the sample elements. It is necessary to be specified for variance estimation by methods \code{'hh'} and \code{'ha'}.}
  \item{pik}{an optional vector of first order inclusion probabilities of length \code{N} for the population elements . It can be used for variance estimation by method \code{'ha'}.}
  \item{method}{method to be used for variance estimation. Options are \code{'yg'} (Yates and Grundy) and \code{'ht'} (Horvitz-Thompson), approximate options are \code{'hh'} (Hansen-Hurwitz) and \code{'ha'} (Hajek).}
}
\details{
For using methods \code{'yg'} or \code{'ht'} has to be provided matrix \code{PI}, and for \code{'hh'} and \code{'ha'} has to be specified vector \code{pk} of inclusion probabilities. 
Additionally, for Hajek method \code{'ha'} can be specified \code{pik}. Unless, an approximate Hajek method is used.
}
\value{
The function \code{htestimate} returns a value, which is a list consisting of the components
  \item{call}{is a list of call components: \code{y} observations, \code{N} population size, \code{PI} inclusion probabilities, \code{pk} inclusion probabilities of sample, \code{pik} full inclusion probabilities and \code{method} method for variance estimation}
  \item{mean}{mean estimate}
  \item{se}{standard error of the mean estimate}
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Juliane Manitz}
\seealso{\code{\link{pps.sampling}}}
\examples{
data(influenza)
summary(influenza)

# pps.sampling()
set.seed(108506)
pps <- pps.sampling(z=influenza$population,n=20,method='midzuno')
sample <- influenza[pps$sample,]
# htestimate()
N <- nrow(influenza)
# exact variance estimate
PI <- pps$PI
htestimate(sample$cases, N=N, PI=PI, method='yg')
htestimate(sample$cases, N=N, PI=PI, method='ht')
# approximate variance estimate
pk <- pps$pik[pps$sample]
htestimate(sample$cases, N=N, pk=pk, method='hh')
pik <- pps$pik
htestimate(sample$cases, N=N, pk=pk, pik=pik, method='ha')
# without pik just approximate calculation of Hajek method
htestimate(sample$cases, N=N, pk=pk, method='ha') 
# calculate confidence interval based on normal distribution for number of cases
est.ht <- htestimate(sample$cases, N=N, PI=PI, method='ht')
est.ht$mean*N  
lower <- est.ht$mean*N - qnorm(0.975)*N*est.ht$se
upper <- est.ht$mean*N + qnorm(0.975)*N*est.ht$se
c(lower,upper) 
# true number of influenza cases
sum(influenza$cases)
}
