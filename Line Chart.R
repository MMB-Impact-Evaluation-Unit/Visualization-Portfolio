# Author: Katie Kotasek
# Date: 10/3/2022
# Description: This file contains the code to generate two line charts using the diamonds dataset.

## LOAD LIBRARIES ##
library(tidyverse)
library(lubridate)
library(mmbtools)
library(datasets)

mmb_load_fonts()

## BASIC LINE PLOT
p1 <- diamonds %>%
    filter(cut == "Good") %>%
    filter(color == "D") %>%
    ggplot(aes(x = carat, y = price)) +
    geom_line() +
    labs(title = "Comparing Carat Size and Price"
         , x = "Carats"
         , y = "Price") +
    theme_mmb_basic(axis.text.x = element_text(size = 14)
                    , axis.text.y = element_text(size = 14)
                    , axis.title.x = element_text(size = 16)
                    , axis.title.y = element_text(size = 16)
                    , legend.text = element_text(size = 14)
                    , legend.title = element_text(size = 14)
                    , panel.grid.major.x = element_line())
# Save as PNG
ggsave("Line Chart 1.png", p1, dpi = 800, width = 375, height = 250, units = "mm")

## BASIC LINE PLOT WITH MMB COLORS
p2 <- diamonds %>%
    filter(cut == "Good") %>%
    filter(color == "D") %>%
    ggplot(aes(x = carat, y = price, color = clarity)) +
    geom_line(size = 1) +
    scale_color_manual("Legend", values = c("#003685", "#78BE21", "#008EAA",
                                            "#8D3F2B", "#5D295F", "#FFC845",
                                            "#97999B", "#A6192E")) +
    labs(title = "Comparing Carat Size and Price by Clarity"
         , x = "Carats", y = "Price") +
    theme_mmb_basic(axis.text.x = element_text(size = 14)
                    , axis.text.y = element_text(size = 14)
                    , axis.title.x = element_text(size = 16)
                    , axis.title.y = element_text(size = 16)
                    , legend.text = element_text(size = 16)
                    , legend.title = element_text(size = 16)
                    , legend.position = "bottom"
                    , panel.grid.major.x = element_line())
# Save as PNG
ggsave("Line Chart 2.png", p2, dpi = 800, width = 375, height = 250, units = "mm")