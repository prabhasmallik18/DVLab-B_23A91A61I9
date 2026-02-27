# DV Lab – Week 04 A
# Name: V. Prabhas Mallik
# Roll No: 23A91A61I9

# Load the Data
data(iris)

# Understand the data
str(iris)
View(iris)
class(iris)
?iris

# ---------------- Base R Boxplots ----------------

# 1️⃣ Basic Box plot
png("plots/week4A_plot-1.png")
boxplot(iris$Sepal.Length,
        main = "Box Plot for Sepal Length",
        ylab = "Sepal Length",
        col = "lightblue")
dev.off()

# 2️⃣ Grouped Box Plot (Eye-friendly colors)
png("plots/week4A_plot-2.png")
boxplot(Sepal.Length ~ Species,
        data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = c("#8ECae6", "#90BE6D", "#FFB703"))
dev.off()

# 3️⃣ Multi-Variable Box Plot
png("plots/week4A_plot-3.png")
boxplot(iris[, 1:4],
        main = "Multi Variable Box Plot",
        col = c("#8ECae6", "#90BE6D", "#FFB703", "#FB8500"))
dev.off()

# Custom Color Palette
species_colors <- c(
  "setosa" = "#8ECae6",
  "versicolor" = "#90BE6D",
  "virginica" = "#FFB703"
)

# 4️⃣ Custom Palette Box Plot
png("plots/week4A_plot-4.png")
boxplot(Sepal.Length ~ Species,
        data = iris,
        col = species_colors,
        main = "Sepal Length by Species (Custom Palette)",
        xlab = "Species",
        ylab = "Sepal Length")
dev.off()

# ---------------- GGplot2 ----------------

library(ggplot2)

# 5️⃣ ggplot Boxplot
p1 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  scale_fill_manual(values = species_colors) +
  theme_minimal()

p1

ggsave("plots/week4A_plot-5.png", plot = p1)