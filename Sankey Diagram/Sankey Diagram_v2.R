# Author: Katie Kotasek
# Date: 11/06/2024
# Description: This file contains the code to generate a Sankey diagram using a dummy data set.

## LOAD LIBRARIES ##
library(tidyverse)
library(lubridate)
library(mmbtools)
library(networkD3)


mmb_load_fonts()

## CREATE CUSTOM COLOR SCALE
# 1 - 97999B (gray) - Nodes
# 2 - 39568C (blue) - 1_branch
# 3 - 238A8D (teal) - 2_branch
# 4 - 54C667 (green-ish) - 3_branch
# 5 - FDE725 (yellow) - 4_branch
my_colors <- 'd3.scaleOrdinal() .domain(["1","2","3"]) .range(["#97999B","#39568C",
"#238A8D","#54C667","#FDE725","#DBA3AB","#453781"])'

# CREATE LINKS
links <- readxl::read_excel(here::here("Data","Interim","Example Sankey data v2.xlsx"),sheet=1) %>%
    as.data.frame()

# CREATE NODES
nodes <- data.frame(
    name=c(as.character(links$source)
           , as.character(links$target)) %>% unique())

# REFORMAT DATA FRAME
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

## CREATE LINKS GROUPING VARIABLE
links <- links %>%
    mutate(group = case_when(row_number()==1 ~ "2"
        ,row_number()==2 ~ "3"
        ,row_number() >=3 & row_number() <=4 ~ "2"
        ,row_number() >=5 & row_number() <=6 ~ "3"
        ,row_number() >=7 & row_number() <=8 ~ "4"
        ,row_number() >=9 & row_number() <=10 ~ "5"
        ,row_number() >=11 & row_number() <=12 ~ "4"
        ,row_number() >=13 & row_number() <=14 ~ "5"
        ))

## CREATE NODES GROUPING VARIABLE
nodes <- nodes %>%
    mutate(group="1")

## CREATE DIAGRAM
# Saving the networkD3 object to a variable so it can be manipulated in the code below
s2 <- sankeyNetwork(Links = links, Nodes = nodes,
              Source = "IDsource", Target = "IDtarget",
              Value = "value", NodeID = "name",iterations = 0,
              fontSize = 12, fontFamily = "calibri", nodeWidth = 20,
              height = 600, width = 1400,colourScale = my_colors,
              nodePadding = 25,sinksRight=FALSE,LinkGroup = "group",NodeGroup="group")

## DISPLAY DIAGRAM
# Use the htmlwidgets package to manipulate the networkD3 object
htmlwidgets::onRender(s2,
'function(el,x) {
    //set variables
    var cols_x = this.sankey.nodes().map(d => d.x).filter((v, i, a) => a.indexOf(v) === i).sort(function(a, b){return a - b});
    var labels = ["","Status 1","Status 2","Status 3"];
    //add space between node and text
    d3.select(el)
        .selectAll(".node text")
        .filter(function(d) { return !d.is_source_node; })
        .attr("x", x.options.nodeWidth)
        //https://github.com/christophergandrud/networkD3/blob/master/inst/htmlwidgets/sankeyNetwork.js#L180-L181
        .attr("x", 3 + x.options.nodeWidth)
        .attr("text-anchor", "start");
    //make all text bold
    d3.select(el)
        .selectAll(".node text")
        .filter(function(d) { return !d.is_source_node; })
        .attr("style","font-weight:bold")
        .attr("text-anchor", "start");
    //add bold column headers for the different dividers/separators
    cols_x.forEach((d, i) => {
      d3.select(el).select("svg")
        .append("text")
        .attr("x", d)
        .attr("y", 12)
        .attr("style","font-weight:bold")
        .text(labels[i]);
    })
}'
)
