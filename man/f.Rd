\name{f}
\alias{f}

\title{Density For Distance Between Two Points In Rectangles}

\description{This evaluates the density for the distance between two
  points, each distribution uniformly and independently in rectangles.
  The rectangles are congruent and lie on a lattice.  Three special
  cases exist, when the two rectangles
  coincide, when the two rectangles lie on the same row
  (or column) of the lattice and when the
  two rectangles lie on different rows and columns.}

\usage{
f(d, rowwidth, colwidth, ax, bx, i, j)
}

\arguments{
  \item{d}{distance}
  \item{rowwidth, colwidth}{Dimensions of the rectangle}
  \item{ax,bx}{Coordinate of the lower left corner of the second
    rectangle.  Lower left corner of the first is at the origin}
  \item{i,j}{Second rectangle lies in i-th row and j-th column of lattice.}
}

\references{
  B. Ghosh "Random distances within a rectangle and between two
  rectangles", Bulletin of the Calcutta Mathematical Society, 1951, 43, 17-24

  D. Clifford, "Computation of Spatial Covariance Matrices", JCGS, March 2005, vol. 14, no. 1, pp. 155-167(13) 
}

\author{David Clifford}

\examples{
d <- 0.75
f(d,rowwidth=1,colwidth=1,ax=0,bx=0,i=1,j=1)  ## two points in a unit square
f(d,rowwidth=1,colwidth=1,ax=1,bx=0,i=2,j=1)  ## two points in squares, squares are side by side
}

\keyword{spatial}

