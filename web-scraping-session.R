library(tidyverse)
library(xml2)
library(RCurl)

## Read Sport RSS Feed from Nu.nl
url <- "https://www.nu.nl/rss/Sport"

rss_feed <- getURL(url, .encoding = "UTF-8")

xml_object <- read_xml(rss_feed)
#xml_structure(xml_object)

titles <- xml_object %>% xml_find_all("//title") %>% 
  as_list() %>% unlist()

links <- xml_object %>% xml_find_all("//link") %>% 
  as_list() %>% unlist()

## Download all the full texts
text = map(links, safely(get_news), xpath = "//div[@data-type=\"article.body\"]//p")


## Read frontpage of the Guardian and get all links, then download the full text of each link
url <- "https://www.theguardian.com/us"
raw_html <- read_html(getURL(url, .encoding = "UTF-8"))
urls <- raw_html %>% xml_find_all("//a/@href") %>%
  as_list() %>% unlist()
urls <- urls[str_detect(urls,"2018.dec")]
texts = map(urls, safely(get_news), xpath = '//div[@itemprop="articleBody"]/p') %>% transpose()




## Function to download a URL and execute a given XPath query to retrieve the text
get_news <- function(url, xpath){
  raw_html <- read_html(getURL(url, .encoding = "UTF-8", .opts = list(followlocation = FALSE)))
  
  text = raw_html %>% xml_find_all(xpath) %>%
    as_list() %>% unlist() %>% str_c(collapse=" ")
}




url = links[2]

