// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// build_snn_rank
Rcpp::List build_snn_rank(Rcpp::IntegerMatrix neighbors);
RcppExport SEXP _bluster_build_snn_rank(SEXP neighborsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerMatrix >::type neighbors(neighborsSEXP);
    rcpp_result_gen = Rcpp::wrap(build_snn_rank(neighbors));
    return rcpp_result_gen;
END_RCPP
}
// build_snn_number
Rcpp::List build_snn_number(Rcpp::IntegerMatrix neighbors);
RcppExport SEXP _bluster_build_snn_number(SEXP neighborsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerMatrix >::type neighbors(neighborsSEXP);
    rcpp_result_gen = Rcpp::wrap(build_snn_number(neighbors));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_bluster_build_snn_rank", (DL_FUNC) &_bluster_build_snn_rank, 1},
    {"_bluster_build_snn_number", (DL_FUNC) &_bluster_build_snn_number, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_bluster(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}