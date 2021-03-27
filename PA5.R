

#Problem 1 
nums = c()

for(i in 1:10){
  nums[i] = rnorm(1)
}

#Problem 2 

average_SL = lapply(with(iris, Sepal.Length), mean)
average_SW = lapply(with(iris, Sepal.Width), mean)
average_PL = lapply(with(iris, Petal.Length), mean)
average_PW = lapply(with(iris, Petal.Width), mean)


#Problem 3 

names = c("Sepal Length", "Sepal Width", "Petal Length", "Petal Width")

averages = c(average_SL, average_SW, average_PL, average_PW)

averageVect = data.frame(names, averages)



#Problem 4 
data = as.matrix(iris[,1:4]) 
colMax = apply(data, 2, max)


#Problem 5 
library(rvest)
cart = read_html("COS-206-ShoppingCart.html")
tab <- html_table(cart, fill = TRUE)
str(tab)




