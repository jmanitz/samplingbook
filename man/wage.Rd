\name{wage}
\alias{wage}
\docType{data}
\title{
Chinese wage data
}
\description{
A data frame with hypothetical Chinese wages differenciated by region and industrial sector.
}
\usage{data(wage)}
\format{
  A data frame with 231 observations on the following 3 variables.
  \describe{
    \item{\code{Region}}{factor, Chinese regions with 14 levels.}
    \item{\code{Sector}}{factor, industrial sector with 30 levels.}
    \item{\code{Wage}}{a numeric vector, average wage in the region and sector measured in Chinese yuan.}
  }
}
\details{
The dataset is hypothetical. Its structure imitates the data in the Chinese Statistical Yearbook. The values are simulated corresponding to the distribution of the real data which are not publicly accessible.
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
}
\examples{
# Chinese wage data
data(wage)
summary(wage)
submean(wage$Wage,PSU=wage$Region, N=990, M=33, Nl=rep(30,14))
}
\keyword{datasets}

