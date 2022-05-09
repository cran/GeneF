\name{flexorhtest}


\alias{flexisoreg}
\alias{flexisoreg.stat}
\alias{flexmonoreg}
\alias{flexmonoreg.stat}


\title{A Flexible Order Restricted Hypothesis Testing}


\description{
These functions test the hypothesis regarding population means from ordered sample groups. Restrictions like a weakly/general/strongly isotonic/monotonic order as well as a lower bound for the location can be imposed on the population means. A partition of sample groups and the corresponding estimates of population means are also provided.
}


\usage{
flexisoreg(y, x, lambda = 0, alpha.location = 1, alpha.adjacency = 0.5)
flexisoreg.stat(y, x, lambda = 0, alpha.location = 1, alpha.adjacency = 0.5)
flexmonoreg(y, x, lambda = 0, alpha.location = 1, alpha.adjacency = 0.5)
flexmonoreg.stat(y, x, lambda = 0, alpha.location = 1, alpha.adjacency = 0.5)
}


\arguments{
  \item{y}{a vector of observed data}
  \item{x}{a vector of ordinal group labels correponding to \code{y} but not necessarily sorted}
  \item{lambda}{a lower location bound for partitioned groups other than the first one}
  \item{alpha.location}{\eqn{\alpha}{\alpha} level for the upper-tailed one-sample \eqn{t}{t}-test with lower bound \code{lambda}}
  \item{alpha.adjacency}{\eqn{\alpha}{\alpha} level for the upper-tailed two-sample \eqn{t}{t}-test to evaluate the magnitude of nondecreasing order}
}


\details{
  \code{flexisoreg} is used for flexible nondecreasing order restricted hypothesis testing.
  \code{flexmonoreg} is used for flexible nondecreasing or nonincreasing order restricted hypothesis testing.
  \code{flexisoreg.stat} and \code{flexmonoreg.stat} only return an \eqn{F}{F}-statistic, which is convenient for multiple comparison.
}


\value{
  \item{groups}{A partition of sample groups}
  \item{estimates}{estimated population means}
  \item{statistic}{an \eqn{F}{F}-type statistic from the test}
}


\note{
Since the \eqn{p}{p}-value of test has to be evaluated by permutation method, these functions will not return any \eqn{p}{p}-value. For the permutation \eqn{p}{p}-value of an individual test, see \code{flexisoreg.pvalue} and \code{flexmonoreg.pvalue}. For the pooled permutation \eqn{p}{p}-values of multiple tests, see \code{flexisoreg.poolpvalues} and \code{flexmonoreg.poolpvalues}.
}


\references{Yinglei Lai (2007) A flexible order restricted hypothesis testing and its application to gene expression data. Technical Report}


\author{Yinglei Lai {ylai@gwu.edu}}


\examples{
#generate ordinal group lables x
x <- runif(100)*6
x <- round(x,0)/3
#generate true values z
z <- round(x^2,0)
#generate observed values y
y <- z + rnorm(100)


#print default results
print(rbind(x,z,y))
print(flexisoreg(y,x))
print(flexisoreg.stat(y,x))
print(flexisoreg(y,0-x))
print(flexisoreg.stat(y,0-x))
print(flexmonoreg(y,x))
print(flexmonoreg.stat(y,x))


     #plots for illustration
     par(mfrow=c(2,3), mai=c(0.6, 0.6, 0.3, 0.1))
     plot(x,y, main="True Model",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, z, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=1, alpha.location=0.05, alpha.adjacency=1)
     plot(x,y, main="Location Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=1, alpha.location=0.05, alpha.adjacency=0.05)
     plot(x,y, main="Location and Strong Order Restrictions", 
     cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.95)
     plot(x,y, main="Weak Order Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.5)
     plot(x,y, main="General Order Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.05)
     plot(x,y, main="Strong Order Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

}

\keyword{htest}