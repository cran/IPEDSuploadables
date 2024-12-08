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
#  #read in from google drive
#  tryCatch(specs_GR200 <-  googlesheets4::read_sheet('1d-bXGayjLWO1dta4OvaX8EWN9fVnLD9K3HefUJrT4sI'),
#          error = function(x) message("Google Sheet unavailable"),
#          warning = function(y) message("There was a warning"))
#  #save it
#  use_data(specs_GR200, overwrite = TRUE)

## ----specstable_df, echo=FALSE, warning=FALSE, message=FALSE------------------
library(magrittr)
specs_GR200$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_GR200$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")

knitr::kable(specs_GR200,
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
    kableExtra::column_spec(2, italic = TRUE, width = '8em')

