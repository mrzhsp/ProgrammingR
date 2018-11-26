by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")

delays <- flights %>% 
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")

# with transmute, only the new columns will remain in a new database

?flights

flight_times %>% select(dep_time) %>%
  mutate(dep_minute = dep_time %/% 100 * 60 + dep_time %% 100) %% 1440

flights_times <- mutate(flights,
                        dep_time_mins = 
                          (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
                        sched_dep_time_mins = 
                          (sched_dep_time %/% 100 * 60 + 
                                                 sched_dep_time %% 100) %% 1440
)
arrange(flights_times, dep_delay)

# Exercise 5.5.2.4
ex5524 <- flights %>%
  mutate(total_delay = dep_delay + arr_delay) %>%
  arrange(desc(total_delay))

ex5524_v2 <- flights_times %>%
  mutate(delay_rank = min_rank(-dep_delay)) %>%
  filter(delay_rank <= 10) %>%
  arrange(delay_rank)

temp <- flights_times %>% 
  group_by(carrier, month) %>%
  summarize(delay = mean(dep_delay, na.rm = TRUE),
            count = n(),
            notNA = sum(!is.na(dep_delay))/count)

temp2 <- summarize(delay = mean(dep_delay, na.rm = TRUE),
                   count = n(),
                   notNA = sum(!is.na(dep_delay))/count)
