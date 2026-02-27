# DV Lab – Week 05
# Name: V. Prabhas Mallik
# Roll No: 23A91A61I9

# Load & Understand the iris Dataset
data(iris)
str(iris)
View(iris)

# ---------- Base R Scatter Plots ----------

# 1️⃣ Basic Scatter
png("plots/week5_plot-1.png")
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Sepal Length vs Sepal Width",
     xlab = "Sepal Length (cm)",
     ylab = "Sepal Width (cm)",
     col = "#3A86FF",
     pch = 16)
dev.off()

# 2️⃣ Colored by Species
png("plots/week5_plot-2.png")
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col = as.numeric(iris$Species),
  pch = 16,
  main = "Sepal Dimensions by Species"
)
legend(
  "topright",
  legend = levels(iris$Species),
  col = 1:3,
  pch = 16
)
dev.off()

# 3️⃣ Multivariate Scatter (Color + Size)
png("plots/week5_plot-3.png")
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col = as.numeric(iris$Species),
  pch = 16,
  cex = iris$Petal.Length / max(iris$Petal.Length),
  main = "Multivariate Scatter Plot"
)
dev.off()

# 4️⃣ Scatter Matrix
png("plots/week5_plot-4.png")
pairs(
  iris[, 1:4],
  col = as.numeric(iris$Species),
  pch = 16,
  main = "Scatter Plot Matrix of Iris Dataset"
)
dev.off()

# ---------- GGplot2 ----------

library(ggplot2)

species_colors <- c(
  "setosa" = "#3A86FF",
  "versicolor" = "#FF006E",
  "virginica" = "#2EC4B6"
)

# 5️⃣ ggplot Colored Scatter
p1 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = species_colors) +
  theme_minimal()

p1
ggsave("plots/week5_plot-5.png", plot = p1)

# 6️⃣ Multivariate ggplot
p2 <- ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Sepal.Width,
    color = Species,
    size = Petal.Length
  )
) +
  geom_point(alpha = 0.7) +
  scale_color_manual(values = species_colors) +
  theme_minimal()

p2
ggsave("plots/week5_plot-6.png", plot = p2)

# 7️⃣ Faceted Scatter
p3 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(color = "#3A86FF") +
  facet_wrap(~Species) +
  theme_minimal()

p3
ggsave("plots/week5_plot-7.png", plot = p3)

# 8️⃣ Scatter Matrix using GGally
library(GGally)

p4 <- ggpairs(
  iris,
  columns = 1:4,
  aes(color = Species, alpha = 0.6)
)

ggsave("plots/week5_plot-8.png", plot = p4)