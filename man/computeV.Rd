\name{computeV}
\alias{computeV}

\title{Compute Covariance Matrix}

\description{
  Observations are averages over congruent rectangular plots that like
  in a lattice.  For extensive observations one needs to multiply the
  matrix by the $area^2$ where $area$ is the common area of
  each plot.

  Various different classes of covariance functions, generalised
  covariance functions and their derivatives wrt parameters
  are built into this library.  These include the Cauchy and Mat\'ern
  covariance functions as well as specific sub models such as the
  Bessel$_0$, Exponential, Bessel$_1$, spline and logarithmic covariance
  functions.}

\usage{
computeV(info, class = "ldt", params, rel.tol = .Machine$double.eps^0.25,
         abs.tol = rel.tol, cat.level = 0, K = NULL)
 }

\arguments{
  \item{info}{Result of the precompute stage}
  \item{class}{The class of covariance functions,"ldt", "bess0", "exp",
    "bess1", "power", "powerNI", "matern", "spline", "cauchy".  Can also
    be used to
    compute the derivatives of the covariance matrices for specific
    models, for example "dbess0", "dexp", "dexp2", "dbess1",
    "dpowerNI".  Can also be used for any isotropic function K, simply
    define a function K in the workspace that has two arguments,
    distance and a vector of parameters.  Then call
  \code{computeV} with \code{class="special"}.}
  \item{params}{Parameters that go with a specific class of models, for
    the "matern" class it requires an inverse range parameter and a
    smoothness parameter, for example \code{params=c(1,0.5)}, this
    corresponds to the case when \code{class="exp", params=c(1)}.}
  \item{rel.tol}{Relative Tolerance for one dimensional numerical
    integration}
  \item{abs.tol}{Absolute Tolerance for one dimensional numerical integration}
  \item{cat.level}{Controls level of time output, takes values 0, 0.5,
    1}
  \item{K}{If class="misc" pass your own covariance function K here, see
  example below}
}

\examples{
## Example for extensive variables - variances of combined plots
library(spatialCovariance)
nrows <- 1
ncols <- 2
rowwidth <- 1.1
colwidth <- 1.2
rowsep <- 0
colsep <- 0

info <- precompute(nrows,ncols,rowwidth,colwidth,rowsep,colsep)
V <- computeV(info,class="matern",params=c(1,1))

info2 <- precompute(nrows=1,ncols=1,rowwidth=rowwidth,colwidth=colwidth*2,0,0)
V2 <- computeV(info2,class="matern",params=c(1,1))

c(1,1) %*% ((rowwidth * colwidth)^2 * V) %*% c(1,1)

(rowwidth * (2*colwidth))^2 * V2

## Bring in anisotropy
V
info <- precompute.update(info,aniso=2)  ## geometric anisotropy update
V <- computeV(info,class="matern",params=c(1,1))
V
info <- precompute.update(info,aniso=5)  ## geometric anisotropy update
V

## Second Example - define your own covariance function, here we use a
## spherical one

library(spatialCovariance)

K <- function(d,params) {
  frac <- d/params
  ret <- rep(0,length(d))
  ind <- which(frac<1)
  if(length(ind)) ret[ind] <- (1 - 2/pi*(frac[ind]*sqrt(1 - frac[ind]^2) + asin(frac[ind])))
  return(ret)
}

dVals <- seq(0,10,l=1001)
plot(dVals,K(dVals,8),type="l")
lines(dVals,K(dVals,7),col=2)

nrows <- 1
ncols <- 3
rowwidth <- 2
colwidth <- 2
rowsep <- 0
colsep <- 0

info <- precompute(nrows,ncols,rowwidth,colwidth,rowsep,colsep)
V <- computeV(info,class="misc",params=c(8),K=K)
V

## Now if we have a low value of theta_2 we should see that the first
## and third plot are independent as there is a 2 unit gap between
## them, so that term in V will be zero
V <- computeV(info,class="misc",params=c(1),K=K)
V

## If theta_2 gets a little bigger than 2 then we should see no
## non-zero entries in V
V <- computeV(info,class="misc",params=c(2.005),K=K)
V

## Check V is positive definite
eigen(V)$values ## should all be positive

}

\author{David Clifford}

\keyword{spatial}

