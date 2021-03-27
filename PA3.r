#Written Assignment 3 
#Jasir Massey-Campbell

################# Question 1 ####################

numeric_vector <- c(3, 9)
char_vector <- c("Hello", "Hi", "Hey")
amatrix <- matrix(1:4, nrow = 2)            #used matrix function to create new matricies 

my_list <- list(numeric_vector, char_vector, amatrix)

names(my_list) <- c("item1", "item2", "item3")    #used names function to lable the diffent items in the list my_list 

print(my_list)

################# Question 2 ####################
#One way to get 9
print(numeric_vector[2])  

#Another way to get 9 
print(my_list$item1[2])

################# Question 3 ####################

my_vector <- as.vector(unlist(my_list))     #convert all items in the lists in my_list into one singular list 
names(my_vector) <- c("item11", "item12", "item21", "item22", "item23", "item31", "item32", "item33", "item34")
print(my_vector)

################# Question 4 ####################

new_list1 <- my_list[-2]  #removes item two from the list by using the "-" 
print(new_list1)

################# Question 5 ####################

store_id1 <-  c(1,2,3,4,5)          #created 3 sepreates list to be used in dataframe
item_name <- c("milk", "egg", "fish", "pork", "beef")
price <- c("$2","$1","$2","$4","$5")

items <- data.frame(store_id1, item_name, price) #syntax to merge 3 seprate lists into a data frame 

print(items)

################# Question 6 ####################

store_id2 <- c(1,2)
zip <- c(22222, 33333)
phone <- c("(111)111-1111", "(222)222-2222")

stores <- data.frame(store_id2, zip, phone)
print(stores)

################# Question 7 ####################
# im sorry professor but i cant figure out why im getting duplicates. Ive tried so many ways.

new_set <- merge(stores, items[-1]) #merge function allows more than one data frame to be linked together. Parameters of merge function allows user to control format
print(head(new_set, 2))


################# Question 8####################

new_set2 <- merge(stores, unique(items[-1]))

new_set20 <- unique(new_set2) #unique function will eliminate duplicate values 
print(new_set2)

################# Question 9&10####################

my_envir <- new.env() #env() function is used to create a new envirnment or scope 
my_envir$num <- 3.14  #syntax initializes an envirment var and stores the val 3.14 in it 

################# Question 11####################

#One way to print my_envir
print(my_envir$num)

#Another way to print my_envir


################# Question 12####################

total <- function(a,b){ #created a function called total that takes in two parameters a and b 
sum <- a+b    #stores the sum of a and b in the variable called "sum" 
}
print(total(3,4))  #call and print the return value of the funtion total

################# Question 13####################
log_vec <- vector()
vec <- c(1,-2,3,-4)
positives <- function(vec){
  for(i in vec){
    if (i > 0){
      log_vec <- c(log_vec, TRUE) #this method takes the old list, concatenates the value TRUE and overwrites the old data in the vector log_vec
    }else{
      log_vec <- c(log_vec, FALSE)
    }
  }
  return(log_vec)
}
print(positives(vec))


