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
#  tryCatch(specs_ADM <-  googlesheets4::read_sheet('1j8D2bHKhteW3Cyant0nKw8mvTWXgHSow6cX6uOXS44M'),
#          error = function(x) message("Google Sheet unavailable"),
#          warning = function(y) message("There was a warning"))
#  
#  usethis::use_data(specs_ADM, overwrite = TRUE)

## ----specstable, echo=FALSE, warning=FALSE, message=FALSE---------------------
library(magrittr)
specs_ADM$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_ADM$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
knitr::kable(specs_ADM, 
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
    kableExtra::column_spec(2, italic = TRUE, width = '8em')

