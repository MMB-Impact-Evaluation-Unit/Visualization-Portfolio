# Author: Katie Kotasek
# Date: 10/3/2022
# Description: This file contains the code to generate two boxplot charts using the diamonds data set.

## LOAD LIBRARIES ##
library(tidyverse)
library(lubridate)
library(mmbtools)
library(datasets)

mmb_load_fonts()

## BASIC BOXPLOT
p1 <- diamonds %>%
    ggplot(aes(x = price, fill = color)) +
    geom_boxplot() +
    guides(fill = guide_legend(title = "Legend")) +
    labs(title = "Distribution of Price and Color", x = "Price", y = "Density") +
    theme_mmb_basic(plot.title = element_text(size = 14),
                    plot.title.position = "plot",
                    legend.position = "bottom",
                    legend.title = element_text(size = 14),
                    legend.text = element_text(size = 14),
                    axis.ticks.x = element_line(),
                    axis.text.x = element_text(size = 14),
                    axis.text.y = element_text(size = 14),
                    axis.title.y = element_text(size = 14),
                    axis.title.x = element_text(size = 14),
                    panel.grid.major.x = element_line())

# Save as PNG
ggsave("Boxplot Chart 1.png", p1, dpi = 800, width = 350, height = 275, units = "mm")

## BOXPLOT WITH JITTER
p2 <- diamonds %>%
    ggplot(aes(x = cut, y = carat, fill = cut)) +
    geom_boxplot() +
    geom_jitter(color="black", size=0.4, alpha=0.3) +
    guides(fill = guide_legend(title = "Legend")) +
    labs(title = "Distribution of Cut and Carat", x = "Price", y = "Density") +
    theme_mmb_basic(plot.title = element_text(size = 14),
                    plot.title.position = "plot",
                    legend.position = "bottom",
                    legend.title = element_text(size = 14),
                    legend.text = element_text(size = 14),
                    axis.ticks.x = element_line(),
                    axis.text.x = element_text(size = 14),
                    axis.text.y = element_text(size = 14),
                    axis.title.y = element_text(size = 14),
                    axis.title.x = element_text(size = 14),
                    panel.grid.major.x = element_line())

# Save as PNG
ggsave("Boxplot Chart 2.png", p2, dpi = 800, width = 350, height = 275, units = "mm")