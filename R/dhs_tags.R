#' @title Return DHS Tags
#' @description Returns the set of tags from DHS from their website
#'
#' @return A \code{data.frame} of the listing of tags
#' @export
#'
#' @examples
#' head(dhs_tags())
dhs_tags = function(){
  fieldurl = paste0(
    dhs::rest_dhs_url,
    "tags")
  res = get_dhs_data(url = fieldurl)
  res = rbind_dhs_data(res$data)
  return(res)
}
