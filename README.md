# Computation of Spatial Covariance Matrices for Data on Rectangles

Functions that compute the spatial covariance matrix for the matern and power classes of spatial models, for data that arise on rectangular units.  This code can also be used for the change of support problem and for spatial data that arise on irregularly shaped regions like counties or zipcodes by laying a fine grid of rectangles and aggregating the integrals in a form of Riemann integration.

## Installation
Please install the package in R directly using the commands:

```R
install.packages("devtools")
devtools::install_github("david-clifford/spatialCovariance")
```
## References
Clifford, D. (2005). Computation of spatial covariance matrices. Journal of Computational and Graphical Statistics, 14(1), 155-167.
