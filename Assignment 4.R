getwd()

twitch <- read.csv("MostPopularTwitchStreamers.csv")
## "Us" is the csv
twitch2 <- na.omit(twitch)
View(twitch2)
str(twitch2)
twitch2$Date <- as.Date(twitch2$Date, "%m/%d/%Y")

library(tidyverse)
library(scales)

p <- ggplot(data = twitch2,
            mapping = aes(x = Date,
                          y = Viewers,
                          color=Streamer))
p + geom_line(mapping = aes(group = Streamer)) +
  labs(title = "Most Popular Twitch Streamers") +
    scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))
              
              
p + geom_line(mapping = aes(group = Streamer)) +
  facet_wrap(~ Streamer) +
                       labs(title = "Most Popular Twitch Streamers")+
  scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))
  

                                             