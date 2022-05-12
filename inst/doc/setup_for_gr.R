## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE, echo=FALSE--------------------------------------------
#  library(IPEDSuploadables)

## ----spectsimport, eval = FALSE, echo = FALSE---------------------------------
#  specs_GR <-  googlesheets4::read_sheet('1HR0W3N5AgsdwppvTr7CZ4Q2IQtfnTfXMJsSP8l-JtLQ')
#  usethis::use_data(specs_GR, overwrite = TRUE)

## ----specstable, echo=FALSE, warning=FALSE, message=FALSE---------------------
#figure out why striped isn't working when format = 'html'
load("../data/specs_GR.rda")
library(magrittr)
specs_GR$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_GR$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
knitr::kable(specs_GR, 
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
    kableExtra::column_spec(2, italic = TRUE, width = '8em')

