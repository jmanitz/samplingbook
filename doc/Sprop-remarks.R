## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  rmarkdown.html_vignette.check_title = FALSE,
  collapse = TRUE,
  comment = "#>"
)
require(samplingbook, quietly = TRUE)

## -----------------------------------------------------------------------------
Sprop(m=3, n = 10, N = 50, level = 0.95)

## ---- echo=FALSE, fig.width=7, fig.height=4-----------------------------------
#par(mfrow=c(1,2))
#M <- 50; curve(phyper(x, M, 500-M, 100), from=0,to=30, col="#E495A5", lwd=2, las=1,
#               ylab="Distribution function, F(x)", main="Hyp(x, M, N-M, n) given N=500, n=100")
#M <- 60; curve(phyper(x, M, 500-M, 100), from=0,to=30, add=TRUE, col="#86B875", lwd=2)
#M <- 70; curve(phyper(x, M, 500-M, 100), from=0,to=30, add=TRUE, col="#7DB0DD", lwd=2)
#abline(h=c(0.975,0.025), lty=2); abline(v=15)
#legend("bottomright", legend=paste0("M=",c(50,60,70)), col=c( "#E495A5","#86B875","#7DB0DD"), lty=1,lwd=2)

#par(mfrow=c(1,2))
M <- 4; curve(phyper(x, M, 50-M, 10), from=0,to=15, col="#E495A5", lwd=2, las=1, ylim=c(0,1),
               ylab="Distribution function, F(x)", main="Hyp(x, M, N-M, n) given N=50, n=10")
#M <- 8; curve(phyper(x-1, M, 50-M, 10), from=0,to=15, add=TRUE, col="#86B875", lwd=2)
M <- 20; curve(phyper(x, M, 50-M, 10), from=0,to=15, add=TRUE, col="#86B875", lwd=2)
M <- 32; curve(phyper(x, M, 50-M, 10), from=0,to=15, add=TRUE, col="#7DB0DD", lwd=2)
abline(h=c(0.975,0.025), lty=2); abline(v=3)
legend("bottomright", legend=paste0("M=",c(4,20,32)), col=c( "#E495A5","#86B875","#7DB0DD"), lty=1,lwd=2)

## ---- echo=FALSE, eval=FALSE--------------------------------------------------
#  N = 50; n = 10; m= 3
#  (Ux =  N - (n-m)) # initialize
#  phyper(m, Ux, N-Ux, n)
#  (Ux <- Ux -1)
#  #Ux <- 32
#  phyper(m, Ux, N-Ux, n)

## ---- echo=FALSE, eval=FALSE--------------------------------------------------
#  N = 50; n = 10; m= 3
#  (Ux = m) # initialize
#  phyper(m, Ux, N-Ux, n)
#  (Ux <- Ux + 1)
#  phyper(m, Ux, N-Ux, n)
#  #Ux <- 32

