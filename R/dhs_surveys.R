#' @title Return DHS Surveys
#' @description Returns the set of surveys from DHS from their website
#'
#' @return A \code{data.frame} of the listing of surveys
#' @export
#'
#' @examples
#' head(dhs_surveys())
dhs_surveys = function(){
  fieldurl = paste0(
    dhs::rest_dhs_url,
    "surveys")
  res = get_dhs_data(url = fieldurl)
  res = rbind_dhs_data(res$data)
  return(res)
}
