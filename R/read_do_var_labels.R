#' Read DO file Variable Label Definitions
#'
#' @param file .do file of label variable definitions from stata
#'
#' @return A \code{data.frame} of variable labels
#' @export
# file = "~/Downloads/ML_2015_MIS_07102017_1141_105112/mlhr70dt/MLHR70FL.DO"
read_do_var_labels = function(file) {
  labs = readLines(file)
  labs = trimws(labs)
  labs = labs[ labs != "" ]
  # replace multi spaces with one space
  labs = stringr::str_replace_all(labs, "\\s+", " ")
  # replace quotes with nothing
  labs = stringr::str_replace_all(labs, '"', "")
  lab_var_rows = stringr::str_detect(labs, "^label variable")
  lab_vars = labs[lab_var_rows ]
  lab_vars = stringr::str_replace(lab_vars, "^label variable ", "")
  lab_vars = trimws(lab_vars)
  lab_vars = strsplit(lab_vars, " ")
  lab_vars = sapply(lab_vars, function(x) {
    if (length(x) == 1) {
      x = c(x, NA)
      return(x)
    }
    c(x[1], paste(x[2:length(x)], collapse = " "))
  })
  lab_vars = t(lab_vars)
  lab_vars = as.data.frame(lab_vars, stringsAsFactors = FALSE)
  colnames(lab_vars) = c("variable", "label")
  return(lab_vars)
}