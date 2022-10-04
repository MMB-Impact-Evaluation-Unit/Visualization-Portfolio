# Author: Katie Kotasek
# Date: 10/4/2022
# Description: This file contains the code to generate a Sankey diagram using a dummy data set.

## LOAD LIBRARIES ##
library(tidyverse)
library(lubridate)
library(mmbtools)
library(networkD3)

mmb_load_fonts()

# CREATE LINKS
links <- openxlsx::read.xlsx("Sankey diagram.xlsx") %>%
    as.data.frame()

# CREATE NODES
nodes <- data.frame(
    name=c(as.character(links$source)
           , as.character(links$target)) %>% unique())

# REFORMAT DATA FRAME
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

# CREATE CUSTOM COLOR SCALE
my_colors <- 'd3.scaleOrdinal() .domain(["All Obs"]) .range(["#78BE21", "#003685",
"#008EAA", "#5D295F", "#FFC845", "#A6192E", "#0D5257", "#A4BCC2", "#F5E1A4"])'

## CREATE DIAGRAM
sankeyNetwork(Links = links
              , Nodes = nodes
              , Source = "IDsource"
              , Target = "IDtarget"
              , Value = "value"
              , NodeID = "name"
              , fontSize = 14
              , fontFamily = "Calibri"
              , height = 600
              , width = 1000
              , colourScale = my_colors
              , sinksRight=FALSE
              , LinkGroup = c("source")
)