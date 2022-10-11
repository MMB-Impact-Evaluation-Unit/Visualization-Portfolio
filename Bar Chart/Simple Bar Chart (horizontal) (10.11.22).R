# Simple Bar Chart (horizontal)
## Author : Yuna Loesch
## 10.11.22

library(tidyverse)
library(mmbtools)
library(skimr)
mmb_load_fonts()

# sample dataset : "population"
## take a peek at the dataset
glimpse(population)
skim(population)
summary(population)

# filter data: county (USA) ,  year(1995, 2000, 2005, 2010)
data <- population %>% 
  filter(country == "United States of America") %>% 
  filter(year %in% c(1995, 2000, 2005, 2010)) %>% 
  mutate(year = as.factor(year)) %>% #treat year as category
  mutate(population = population/1000000) %>% #convert it to "million"
  mutate(year = factor(year, levels = c(2010, 2005, 2000, 1995))) 
# this defines the order of factors showing in ggplot

  
# simple bar chart
data %>% 
  ggplot(aes(x = year, y = population)) + 
  geom_bar(aes(fill = year), stat = "identity") +
  coord_flip() + ## this code flips x/y coordination
  geom_text(aes(label = round(population, 2), hjust = -0.1)) + #add data label
  theme_mmb_basic() + #apply mmb theme
  scale_fill_mncol(palette = "main") + #apply MN theme color
  scale_y_continuous(breaks = seq(0, 350, by = 50), limits = c(0, 350)) + # adjust y axis limits, grid line by 50
  labs(
    title = "Population of United States",
    subtitle = ("1995-2010 (every 5 years)"),
    x = "Year",
    y = "Population (in million)"
    ) +
  theme(plot.title = element_text(hjust = 0.5), #center title
        plot.subtitle = element_text(hjust = 1), #subtitle on the right
        legend.title = element_blank(), #remove legend title
  )

  
