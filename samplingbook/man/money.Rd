\name{money}
\Rdversion{1.1}
\alias{money}
\docType{data}
\title{
Money Data Frame
}
\description{
Data provides guesses and true values for students wallet money.
}
\usage{data(money)}
\format{
  A data frame with 13 observations (corresponding to the students) on the following 3 variables.
  \describe{
    \item{\code{id}}{a numeric vector of identification number}
    \item{\code{X}}{a numeric vector of secondary information, guesses of money in the wallet}
    \item{\code{y}}{a numeric vector of primary information, counted money in the wallet. \code{NA} means subject was not included into the sample.}
  }
}
\details{
In a lesson an experiment was made, in which the students were asked to guess the current amount of money in their wallet. A simple sample of these students was drawn, who counted the money in their wallet exactly. Using this secondary information, model based estimation of the population mean is possible.
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\examples{
data(money)
print(money)

# Usage of mbes()
mu.X <-  mean(money$X)
x <- money$X[which(!is.na(money$y))]
y <- na.omit(money$y)
# estimation
mbes(y~x, aux=mu.X, N=13, method='all')
}
\keyword{datasets}
