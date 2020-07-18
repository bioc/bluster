% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SNNGraphParam.R
\docType{class}
\name{NNGraphParam-class}
\alias{NNGraphParam-class}
\alias{NNGraphParam}
\alias{clusterRows,ANY,NNGraphParam-method}
\title{Graph-based clustering}
\usage{
NNGraphParam(shared = TRUE, ..., cluster.fun = NULL, cluster.args = list())

\S4method{clusterRows}{ANY,NNGraphParam}(x, BLUSPARAM, full = FALSE)
}
\arguments{
\item{shared}{Logical scalar indicating whether a shared NN graph should be constructed.}

\item{...}{Further arguments to pass to \code{\link{makeSNNGraph}} (if \code{shared=TRUE}) or \code{\link{makeKNNGraph}}.}

\item{cluster.fun}{Function specifying the method to use to detect communities in the NN graph.
The first argument of this function should be the NN graph and the return value should be a \link{communities} object.
Defaults to \code{\link{cluster_walktrap}}.

Alternatively, this may be a string containing the suffix of any \pkg{igraph} community detection algorithm.
For example, \code{cluster.fun="louvain"} will instruct \code{\link{clusterRows}} to use \code{\link{cluster_louvain}}.}

\item{cluster.args}{Further arguments to pass to the chosen \code{cluster.fun}.}

\item{x}{A numeric matrix-like object where rows represent observations and columns represent variables.}

\item{BLUSPARAM}{A \linkS4class{NNGraphParam} object.}

\item{full}{Logical scalar indicating whether the graph-based clustering objects should be returned.}
}
\value{
The \code{NNGraphParam} constructor will return a \linkS4class{NNGraphParam} object with the specified parameters.

The \code{clusterRows} method will return a factor of length equal to \code{nrow(x)} containing the cluster assignments.
If \code{full=TRUE}, a list is returned with \code{clusters} (the factor, as above) and \code{objects};
the latter is a list with \code{graph} (the graph) and \code{communities} (the output of \code{cluster.fun}).
}
\description{
Run community detection algorithms on a nearest-neighbor (NN) graph within \code{\link{clusterRows}}.
}
\examples{
clusterRows(iris[,1:4], NNGraphParam())
clusterRows(iris[,1:4], NNGraphParam(k=5))
clusterRows(iris[,1:4], NNGraphParam(cluster.fun="louvain"))

}
\seealso{
\code{\link{dist}}, \code{\link{hclust}} and \code{\link{cutree}}, which actually do all the heavy lifting.

\code{cutreeDynamic} from the \pkg{dynamicTreeCut} package, for an alternative tree cutting method to use in \code{cut.fun}.
}
\author{
Aaron Lun
}