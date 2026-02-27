# DV Lab – Week 03 A 
# Name: V. Prabhas Mallik 
# Roll No: 23A91A61I9 

# Load the dataset
data(iris)

# Inspect the Data
?iris
head(iris, 3)
str(iris)
class(iris)

iris$Species
View(iris)

# 1️⃣ Basic Bar Chart
png("plots/week3A_plot-1.png")
barplot(table(iris$Species))
dev.off()

# 2️⃣ Labeled Bar Chart
png("plots/week3A_plot-2.png")
barplot(
  table(iris$Species),
  main = "Count of Iris Species",
  xlab = "Species",
  ylab = "Number of Items",
  col = "steelblue"
)
dev.off()

# 3️⃣ Mean Sepal Length Bar Chart
mean_sepal <- tapply(iris$Sepal.Length, iris$Species, mean)

png("plots/week3A_plot-3.png")
barplot(
  mean_sepal,
  main = "Average Sepal Length by Species",
  xlab = "Species",
  ylab = "Mean Sepal Length",
  col = "lightgreen"
)
dev.off()

# 4️⃣ Grouped Bar Chart
group_means <- rbind(
  Sepal = tapply(iris$Sepal.Length, iris$Species, mean),
  Petal = tapply(iris$Petal.Length, iris$Species, mean)
)

png("plots/week3A_plot-4.png")
barplot(
  group_means,
  beside = TRUE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Clustered Bar Chart: Sepal vs Petal Length"
)
dev.off()

# 5️⃣ Stacked Bar Chart
png("plots/week3A_plot-5.png")
barplot(
  group_means,
  beside = FALSE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Sepal vs Petal Length"
)
dev.off()