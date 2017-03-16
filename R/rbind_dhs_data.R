#' @title Coerce DHS data into a \code{data.frame}
#' @description Worker function for running and returning DHS data,
#' but in a \code{data.frame}.
#'
#' @param data Slot of \code{data} in output
#' from \code{\link{get_dhs_data}}
#'
#' @return A \code{data.frame} of the data.  Most likely all columns are
#' going to be character.
#' @export
rbind_dhs_data = function(data) {
  # rm(list = "res")
  data = lapply(data, unlist)
  n = lapply(data, names)
  check_n = sapply(n, all.equal, n[[1]])
  if (!all(check_n)) {
    warning("Names are not consistent in the list - may have errors!")
  }
  data = do.call("rbind", data)
  data = as.data.frame(data, stringsAsFactors = FALSE)
  return(data)
}
