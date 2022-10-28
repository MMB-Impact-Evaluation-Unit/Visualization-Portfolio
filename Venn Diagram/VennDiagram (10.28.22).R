# Venn Diagram
## Author : Yuna Loesch
## 10.28.22

library(tidyverse)
library(ggvenn) #required for venn diagram
library(mmbtools)
library(skimr)
mmb_load_fonts()

# 2 ring venn diagram
list1 <- list("Set1" = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
             "Set2" = c(1, 3, 5, 7, 9, 12, 15))

ggvenn(list, c("Set1", "Set2"),
       stroke_linetype = 1, #linetype1 : "solid", 2 : dashed, 3 : dotted..etc
       stroke_size = 1.2, # default is 1
       stroke_color = "#003865", # default is black
       fill_alpha = 0.7, # default is 0.5
       fill_color = c("#003865", "#78BE21"), #MN blue/green
       set_name_color =  "#003865", # default is black
       set_name_size = 8, #default is 6,
       text_color = "#003865", #default is black
       text_size = 5, #default is 4
       show_elements = FALSE, # FALSE shows # of elements
       #show_elements = TRUE # TRUE shows all individual elements
       show_percentage = TRUE #FALSE hides %
       )

# 3 ring venn diagram
list2 <- list("Set1" = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
             "Set2" = c(1, 3, 5, 7, 9, 12, 15),
             "Set3" = c(2, 3, 5, 7, 9))

ggvenn(list2, c("Set1", "Set2", "Set3"),
       stroke_linetype = 1, #linetype1 : "solid", 2 : dashed, 3 : dotted..etc
       stroke_size = 1.2, # default is 1
       stroke_color = "#003865", # default is black
       fill_alpha = 0.7, # default is 0.5
       fill_color = c("#003865", "#78BE21", "#8D3F2B"), #MN blue/green/orange
       set_name_color =  "#003865", # default is black
       set_name_size = 8, #default is 6,
       text_color = "#003865", #default is black
       text_size = 5, #default is 4
       #show_elements = FALSE, # FALSE shows # of elements
       show_elements = TRUE, # TRUE shows all individual elements
       show_percentage = TRUE #FALSE hides %
)

# 4 ring venn diagram
list3 <- list("Set1" = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
              "Set2" = c(1, 3, 5, 7, 9, 12, 15),
              "Set3" = c(2, 3, 5, 7, 9),
              "Set4" = c(1, 2, 3, 5, 8, 12, 20))

ggvenn(list3, c("Set1", "Set2", "Set3", "Set4"),
       stroke_linetype = 1, #linetype1 : "solid", 2 : dashed, 3 : dotted..etc
       stroke_size = 1.2, # default is 1
       stroke_color = "#003865", # default is black
       fill_alpha = 0.5, # default is 0.5
       fill_color = c("#003865", "#78BE21", "#8D3F2B", "#008EAA"), #MN blue/green/orange/teal
       set_name_color =  "#003865", # default is black
       set_name_size = 8, #default is 6,
       text_color = "#003865", #default is black
       text_size = 5, #default is 4
       show_elements = FALSE, # FALSE shows # of elements
       #show_elements = TRUE, # TRUE shows all individual elements
       show_percentage = TRUE #FALSE hides %
)
