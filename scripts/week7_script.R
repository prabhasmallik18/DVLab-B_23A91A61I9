#Load Dataset
data(HairEyeColor)

#Basic Mosaic
mosaicplot(HairEyeColor)

#Add Titles and Colors (changed colors)
mosaicplot(HairEyeColor,
           main="Mosaic Plot: Hair, Eye Color and Sex",
           color = c("skyblue","orange","green","purple"))

#Two variable Mosaic
HairEye2D <- margin.table(HairEyeColor, c(1,2))
mosaicplot(HairEye2D,
           main="Hair vs Eye Color Mosaic Plot",
           color = c("cyan","pink","yellow","gray"))

#Mosaic by Sex
par(mfrow = c(1,2))
mosaicplot(HairEyeColor[,,"Male"],
           main="Male",
           col=c("red","blue","green","orange"))

mosaicplot(HairEyeColor[,,"Female"],
           main="Female",
           col=c("purple","yellow","cyan","brown"))
par(mfrow=c(1,1))

#Custom Colors (changed)
mosaicplot(HairEye2D,
           col=c("darkblue","darkgreen","darkred","gold"),
           main = "Hair vs Eye Color(Custom Colors)")

#vcd Mosaic
library(vcd)
mosaic(HairEyeColor,
       shade=TRUE,
       legend=TRUE,
       main="Shaded Mosaic Plot(vcd)")

#ggplot version
library(ggplot2)
hair_eye_df <- as.data.frame(HairEyeColor)

ggplot(hair_eye_df, aes(x=Hair,y=Freq, fill=Eye))+
  geom_bar(stat = "identity", position="fill")+
  facet_wrap(~Sex)+
  scale_fill_manual(values=c("blue","green","orange","red"))+
  labs(title="Proportion of Eye Color by Hair",
       y = "Proportion")+
  theme_minimal()

#Advanced Mosaic
mosaic(~Hair+Eye+Sex,
       data=hair_eye_df,
       shade=TRUE,
       legend=TRUE)