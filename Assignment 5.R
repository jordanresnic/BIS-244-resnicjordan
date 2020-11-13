getwd()

LT <- read.csv("LT History.csv")


View(LT)

library(tidyverse)

LT

LTWPERC <- LT %>%
  group_by(Tank) %>%
  mutate(freq = Wins / Games.Played,
         pct = round((freq*100), 0))

View(LTWPERC)

p <- ggplot(LTWPERC, aes(x = Nationality, y = pct, fill = Nationality))
p + geom_col(position = "dodge2") +
  labs(x = "Nationality",y = "Percent", fill = "Nationality") +
  theme(legend.position = "top")  

p <- ggplot(LTWPERC, aes(x = Tank, y = pct, fill = Tank))
p + geom_col(position = "dodge2") +
  labs(x = "Tank",y = "Percent", fill = "Tank") +
  theme(legend.position = "top")  

p <- ggplot(LTWPERC, aes(x = Tier, y = pct, fill = Tier))
p + geom_col(position = "dodge2") +
  labs(x = "Tier",y = "Percent", fill = "Nationality") +
  theme(legend.position = "top")  

