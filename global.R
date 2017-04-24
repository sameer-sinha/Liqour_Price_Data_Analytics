library(shiny)
library(dplyr)
library(ggplot2)
library(DT)
library(shinyjs)
library(shiny)
library(shinythemes)
library(plotly)

capwords <- function(s, strict = FALSE) {
  cap <- function(s)
    paste(toupper(substring(s, 1, 1)),
          {
            s <- substring(s, 2)
            if (strict)
              tolower(s)
            else
              s
          },
          sep = "", collapse = " ")
  sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

#bc1 <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)
load("WorkSpace.RData")
