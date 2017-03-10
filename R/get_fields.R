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
  field_res = httr::GET(url = fieldurl)
  httr::stop_for_status(field_res)

  fields = httr::content(field_res)
  fields = rvest::html_table(fields, fill = TRUE)
  fields = fields[[1]]
  fields = fields[, c(2:3)]
  colnames(fields) = c("name", "desc")
  fields = fields[ !grepl("^Response.*records\\)", fields$name), ]
  fields$name = trimws(fields$name)
  fields = fields[ !(fields$name %in% "fieldname"), ]
  fields$desc = gsub("\t", " ", fields$desc)
  fields$desc = gsub("\r", " ", fields$desc)
  fields$desc = gsub("\\s+", " ", fields$desc)
  return(fields)
}
