\name{Sprop}
\alias{Sprop}
\title{Sampling Proportion Estimation}
\description{
  The function \code{Sprop} estimates the proportion out of samples either with or without
  consideration of finite population correction. Different methods for calculating 
  confidence intervals for example based on binomial distribution (Agresti and 
  Coull or Clopper-Pearson) or based on hypergeometric distribution are used.
}
\usage{
Sprop(y, m, n = length(y), N = Inf, level = 0.95)
}
\arguments{
  \item{y}{vector of sample data containing values 0 and 1}
  \item{m}{an optional non-negative integer for number of positive events}
  \item{n}{an optional positive integer for sample size. Default is \code{n=length(y)}.}
  \item{N}{positive integer for population size. Default is \code{N=Inf}, which means calculations are carried out without finite population correction.}
  \item{level}{coverage probability for confidence intervals. Default is \code{level=0.95}.}
}
\details{
\code{Sprop} can be called by usage of a data vector \code{y} with the observations 1 for event and 0 for failure. Moreover, it can be called by specifying the number of events \code{m} and trials \code{n}. 
}
\value{
The function \code{Sprop} returns a value, which is a list consisting of the components
  \item{call}{is a list of call components: \code{y} sample data, \code{m} number of positive events in the sample, \code{n} sample size, \code{N} population size, \code{level} coverage probability for confidence intervals}
  \item{p}{proportion estimate}
  \item{se}{standard error of the proportion estimate}
  \item{ci}{is a list of confidence interval boundaries for proportion. \cr
    In case of a finite population of size \code{N}, it is given \code{approx}, the hypergeometric confidence interval with normal distribution approximation, and \code{exact}, the exact hypergeometric confidence interval. \cr
    If the population is very large \code{N=Inf}, it is calculated \code{bin}, the binomial confidence interval, which is asymptotic, \code{cp} the exact confidence interval based on binomial distribution (Clopper-Pearson), and \code{ac}, the asymptotic confidence interval based on binomial distribution by Wilson (Agresti and Coull (1998)).}
  \item{nr}{In case of finite population of size \code{N}, it is given a list of confidence interval boundaries for number in population with \code{approx}, the hypergeometric confidence interval with normal distribution approximation, and \code{exact}, the exact hypergeometric confidence interval.}
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.
  
  Agresti, Alan/Coull, Brent A. (1998): Approximate Is Better than 'Exact' for Interval Estimation of Binomial Proportions. The American Statistician, Vol. 52, No. 2 , pp. 119-126.
}
\author{Juliane Manitz}
\seealso{\code{\link{Smean}}, \code{\link{sample.size.prop}}}
\examples{
# 1) Survey in company to upgrade office climate
Sprop(m=45, n=100, N=300)
Sprop(m=2, n=100, N=300)

# 2) German opinion poll for 03/07/09 with 
# (http://www.wahlrecht.de/umfragen/politbarometer.htm)
# a) 302 of 1206 respondents who would elect SPD.
# b) 133 of 1206 respondents who would elect the Greens.
Sprop(m=302, n=1206, N=Inf)
Sprop(m=133, n=1206, N=Inf)

# 3) Rare disease of animals (sample size n=500 of N=10.000 animals, one infection)
# for 95\% one sided confidence level use level=0.9
Sprop(m=1, n=500, N=10000, level=0.9)

# 4) call with data vector y
y <- c(0,0,1,0,1,0,0,0,1,1,0,0,1)
Sprop(y=y, N=200)
# is the same as
Sprop(m=5, n=13, N=200)
}

