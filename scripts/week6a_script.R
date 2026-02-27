# DV Lab – Week 06 A
# Name: V. Prabhas Mallik
# Roll No: 23A91A61I9

library(ggplot2)
library(hexbin)

# Load and Understand Dataset
data("diamonds")
str(diamonds)
dim(diamonds)
?diamonds

# ---------- Base Scatter ----------

png("plots/week6A_plot-1.png")
plot(diamonds$carat, diamonds$price,
     col = rgb(0.2, 0.4, 0.8, 0.1),
     pch = 16,
     main = "Scatter Plot: Carat vs Price",
     xlab = "Carat",
     ylab = "Price")
dev.off()

# ---------- Hexbin using base R ----------

hb <- hexbin(diamonds$carat, diamonds$price, xbins = 40)

png("plots/week6A_plot-2.png")
plot(hb, main = "Hexbin Plot: Diamond Density")
dev.off()

# ---------- ggplot Hexbin ----------

p1 <- ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(bins = 35) +
  scale_fill_gradient(low = "#90DBF4", high = "#1D3557") +
  labs(title = "Hexagon Binning: Diamond Structure",
       x = "Carat",
       y = "Price") +
  theme_minimal()

p1
ggsave("plots/week6A_plot-3.png", plot = p1)

# ---------- Viridis Professional Palette ----------

p2 <- ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 30) +
  scale_fill_viridis_c(name = "Density") +
  labs(title = "Density Structure of Diamonds",
       x = "Carat",
       y = "Price") +
  theme_minimal()

p2
ggsave("plots/week6A_plot-4.png", plot = p2)

# ---------- Faceted Hexbin ----------

p3 <- ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 25) +
  scale_fill_viridis_c() +
  facet_wrap(~cut) +
  labs(title = "Faceted Hexbin by Cut Quality") +
  theme_minimal()

p3
ggsave("plots/week6A_plot-5.png", plot = p3)