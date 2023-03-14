# Lollipop Chart
## author : Yuna Loesch
## 03.14.23

library(tidyverse)
library(ggtext)
library(mmbtools)
mmb_load_fonts()

data <- tribble(
  ~Step, ~Minimum, ~Maximum, ~Average,
  "Step2\n(% cases assessed)", 13, 75, 49,
  "Step3\n(% cases that did NOT\nrequire contact)", 13, 63, 29,
  "Step4\n(% NCP interviews\ncompleted)", 22, 100, 48
) %>% 
  mutate(Step = factor(Step, levels = c("Step4\n(% NCP interviews\ncompleted)", "Step3\n(% cases that did NOT\nrequire contact)", "Step2\n(% cases assessed)")))

legend <- tribble( ##create a dummy data for data lable legend
  ~stat, ~points, ~Step,
  "Minimum/Maximum     ", -10, "Step2\n(% cases assessed)",
  "Average", -10, "Step2\n(% cases assessed)"
) %>% 
  mutate(stat = factor(stat, levels = c("Minimum/Maximum     ", "Average")))

plot <- data %>% 
  ggplot(aes(y = Step, x = Average)) +
  mmbtools::theme_mmb_basic() +
  geom_segment(data = data,
               aes(y = Step, yend = Step, x = Minimum, xend = Maximum), color = "gray", size = 2, alpha = 0.6) +
  geom_point(data = data,
             aes(y = Step, x = Minimum), color = "#003865", size = 5, shape = 15) +
  geom_point(data = data,
             aes(y = Step, x = Maximum), color = "#003865", size = 5, shape = 15) +
  geom_point(data = data,
             aes(y = Step, x = Average), color = "#008EAA", size = 5, shape = 15) +
  geom_text(data = data, 
            aes(y=Step, x=Minimum, label=Minimum), hjust=0.5, vjust=2, size=4) +
  geom_text(data = data, 
            aes(y=Step, x=Maximum, label=Maximum), hjust=0.5, vjust=2, size=4) +
  geom_text(data = data, 
          aes(y=Step, x=Average, label=Average), hjust=0.5, vjust=-1.2, size=4) +
  scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, 20)) +
  geom_point(data = legend, aes(x = points, y = Step, color = stat), 
             shape = 15, size = 7) + #legend
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_text(size = 14, face = "bold"),
        legend.position = "bottom",
        legend.box = "horizontal",
        legend.title = element_blank(),
        legend.background = element_rect(size = 0.5)) +
  scale_color_manual(values = c("#003865", "#008EAA"))

plot
ggsave(
  width = 10,
  height = 10*9/16,
  here(
    "Code",
    "Lollipop Chart (3.14.23).png"))




  
  
