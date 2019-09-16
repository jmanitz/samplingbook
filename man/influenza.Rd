\name{influenza}
\Rdversion{1.1}
\alias{influenza}
\docType{data}
\title{
Population and Cases of Influenza for Administrative Districts of Germany
}
\description{
The data frame \code{influenza} provides cases of influenza and inhabitants for administrative districts of Germany in 2007.
}
\usage{data(influenza)}
\format{
  A data frame with 424 observations on the following 4 variables.
  \describe{
    \item{\code{id}}{a numeric vector}
    \item{\code{district}}{a factor with levels \code{LK Aachen}, \code{LK Ahrweiler}, ..., \code{SK Zweibruecken}, names of administrative districts in Germany} 
    \item{\code{population}}{a numeric vector specifying the number of inhabitants in the specific administrative district}
    \item{\code{cases}}{a numeric vector specifying the number of influenza cases in the specific administrative district}
  }
}
\details{
Data of 2007. If you want to use the population numbers in the future, be aware of local governmental reorganizations, e.g. district unions.
}
\source{
Database SurvStat of Robert Koch-Institute. Many thanks to Hermann Claus.
}
\references{
Database of Robert Koch-Institute http://www3.rki.de/SurvStat/

Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\examples{
data(influenza)
summary(influenza)

# 1) Usage of pps.sampling
set.seed(108506)
pps <- pps.sampling(z=influenza$population,n=20,method='midzuno')
pps
sample <- influenza[pps$sample,]
sample

# 2) Usage of htestimate
set.seed(108506)
pps <- pps.sampling(z=influenza$population,n=20,method='midzuno')
sample <- influenza[pps$sample,]
# htestimate()
N <- nrow(influenza)
# exact variance estimate
PI <- pps$PI
htestimate(sample$cases, N=N, PI=PI, method='ht')
htestimate(sample$cases, N=N, PI=PI, method='yg')
# approximate variance estimate
pk <- pps$pik[pps$sample]
htestimate(sample$cases, N=N, pk=pk, method='hh')
pik <- pps$pik
htestimate(sample$cases, N=N, pk=pk, pik=pik, method='ha')
# without pik just approximative calculation of Hajek method
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
\keyword{datasets}
