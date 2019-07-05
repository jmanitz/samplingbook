\name{pps.sampling}
\alias{pps.sampling}
\title{Sampling with Probabilities Proportional to Size}
\description{
The function provides sample techniques with sampling probabilities which are proportional to the size of a quantity z.
}
\usage{
pps.sampling(z, n, id = 1:N, method = 'sampford', return.PI = FALSE)
}
\arguments{
  \item{z}{vector of quantities which determine the sampling probabilities in the population}
  \item{n}{positive integer for sample size}
  \item{id}{an optional vector with identification values for population elements. Default is \code{'id = 1:N'}, where \code{'N'} is length of \code{'z'}.}
  \item{method}{the sampling method to be used. Options are \code{'sampford'}, \code{'tille'}, \code{'midzuno'} or \code{'madow'}.}
  \item{return.PI}{logical. If \code{TRUE} the pairwise inclusion probabilities for all individuals in the population are returned.}
}
\details{
 The different methods vary in their run time. Therefore, \code{method='sampford'} is stopped if \code{N > 200} or if \code{n/N < 0.3}. \code{method='tille'} is stopped if \code{N > 500}. 
 In case of large populations use \code{method='midzuno'} or \code{method='madow'}.
}
\value{
The function \code{pps.sampling} returns a value, which is a list consisting of the components
  \item{call}{is a list of call components: \code{z} vector of quantity data, \code{n} sample size, \code{id} identification values, and \code{method} sampling method}
  \item{sample}{resulted sample}
  \item{pik}{inclusion probabilities}
  \item{PI}{sample second order inclusion probabilities}
  \item{PI.full}{full second order inclusion probabilities}
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\author{Juliane Manitz}
\seealso{\code{\link{htestimate}}}
\examples{
## 1) simple suppositious example
data <- data.frame(id = 1:7, z = c(1.8, 2 ,3.2 ,2.9 ,1.5 ,2.0 ,2.2))
# Usage of pps.sampling for Sampford method
set.seed(178209)
pps.sample_sampford <- pps.sampling(z=data$z, n=2, method='sampford', return.PI=FALSE)
pps.sample_sampford
# sampling elements
id.sample <- pps.sample_sampford$sample
id.sample
# other methods
set.seed(178209)
pps.sample_tille <- pps.sampling(z=data$z, n=2, method='tille')
pps.sample_tille
set.seed(178209)
pps.sample_midzuno <- pps.sampling(z=data$z, n=2, method='midzuno')
pps.sample_midzuno
set.seed(178209)
pps.sample_madow <- pps.sampling(z=data$z, n=2, method='madow')
pps.sample_madow

## 2) influenza
data(influenza)
summary(influenza)

set.seed(108506)
pps <- pps.sampling(z=influenza$population,n=20,method='midzuno')
pps
sample <- influenza[pps$sample,]
sample
}
