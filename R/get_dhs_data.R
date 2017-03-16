#' @title Get DHS data from a URL
#' @description Worker function for running and returning DHS data
#'
#' @param url URL for DHS
#' @param query Query to pass to \code{\link{GET}}
#' @param progress Show progress bar if more than one page
#'
#' @return List of the data, the number of pages parsed, the number of
#' records to be in the output, the number of records in the output.
#' @export
get_dhs_data = function(url,
                        query = NULL,
                        progress = TRUE) {

  get_ind_info = function(query) {
    field_res = httr::GET(url = url, query = query)
    httr::stop_for_status(field_res)
    fields = httr::content(field_res)
  }
  fields = get_ind_info(query)
  n_pages = fields$TotalPages
  n_rets = fields$RecordsReturned
  n_recs = fields$RecordCount
  dat = fields$Data
  if (n_pages > 1) {
    if (progress) {
      message(paste0("There are ", n_pages, " pages to run"))
    }
    # rec_count = fields$RecordCount
    # if (rec_count > per_page) {
    # n_pages = ceiling(rec_count/per_page)
    inds = seq(2, n_pages) # start at 2 because already did page 1
    if (progress) {
      pb = txtProgressBar(min = 2, max = n_pages, style = 3)
    }
    for (ipage in inds) {
      query$page = ipage
      fields = get_ind_info(query)
      dat = c(dat, fields$Data)
      if (progress) {
        setTxtProgressBar(pb, value = ipage)
      }
      n_rets = fields$RecordsReturned + n_rets
    }
    if (progress) {
      close(pb)
    }
  }
  if (is.null(n_recs)) {
    n_recs = length(dat)
  }
  if (is.null(n_rets)) {
    n_rets = length(dat)
  }
  if (n_recs != n_rets) {
    warning(paste0(
      "Number of records to be returned were ",
      n_recs,
      " but only ",
      n_rets,
      " were returned")
    )
  }
  if (n_rets != length(dat)) {
    warning(paste0(
      "Number of records to be returned were ",
      n_rets,
      " but data is only of length ",
      length(dat))
    )
  }
  L = list(
    data = dat,
    n_pages = n_pages,
    n_records = n_recs,
    n_returned = n_rets
  )
  return(L)
}
