library(tidyverse)
library(stargazer)

apple_data <- read_csv("apple_data_clean.csv")
mango_data <- read_csv("mango_data_clean.csv")
blueberry_data <- read_csv("blueberry_data_clean.csv")

apple_aov <- aov(Cost_by_weight ~ Variety, data = apple_data)
summary(apple_aov)

mango_aov <- aov(Cost_by_weight ~ Variety, data = mango_data)
summary(mango_aov)

blueberry_aov <- aov(Cost_by_weight ~ Variety, data = blueberry_data)
summary(blueberry_aov)