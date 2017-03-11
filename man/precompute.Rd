\name{precompute}
\alias{precompute.update}
\alias{precompute}

\title{Precompute Step for Computing Covariance Matrix}

\description{For a lattice with \code{nr} rows and \code{nc} columns on
  only needs to compute $n=nr X nc$ entries to fill the whole
  covariance matrix (of size $n X n$).  For example, the
  diagonal entries will all be the same so one only needs to compute it
  once and know that the value needs to be placed along the diagonal.
  This algorithm figures out which entries need to be computed, and how
  to insert them into the covariance matrix.

  When an anisotropy term \code{aniso} is
  included in the direction of rows and columns it changes how distance
  is measure from $sqrt (x^2+y^2)$ to
  $sqrt (x^2+ alpha^2 y^2)$.  This amounts to stretching the
  lattice in the appropriate direction by a factor of $alpha$.  We
  can update the results of the \code{precompute} stage very easily.
}

\usage{
precompute(nrows,ncols,rowwidth,colwidth,rowsep,colsep,cat.level)
precompute.update(info,cat.level=0,aniso=1) }

\arguments{
  \item{nrows,ncols}{Number of rows and columns in the lattice}
  \item{rowwidth, colwidth}{Dimensions of the rectangle}
  \item{rowsep,colsep}{Vectors of separations between rows and columns.
  Pass scalars if the separations are constant in each direction.}
  \item{cat.level}{0,0.5,1, changes the amount of output.  Output is
    limited to times for various stages of the computation}
  \item{aniso}{Value of anisotropy parameter in the direction of rows
    and columns.  Should be a positive number.}
  \item{info}{Result of the precompute stage}
}

\author{David Clifford}

\examples{
## See computeV help page for more details and examples
}

\keyword{spatial}

