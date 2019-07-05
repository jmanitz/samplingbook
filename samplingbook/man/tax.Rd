\name{tax}
\alias{tax}
\docType{data}
\title{Hypothetical Tax Refund Data Frame}
\description{
Simulated tax refund data frame including the estimated and actual refund value
}
\usage{data(tax)}
\format{
  A data frame with 9083 observations on the following 5 variables.
  \describe{
    \item{\code{id}}{a numeric vector indicating the tax payer}
    \item{\code{estRefund}}{a numeric vector representing the estimated value of tax refund by the tax payer}
    \item{\code{actRefund}}{a numeric vector representing the actual tax refund calculated by the financial authority}
    \item{\code{diff}}{difference between estimated and acture tax refund}
    \item{\code{Class}}{a factor with levels \code{1}, \code{2}, \code{3}, and \code{4} indicating the strata}
}}
\source{
Due to data protection this is a simulated data set reflecting the real data.
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\examples{
data(tax)
summary(tax)

# illustration of stratamean
nh <- as.vector(table(tax$Class))
wh <- nh/sum(nh)
stratamean(y=tax$diff, h=as.vector(tax$Class), wh=wh, eae=TRUE)
}
\keyword{datasets}
