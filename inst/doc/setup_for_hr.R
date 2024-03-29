## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE, echo=FALSE--------------------------------------------
#  library(IPEDSuploadables)

## ----specstable, echo=FALSE, warning=FALSE, message=FALSE---------------------
#figure out why striped isn't working when format = 'html'
load("../data/specs_HR.rda")
library(magrittr)
specs_HR$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_HR$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
knitr::kable(specs_HR, 
            format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


