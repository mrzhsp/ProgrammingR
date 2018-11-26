# This is my own playground using what I have learned from course and books.

# -----
### Inserting libraries
# -----
library(tidyverse)
library(tidyr)
library(tidyselect)
library(euR)
library(dplyr)
library(ggplot2)
library(GGally)
library(DBI)
library(RSQLite)
library(proto)
library(sqldf)
library(gsubfn)
library(forcats)
library(microbenchmark)
library(rmarkdown)
library(colorspace)
library(readr)
library(knitr)
library(knitr)
library(lubridate)
library(stringr)
library(maps)
library(nycflights13)

# -----
### Chapter 1
# -----
# practicing the codes and exercises

data(mpg)
View(mpg)
dim(mpg)
summary(mpg)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
?mpg
plot(mpg)
ggplot(data = mpg)

ggplot(mpg, aes(x = hwy, y = cyl)) +
  geom_point()

ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))

ggplot(mpg, aes(x = class, y = drv)) + geom_point()

ggplot(mpg, aes(x = displ, y = hwy, color = class)) + geom_point()

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = )

?mpg
glimpse(mpg)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = cty))

ggplot(mpg, aes(x = displ, y = cty, color = year)) + 
  geom_point(shape = 24, size = 3, stroke = 3)

data(mtcars)
View(mtcars)
?mtcars

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(.~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cty, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

ggplot(mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

data(mpg)
data(mtcars)

ggplot(mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cty)

ggplot(mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv, linetype = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(color = "red")

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# se stands for standard errors in drawing a smooth line

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(aes(linetype = drv), se = F)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(fill = drv), 
             shape = 21, size = 3, stroke = 2, color = "white")

data(diamonds)
View(diamonds)
?diamonds

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price, color = cut))

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(diamonds) +
  geom_boxplot(aes(x = cut, y = depth))

ggplot(data = diamonds) +
  stat_summary(mapping = aes(x = cut, y = depth),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = median) +
  theme_light()

?stat_bin

seq(1, 10)

ggplot(data = diamonds) +
  geom_col(aes(x = color, y = carat))
ggplot(data = diamonds) +
  stat_smooth(mapping = aes(x = carat, y = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = color, fill = color))

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut, color = clarity), fill = NA, 
                         position = "identity")

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(position = "jitter")

ggplot(data = mpg) +
  geom_boxplot(aes(x = class, y = hwy)) + 
  coord_flip()

ggplot(map_data("nz"), aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()
?maps
?map_data

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity)) +
  coord_polar()

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity)) +
  coord_polar(theta = "y")

# -----
### Chapter 2
# -----
# practicing the codes and exercises

jan1 <- filter(flights, month == 1, day == 1)
nov_or_dec <- filter(flights, month == 11 | month == 12)

x <- filter(flights, arr_delay >= 120)
x <- filter(flights, dest  %in% c("IAH", "HOU"))
x <- filter(flights, arr_delay >= 120 & dep_delay <= 0)
