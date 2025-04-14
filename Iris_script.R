library(tidyverse)
library(ggplot2)
renv::snapshot()
data(iris)
head(iris)
summary(iris)
iris %>% summarize_if(is.numeric, mean)

filter(iris, Petal.Length > 2)
filter(iris, Petal.Length > 6 & Sepal.Length > 7)

#1 Scatter PLot
ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

#2 Box Plot
iris_2 <- ggplot(data=iris, aes(x=Species, y=Sepal.Length))
iris_2 + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)

#3 Histogram
iris_3 <- ggplot(data=iris, aes(x=Sepal.Width))
iris_3 +
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
  xlab("Sepal Width") + 
  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Width")

#4 bar plot
iris_4 <- ggplot(data=iris, aes(x=Species))
iris_4 +
  geom_bar(aes(fill=Species)) + xlab("Species") + 
  ylab("Count") +
  ggtitle("Bar plot of Sepal Length") 
