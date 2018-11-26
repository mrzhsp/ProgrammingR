
# World Map plot --------------------------------------------------------------------------------------------------
# You probable have to run this first:
# install.packages(c("gapminder","rworldmap","data.table"))
library(gapminder)
library(rworldmap)
library(data.table) 

map.world <- map_data(map = 'world')
gpml07 <- gapminder[gapminder$year == 2007, c("country", "lifeExp")]
names(gpml07)[1] <- "region"
dpe9 <- merge(map.world, gpml07, all.x = TRUE)
dpe9 <- dpe9[order(dpe9$order), ]
# Drop Antarctica
map.world <- dpe9[dpe9$region != "Antarctica", ]

# For a perfect outcomes some data cleaning is needed
# For example some countries' names don't match exactly between dataset

ggplot() +
  geom_map(data = dpe9, map = dpe9,
           aes(map_id = region, x = long, y = lat, fill = lifeExp)) +
  coord_quickmap() +
  theme_bw() +
  theme(axis.ticks = element_blank(), 
        axis.title.x = element_blank(),
        axis.title.y = element_blank(), 
        axis.text.x = element_blank(),
        axis.text.y = element_blank())


# Create animated GIF ---------------------------------------------------------------------------------------------
# You need the animation package
# install.packages("animation")
# This package uses an external tool to create the GIF itself, which is ImageMagick
# You need to separately install this first on your machine for the package to work properly
# It supports some other external tools as well (check the documentation)

# This code works as follows: we create one ggplot for each year in your data set
# We will cover loops (the 'for' command below) later in the course
# Each time a plot is printed, it is 'caught' by the saveGIF method which puts all of them
# inside a single animated GIF file
animation::saveGIF({
  for (y in unique(gapminder$year)) {
    g = ggplot(subset(gapminder, year == y),
               aes(x = gdpPercap,
                   y = lifeExp,
                   size = pop,
                   col = continent)) +
      geom_point(alpha = 0.5) +
      ggtitle(as.character(y)) +
      scale_x_log10()  +
      coord_cartesian(xlim = c(400, 70000), ylim = c(25, 85))
    print(g)
  }}, movie.name = "animation.gif", img.name = "gapminder" )