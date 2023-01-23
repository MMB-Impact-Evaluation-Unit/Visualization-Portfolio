# Correlation Plot
## Author : Yuna Loesch
## Origina work credit to : Ben Nguyen

## 12.27.22

library(skimr)
library(tidyverse)
library(plotly) #interactive ggplots
library(mmbtools)
library(ggcorrplot) #correlation plots
library(rstatix) #for various statistical functions

#library(tarchetypes)
#library(reactable)
#library(htmltools)
#library(sparkline)
#library(crosstalk)
#library(highcharter)


#sample data : "mtcars"
## take a peek at the dataset
data(mtcars)
glimpse(mtcars)
skim(mtcars)
summary(mtcars)

#get correlation
corr <- mtcars %>%
  rstatix::cor_mat() #convert correlation matrix

#compute a matrix of correlation p-values
p.mat <- corr %>% 
  rstatix::cor_get_pval()

head(p.mat)

## or this can be obtained directly from dataset using cor_pmat()
#p.mat <- mtcars %>% 
#  rstatix::cor_pmat()


## correlation matrix visualization
# "X" on the plot indicates not significant
#method = "square" as default

##other arguments that can be used:
# tl.col = text label colour, tl.srt = string rotation for text
# tl.cex = size of text label, bg = background colour
# method = "shade" for coloured squares
# type = "full" for full matrix
# title = "title" for the plot
# hc.order = TRUE/FALSE for hierachical clustering
# lab = TRUE #add data label
# colors = c("#A6192E", "white", "#0D5257"), #lower limit (-1)/neutral(0)/uppder limit(1); can have more than three
# ggtheme = mmbtools::theme_mmb_basic, #apply mmb themes

ggcorrplot(corr)

## method = "circle"
ggcorrplot(corr,
           method = "circle",
           title = "Circle Correlation plot")

# Reordering the correlation matrix
# using hierarchical clustering
ggcorrplot(corr,
           type = "upper",
           hc.order = TRUE, 
           outline.color = "white",
           tl.srt = 45)


# Types of correlogram layout
# Get the lower triangle
ggcorrplot(corr,
           hc.order = TRUE,
           type = "lower", #lower triangle
           outline.color = "white")


# Types of correlogram layout
# Get the lower triangle
ggcorrplot(corr,
           hc.order = TRUE,
           type = "upper", #upper triangle
           outline.color = "white")


# Add color scheme/data label
plot <- ggcorrplot(corr,
           hc.order = TRUE,
           ggtheme = mmbtools::theme_mmb_basic, #apply mmb themes
           #type = "lower", #lower triangle
           outline.color = "white", #outline color
           colors = c("#A6192E", "white", "#0D5257"), #lower limit (-1)/neutral(0)/uppder limit(1)
           lab = TRUE #add data label
           )

plot

## apply ggplotly function to make it interactive
plotly::ggplotly(plot)
