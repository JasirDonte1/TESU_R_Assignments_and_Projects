#Written Assignment 2 
#Jasir Massey-Campbell

	
grade_level <-c("freshman", "sophomore", "junior", "senior") #I create list of the 4 grade classifications 
status_factor <- factor(grade_level)  #I use the factor() to create a factor of the list grade level
cat("Quetion 1: ", status_factor, "\n") #I use cat() in order to concatenate variables and strings to print them neatly 


################# Question 1 ####################

grade_level <-c("freshman", "sophomore", "junior", "senior") #I create list of the 4 grade classifications 
status_factor <- factor(grade_level)  #I use the factor() to create a factor of the list grade level
cat("Question 1: ", status_factor, "\n") #I use cat() in order to concatenate variables and strings to print them neatly 

################# Question 2 ####################

words = c("78.1","23.4","35.6","97.6")  
words_factor <- factor(words)  
numbers <- as.numeric(words)  #as.numeric() can be used to convert a vector to strings to a vector of nums
cat("Question 2: ", numbers, "\n")

################# Question 3 #####################

data <- c(-1.7382021,1.0636014,1.9335294,0.4239470,-1.5176473,1.7202728,1.0427466,1.9482044,-0.7755854,0.4915089)

dataAsNumeric <- as.numeric(data)  
dataMin <- min(dataAsNumeric) #min(), max(), mean(), and median() are all built in functions that allows extraction of data much easier. 
dataMax <- max(dataAsNumeric)
dataMean <- mean(dataAsNumeric)
dataMedian <- median(dataAsNumeric)

cat("Question 3: max:",dataMax, "min:", dataMin, "mean:", dataMean, "med:", dataMedian, "\n" )

#another way to display these values is with the built in function, summary

sumData <- summary(data)
print(sumData)


################# Question 4 #####################

sequence <- seq(3.2,4.8, length.out=9) #the seq() function can be used to create a sequence in R. The first two numbers represent the parameters of the sequence. The “length.out” statement controls the desired length of the sequence. 
cat("Question 4:", sequence, "\n")

################# Question 5 #####################

x <- c(one=1,two=2,three=3)
cat("Question 5:\n") 
print(x)

################# Question 6 #####################
counts <- matrix(1:9, byrow = TRUE, nrow = 3) #the matrix() is used to create ordered tables of data. The “byrow - TRUE” statement order the numbers by row instead of the default (columns). “nrow” controls the number of rows desired in your matrix 
rbind(counts, 7:9) #rbinds() is a function that allows to add elements to the matrix. The first param “counts” is the name of the matrix, the second param controls the numbers you want to add. 7:9 represents the numbers the range of numbers between and including 7 and 9. 
colnames(counts) <- c("Mon", "Tue", "Wed") #colnames() and rownames() take in a matrix as a param and allows the programmer to add names to their matrix
rownames(counts) <- c("Adam", "Bell", "Coach")
cat("Question 6:\n")
print(counts)
################# Question 7 #####################

cat("Question 7:\n") 

a <- counts[2,3]    #[2,3] will gather the data from the element located at row 2 and col 3. 
b <- counts[3,] #[3,] will include all of the elements in row 3 
c <- counts[,1] #[,1] will include all of the elements in col 1

cat("Bell on Wednesday: ", a, "\n")
cat("Coach", b, "\n")
cat("Mon: ", c, "\n")


################# Question 8 #####################

cat("Question 8:\n")

counts_2 <- rbind(counts, c(10,11,12)) #rbind can be used to add another row to a matrix. 
rownames(counts_2)[4] <- "Dell"   #the “[4]” in this statement pinpoints the 4th row which was created in the statement above. 
print(counts_2)

################# Question 9 #####################
cat("Question 9:\n")

counts_3 <- cbind(counts, c(10,11,12))
colnames(counts_3)[4] <- "Thu" 
print(counts_3)

################# Question 10 #####################

cat("Question 10a:\n")

amatrix <- matrix(1:9, nrow = 3)
print(amatrix)

cat("Question 10b:\n")
bmatrix <- matrix(1:9,byrow = TRUE, nrow = 3)   
print(bmatrix)

cat("Question 10c:\n")
ten_c <- t(amatrix)
print(ten_c)

cat("Question 10d:\n")
ten_d <- amatrix %*% bmatrix
print(ten_d)

cat("Question 10e:\n")

ten_e <- solve(amatrix * bmatrix)
print(ten_e)


