
#Written Assignment 1 
#Jasir Massey-Campbell

numbers1 <- 3:7         #Question 1 
numbers2 <- c(3, 9, 27, 81, 105)   #Question 2 
numbers3 <- 1:5                 #Question 3 (all print statements are below)
numbers4 <- 1:5  #Question 4
numbers5 <- c(FALSE, FALSE, FALSE, FALSE, FALSE) #Question 8

count <- 1


# QUESTIONS 1, 2, AND 3


for(val in numbers2){
	numbers3[count] = numbers1[count] * numbers2[count]   #new array numbers3 will store the element-wise products of numbers1 and numbers2 
	count = count + 1          #count is used to increment the position in the arrays
}

##############################################################

#QUESTION 4 

count = 1            #reset count to 1 from previous computation
for(val in numbers2){
    numbers4[count] = numbers2[count] %% 4   # numbers4 stores the values in numbers2 modulus 4 (which is the remainder left from the division of numbers2 divided by 4)
    count = count + 1      
}

##############################################################

#QUESTION 5, 6, AND 7

num1 = sqrt(7)^4     
num2 = 7^2         #7 is raised to the power or 2, so 7*7 = 49

ans <- all.equal(num1,num2)


##############################################################

#QUESTION 8
count = 1    #count reset to 1 in order to keep reusing same var
for(val in numbers1){
    
    if (numbers1[count] < 5){
        numbers5[count] = FALSE
    }
    else{numbers5[count] = TRUE}
    
    count = count + 1
  
}

##############################################################


val <- 0   #var used in Question 9. Print statements are at the end of the script
 
##############################################################

#QUESTION 10 

val2 <- 0
isTrue = FALSE    #initiated to FALSE, must satisfy condition below to be changed 

if(val2 > 3 || val2 == 30){   #if statement checks is val1 is “>” greater than 3 “||” or “==“ equal to 30
    isTrue = TRUE
}

##############################################################

# QUESTION 11
hasValueGreaterThanSix = any(numbers1>6)

##############################################################

#PRINT STATEMENTS FOR ALL QUESTIONS 

print(numbers1)  # Question 1 
print(numbers2)  # Question 2 
print(numbers3)  # Question 3 
print(numbers4)  # Question 4 
print(num1)      # Question 5
print(num2)      # Question 6 
print(ans)       # Question 7
print(numbers5)   # Question 8 

#QUESTION 9
is.numeric(val)  
is.infinite(val)
exists("val")

print(isTrue) # Question 10 
print(hasValueGreaterThanSix) #Question 11



