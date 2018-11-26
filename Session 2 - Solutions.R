library(tidyverse)

##### __Exercise 1 ####

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species, shape = Species)) +
  geom_point() +
  geom_density2d() +
  ggtitle('IRIS') +
  theme_light()

##### __Exercise 2 ####

data = iris %>% mutate(Species = 'ALL') %>% bind_rows(iris)
ggplot(data, aes(Petal.Length, Petal.Width, color = Species)) +
  geom_point() +
  geom_smooth() +
  xlab('Petal Length') +
  ylab('Petal Width') +
  facet_wrap(~Species, scales = 'free') +
  theme_bw()

##### __Exercise 3 #####

data = mtcars %>% rownames_to_column() %>% 
  mutate(rowname = forcats::fct_reorder(rowname, mpg))
ggplot(data, aes(mpg, rowname, label = rowname)) +
  geom_point() +
  geom_text(nudge_x = .3, hjust = 'left') +
  ylab('Miles per gallon fuel consumption') +
  xlim(10, 40) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0, size = 16),
        axis.title.x = element_text(face = 'bold'),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.line.y = element_blank())

##### __Exercise 4 ####

ggplot(mtcars, aes(mpg, qsec, size = disp, color = as.factor(am))) +
  geom_point() +
  scale_colour_discrete(name  ="Gear",
                        breaks=c(0, 1),
                        labels=c("Manual", "Automatic")) +
  scale_size_continuous(name = 'Displacement') +
  xlab('Miles per gallon') +
  ylab('1/4 mile time') +
  theme_light()

#### __Exercise 6 ####
## if ggthemes cannot be found, use:
## install.packages("ggthemes") 

ggplot(economics, aes(date, uempmed)) +
  geom_line() +
  expand_limits(y  = 0) +
  ggtitle('Median duration of unemployment [weeks]') +
  ylab('Median duration of unemployment [weeks]') +
  ggthemes::theme_economist_white() +
  theme(axis.title.x = element_blank())