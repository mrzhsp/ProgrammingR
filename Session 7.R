x1 <- c("Dec", "Apr", "Jan", "Mar")
x2 <- c("Dec", "Apr", "Jam", "Mar")

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)
month_levels

y1 <- factor(x1, levels = month_levels)
y1
sort(y1)

y2 <- factor(x2, levels = month_levels)
y2
gss_cat
View(gss_cat)

gss_cat %>%
  count(race)
## Exercise 15.3.1.1:
# my solution:
ggplot(gss_cat, aes(rincome)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE) +
  coord_flip()

# book solution:
rincome_plot <-
  gss_cat %>%
  ggplot(aes(x = rincome)) +
  geom_bar()
rincome_plot

rincome_plot +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
rincome_plot +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

gss_cat %>%
  filter(!rincome %in% c("Not applicable")) %>%
  mutate(rincome = fct_recode(rincome, 
                              "Less than $1000" = "Lt $1000")) %>%
  mutate(rincome_na = rincome %in% c("Refused", "Don't know", "No answer"))  %>%
  ggplot(aes(x = rincome, fill = rincome_na)) +
  geom_bar() +
  coord_flip() +
  scale_y_continuous("Number of Respondents", labels = scales::comma) +
  scale_x_discrete("Respondent's Income") +
  scale_fill_manual(values = c("FALSE" = "black", "TRUE" = "gray")) +
  theme(legend.position = "None")

gss_cat %>%
  filter(!rincome %in% c("Not applicable", "Don't know", "No answer", "Refused")) %>%
  mutate(rincome = fct_recode(rincome, 
                              "Less than $1000" = "Lt $1000")) %>%
  ggplot(aes(x = rincome)) +
  geom_bar() +
  coord_flip() +
  scale_y_continuous("Number of Respondents", labels = scales::comma) +
  scale_x_discrete("Respondent's Income")

relig_summary <- gss_cat %>%
  group_by(relig) %>%
  summarise(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

ggplot(relig_summary, aes(tvhours, relig)) + geom_point()
ggplot(relig_summary, aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()

rincome_summary <- gss_cat() %>% 
  group_by(rincome) %>% 
  summarize(
    age = mean(age, na.rm = TRUE),
    tvhours = 
  )

## Beginning the session:

# Eercise 19.2.1.3:
mean_fun <- function(x) {
  mean(is.na(x))
}
mean_fun(c(10, 11, NA, 14))
mean_fun(c(1:10))
# it is calculating the proportion of NAs in a data set by converting NAs into
# 1s and 0s.

# ew can use ctrl+i for indention.

perc_fun <- function(x) {
  x / sum(x, na.rm = FALSE)
}
perc_fun(c(1:3))
perc_fun(c(1:3, NA))

#' Title
#'
#' @param x 
#'
#' @return
#' @export
#'
#' @examples
percentage <- function(x) {
  if (any(is.na(x))) {
    warning("Removed NA's")
  }
  x / sum(x, na.rm = FALSE)
}

percentage(c(1:10, NA))

var_fun <- function(x) {
  sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)
}
var_fun(c(1:10))

coef_variation <- function(x, na.rm = FALSE) {
  sd(x, na.rm = na.rm) / mean(x, na.rm = na.rm)
}
coef_variation(c(1:10, NA), TRUE)

both_na <- function(x, y) {
  sum(is.na(x) & is.na(y))
}
a <- c(1, 2, 3, NA, 4, 5)
b <- c(3, 4, 5, NA, 9, 8)
both_na(a, b)

?ifelse

greet <- function(time = lubridate::now()) {
  hr <- lubridate::hour (time)
  if (hr < 12) {
    print("Good Morning")
  } else if (hr < 17) {
    print("Good Afternoon")
  } else {
    print("Good Evening")
  }
}
greet()

temp <- seq(-10, 50, by = 5)
cut(temp, c(-Inf, 0, 10, 20, 30, Inf), right = TRUE,
    labels = c("freezing", "cold", "cool", "warm", "hot"))

lazy_example <- function(greeting = greet()){
  print("greeting")
}

lazy_example(greet())
z <- 10
t <- function(x) {
  y <- x + z
}
a <- t(2)

# If we don't want something in our global environment, we can insert 
# it in a function and get rid of it from the global.
