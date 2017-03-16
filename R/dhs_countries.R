#' @title Return DHS Countries
#' @description Returns the set of countries from DHS from their website
#'
#' @return A \code{data.frame} of the listing of countries
#' @export
#'
#' @examples
#' head(dhs_countries())
dhs_countries = function(){
  fieldurl = paste0(
    dhs::rest_dhs_url,
    "countries")
  res = get_dhs_data(url = fieldurl)
  res = rbind_dhs_data(res$data)
  return(res)
}
