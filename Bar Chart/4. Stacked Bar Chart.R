# Stacked Bar Chart
## Author : Yuna Loesch
## 10.11.22

library(tidyverse)
library(mmbtools)
library(skimr)
library(scales)
mmb_load_fonts()

# sample dataset : "population"
## take a peek at the dataset
glimpse(table1)
skim(table1)
summary(table1)


# assign data
data <- table1 %>% 
  mutate(year = as.factor(year)) %>% 
  filter(country %in% c("Brazil", "Afghanistan"))

# get the total for the cases per country
data_total <- data %>% 
  group_by(country) %>% 
  summarize(Total_cases = sum(cases))

# Stacked bar chart
data %>% 
  ggplot(aes(x = country, y = cases)) + 
  geom_bar(aes(fill = year), stat = "identity", position = "stack", width = 0.5) + 
  geom_text(data = data_total, #add data label for bar total
            aes(x = country, y = Total_cases, 
                label = format(Total_cases, big.mark = ",", scientific = FALSE), 
                inherit.aes = FALSE), hjust = 0) +
  theme_mmb_basic() + #apply mmb theme
  scale_fill_mncol(palette = "main") + #apply MN theme color
  coord_flip() +
  scale_y_continuous(breaks = seq(0, 140000, by = 20000), limits = c(0, 140000), labels = comma) + # adjust y axis limits
  labs(
    title = "Total Cumulative Crime Cases in Afghanistan/Brazil",
    subtitle = ("1999-2000 Period"),
    x = "",
    y = "Number of Crimes"
    ) +
  theme(plot.title = element_text(hjust = 0.5), #center title
        plot.subtitle = element_text(hjust = 1), #subtitle on the right
        legend.title = element_blank(), #remove legend title
  )

  