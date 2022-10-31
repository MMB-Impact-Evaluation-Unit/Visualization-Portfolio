# Simple histogram
## Author : Yuna Loesch
## 10.31.22

library(tidyverse)
library(mmbtools)
library(skimr)
library(ggh4x) #required for "minor" ticks on the plot
mmb_load_fonts()

# sample dataset : "starwars"
## take a peek at the dataset
glimpse(starwars)
skim(starwars)
summary(starwars)

# for all group
starwars %>% 
  ggplot(aes(x = height)) +
  geom_histogram(fill = "#003865", #MN Blue for "bar" color
                 color = "white", #"bar" line color
                 alpha = 1,#transparency
                 bins = 30) + # number of bins
  theme_mmb_basic() +
  scale_y_continuous(breaks = seq(0, 15, by = 5), #major break lines
                     minor_breaks = seq(0, 15, by = 1), #minor break lines
                     limits = c(0, 15),
                     guide = "axis_minor") + # add "minor ticks
  scale_x_continuous(breaks = seq(50, 300, by = 50), #major break lines
                     minor_breaks = seq(50, 300, by = 25), #minor break lines
                     limits = c(50, 300),
                     guide = "axis_minor") + # add "minor ticks
  labs(
    title = "Distribution of Heights",
    subtitle = ("For All Starwars Characters"),
    x = "Height (cm)",
    y = "Frequency"
  ) +
  theme(plot.title = element_text(hjust = 0.5), #center title
        plot.subtitle = element_text(hjust = 0.5), #center subtitle
        panel.grid.major.y = element_line(color = "#003865", linetype = 2, size = 0.5), #major panel grid line
        panel.grid.minor.y = element_line(color = "#003865", linetype = 3, size = 0.1), #mijor panel grid line
        ggh4x.axis.ticks.length.minor = rel(1) #optional; add this to get the same length
  )
