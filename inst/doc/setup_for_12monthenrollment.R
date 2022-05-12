## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE, echo=FALSE--------------------------------------------
#  library(IPEDSuploadables)

## ----create_data_file_in_package, eval=FALSE, echo=FALSE----------------------
#  #export spreadsheet with specs from google drive
#  #read in with readr
#  #then run: use_data(specs_E1D, specs_E1D, overwrite = TRUE) to save as .rda and replace the old file

## ----specstable_df, echo=FALSE, warning=FALSE, message=FALSE------------------
#figure out why striped isn't working when format = 'html'
load("../data/specs_E1D.rda")
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
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
  kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


