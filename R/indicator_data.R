#' @title Get DHS Fields
#' @description Returns a \code{data.frame} of the fields from
#' \url{http://api.dhsprogram.com/rest/dhs/data/fields}
#'
#' @param per_page Number of records to return per page
#' @param progress Show progress bar if more than one page
#' @param survey Surveys to return based on survey ID
#' @param countries Countries to return based on country ID
#' @param indicators Indicators to return based on country ID
#' @param years Years to return
#'
#' @return  \code{data.frame} of the field names and the description of
#' the field
#' @export
#'
#' @examples
#' indicator_data(survey = "SN2010DHS")
#' indicator_data(survey = "EG1988DHS", countries = "EG")
#'
indicator_data = function(
  per_page = 1000,
  progress = TRUE,
  survey = NULL,
  countries = NULL,
  indicators = NULL,
  years = NULL) {

  fieldurl = paste0(
    dhs::rest_dhs_url,
    "data")
  q = list(perpage = per_page, page = 1)
  opts = NULL
  run_opts = function(x, opts){
    if (!is.null(x)) {
      x = paste(x, collapse = ",")
      opts = paste(x, opts, sep = ",")
    }
    return(opts)
  }
  opts = run_opts(survey, opts)
  opts = run_opts(countries, opts)
  opts = run_opts(indicators, opts)
  opts = run_opts(years, opts)

  if (!is.null(opts)) {
    fieldurl = paste0(fieldurl, "/", opts)
  }
  fields = get_dhs_data(
    url = fieldurl,
    query = q,
    progress = progress)
  fields = rbind_dhs_data(fields$data)
  return(fields)
}
