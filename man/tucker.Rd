\docType{methods}
\name{tucker-methods}
\alias{tucker-methods}
\alias{tucker}
\alias{tucker,DelayedArray-method}
\title{Tucker Decomposition}
\usage{
tucker(darr, ranks=NULL, max_iter=25, tol=1e-05)

\S4method{tucker}{DelayedArray}(darr, ranks, max_iter, tol)
}
\arguments{
\item{darr}{Tensor with K modes}

\item{ranks}{a vector of the modes of the output core Tensor}

\item{max_iter}{maximum number of iterations if error stays above \code{tol}}

\item{tol}{relative Frobenius norm error tolerance}
}
\value{
a list containing the following:\describe{
\item{\code{Z}}{the core tensor, with modes specified by \code{ranks}}
\item{\code{U}}{a list of orthgonal factor matrices - one for each mode,
with the number of columns of the matrices given by \code{ranks}}
\item{\code{conv}}{whether or not \code{resid} < \code{tol}
by the last iteration}
\item{\code{est}}{estimate of \code{darr} after compression}
\item{\code{norm_percent}}{the percent of Frobenius norm explained
by the approximation}
\item{\code{fnorm_resid}}{the Frobenius norm of the error
\code{fnorm(est-darr)}}
\item{\code{all_resids}}{vector containing the Frobenius norm of error
for all the iterations}
}
}
\description{
The Tucker decomposition of a tensor. Approximates a K-Tensor using a
n-mode product of a core tensor (with modes specified by \code{ranks})
with orthogonal factor matrices. If there is no truncation in one of the modes,
then this is the same as the MPCA, \code{\link{mpca}}.
If there is no truncation in all the modes (i.e. \code{ranks = darr@modes}),
then this is the same as the HOSVD, \code{\link{hosvd}}.
This is an iterative algorithm, with two possible stopping conditions:
either relative error in Frobenius norm has gotten below \code{tol},
or the \code{max_iter} number of iterations has been reached.
For more details on the Tucker decomposition, consult Kolda and Bader (2009).
}
\details{
This function is an extension of the \code{\link[rTensor]{tucker}}
by DelayedArray.

Uses the Alternating Least Squares (ALS) estimation procedure also
known as Higher-Order Orthogonal Iteration (HOOI).
Intialized using a (Truncated-)HOSVD.
A progress bar is included to help monitor operations on large tensors.
}
\note{
The length of \code{ranks} must match \code{darr@num_modes}.
}
\examples{
library("DelayedRandomArray")
darr <- RandomUnifArray(c(2,3,4))
tucker(darr, ranks=c(1,2,3))
}
\references{
T. Kolda, B. Bader,
"Tensor decomposition and applications".
SIAM Applied Mathematics and Applications 2009.
}
\seealso{
\code{\link{hosvd}}, \code{\link{mpca}}
}
