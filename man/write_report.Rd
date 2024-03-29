% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_report.R
\name{write_report}
\alias{write_report}
\title{Write the prepared data to a txt file in key-value format}
\usage{
write_report(..., survey, part, output_path)
}
\arguments{
\item{...}{dataframes (one for each survey part, in order)}

\item{survey}{a string (which [IPEDS] survey)}

\item{part}{a string (which upload part of the survey)}

\item{output_path}{a file path (where the file should be saved)}
}
\value{
a txt file (at the path location)
}
\description{
Write the prepared data to a txt file in key-value format
}
\note{
All arguments for this function are required and must be named.
  Dataframes must have the key as the column name (with appropriate
  capitalization) and the value in the cells
}
