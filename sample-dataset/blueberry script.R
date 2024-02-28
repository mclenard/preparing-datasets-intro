library(tidyverse)
library(stargazer)

blueberry_data <- read_csv("blueberry_data_clean.csv")

model <- lm(Cost_millions_USD ~ Import_weight_metric_tons + Variety, data = blueberry_data)

stargazer(model, type='text', digits = 2, title = 'Blueberry Regressions', style = 'qje', out = 'blueberryregs.html')

blueberry_plot <- ggplot(blueberry_data, aes(x = Import_weight_metric_tons, y = Cost_millions_USD,
                                     color = Variety)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

blueberry_plot_labs <- blueberry_plot + labs(title = "Blueberry Import Expenditures vs. Weight", x = "Weight (Metric Tons)",
                                     y = "Expenditure (Millions USD)")

show(blueberry_plot_labs)

ggsave("blueberry_plot.png")