## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----setup, eval=FALSE--------------------------------------------------------
#  #official install from CRAN
#  install.packages("IPEDSuploadables")
#  
#  #development install from the github repo
#  #use this if you want to pull in changes before they reach cran or need to use other code branches
#  
#  #development install option 1
#  remotes::install_github("AlisonLanski/IPEDSuploadables")
#  
#  #development install option 2
#  devtools::install_github("AlisonLanski/IPEDSuploadables")

## ----load, eval = TRUE--------------------------------------------------------
#load the packages
library(IPEDSuploadables)

## ----dummy_data, eval = TRUE--------------------------------------------------
#dataframe of student information for 12 month enrollment
head(e1d_students)

## ----produce_report, eval=FALSE-----------------------------------------------
#  #full export using sample data
#  produce_e1d_report(df = e1d_students, hrs = e1d_instr, part = "ALL")

## ----gender_example, eval = FALSE---------------------------------------------
#  #able to report undergraduate "another gender" but NOT able to report graduate "another gender"
#  produce_com_report(df = com_students, extracips = com_cips, ggender = FALSE)

## ----produce_subreport, eval = FALSE------------------------------------------
#  #if you only want to look at 12 month enrollment part B
#  produce_e1d_report(e1d_instr, part = "B")

## ----produce_prettyfile, eval = FALSE-----------------------------------------
#  #text files make my eyes bleed! let's use a csv
#  produce_e1d_report(hrs = e1d_instr, part = "B", format = "readable")

## ----branch, eval=FALSE-------------------------------------------------------
#  #install, picking an acceptable year range
#  devtools::install_github(repo = "AlisonLanski/IPEDSuploadables", ref = "reporting_year_2022-2023")

