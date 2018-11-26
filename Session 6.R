library(tidyverse)
library(stringr)

# Exercise 14.3.2.1
x <- c("$^$", "apple", "orange")
str_view(x, "\\$\\^\\$")

stringr::words
str_view(stringr::words, "^y", match = T)
str_view(stringr::words, "x$", match = T)
str_view(stringr::words, "^...$", match = T)
str_view(stringr::words, ".......", match = T)

str_view(words, "\\w")

str_view(words, "^(a|e|i|o|u)")
str_view(words, "^[^aeiou]+$", match = T)
str_view(words, "^ed$|[^e]ed$", match = T)
str_view(words, "[^e]ed$", match = T)
str_view(stringr::words, "i(ng|se)$", match = TRUE)

str_view(words, "[^c]ie|cei", match = T)
str_view(words, "[^c]ei|cie", match = T)
str_view(words, "q[^u]", match = T)
str_view(words, "ou|ae|oe|ise", match = T)
str_view(words, "[aeiou][^aeiou]our$", match = T)
str_view(words, "c{2,3}?", match = T)
str_view(words, "c{2,3}", match = T)
str_view(words, "c{2,3}+", match = T)
str_view(words, "c{2,3}*", match = T)

str_view(words, "^[^aeiou]{3}", match = T)

str_view(words, "^[^aeiou]{3}", match = T)
str_view(words, "[aeiou]{3,}", match = T)
str_view(words, "([aeiou][^aeiou])")

str_view(words, "(.)\1\1", match = T)
str_view(fruit, "(..)\\1", match = T)
str_view(words, "(.).*\\1$", match = T)
str_view(words, "(..).*\1", match = T)
str_view(words, "(.)(.*\\1){2}", match = T)
