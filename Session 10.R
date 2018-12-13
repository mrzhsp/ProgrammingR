# Session 10

RCurl::getURL( .opt = list(followlocation = FALSE))
# This is a line of code to get passes the "Cookie" setting in websites.

library(twitteR)

# This is the way we are reading into the twitter account.
consumer_key <-"ZuK4mehxva4uBV5SlZ6NVxm3Y"
consumer_secret <- "INEqob1bNAfB1UAY5VWXEt7GyghMd31OyPJj93sR11hSeBlhfC"
access_token <- "130932005-nsR9pLAeK3kDvvAHR3cLJK0CGmFD6FndOfWQmFDT"
access_token_secret <- "iHWgEsS81sZK9Ry6jFOpzBERIAZU6NzsbiGyfZrzpWadn"

setup_twitter_oauth(consumer_key,
                    consumer_secret,
                    access_token,
                    access_token_secret)

tweets <- searchTwitter("from:realDonaldTrump", n = 50)
df <- twListToDF(tweets)

trump_user <- getUser("realDonaldTrump")
trump_user$followersCount
trump_user$getDescription()
trump_user$getLocation()

trend_locs <- availableTrendLocations()
trend_locs %>% filter(country == "Netherlands")

trends <- getTrends(733075)
trends <- getTrends(23424909)


# the package to use when we are accessing manualy to a website without an API
#   in R packages.
library(httr)
?oauth_endpoints
oauth_endpoints("github")
myapp <- oauth_app(appname = "AssignmentChekcer",
                   key = "acf9bc71ef914915ba3c",
                   secret = "30030fb4d9a92b2cdccea3474c690066a9e05e8f")
# we should insert the clinet id and client secret from github.
#  These are in the developer setting in the github.
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

token <- config(token = github_token)
req <- GET("https://api.github.com/users/KSchouten", token)
content <- content(req)
req <- GET(content$repos_url, token)
content <- content(req)

req <- GET(content[[5]]$commits_url, token)
content <- content(req)

req <- GET("https://api.github.com/repos/KSchouten/RTest/commits", token)
commits <- content(req)
View(commits)

?GET
req <- GET("https://www.google.com")
content <- content(req)
View(content)
req$status_code
req$cookies
req$headers

