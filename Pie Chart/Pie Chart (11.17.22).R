# Pie Chart
## Author : Yuna Loesch
## 11.17.22

library(tidyverse)
library(mmbtools)
library(skimr)
library(scales)
mmb_load_fonts()


# MN Population Estimate by Race in MN 2019
## Total : 5,639,632
## White : 4,723,931
## Black of African American :395,556
## American Indian and Alaska Native : 77,479
## Asian : 292,507
## Nativie Hawaiian and Other Pacific Islander : 4,214
## Two or More Races : 145,945

# create a dataset
MN_Population <-
  tribble(
    ~Race, ~Count,
    "White", 4723931,
    "Black", 395556,
    "Native American", 77479,
    "Asian", 22507,
    "Pacific Islander", 4214,
    "Two or More", 145945
)

# add percentage to each race
MN_Population <- MN_Population %>% 
  mutate(Race = # specify the level to set the "order"
           factor(Race, 
                  levels = c("White", "Black", "Two or More",
                             "Native American", "Asian", "Pacific Islander"))) %>% 
  mutate(Percent = Count/sum(MN_Population$Count)*100) # calculate percent

## take a peek at the dataset
glimpse(MN_Population)
skim(MN_Population)
summary(MN_Population)

# Plot a pie chart
MN_Population %>% 
  ggplot(aes(x = "", y = Percent, fill = Race)) + #x="" is required
  geom_bar(stat = "identity", width = 1, color = "white") + 
            # plots the "area", include color argument if would like separator lines
  coord_polar(theta = "y") + #plots the angle
  theme_mmb_basic() +
  scale_fill_mncol(palette = "main") + #add MN color palette
  labs(
    title = "Minnesota Population in 2019",
  ) +
  theme(plot.title = element_text(hjust = 0.5), #center title
        legend.title = element_blank(), #remove legend title
        axis.text.x = element_blank(),  #remove x text
        axis.text.y = element_blank(), #remove y text
        axis.title.x = element_blank(), #remove axis x title
        axis.title.y = element_blank(), #remove axis y title
  ) +
  geom_text(aes(label = paste0(round(Percent, 1), "%")),
            position = position_stack(vjust = 0.5),
            color = "white",
            size = 3)

  
