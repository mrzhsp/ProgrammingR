## 14.3.2
#1
str_view(c("$^$","abc"),"\\$\\^\\$")

#2
str_view(words,"^y", match = TRUE)
str_view(words,"x$", match = TRUE)
str_view(words,"^...$", match = TRUE)
str_view(words,".......", match = TRUE)

## 14.3.3
#1
str_view(words, "^[aeiou]", match = TRUE)
str_view(words, "^[^aeiou]+$", match = TRUE)
str_view(words, "[^e]ed$", match = TRUE)
str_view(words, "ing|ise$", match = TRUE)

#2
str_view(words, "cie|[^c]ei", match = TRUE)

#3
str_view(words, "q[^u]", match = TRUE)

#4
str_view(words, "[aeiou][^aeiou]our$", match = TRUE)


## 14.3.4

"{0,1}"
"{1,}"
"{0,}"

#anything
#anything inside { and } at least one char
#4 digits, dash, two digits, dash, two digits (date in yyyy-mm-dd format)
#match 4 backslashes

str_view(words, "^[^aeiuo]{3}", match = TRUE)
str_view(words, "[aeiou]{3,}", match = TRUE)
str_view(words, "([aeiou][^aeiuo]){2,}", match = TRUE)

## 14.3.5

#three times the same character
#a 4-char palindrome (like "abba")
#two times the same two chars (like "abab")
#three times the same character, separated by a (possibly different) character (like "abaca")
#a word where the first three characters are also the last three characters but in reverse order
#  like (abcxxxxxcba)

str_view(words, "^(.).*\\1$", match = TRUE)

str_view(words, "(..).*\\1", match = TRUE)

str_view(words, "(.).*\\1.*\\1", match = TRUE)


