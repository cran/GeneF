\name{flexorhtest.pvalue}


\alias{flexisoreg.pvalue}
\alias{flexisoreg.poolpvalues}
\alias{flexmonoreg.pvalue}
\alias{flexmonoreg.poolpvalues}


\title{Significance Assessment for the Flexible Order Restricted Hypothesis Testing}


\description{
These functions evaluate the \eqn{p}{p}-values from an individual or multiple flexible order restricted hypothesis testing.
}


\usage{
flexisoreg.pvalue(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.5, B=100)
flexisoreg.poolpvalues(m, x, lambda=0, alpha.location=1, alpha.adjacency=0.5, B=100)
flexmonoreg.pvalue(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.5, B=100)
flexmonoreg.poolpvalues(m, x, lambda=0, alpha.location=1, alpha.adjacency=0.5, B=100)
}


\arguments{
  \item{m}{a matrix of observed data, where samples are in columns and variables are in rows}
  \item{y}{a vector of observed data}
  \item{x}{a vector of ordinal group labels correponding to \code{y} or rows of \code{m} but not necessarily sorted}
  \item{lambda}{a lower location bound for partitioned groups other than the first one}
  \item{alpha.location}{\eqn{\alpha}{\alpha} level for the upper-tailed one-sample \eqn{t}{t}-test with lower bound \code{lambda}}
  \item{alpha.adjacency}{\eqn{\alpha}{\alpha} level for the upper-tailed two-sample \eqn{t}{t}-test to evaluate the magnitude of nondecreasing order}
  \item{B}{the number of permutations for \eqn{p}{p}-value assessment}
}


\details{
  \code{flexisoreg.pvalue} and \code{flexmonoreg.pvalue} provide the permutation \eqn{p}{p}-value for an individual flexible order restricted hypothesis testing.
  \code{flexisoreg.poolpvalues} and \code{flexmonoreg.poolpvalues} provide the pooled permutation \eqn{p}{p}-values for multiple flexible order restricted hypothesis testing.
}


\value{
  \code{flexisoreg.pvalue} and \code{flexmonoreg.pvalue} return a permutation \eqn{p}{p}-value.
  \code{flexisoreg.poolpvalues} and \code{flexmonoreg.poolpvalues} return a vector of pooled permutation \eqn{p}{p}-values.
}


\note{
These functions are used in conjunction with \code{flexisoreg}, \code{flexisoreg.stat}, \code{flexmonoreg} and \code{flexmonoreg.stat}.
}


\references{Yinglei Lai (2007) A flexible order restricted hypothesis testing and its application to gene expression data. Technical Report}


\author{Yinglei Lai {ylai@gwu.edu}}


\examples{
#generate ordinal group lables x
x <- runif(100)*6
x <- round(x,0)/3
#generate true values z
z <- round(x^2,0)
#generate 6 vectors in a matrix for observed values, some noises and some not
m <- array(double(6*100), dim=c(6,100))
for(k in 1:3)
m[k,] <- rnorm(100)
for(k in 4:6)
m[k,] <- z + rnorm(100)


#print default results
par(mfrow=c(2,3))
for(k in 1:6){
print(paste("The ", k, "-th vector", sep=""))
y <- m[k,]
plot(x,y,main=k)
print(flexisoreg.stat(y,x))
print(flexisoreg.pvalue(y,x,B=20))
print(flexisoreg.stat(y,0-x))
print(flexisoreg.pvalue(y,0-x,B=20))
print(flexmonoreg.stat(y,x))
print(flexmonoreg.pvalue(y,x,B=20))
}

flexisoreg.poolpvalues(m, x, B=20)
flexmonoreg.poolpvalues(m, x, B=20)

}

\keyword{htest}