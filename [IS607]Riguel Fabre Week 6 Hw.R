install_github("hadley/rvest")
library(rvest)



Stats <- html("http://espn.go.com/mlb/player/stats/_/id/3246/derek-jeter")
table <- Stats %>% 
  html_nodes("div p") %>%
  html_text() %>%
  table

table


