#' @title Return DHS Indicators
#' @description Returns the set of indicators from DHS from their website
#'
#' @return A \code{data.frame} of the listing of indicators
#' @export
#'
#' @examples
#' head(dhs_indicators())
dhs_indicators = function(){
  fieldurl = paste0(
    dhs::rest_dhs_url,
    "indicators")
  res = get_dhs_data(url = fieldurl)
  res = rbind_dhs_data(res$data)
  return(res)
}
