% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pairwiseRand.R
\name{pairwiseRand}
\alias{pairwiseRand}
\title{Compute pairwise Rand indices}
\usage{
pairwiseRand(ref, alt, mode = c("ratio", "pairs", "index"), adjusted = TRUE)
}
\arguments{
\item{ref}{A character vector or factor containing one set of groupings, considered to be the reference.}

\item{alt}{A character vector or factor containing another set of groupings, to be compared to \code{alt}.}

\item{mode}{String indicating whether to return the ratio, the number of pairs or the Rand index.}

\item{adjusted}{Logical scalar indicating whether the adjusted Rand index should be returned.}
}
\value{
If \code{mode="ratio"}, a square numeric matrix is returned with number of rows equal to the number of unique levels in \code{ref}.
Each diagonal entry is the ratio of the per-cluster \eqn{a} to the total number of pairs of cells in that cluster.
Each off-diagonal entry is the ratio of the per-cluster-pair \eqn{b} to the total number of pairs of cells for that pair of clusters.
Lower-triangular entries are set to \code{NA}.
If \code{adjusted=TRUE}, counts and totals are both adjusted prior to computing the ratio.

If \code{mode="pairs"}, a list is returned containing \code{correct} and \code{total},
both of which are square numeric matrices of the same arrangement as described above.
However, \code{correct} contains the actual numbers \eqn{a} (diagonal) and \eqn{b} (off-diagonal) rather than the ratios,
while \code{total} contains the total number of cell pairs in each cluster or pair of clusters.
If \code{adjusted=TRUE}, both matrices are adjusted by subtracting the random expectations from the counts.

If \code{mode="index"}, a numeric scalar is returned containing the Rand index (or ARI, if \code{adjusted=TRUE}).
}
\description{
Breaks down the Rand index calculation to report values for each cluster and pair of clusters
in a reference clustering compared to an alternative clustering.
}
\details{
Recall that the Rand index calculation consists of four numbers:
\describe{
\item{\eqn{a}}{The number of pairs of cells in the same cluster in \code{ref} and the same cluster in \code{alt}.}
\item{\eqn{b}}{The number of pairs of cells in different clusters in \code{ref} and different clusters in \code{alt}.}
\item{\eqn{c}}{The number of pairs of cells in the same cluster in \code{ref} and different clusters in \code{alt}.}
\item{\eqn{d}}{The number of pairs of cells in different clusters in \code{ref} but the same cluster in \code{alt}.}
}
The Rand index is then computed as \eqn{a + b} divided by \eqn{a + b + c + d}, i.e., the total number of pairs.

We can break these numbers down into values for each cluster or pair of clusters in \code{ref}.
For each cluster, we compute its value of \eqn{a}, 
i.e., the number of pairs of cells in \emph{that} cluster that are also in the same cluster in \code{alt}.
Similarly, for each pair of clusters in \code{ref}, we compute its value of \eqn{b},
i.e., the number of pairs of cells that have one cell in each of those clusters 
and also belong in different clusters in \code{alt}.

This process provides more information about the specific similarities or differences between \code{ref} and \code{alt},
rather than coalescing all the values into a single statistic. 
For example, it is now possible to see which specific clusters from \code{ref} are not reproducible in \code{alt},
or which specific partitions between pairs of clusters are not reproducible.
Such events can be diagnosed by looking for small (i.e., near-zero or negative) entries in the ratio matrix;
on the other hand, large values (i.e., close to 1) indicate that \code{ref} is almost perfectly recapitulated by \code{alt}.

If \code{adjusted=TRUE}, we adjust all counts by subtracting their expected values under a model of random permutations.
This accounts for differences in the number and sizes of clusters within and between \code{ref} and \code{alt},
in a manner that mimics the calculation of adjusted Rand index (ARI).
We subtract expectations on a per-cluster or per-cluster-pair basis for \eqn{a} and \eqn{b}, respectively;
we also redefine the \dQuote{total} number of cell pairs for each cluster or cluster pair based on the denominator of the ARI.
}
\examples{
m <- matrix(runif(10000), ncol=10)

clust1 <- kmeans(m,3)$cluster
clust2 <- kmeans(m,5)$cluster

ratio <- pairwiseRand(clust1, clust2)
ratio

# Getting the raw counts:
pairwiseRand(clust1, clust2, mode="pairs")

# Computing the original Rand index.
pairwiseRand(clust1, clust2, mode="index")

}
\seealso{
\code{\link{pairwiseModularity}}, which applies the same breakdown to the cluster modularity.

\code{\link{compareClusterings}}, which does this for multiple clusterings.
}
\author{
Aaron Lun
}
