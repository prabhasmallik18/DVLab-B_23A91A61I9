# DV Lab – Week 04 B
# Name: V. Prabhas Mallik
# Roll No: 23A91A61I9

# Load the Air Quality Dataset
data(airquality)

# Understand the dataset
str(airquality)
View(airquality)
class(airquality)
?airquality

# -------- Base R Boxplots --------

# 1️⃣ Ozone
png("plots/week4B_plot-1.png")
boxplot(airquality$Ozone,
        main = "Box Plot of Ozone Levels",
        ylab = "Ozone (ppb)",
        col = "#90DBF4")
dev.off()

# 2️⃣ Solar Radiation
png("plots/week4B_plot-2.png")
boxplot(airquality$Solar.R,
        main = "Box Plot of Solar Radiation",
        ylab = "Solar Radiation",
        col = "#B5E48C")
dev.off()

# 3️⃣ Wind Speed
png("plots/week4B_plot-3.png")
boxplot(airquality$Wind,
        main = "Box Plot of Wind Speed",
        ylab = "Wind (mph)",
        col = "#FFD166")
dev.off()

# 4️⃣ Temperature
png("plots/week4B_plot-4.png")
boxplot(airquality$Temp,
        main = "Box Plot of Temperature",
        ylab = "Temperature (°F)",
        col = "#F4978E")
dev.off()

# 5️⃣ Multi-Variable Box Plot
png("plots/week4B_plot-5.png")
boxplot(airquality[, c("Ozone", "Solar.R", "Wind", "Temp")],
        main = "Air Quality Parameters Box Plot",
        col = c("#90DBF4", "#B5E48C", "#FFD166", "#F4978E"),
        ylab = "Values")
dev.off()