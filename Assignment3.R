getwd()
## know what directory im working in

Temp <- getwd()
## is the current working directory

setwd("./covid-19-data/")
## set working directory as covid data within project

Us <- read.csv("us-counties.csv")
## "Us" is the csv

View(Us)

setwd(Temp)
## set working directory as "Temp"

library(tidyverse)
## load in tidyverse
PA <- Us %>% filter(state=="Pennsylvania")
Northampton <- PA %>% filter(county=="Northampton")
## filter to only pennsylvania data


p = ggplot() + 
  geom_point(data = Northampton, mapping = aes(x = date, y = deaths, color = "deaths")) +
  geom_point(data = Northampton, mapping = aes(x = date, y = cases, color = "cases")) +
  labs(x = "Dates", y = "Count (Deaths & Cases)",
       title = "Cases/Deaths In Northampton County",
       subtitle = "Red = Cases, Green = Deaths",
       caption = "Source: NY Times")
p

