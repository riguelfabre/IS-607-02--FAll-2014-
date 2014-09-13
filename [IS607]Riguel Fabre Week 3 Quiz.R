#1. Write a function that takes a numeric vector and calculates the mean of the observations in the vector.

V<-c(1,2,3,4,5)

my.mean <- function(Vector){
  Vsum = sum(Vector)
  mean = Vsum/length(Vector)
  return(mean)
}

#2. Modify your function in the previous question so that it can handle a numeric vector with missing values.

V<-c(1,2,NA,4,5)
V <- V[!is.na(V)]
my.mean <- function(Vector){
  V <- V[!is.na(V)]
  Vsum = sum(Vector)
  mean = Vsum/length(Vector)
  return(mean)
}


#3. Write a function that takes two numeric input values and calculates the greatest common divisor of the two numbers.

a<-4
b<-16

my.GCD <- function(x,y)
{
  if (y == 0) 
  {
    return (x)
  }
  else 
  {
      return (my.GCD(y, (x %% y)))
  }
}

      
      



#4. Write a function that implements Euclid's algorithm (you may need to do a bit of research to find this algorithm) for finding the greatest common divisor of two numeric inputs.
a<-4
b<-16

my.EuclidGCD <- function(p,q)
{

  while (q != 0) 
  {
    temp <- q
    q <- p %% q
    p <- temp
  }
  return (p)
}



#5. Write a function that takes two numeric inputs x and y and calculates x^2*y+2*x*y-x*y^2.

x<-3
y<-4

my.poly <- function(x,y)
{
  ans<-((x^2)*y)+(2*x*y)-(x*(y^2))
  
  return (ans)
}

#6. Read in the week-3-price-data.csv and week-3-make-model-data.csv files as data frames and then merge them by the ModelNumber key. Leave the "all" parameters as their defaults. How many observations end up in the result? Is this what you would have expected?

path <- "C:/Users/Tablet/Documents/R/Data Files/week-3-price-data.csv"
price_file <- read.table(file = path, header = TRUE,sep = ",")

path2 <- 'C:/Users/Tablet/Documents/R/Data Files/week-3-make-model-data.csv'
make_model_file <- read.table(file = path2, header = TRUE, sep = ",")


merged_data <- merge(price_file,make_model_file,by= "ModelNumber")

#I didnt expect it to be 27 observations because there are 28 

#7. Use the data sets from the previous question, but this time merge them so that the rows from the price-data table all appear, even if there is no match in the make-model table.
merged_data <- merge(price_file,make_model_file,by= "ModelNumber",all=TRUE)

#8. Take your result from question 7 and subset it so that only the 2010 vehicles are included.
subset(merged_data, Year==2010)


#9. Take your result from question 7 and subset it so that only the red cars that cost more than $10,000 are included.
subset(merged_data, Color=='Red'& Price>10000)
#10. Take your result from question 9 and subset it so that the ModelNumber and Color columns are removed.

subset(merged_data,Color=='Red'& Price>10000, select=c(ID, Mileage, Price, Make, Model, Year))

#11. Write a function that takes as input a character vector and returns a numeric vector with the numbers of characters in each of the elements in the original vector.

char_vect<- c('mon','tues','weds','thurs','fri','sat','sun')

my.charcount <- function(cvec)
{
  myans<-as.numeric(nchar(char_vect))
  
  return (myans)
}
#12. Write a function that takes two character vectors of equal length and concatenates them element by element with a space as the separator. Have the function die gracefully if the vectors are the same length.
day_vect<- c('mon','tues','weds','thurs','fri','sat','sun')
num_vect<- c('first','second','third','forth','fifth','sixth','seventh')

my.catvect <- function(x,y)
{
  z<- paste(x,y, sep=' ')
  
  return (z)
}
#13. Write a function that takes a character vector and returns the substring of three characters that begins with the first vowel in the string. Have the function handle gracefully substrings where this isn't possible.

strgvec<-c('d','k','f','e','l','g','j','o','c','f','g')

my.vow <- function(X)
{
  vowels<-c('a','e','i','o','u','y')
  
  for(i in 1:length(X)){
  
    if(X[i]%in%vowels)  
    {
      for(j in i:(i+2))
       { print(X[j])}
    }
      
    }
    
}


#14. Suppose you have a data frame where one column gives the month (in numeric format), the next gives the day, and the third column gives the year. Use R to create such a data frame (by hand is fine) and then add a fourth column with the date in date format.
month<-c(01,02,03,04,05,06,07,08,09,10,11,12)
day<-c(03,12,29,04,11,27,19,30,01,06,21,20)
year<-c(2000,2003,1955,1970,2015,2088,1776,1100,1809,1492,1944,1812)
fulldate<- paste(month,day,year, sep=' ')
as.Date(fulldate)

theDF <- data.frame(month = month,day = day,year = year)




#15. Illustrate the code necessary to take a string of MM-DD-YYYY format and convert it to a date.
string_date<-'02-04-1986'
the_date<-as.Date(string_date, "%m-%d-%Y") 
#16. Illustrate the code necessary to take a date and extract the month of the date.
format(the_date, format="%m")
#17. Create a sequence of all of the dates from January 1, 2005, to December 31, 2014.
seq(as.Date("2005/1/1"), as.Date("2014/1/1"), "days")

