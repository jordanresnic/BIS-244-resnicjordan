getwd()
## know what directory im working in

Temp <- getwd()
## is the current working directory

setwd("./covid-19-data/")
## set working directory as covid data within project

Us <- read.csv("us-states.csv")
## "Us" is the csv

setwd(Temp)
## set working directory as "Temp"

library(tidyverse)
## load in tidyverse

Penn <- Us %>% filter(state=="Pennsylvania")
## filter to only pennsylvania data

View(Penn)
## view what we made "Penn"

Penn <- mutate(Penn, adj_deaths = deaths)

n <- length(Penn$date)
for (i in 1:n) 
  if (as.character(Penn$date[i])=="2020-04-21"){Penn$adj_deaths[i] <- (Penn$deaths[i] - 282)}
for (i in 1:n)
  if (as.character(Penn$date[i])=="2020-04-22"){Penn$adj_deaths[i] <- (Penn$deaths[i] - 297)}
sum(Penn$adj_deaths)

