
# Import the readr library 
library(readr) 
library(reshape2)

# read.csv() to read csv file 
data_file = read.csv("COS-206_data.csv", header = TRUE) 

#highData and lowData stores their individual list values in seperate lists respectively 
highData = data_file[,3]  
lowData = data_file[,4]

#list called rangeData is created. First space is initialized to hold header name. 
rangeData = c("")

#for loop counter 
cntr = 1 

#for loop will traverse through the list while storing the difference between High and Low into a new list called rangeData
for(val in lengths(highData)){
	rangeData[cntr] = format(highData[cntr] - lowData[cntr], digits = 2)
	cntr = cntr+1
}

#creates new col in the data file called "Range" and adds the contents of rangeData to it
data_file$Range = rangeData

#Delete the original High and Low cols 
data_file2 = subset(data_file, select = -c(High, Low))


#sort data by the Range col
data_sorted_by_range <- data_file[order(data_file$Range),]

#organize data from wide to long format by using the melt() function 
print(melt(data_file, id.vars = c("Date")))






