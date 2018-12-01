# Nesting or collapsing the data and table in another table.

forbes <- read_csv("forbes.csv", col_types = cols(
  rank = col_number(),
  name = col_character(),
  networth = col_number(),
  age = col_number(),
  source = col_character(),
  country = col_character()
))

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

output <- vector("double", ncol(df))  # 1. output
for (i in seq_along(df)) {            # 2. sequence
  output[[i]] <- median(df[[i]])      # 3. body
}
output

# Exercise 21.2.1.1.1
data(mtcars)
mean_mtcars <- vector("double", ncol(mtcars))
names(mean_mtcars) <- names(mtcars)
for (i in seq_along(mtcars)) {
  mean_mtcars[[i]] <- mean(mtcars[[i]])
}
mean_mtcars

# Exercise 21.2.1.1.2
data(flights)
type_flights <- vector("list", ncol(flights))
for (i in seq_along(flights)) {
  type_flights[[i]] <- class(flights[[i]])
}
type_flights
?POSIXct

# Exercise 21.2.1.1.3
data(iris)
View(iris)
unique_iris <- vector("double", ncol(iris))
names(unique_iris) <- names(iris)
for (i in seq_along(iris)) {
  unique_iris[[i]] <- length(unique(iris[[i]]))
}
unique_iris

# Exercise 21.2.1.1.4
n <- 10
mu <- c(-10, 0, 10, 100)
normals <- vector("list", length(mu))
for (i in seq_along(normals)) {
  normals[[i]] <- rnorm(n, mean = mu[[i]])
}
normals

out <- ""
for (x in letters) {
  out <- stringr::str_c(out, x)
}
stringr::str_c(letters, collapse = "")

# Exercise 21.3.5.1
files <- dir("data/", pattern = "\\.csv$", full.names = TRUE)
df <- vector("list", length(files))
for (i in seq_along(files)) {
  df[[i]] <- read_csv(files[[i]])
}
df <- bind_rows(df)
df

forbes %>% map_chr(typeof)
