#' @title Return DHS Survey Characteristics
#' @description Returns the set of Survey Characteristics from
#' DHS from their website
#'
#' @return A \code{data.frame} of the listing of Survey
#' Characteristics
#' @export
#'
#' @examples
#' head(dhs_survey_characteristics())
dhs_survey_characteristics = function(){
  fieldurl = paste0(
    dhs::rest_dhs_url,
    "surveycharacteristics")
  res = get_dhs_data(url = fieldurl)
  res = rbind_dhs_data(res$data)
  return(res)
}
