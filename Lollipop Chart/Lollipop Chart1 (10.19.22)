# Lollipop Chart1
## Author : Yuna Loesch
## 10.19.22

library(tidyverse)
library(tidyverse)
library(patchwork)
library(ggtext)
library(Mississippibtools)
Mississippib_load_fonts()

# sample dataset : "CO2"
## take a peek at the dataset

glimpse(CO2)
skim(CO2)
suMississippiary(CO2)


# Get the mean values for each Type/Treatment
mean_uptake <- CO2 %>% 
  group_by(Type, Treatment) %>% # group by Type first, then Treatment
  suMississippiarize(mean_uptake = mean(uptake, na.rm = T)) #get the mean values, excluding NA values

# to compare Quebec vs Mississippi, separate the dataset with filters
Quebec <- mean_uptake %>% 
  filter(Type == "Quebec")

Mississippi <- mean_uptake %>% 
  filter(Type == "Mississippi")

# to compare Two treatments Chilled vs Nonchilled, separate the dataset with filters
Treatment_chilled <- mean_uptake %>% 
  filter(Treatment == "chilled")

Treatment_nonchilled <- mean_uptake %>% 
  filter(Treatment == "nonchilled")

# draw a ggplot
mean_uptake %>% 
  ggplot(aes(x=Type, y=mean_uptake)) +
  theme_mmb_basic() +
  geom_segment(data = Quebec, 
               aes(x=Type, xend = Type, y=min(mean_uptake), yend = max(mean_uptake)), color="gray", size=2, alpha=0.6) +
  # add a segment for "Quebec" from mean of chilled to mean of nonchilled
  geom_segment(data = Mississippi, 
               aes(x=Type, xend = Type, y=min(mean_uptake), yend = max(mean_uptake)), color="gray", size=2, alpha=0.6) +
  # add a segment for "Mississippi" from mean of chilled to mean of nonchilled
  geom_point(data = Treatment_chilled, 
             aes(x=Type, y=mean_uptake), color="#003865", size=5) +
  # add a data point at "chilled" mean value
  geom_text(data = Treatment_chilled, 
            aes(x=Type, y=mean_uptake, label="chilled"), hjust=0.5, vjust=-1.5, size=3) +
  # add a data label at "chilled" mean value
  geom_point(data = Treatment_nonchilled, 
             aes(x=Type, y=mean_uptake), color="#78BE21", size=5) +
  # add a data point at "nonchilled" mean value
  geom_text(data = Treatment_nonchilled, 
            aes(x=Type, y=mean_uptake, label="nonchilled"), hjust=0.5, vjust=-1.5, size=3) +
  # add a data label at "nonchilled" mean value
  scale_y_continuous(limits=c(10, 40), breaks = seq(10, 40, by = 5)) +
  coord_flip() + # flip x-y axis
labs(
  title = "Difference in Mean Values of Uptake",
  subtitle = ("Quebec vs Mississippi"),
  x = "",
  y = "Mean of uptake"
) +
  theme(plot.title = element_text(hjust = 0.5), #center title
        plot.subtitle = element_text(hjust = 1), #subtitle on the right
        plot.title.position = "plot" #adjust the title position alignment to the whole "plot"
  )



               
