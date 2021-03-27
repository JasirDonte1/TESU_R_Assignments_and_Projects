#Final Project 
#Jasir Massey-Campbell

library(pracma)



#vars 
fileName = "COS-206_gradebook.csv"
s_name = "K"    #student name 
a_name = 	"final"		#assessment name 
a_prefix = "hw"
assessmentTypeWeights <- c(5,15,5,3,2,10,10,10,40)
names(assessmentTypeWeights) <-c("quiz","hw","term1","term2","term3","exam1",
                                 "exam2","exam3","final")


#read.csv() to read csv file into variable df as a data frame. readData() will return the contents of the file. 
readData <- function(fileName){
	df <- read.csv(fileName, header = TRUE)
	return(df)		
}

#data_frame stores the contents of the gradebook cvs file 
data_frame <- readData(fileName)


#checkStudent() accepts 2 params, a data frame and the name of a student as a string.
checkStudent <- function(df, studentName){
	
	names <- df[,1]  #names stores the contents of the first col in the gradebook data frame
	counter = 1    #counter helps iterate through list to find correct name 
	
	for (val in lengths(names)){
		
		if(names[counter] == studentName){  
			#if condition is met function will break and reutrun the row of the students name.
			return(df[counter,])
		}
		counter = counter + 1 
	}
	#function will return message if no name was found in names[]
	return("Name was not found, try a new name")
}


checkAssessment <- function(df, assessmentName){
	
	#colnames() extracts the col labels of a data frame. col_labels stores those names in a list 
	col_labels <- colnames(df)  
	counter <- 2
	
	#for loop checks assmentName with names in col_labels 
	for(val in lengths(col_labels)){
		if(col_labels[counter] == assessmentName){ #if condition is met (if assessment name is found) data will store the grades of the desired  assessment 
			data <- df[,counter]    
			data <- data[2:length(data)] #removes first score from list which represents max possible score not student score 
			dataMax <- max(data)  #store max, min and mean data by using max(), min(), and mean() respectively 
			dataMin <- min(data)
			dataMean <- mean(data)
	#data frame is created to return organized values 
			assessmentSet <- data.frame("Min Score" = dataMin, "Max Score" = dataMax, "Mean Score" = dataMean)
			return(assessmentSet)
		}
		counter = counter + 1 
	}
	#if assessment is not found, this message will get returned 
	return("Assessment name was not founf, enter new name")	
}


calcAssessmentEffectiveScoreRatios <- function(df, assessmentName){
		
	#colnames() extracts the col labels of a data frame. col_labels stores those names in a list 
	col_labels <- colnames(df)  
	counter <- 2
	topScore <- -1       
	
	#for loop checks assmentName with names in col_labels 
	for(val in lengths(col_labels)){
		if(col_labels[counter] == assessmentName){ #if condition is met (if assessment name is found) data will store the grades of the desired  assessment 
			data <- df[,counter]  
			topScore =   data[1]  #stores overall top possible score 
			raw_data <- data[-1] #removes first score from list which represents max possible score not student score 
			
			scoreRatios <- c()    #create empty list to store ratios 
			counter2 <- 1 
			for (val in lengths(data)){
				scoreRatios[counter2] = data[counter2]/topScore
				counter2 = counter2 + 1 
			}
			
			scoreRatios <- scoreRatios[-1]	 #removes the the first cell which stores the overall score not the student score 
			
			names <- df[,1]  #names stores the contents of the first col in the gradebook data frame
			names <- names[-1] #compensate for the empty space above students' names 

			entry_length <- length(data) - 1   #compensate for first entry being overall scores not student scores 
			
			#fucntion will end by returning data frame of students names and thier effective score ratios 
			ratios_df = data.frame("names" = names, "ratios" = scoreRatios)
					
			return(ratios_df)
		}
		counter = counter + 1 
	}
	#if assessment is not found, this message will get returned 
	return("Assessment name was not founf, enter new name")	
}


assessmentCount <- function(df, assessmentNamePrefix){
	
	col_labels <- colnames(df)  
	assessmentNames <- col_labels[-1]
	assessmentCount <- 0 
	
	#for loop compares col names to prefix using startsWith(). startsWith() will return either TRUE or FALSE. If it returns T, it will iterate the assessmentCount coutner. 
	for (x in assessmentNames){
		
		if(startsWith(x, assessmentNamePrefix)){
			assessmentCount = assessmentCount + 1 
		}		
	}

	return(assessmentCount)
}

assessmentWeight <- function(df, assessmentName, assessmentTypeWeight){
	
	row_weights <- df[1,]
	row_weights = row_weights[-1]
	col_labels <- colnames(df)
	col_labels <- col_labels[-1]  
	
	hw_totals = 0
	quiz_totals = 0

#k and i are used as iterators for loops 
	i =1
	k =1
	
	#for loop calculates the highes possibles scores for both hw and qizzes by traversing throgh all cols and summing up assignments with the prefix hw or quiz
	for(x in row_weights){
		
		if(startsWith(names(row_weights[i]), "hw")){
			hw_totals = hw_totals + x 
		} 
		if(startsWith(names(row_weights[i]), "quiz")){
			quiz_totals = quiz_totals + x 
		} 
		
		i = i + 1
	}
	
	
		assessmentValue = 0
	
	#for loop locates the desired assessmentName
	for(x in col_labels){
		if(assessmentName == names(row_weights[k])){
			assessmentValue = row_weights[k]
			break
		}
		k = k+1 #iterator 
	}
	
	#if statements calculate the correct weights. assessmentWeights are divided by 100 to achieve decimal form of the percentage. That is then multiplied by the total possible value.
	if(startsWith(assessmentName, "hw")){
		return (unname(assessmentValue/hw_totals * (assessmentTypeWeights["hw"]/100)))
	}
	if(startsWith(assessmentName, "quiz")){
		return (unname(assessmentValue/ quiz_totals* (assessmentTypeWeights["quiz"]/100)))
	}
	if(strcmp(assessmentName, "term1")){
		return (unname(assessmentValue* (assessmentTypeWeights["term1"]/100)))
	}
	if(strcmp(assessmentName, "term2")){
		return (unname(assessmentValue* (assessmentTypeWeights["term2"]/100)))
	}
	if(strcmp(assessmentName, "term3")){
		return (unname(assessmentValue* (assessmentTypeWeights["term3"]/100)))
	}
	if(strcmp(assessmentName, "exam1")){
		return (unname(assessmentValue* (assessmentTypeWeights["exam1"]/100)))
	}
	if(strcmp(assessmentName, "exam2")){
		return (unname(assessmentValue* (assessmentTypeWeights["exam2"]/100)))
	}
	if(strcmp(assessmentName, "exam3")){
		return (unname(assessmentValue* (assessmentTypeWeights["exam3"]/100)))
	}
	if(startsWith(assessmentName, "fin")){
		return (unname(assessmentValue* (assessmentTypeWeights["final"]/100)))
	}
	
	return("error: not found")
}

calcFinalGrade <- function(df, assessmentTypeWeights){
	
	studentFinalGrade = c()   #list will store the calculated final grades at the end 
	
	#iterators 
	y = 1
	k = 1

#row data and col data for data frame 
	row_labels <- rownames(df)
	num_rows <- length(row_labels)

	col_labels <- colnames(df)
	num_cols <- length(col_labels)

	
#vars will store the total poossible score for hw and quiz 
	hw_total = 0
	quiz_total = 0


#loop calculates the hw and quiz totals by comparing the prefix 
	first_line <- df[1,]
	for(x in first_line){
		if(startsWith(names(first_line[k]), "hw"))
		{
			hw_total = hw_total + x 
		} 
		if(startsWith(names(first_line[k]), "quiz"))
		{
			quiz_total = quiz_total + x 
		} 
		k = k + 1
	}

#iterator 
#itr is set to 2 to avoid grabbing the total possible score data 
	it = 2

	while(y < num_rows){

		student <- df[it,] #as the iterator increases, each students name will be loaded into student 

#if statements calculate the correct scores. assessmentWeights are divided by 100 to achieve decimal form of the percentage. That is then multiplied by the students achieved grade.
		term1 = student["term1"]*(assessmentTypeWeights["term1"]/100)
		term2 = student["term2"]*(assessmentTypeWeights["term2"]/100)
		term3 = student["term3"]*(assessmentTypeWeights["term3"]/100)

#terms and exams are grouped for printing simplicity 
		term = term1 + term2 + term3
				
		exam1 =  student["exam1"]*(assessmentTypeWeights["exam1"]/100)
		exam2 = student["exam2"]*(assessmentTypeWeights["exam2"]/100)
		exam3 = student["exam3"]*(assessmentTypeWeights["exam3"]/100)
		
		exam = exam1 + exam2 + exam3
		
		final = student["final"]*(assessmentTypeWeights["final"]/100)


		hw_sum = 0 
		quiz_sum = 0
		it2 = 1    #iterator 

		for(x in col_labels){
			if(startsWith(names(student[it2]), "hw")){
				hw_sum = hw_sum + student[it2]
			}
			if(startsWith(names(student[it2]), "quiz")){
				quiz_sum = quiz_sum + student[it2]
			}
			
			it2 = it2+1
		}

		hw =  hw_sum/hw_total*(assessmentTypeWeights["hw"]/100)
		quiz = quiz_sum/quiz_total*(assessmentTypeWeights["quiz"]/100)
		

		studentFinalGrade[y] = hw + quiz + term + exam + final
		y=y+1
		it=it+1
	}
	return(studentFinalGrade)
}

fileName2  = "ofile.txt"
finalGrades = calcFinalGrade(data_frame, assessmentTypeWeights)

writeReport <- function(df, finalGrades, fileName ){
	
	#x stores a combined list with a single cell'd list and the final grades. The single cell list stores the highes grade that can be achieved to correctly allign list to data frame.  (final grades as 17 rows, df has 18)
	x <- c(100, finalGrades)
	updated_df <- df 
	updated_df$FinalGrade <- x 

	write.table(updated_df, fileName)

}






