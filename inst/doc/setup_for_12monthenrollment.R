## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(IPEDSuploadables)

## ----create_data_file_in_package, eval=FALSE, echo=FALSE----------------------
#  #this chunk is only used during interactive session by the package maintainers, if the requirements have been updated
#  
#  tryCatch(specs_E1D <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1bhjgAjmipg_pqwUum2Wcn6sOKInoTUne_PeFDKf3ncs/edit", sheet = 1),
#          error = function(x) message("Google Sheet unavailable"),
#          warning = function(y) message("There was a warning"))
#  
#  usethis::use_data(specs_E1D, overwrite = TRUE)

## ----specstable_df, echo=FALSE, warning=FALSE, message=FALSE------------------
library(magrittr)
specs_E1D$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_E1D$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
specs_E1D_startingdf <- specs_E1D[specs_E1D$DATA_FRAME == 'startingdf', 2:4]
knitr::kable(specs_E1D_startingdf,
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
  kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


## ----specstable_e1d, echo=FALSE, warning=FALSE, message=FALSE-----------------
#figure out why striped isn't working when format = 'html'
specs_E1D_hrs <- specs_E1D[specs_E1D$DATA_FRAME == 'hrs', 2:4]
knitr::kable(specs_E1D_hrs,
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition'),
             row.names = FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


