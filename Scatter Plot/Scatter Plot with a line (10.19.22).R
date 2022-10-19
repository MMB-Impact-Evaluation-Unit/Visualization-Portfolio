# Scatter plot with a line
## Author : Yuna Loesch
## 10.19.22

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
  mutate(population = population/1000000) #convert it to "million"

# Scatter plot with a line
data %>% 
  ggplot(aes(x = year, y = population)) + 
  geom_point(size = 3, color = "#003865") + #scatter plot(data points)
  geom_line(color = "#003865", size = 1) + # add a line
  geom_text(aes(label = round(population, 2), vjust = -0.3)) + #add data label
  theme_mmb_basic() + #apply mmb theme
  scale_y_continuous(breaks = seq(200, 350, by = 50), limits = c(200, 350)) + # adjust y axis limits, grid line by 50
  labs(
    title = "Population of United States",
    subtitle = ("1995-2010 (every 5 years)"),
    x = "Year",
    y = "Population (in million)"
  ) +
  theme(plot.title = element_text(hjust = 0.5), #center title
        plot.subtitle = element_text(hjust = 1), #subtitle on the right
        
  )
