library(tidyverse)
library(stargazer)

mango_data <- read_csv("mango_data_clean.csv")

model <- lm(Cost_millions_USD ~ Import_weight_metric_tons + Variety, data = mango_data)

stargazer(model, type='text', digits = 2, title = 'Mango Regressions', style = 'qje', out = 'mangoregs.html')

mango_plot <- ggplot(mango_data, aes(x = Import_weight_metric_tons, y = Cost_millions_USD,
                                     color = Variety)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

mango_plot_labs <- mango_plot + labs(title = "Mango Import Expenditures vs. Weight", x = "Weight (Metric Tons)",
                                     y = "Expenditure (Millions USD)")

show(mango_plot_labs)

ggsave("mango_plot.png")
