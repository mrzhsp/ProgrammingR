airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

nycflights13::airports
nycflights13::flights

avg_dest_delays <- 
  flights %>%
  group_by(dest) %>%
  summarize(delay = mean(arr_delay, na.rm = T), count = n()) %>%
              left_join(airports, by = c("dest" = "faa"))

avg_dest_delays %>%
  ggplot(aes(lon, lat, color = delay)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

flights_location <- 
  select(airports, "faa", "lat", "lon")

flights_new <- 
  flights %>%
  left_join(flights_location, by = c("dest" = "faa")) %>%
  left_join(flights_location, by = c("origin" = "faa"),
            suffix = c("_dest", "_origin"))

nycflights13::planes
View(planes)

# 13.4.6.3
planes_age <- 
  planes %>% 
  mutate(age = 2013 - year) %>% 
  select(tailnum, age)

flights_age <- 
  flights %>%
  inner_join(planes_age, by = "tailnum") %>%
  group_by(age) %>%
  summarize(mean_delay = mean(dep_delay, na.rm = TRUE))

ggplot(data = flights_age) +
  geom_point(mapping = aes(x = age, y = mean_delay)) +
  geom_line(mapping = aes(x = age, y = mean_delay))

# 13.4.6.4
flight_weather <- flights %>% 
  inner_join(weahter, by = c("orgin", "year", "month", "day", "hour"))

flight_weather %>% group_by(perceip) %>% 
  summarize(delay = mean(dep_delay, na.rm = T)) %>% 
  ggplot(aes(x = percip, y = delay)) + geom_line() + geom_point()

plot <- flight_weather %>% 
  gather(temp:visib, key = weather_var, value = obs) %>% 
  ggplot(aes(x = obs, y = dep_delay)) +
  facet_wrap(~weather_var) +
  geom_point()

# 13.5.1.1
flight_tailnum <- flights %>% 
  anti_join(planes, by = "tailnum") %>% 
  group_by(carrier) %>% 
  summarize(Car_count = n())

planes_gt100 <- filter(flights) %>% 
  group_by(tailnum) %>% 
  count() %>% 
  filter(n >100)

flights %>% semi_join(planes_gt100, by = "tailnum")

dim(flight_tailnum)
