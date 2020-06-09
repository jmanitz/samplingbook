
## `samplingbook` package

Sampling procedures from the book [‘Stichproben - Methoden und
praktische Umsetzung mit
R’](https://www.springer.com/de/book/9783642123177) by Goeran
Kauermann and Helmut Kuechenhoff (2010).

The book introduces the basic principles for sampling and corresponding
statistical analysis. The following topics are covered:

1.  Introduction of Basic Sampling Principles
2.  Simple Sample Methods
3.  Model-based Sampling
4.  Design-based Sampling: Horvitz-Thomson Estimate
5.  Grouping of Populations: Stratified and Cluster Sampling
6.  Methods with Multiple Phases
7.  Problems in Real-World Applications

Each chapter concludes with exemplifying real-world applications in `R`,
which utilize the functions from this R package.

### Installation

You can install the latest production version from CRAN

``` r
install.packages("samplingbook", dependencies = TRUE)
```

or the current development version from GitHub

``` r
library("devtools")
install_github("Pakillo/template")
```

Then, load the package

``` r
library("samplingbook")
```

### Example: Simple Sample and Estimation of Proportions

In a company with N=300 employees a survey was conducted regarding to
improve working conditions. A random sample of n=100 employees was drawn
and two questions were asked:

  - Would you support more flexibility in your working hours?
  - Would you support a possibility for child care within the company?

The questions were answered with “yes” by 45 and 2 employees,
respectively. Using `samplingbook::Sprop()`, we can estimate the
proportions of support in the entire company:

``` r
Sprop(m=45, n=100, N=300)
```

    ## 
    ## Sprop object: Sample proportion estimate
    ## With finite population correction: N= 300 
    ## 
    ## Proportion estimate:  0.45 
    ## Standard error:  0.0408 
    ## 
    ## 95% approximate hypergeometric confidence interval: 
    ##  proportion: [0.37,0.53]
    ##  number in population: [111,159]
    ## 95% exact hypergeometric confidence interval: 
    ##  proportion: [0.3667,0.5367]
    ##  number in population: [110,161]

Thus, between 37% and 53% of all employees, thus between 111 and 159
persons, are estimated to support more flexible working hours.

``` r
Sprop(m=2, n=100, N=300)
```

    ## 
    ## Sprop object: Sample proportion estimate
    ## With finite population correction: N= 300 
    ## 
    ## Proportion estimate:  0.02 
    ## Standard error:  0.0115 
    ## 
    ## 95% approximate hypergeometric confidence interval: 
    ##  proportion: [-0.0025,0.0425]
    ##  number in population: [0,12]
    ## 95% exact hypergeometric confidence interval: 
    ##  proportion: [0.0033,0.0633]
    ##  number in population: [1,19]

On the other hand, the survey results that only between 1 and 19
employees would support child care within the company.

The example shows, that in particular the for small proportion
estimates, the calculations of exact confidence intervals using the
hypergeometric distributions is more appropriate.

### Contributions:

  - Goeran Kauermann and Helmut Kuechenhoff for their guidance and ideas
  - Cornelia Oberhauser for proof reading and testing
  - Mark Hempelmann, Shuai Shao, Nina Westerheide, and Manuel
    Wiesenfarth for contributing source code
