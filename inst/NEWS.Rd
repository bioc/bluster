\name{blusterNews}
\title{bluster News}
\encoding{UTF-8}

\section{Version 1.16.0}{\itemize{
\item Add \code{num.threads=} to all neighbor-based methods, to be passed to \pkg{BiocNeighbors}.

\item Parallelize the SNN graph construction in \code{makeSNNGraph()}.
}}

\section{Version 1.10.0}{\itemize{
\item Corrected calculation of the ratio matrix in \code{pairwiseRand()} when \code{adjusted=TRUE},
so that ratios have an upper bound of 1.
}}

\section{Version 1.2.0}{\itemize{
\item
Previously zero-weight edges are now assigned a nominal positive weight in \code{makeSNNGraph()}.

\item 
Added \code{MbkmeansParam()} to wrap mini-batch k-means from \pkg{mbkmeans}.

\item 
Added \code{SOMParam()} to wrap self-organizing map implementation from \pkg{kohonen}.

\item 
Added \code{AffinityParam()} to wrap the affinity propagation code from \pkg{apcluster}.

\item
Added \code{DbscanParam()} to provide a custom DBSCAN implementation with automatic \code{eps} choice.

\item 
Added \code{PamParam()} to wrap the PAM implementation from \pkg{cluster}.

\item 
Added \code{ClaraParam()} to wrap the CLARA implementation from \pkg{cluster}.

\item 
Added \code{AgnesParam()} to wrap the agglomerative nesting method from \pkg{cluster}.

\item 
Added \code{DianaParam()} to wrap the divisive analysis method from \pkg{cluster}.

\item 
Added \code{clusterSweep()} to easily perform parameter sweeps via \code{clusterRows()}.

\item 
Added \code{linkClusters()} to find relationships between clusters in different clusterings.

\item 
Added \code{compareClusterings()} to compute similarities between multiple clusterings.

\item
Added \code{nestedClusters()} to quantify the degree of nesting across two clusterings.

\item Moved \code{objects} into \code{objects$kmeans} for \code{KmeansParam()} when \code{full=TRUE}. 

\item Moved \code{objects} into \code{objects$hclust} for \code{HclustParam()} when \code{full=TRUE}. 

\item Added \code{clusterRMSD()} to compute the root-mean-squared-deviation for each cluster.
}}

\section{Version 1.0.0}{\itemize{
\item
New package bluster for modular clustering in Bioconductor packages.
}}

