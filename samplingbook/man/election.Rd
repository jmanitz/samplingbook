\name{election}
\alias{election}
\docType{data}
\title{German Parliament Election Data}
\description{
Data frame with number of citizens eligible to vote and results of the elections in 2002 and 2005 for the German Bundestag, the first chamber of the German
parliament.
}
\usage{data(election)}
\format{
  A data frame with 299 observations (corresponding to constituencies) on the following 13 variables.
  \describe{
    \item{\code{state}}{factor, the 16 German federal states}
    \item{\code{eligible_02}}{number of citizens eligible to vote in 2002} 
    \item{\code{SPD_02}}{a numeric vector, percentage for the Social Democrats SPD in 2002}
    \item{\code{UNION_02}}{a numeric vector, percentage for the conservative Christian Democrats CDU/CSU in 2002}
    \item{\code{GREEN_02}}{a numeric vector, percentage for the Greens in 2002}
    \item{\code{FDP_02}}{a numeric vector, percentage for the Liberal Party FDP in 2002}
    \item{\code{LEFT_02}}{a numeric vector, percentage for the Left Party PDS in 2002}
    \item{\code{eligible_05}}{number of citizens eligible to vote in 2005} 
    \item{\code{SPD_05}}{a numeric vector, percentage for the Social Democrats SPD in 2005}
    \item{\code{UNION_05}}{a numeric vector, percentage for the conservative Christian Democrats CDU/CSU in 2005}
    \item{\code{GREEN_05}}{a numeric vector, percentage for the Greens in 2005}
    \item{\code{FDP_05}}{a numeric vector, percentage for the Liberal Party FDP in 2005}
    \item{\code{LEFT_05}}{a numeric vector, percentage for the Left Party in 2005}
  }
}
\details{
German Federal Elections

Half of the Members of the German Bundestag are elected directly from Germany's 299 constituencies,
the other half one on the parties' land lists. Accordingly, each voter has two votes in the elections
to the German Bundestag. The first vote, allowing voters to elect their local representatives to the
Bundestag, decides which candidates are sent to Parliament from the constituencies.
The second vote is cast for a party list. And it is this second vote that determines the relative
strengths of the parties represented in the Bundestag. At least 598 Members of the German Bundestag
are elected in this way. In addition to this, there are certain circumstances in which some
candidates win what are known as 'overhang mandates' when the seats are being distributed.

The data set provides the percentage of second votes for each party, which determines the number of
seats each party gets in parliament. These percentages are calculated by the number of votes for a party divided by number
of valid votes.
}
\source{
  The data is provided by the R package flexclust.
}
\references{
  Kauermann, Goeran/Kuechenhoff, Helmut (2010): Stichproben. Methoden und praktische Umsetzung mit R. Springer.

  Homepage of the Bundestag: http://www.bundestag.de.
  
  Friedrich Leisch. A Toolbox for K-Centroids Cluster Analysis. Computational Statistics and Data Analysis, 51 (2), 526-544, 2006.
}
\examples{
data(election)
summary(election)

# 1) Draw a simple sample of size n=20
n <- 20
set.seed(67396)
index <- sample(1:nrow(election), size=n)
sample1 <- election[index,]
Smean(sample1$SPD_02, N=nrow(election))
# true mean
mean(election$SPD_02)

# 2) Estimate sample size to forecast proportion of SPD in election of 2005
sample.size.prop(e=0.01, P=mean(election$SPD_02), N=Inf)

# 3) Usage of previous knowledge by model based estimation
# draw sample of size n = 20
N <- nrow(election)
set.seed(67396)
sample <- election[sort(sample(1:N, size=20)),]
# secondary information SPD in 2002
X.mean <- mean(election$SPD_02)
# forecast proportion of SPD in election of 2005
mbes(SPD_05 ~ SPD_02, data=sample, aux=X.mean, N=N, method='all')
# true value
Y.mean <- mean(election$SPD_05)
Y.mean
# Use a second predictor variable
X.mean2 <- c(mean(election$SPD_02),mean(election$GREEN_02))
# forecast proportion of SPD in election of 2005 with two predictors
mbes(SPD_05 ~ SPD_02+GREEN_02, data=sample, aux=X.mean2, N=N, method= 'regr')
}

\keyword{datasets}
