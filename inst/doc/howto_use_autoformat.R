## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
#load packages
library(dplyr)
library(magrittr)
library(IPEDSuploadables)

## ----create_dummy_data, message=FALSE-----------------------------------------
#create data
adm_dat <- data.frame(StudentId = seq(1:24),
                      FtPt = c(rep('FT', 23), 'PT'),
                      Sex = rep(c("M", "F"), 12),
                      Admit = c(rep(1, 16), rep(0, 8)),
                      Enroll = c(rep(1, 12), rep(0, 12)),
                      SAT = c(rep(1, 8), rep(0, 16)),
                      SAT_V = c(500, 560, 600, 660, 700, 760, 800, 800, rep(NA, 16)),
                      SAT_M = c(400, 460, 500, 560, 600, 660, 700, 700, rep(NA, 16)),
                      ACT = c(rep(0, 8), rep(1, 16)),
                      ACT_CMP = c(rep(NA, 8), 32, 32, 31, 31, 30, 30, 29, 29, 28, 28, 27, 27, 26, 26, 25, 25)
                      )

## ----printdat, echo=FALSE-----------------------------------------------------
knitr::kable(adm_dat, 
            format = 'html')

## ----produceA-----------------------------------------------------------------
#### PART A: General Admissions Criteria
partA <- data.frame(UNITID = 999999,
                    SURVSECT = 'ADM',
                    PART = 'A',
                    ADMCON1 = 2, #GPA
                    ADMCON2 = 1, #Rank
                    ADMCON3 = 1, #Record
                    ADMCON4 = 2, #HS grad
                    ADMCON5 = 1, #Recs
                    ADMCON6 = 3, #Portfolio
                    ADMCON7 = 5, #SAT/ACT  #1 or 5 = have to do part C
                    ADMCON8 = 2, #TOEFL
                    ADMCON9 = 3) #other test

## ----printA, echo=FALSE-------------------------------------------------------
knitr::kable(partA, 
            format = 'html')

## ----produceB-----------------------------------------------------------------
##### PART B: Admission Counts; FirstTime UG only
partB <- data.frame(UNITID = 999999,
                    SURVSECT = 'ADM',
                    PART = 'B',
                    APPLCNM = nrow(adm_dat[adm_dat$Sex == 'M', ]),
                    APPLCNW = nrow(adm_dat[adm_dat$Sex == 'F', ]),
                    APPLCNT = nrow(adm_dat),
                    ADMSSNM = nrow(adm_dat[adm_dat$Sex == 'M' & adm_dat$Admit == 1,]),
                    ADMSSNW = nrow(adm_dat[adm_dat$Sex == 'F' & adm_dat$Admit == 1,]),
                    ADMSSNT = nrow(adm_dat[adm_dat$Admit == 1,]),
                    ENRLFTM = nrow(adm_dat[adm_dat$Sex == 'M' & adm_dat$Enroll == 1 & adm_dat$FtPt == 'FT', ]),
                    ENRLFTW = nrow(adm_dat[adm_dat$Sex == 'F' & adm_dat$Enroll == 1 & adm_dat$FtPt == 'FT', ]),
                    ENRLFTT = nrow(adm_dat[adm_dat$Enroll == 1 & adm_dat$FtPt == 'FT', ]),
                    ENRLPTM = nrow(adm_dat[adm_dat$Sex == 'M' & adm_dat$Enroll == 1 & adm_dat$FtPt == 'PT', ]),
                    ENRLPTW = nrow(adm_dat[adm_dat$Sex == 'F' & adm_dat$Enroll == 1 & adm_dat$FtPt == 'PT', ]),
                    ENRLPTT = nrow(adm_dat[adm_dat$Enroll == 1 & adm_dat$FtPt == 'PT', ])
                    )

## ----printB, echo=FALSE-------------------------------------------------------
knitr::kable(partB, 
            format = 'html')

## ----produceC-----------------------------------------------------------------
#### PART C: Test Scores

adm_enr <- adm_dat %>%
  filter(Enroll == 1)

#in this example we are not supplying ACT test percentiles by subject
partC <- data.frame(UNITID = 999999,
                    SURVSECT = 'ADM',
                    PART = 'C',
                    SATINUM = nrow(adm_enr[adm_enr$SAT == 1, ]),
                    SATIPCT = round(nrow(adm_enr[adm_enr$SAT == 1, ])*100/nrow(adm_enr), 0),
                    ACTNUM = nrow(adm_enr[adm_enr$ACT == 1,]),
                    ACTPCT = round(nrow(adm_enr[adm_enr$ACT == 1,])*100/nrow(adm_enr), 0),
                    SATVR25 = quantile(adm_enr$SAT_V[!is.na(adm_enr$SAT_V)], .25),
                    SATVR75 = quantile(adm_enr$SAT_V[!is.na(adm_enr$SAT_V)], .75),
                    SATMT25 = quantile(adm_enr$SAT_M[!is.na(adm_enr$SAT_M)], .25),
                    SATMT75 = quantile(adm_enr$SAT_M[!is.na(adm_enr$SAT_M)], .75),
                    ACTCM25 = quantile(adm_enr$ACT_CMP[!is.na(adm_enr$ACT_CMP)], .25),
                    ACTCM75 = quantile(adm_enr$ACT_CMP[!is.na(adm_enr$ACT_CMP)], .75),
                    ACTEN25 = -2,
                    ACTEN75 = -2,
                    ACTMT25 = -2,
                    ACTMT75 = -2)

## ----printC, echo=FALSE-------------------------------------------------------
knitr::kable(partC, 
            format = 'html', 
            row.names = FALSE)

## ----producefinal, echo=TRUE, eval=FALSE, message=FALSE-----------------------
#  produce_other_report(partA, partB, partC, survey = "Admissions")

## ----showfinal, echo=FALSE, eval=TRUE, message=FALSE--------------------------
rbind(IPEDSuploadables:::apply_upload_format(partA),
      IPEDSuploadables:::apply_upload_format(partB),
      IPEDSuploadables:::apply_upload_format(partC)) %>%
  knitr::kable(format = 'html',
               row.names = FALSE,
               col.names = '')

