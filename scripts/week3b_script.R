# DV Lab – Week 03 B
# Name: V. Prabhas Mallik
# Roll No: 23A91A61I9

library(ggplot2)

# Load dataset
data("airquality")

# Remove missing values
df <- na.omit(airquality)

# Histogram of Ozone concentration
p1 <- ggplot(df, aes(x = Ozone)) +
  geom_histogram(binwidth = 10, fill = "mediumpurple", color = "black") +
  labs(title = "Distribution of Ozone Concentration",
       x = "Ozone (ppb)",
       y = "Frequency") +
  theme_minimal()

p1

# Save plot
ggsave("plots/week3B_plot-1.png", plot = p1)