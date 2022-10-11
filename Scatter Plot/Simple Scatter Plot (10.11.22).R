# Simple Scatter Plot
## Author : Yuna Loesch
## 10.11.22

library(tidyverse)
library(mmbtools)
library(skimr)
library(scales)
mmb_load_fonts()

# sample dataset : "iris"
## take a peek at the dataset
glimpse(iris)
skim(iris)
summary(iris)


# scatter plot chart
iris %>% 
  ggplot(aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)) + 
  geom_point() +
  theme_mmb_basic() + #apply mmb theme
  scale_color_mncol(palette = "main") + #apply MN theme color
  scale_x_continuous(breaks = seq(0, 7, by = 0.5)) + # manually assign grid by 0.5
  labs(
    title = "Petal length/width of Iris",
    subtitle = ("Species : Setosa/Versicolor/Virginica"),
    x = "Length of Petal",
    y = "Width of Petal"
    ) +
  theme(plot.title = element_text(hjust = 0.5), #center title
        plot.subtitle = element_text(hjust = 1), #subtitle on the right
       
  )

  
