## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(IPEDSuploadables)

## ----dataprep, echo=FALSE, eval=FALSE, message=FALSE--------------------------
#  #this chunk is only used during interactive session by the package maintainers, if the requirements have been updated
#  
#  tryCatch(specs_OM <- googlesheets4::read_sheet('1e1o9Omor7jWwxKRncgzvFbz67sUxKqSkPtSW_B-8jr0'),
#          error = function(x) message("Google Sheet unavailable"),
#          warning = function(y) message("There was a warning"))
#  #then run
#  use_data(specs_OM, overwrite = TRUE) #to save as .rda and replace the old file
#  

## ----specstable, echo=FALSE, warning=FALSE, message=FALSE---------------------
library(magrittr)
specs_OM$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_OM$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
knitr::kable(specs_OM, 
            format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


