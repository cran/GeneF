\name{internal functions}


\alias{get.numbers}
\alias{t1p1}
\alias{t1p2}


\title{Internal GeneF Functions}


\description{
Internal functions to support generalized \eqn{F}{F}-statistics.
}


\usage{
get.numbers(x)
t1p1(v, n)
t1p2(v, n1, n2)
}


\arguments{
  \item{x}{a vector of ordered groups of numbers}
  \item{v}{a vector of real numbers}
  \item{n}{the sample size of one-sample data}
  \item{n1}{the first sample size of two-sample data}
  \item{n2}{the second sample size of two-sample data}
}


\value{
  \item{get.numbers}{a vector of culmulative sample sizes from ordered groups}
  \item{t1p1}{a \eqn{p}{p}-value from one-sample \eqn{t}{t}-test}
  \item{t1p2}{a \eqn{p}{p}-value from two-sample \eqn{t}{t}-test}
}


\author{Yinglei Lai {ylai@gwu.edu}}


\keyword{htest}