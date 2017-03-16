#' @title Get DHS Fields
#' @description Returns a \code{data.frame} of the fields from
#' \url{http://api.dhsprogram.com/rest/dhs/data/fields}
#'
#' @return  \code{data.frame} of the field names and the description of
#' the field
#' @export
#'
#' @examples
#' get_fields()
get_fields = function() {

  fieldurl = paste0(dhs::rest_dhs_url, "data", "/", "fields")
  query = list(f = "json")
  fields = get_dhs_data(url = fieldurl, query = query)
  fields = rbind_dhs_data(fields$data)


  fields$fieldDescription = gsub("\t", " ", fields$fieldDescription)
  fields$fieldDescription = gsub("\r", " ", fields$fieldDescription)
  fields$fieldDescription = gsub("\\s+", " ", fields$fieldDescription)
  return(fields)
}
