## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----setup, eval=FALSE--------------------------------------------------------
#  #install option 1
#  remotes::install_github("AlisonLanski/IPEDSuploadables")
#  
#  #install option 2 (relies on the remotes package)
#  devtools::install_github("AlisonLanski/IPEDSuploadables")

## ----load, eval = TRUE--------------------------------------------------------
#load the packages
library(IPEDSuploadables)

## ----dummy_data, eval = TRUE--------------------------------------------------
#dataframe of student information for 12 month enrollment
head(e1d_student)

## ----produce_report, eval=FALSE-----------------------------------------------
#  #full export using sample data
#  produce_e1d_report(df = e1d_student, hrs = e1d_instr, part = "ALL")

## ----produce_subreport, eval = FALSE------------------------------------------
#  #if you only want to look at 12 month enrollment part B
#  produce_e1d_report(e1d_instr, part = "B")

## ----produce_prettyfile, eval = FALSE-----------------------------------------
#  #text files make my eyes bleed! let's use a csv
#  produce_e1d_report(hrs = e1d_instr, part = "B", format = "readable")

## ----branch, eval=FALSE-------------------------------------------------------
#  #install, picking an acceptable year range
#  remotes::install_github(repo = "AlisonLanski/IPEDSuploadables", ref = "reporting_year_2020-2021")

