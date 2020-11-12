##Jordan Resnic
library(tidyverse)
getwd()
## know what directory im working in

Temp <- getwd()
## is the current working directory

setwd("./BIS-244-resnicjordan/")

Data <- read.csv("data.csv")

View(Data)

Data2 <- Data %>% filter(countriesAndTerritories=="Canada" | countriesAndTerritories=="France"| countriesAndTerritories=="Germany"| countriesAndTerritories=="Italy"| countriesAndTerritories=="Japan"| countriesAndTerritories=="United_States_of_America"| countriesAndTerritories=="United_Kingdom")

Data2$month <- month.abb[Data2$month]
str(Data2)

p <- ggplot(data = Data2,
            mapping = aes(x = month,
                          y = cases,
                          color=countriesAndTerritories))
p + geom_line(mapping = aes(group = countriesAndTerritories)) +
  labs(title = "G7 COVID-19 Case Counts", x = "", y = " New Cases per Day" , 
       subtitle = "by Jordan Resnic as of 2020-16-03",
       caption = "Data: NY ECDC Times")
