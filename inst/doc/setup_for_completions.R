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
#  specs_COM <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/132EKp46TpEHPlVrG9FZxINxmVVz8UO0Ov989sP4lNaM/edit", sheet = 1)
#  usethis::use_data(specs_COM, overwrite = TRUE)

## ----specstable_df, echo=FALSE, warning=FALSE, message=FALSE------------------
#figure out why striped isn't working when format = 'html'
load("../data/specs_COM.rda")
library(magrittr)
specs_COM$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_COM$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
specs_COM_startingdf <- specs_COM[specs_COM$DATA_FRAME == 'startingdf', 2:4]
knitr::kable(specs_COM_startingdf,
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


## ----specstable_com, echo=FALSE, warning=FALSE, message=FALSE-----------------
#figure out why striped isn't working when format = 'html'
specs_COM_extracips <- specs_COM[specs_COM$DATA_FRAME == 'extracips', 2:4]
knitr::kable(specs_COM_extracips,
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


