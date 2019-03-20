#random norm
library(tidyverse)

x <- rnorm(10000, mean = 5000, sd = 250)
y <- rnorm(10000, mean = 5000, sd = 250)
df <- as.data.frame(cbind(x, y))

df_plot <- df %>% ggplot(aes(x = x)) +
   geom_density(fill = "light blue") +
   geom_vline(aes(xintercept = mean(x)), col = "purple") +
  labs(title = "Totally Random Numbers in a Normal Distribution",
       subtitle = "The purple line is the Mean, Median and Mode")


