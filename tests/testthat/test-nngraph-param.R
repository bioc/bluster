# Tests the NNGraphParam class.
# library(bluster); library(testthat); source('test-nngraph-param.R')

test_that("NNGraphParam constructor and utilities work correctly", {
    X <- NNGraphParam()
    expect_output(show(X), "SNNGraphParam")

    X <- NNGraphParam(shared=FALSE)
    expect_output(show(X), "KNNGraphParam")

    expect_identical(X[["cluster.fun"]], "walktrap")
    X <- NNGraphParam(cluster.fun=igraph::cluster_louvain)
    expect_true(is.function(X[["cluster.fun"]]))

    X <- NNGraphParam(k=20)
    expect_identical(X[["k"]], 20L)
    X[["k"]] <- 30L
    expect_identical(X[["k"]], 30L)
})

test_that("NNGraphParam validity works correctly", {
    expect_error(NNGraphParam(k=NA), "integer scalar")
    expect_error(NNGraphParam(type=letters), "string")
    expect_error(NNGraphParam(shared=FALSE, directed=NA), "logical scalar")
    expect_error(NNGraphParam(cluster.fun=LETTERS), "non-missing string")
})

test_that("clusterRows works correctly", {
    m <- matrix(runif(1000), ncol=10)
    out <- clusterRows(m, NNGraphParam())
    expect_true(is.factor(out))
    expect_identical(length(out), nrow(m))

    out2 <- clusterRows(m, NNGraphParam(shared=FALSE))
    expect_true(is.factor(out2))
    expect_identical(length(out2), nrow(m))
    expect_false(identical(out, out2))

    set.seed(1000)
    out3 <- clusterRows(m, NNGraphParam(cluster.fun="louvain"))
    expect_true(is.factor(out3))
    expect_identical(length(out3), nrow(m))
    expect_false(identical(out, out3))

    set.seed(1000)
    out4 <- clusterRows(m, NNGraphParam(cluster.fun=igraph::cluster_louvain))
    expect_identical(out3, out4)

    full <- clusterRows(m, NNGraphParam(), full=TRUE)
    expect_s3_class(full$objects$graph, "igraph")
    expect_s3_class(full$objects$communities, "communities")
})
