## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE, echo=FALSE--------------------------------------------
#  library(IPEDSuploadables)

## ----create_data_file_in_package, eval=FALSE, echo=FALSE----------------------
#  #this chunk is only used during interactive session by the package maintainers, if the requirements have been updated
#  
#  tryCatch(specs_EF1 <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1XVcGKtrAwsgKRYvqrbzO13-w8_u3IB2oYft-F5Psxx4/edit", sheet = 1),
#           error = function(x) message("Google Sheet unavailable"),
#           warning = function(y) message("There was a warning"))
#  usethis::use_data(specs_EF1, overwrite = TRUE)

## ----specstable_df, echo=FALSE, warning=FALSE, message=FALSE------------------
#figure out why striped isn't working when format = 'html'
load("../data/specs_EF1.rda")
library(magrittr)
specs_EF1$ACCEPTABLE_VALUES <- stringr::str_replace_all(specs_EF1$ACCEPTABLE_VALUES, pattern = "\\n", replacement = "<br>")
specs_EF1_students <- specs_EF1[specs_EF1$DATA_FRAME == 'students', 2:4]
knitr::kable(specs_EF1_students,
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition')) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(2, italic = TRUE, width = '8em')


## ----specstable_com, echo=FALSE, warning=FALSE, message=FALSE-----------------
#figure out why striped isn't working when format = 'html'
specs_EF1_retention <- specs_EF1[specs_EF1$DATA_FRAME == 'retention', 2:4]
knitr::kable(specs_EF1_retention,
             format = 'html',
             escape = FALSE,
             col.names = c('Column Name', 'Column Type', 'Acceptable Value - Definition'),
             row.names = FALSE) %>%
    kableExtra::kable_styling(bootstrap_options = "striped") %>%
  kableExtra::column_spec(column = 2, italic = TRUE, width = '8em', )


