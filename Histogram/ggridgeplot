library(ggridges)
library(ggplot2)
library(mmbtools)


# example from https://wilkelab.org/ggridges/reference/stat_binline.html
p <- ggplot(iris, aes(x = Sepal.Length, y = Species, group = Species, fill = Species)) +
  geom_density_ridges(stat = "binline", bins = 20, scale = 2.2) +
  scale_y_discrete(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) +
  coord_cartesian(clip = "off") +
  theme_ridges() +
  mmbtools::scale_fill_mncol() +
  mmbtools::theme_mmb_basic()
p

ggsave("ggridgeplot.png", p)
