# session 9

data(iris)
map_lgl(iris, is.factor)

# 21.5.3.5:
map(x, function(df) lm(mpg ~ wt, data = df))
list(mtcars) %>% map(~lm(mpg ~ wt, data = .))
lm(mpg ~ wt, data = mtcars)

# hint
df %>% mutate(new = asdfasdf) %>% .[]
# ------

models %>% 
  map(summary) %>% 
  map_dbl(~.$r.squared)
models %>% 
  map(summary) %>% 
  map_dbl(function(s) (s$r.squared))

iris[["Species"]]

safe_log <- safely(log)
str(safe_log(10))
# it is splitting the results into a list with the results and errors

map(c(1:5, "a"), safe_log)
map(list(1,2,5,-1,"a"), safe_log) %>% transpose()

x <- sample(1:10)
x %>% reduce(`+`)
sum(x)


# Web srapping
# We should try to search for packages for scrapping. 
library(xml2)
library(RCurl)

url <- "https://www.nu.nl/rss/Sport"
rss_feed <- getURL(url, .encoding = "UTF-8")
xml_object <- read_xml(rss_feed)
xml_structure(xml_object)
titles <- xml_object %>% xml_find_all("//title") %>% as_list() %>% unlist()
links <- xml_object %>% xml_find_all("//link") %>% as_list() %>% unlist()

texts = map(urls, safely(get_news)) %>% transpose()
url <- "https://www.theguardian.com/us"
raw_html <- read_html(getURL(url, .encoding = "UTF-8"))
urls <- raw_html %>% xml_find_all("//a/@href") %>% 
  as_list() %>% unlist()
urls <- urls[str_detect(urls, "2018.dec")]


get_news <- function(url){
  raw_html <- read_html(url)
  text = raw_html %>% xml_find_all('//div[@itemprop="articleBody"]/p') %>% 
    as_list() %>% unlist() %>% str_c(collapse= " ")
}
# Use copy xpath in google chrome inspect element