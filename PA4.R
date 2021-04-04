

#Question 1 

statusDesc = c("freshman", "sophomore", "junior", "senior")

statusFac <- factor(c(statusDesc))


print(statusFac)

#Question 2 
set.seed(1);
ages=rnorm(10,24,24);
x <- cut(ages, breaks = c(3,13,18,60,120),labels = c("child","teen","adult","senior")) #breaks represent the cutoff points that determine the ranges in which the ages fit. lables represent the names of those different ranges 

print(x)

#Question 3

#write an if-else statement to display the message “it is an even number” if num is even, or “it is an odd number” if num is odd.

num = 1 
if(num %% 2 > 0){     # "%" the modulus operator lets us store the remeinder of the division of two numbers. And even number %%2 will always be zero. If not zero it is an odd number 
  print("num is an odd number")
}else{
  print("num is an even number")
}

#Question 4

score = 88
grade = ""      #initializing the grade variable 

if(score >= 90){
  grade = "A"
}else if (score >= 80){    #else ifs will break once the condition is met
  grade = "B"
}else if (score >= 70){
  grade = "C"
}

print(grade)

#Question 5

a = c(2,-4,-3,7,6)
b = 1:5     
c = 6:10
d = c() 

for (i in 1:length(a)){  #length() allows quick calculation of the size of a vector. 
  if(a[i] > 0){
      d[i] <- b[i]
  }else{
    d[i] <- c[i]
  }
}
print(d)
#Question 6 
for(i in 1:10){       # 1:10 is the for loop iterator that will loop 10 times 
  print("Hello World")
}

#Question 7

factorial = 9   #factorial will control the number of times the factorial loops
x = 1    #x is the control var or counter 
ans = 1  #ans will store the product as x loops towards the factorial 

for(i in 1:factorial){
  ans = ans * x
  x = x + 1 
}

print(ans)

#Question 8
data=seq(0,100,2)   #seq creates a vector that begins at "0", will continue until it reaches "100", and iterate by "2" 
sum = 0   #sum will store the sums of the values inside the vector as the for loop iterates through the vector 
for (i in 1:length(data)){
  sum = sum + data[i]
}
print(sum)


