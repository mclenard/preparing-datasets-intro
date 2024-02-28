library(tidyverse)
library(stargazer)

apple_data <- read_csv("apple_data_clean.csv")

model <- lm(Cost_millions_USD ~ Import_weight_metric_tons + Variety, data = apple_data)

stargazer(model, type='text', digits = 2, title = 'Apple Regressions', style = 'qje', out = 'appleregs.html')

apple_plot <- ggplot(apple_data, aes(x = Import_weight_metric_tons, y = Cost_millions_USD,
                       color = Variety)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

apple_plot_labs <- apple_plot + labs(title = "Apple Import Expenditures vs. Weight", x = "Weight (Metric Tons)",
                  y = "Expenditure (Millions USD)")

show(apple_plot_labs)

ggsave("apple_plot.png")