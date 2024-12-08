## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(IPEDSuploadables)

## ----specsimport, eval = FALSE, echo = FALSE----------------------------------
#  #this chunk is only used during interactive session by the package maintainers, if the requirements have been updated
#  
#  tryCatch(specs_GR <-  googlesheets4::read_sheet('1HR0W3N5AgsdwppvTr7CZ4Q2IQtfnTfXMJsSP8l-JtLQ'),
#          error = function(x) message("Google Sheet unavailable"),
#          warning = function(y) message("There was a warning"))
#  
#  usethis::use_data(specs_GR, overwrite = TRUE)

## ----create_data_file_in_package, eval=FALSE, echo=FALSE----------------------
#  #export spreadsheet with specs from google drive
#  #read in with readr
#  specs_GR <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1HR0W3N5AgsdwppvTr7CZ4Q2IQtfnTfXMJsSP8l-JtLQ/edit#gid=0", sheet = 1)
#  usethis::use_data(specs_GR, overwrite = TRUE)

## ----specstable, echo=FALSE, warning=FALSE, message=FALSE---------------------
library(magrittr)
specs_GR$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_GR$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
knitr::kable(specs_GR, 
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
    kableExtra::column_spec(2, italic = TRUE, width = '8em')

