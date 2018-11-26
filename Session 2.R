?aes

# We can use the branching in GIT
# The master branch (main) should be thought as the main line of commands
# We can use a new branch at some levels.

data(iris)
View(iris)
ggplot(iris)

# Exercise 1
ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, 
                           color = Species, shape = Species)) +
  geom_density2d(mapping = aes(x = Sepal.Length, y = Sepal.Width, 
                               color = Species)) +
  ggtitle("IRIS") +
  theme_light()

# Exercise 2
data = iris %>%mutate(Species = 'ALL')%>% bind_rows(iris)

ggplot(data = data) +
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width,
                           color = Species)) +
  geom_smooth(mapping = aes(x = Petal.Length, y = Petal.Width,
                            color = Species)) +
  facet_wrap(. ~ Species, nrow = 2, scales = "free")

# exercise 3
data = mtcars %>%rownames_to_column() %>%mutate(rowname = 
                                                  forcats::fct_reorder(rowname, 
                                                                       mpg))
ggplot(data = data) +
  geom_point(mapping = aes(x = mpg, y = rowname, label = rowname)) +
  geom_text(mapping = aes(x = mpg, y = rowname, label = rowname),
                          label = data$rowname, hjust = "left", udge_x = 0.5) +
  theme(axis.title.y = element_blank(), 
                      axis.text.y = element_blank(), 
                      axis.ticks.y = element_blank())

# Exercies 4
ggplot(data = mtcars) +
  geom_point(mapping = aes(x = mpg, y = qsec, color = as.factor(am), 
                           size = disp)) +
  scale_size_continuous(name = "Displacement") +
  scale_color_discrete(name = "Gear",
                       breaks = c(0,1),
                       labels = c("Manual", "Automatic"))

data(economics)
View(economics)
dim(economics)

ggplot(data = economics) +
  geom_line(mapping = aes(x = date, y = uempmed)) +
  labs(title = "Median Duration of Unemployment [Weeks]")
