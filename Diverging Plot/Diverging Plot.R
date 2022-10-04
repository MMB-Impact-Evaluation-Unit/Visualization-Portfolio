# Author: Katie Kotasek
# Date: 10/4/2022
# Description: This file contains the code to generate two diverging plots using a dummy data set.

## LOAD LIBRARIES ##
library(tidyverse)
library(lubridate)
library(mmbtools)
library(HH)
library(likert)

mmb_load_fonts()

## DIVERGING PLOT USING LIKERT PACKAGE
ikertExample <- read.xlsx("Plotting Likert Data/Likert Example Data.xlsx", sheet = 1)

# convert values to factors
likertExample[1:5] <- lapply(likertExample[1:5],
                             factor,
                             levels= c("Strongly disagree","Disagree",
                                       "Neutral", "Agree", 
                                       "Strongly agree"), ordered = TRUE)

plot(likert(likertExample),
     # specify the number of characters to display on each line
     wrap = 20,
     # specify color scheme to use
     col = c("#E57200", "#ED9C4D", "grey90", "#4D72AA", "#003685")) +
    # specify plot title
    ggtitle("Example Plot Using Likert Package") +
    # specify y-axis title
    ylab("Percent of responses") +
    # specify theme() to customize graph more
    theme(legend.text = element_text(color = "black", size = 12),
          axis.text = element_text(color = "black", size = 12)
    )

## DIVERGING PLOT USING HH PACKAGE
hhExample <- read.xlsx("HH Example Data.xlsx", sheet = 1)

likert(Question ~ ., 
       # specify the data to work with
       hhExample,
       # specify this to display as percentages instead of counts
       as.percent = TRUE,
       # specify this to display the same values on the left and right
       xlimEqualLeftRight = TRUE,
       # specify this to manually set the x-axis value range
       xlim = c(-15,15),
       # specify this to remove right-hand axis
       rightAxis = FALSE,
       # specify this to display the actual values in the question column
       ylab = NULL,
       # specify x-axis title
       xlab = "Count of responses",
       # specify plot title
       main="Example Plot Using HH Package",
       # specify color scheme to use
       col = c("#E57200", "#ED9C4D", "grey90", "#4D72AA", "#003685")
)