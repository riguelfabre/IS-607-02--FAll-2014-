#1. Create a vector that contains 20 numbers.

V <- c(1:20)


#2. Use R to convert the vector from question 1 into a character vector.
library("rpsychi", lib.loc="~/R/win-library/3.1")
cV <- formatted(V, digits = 0)

#3. Use R to convert the vector from question 1 into a vector of factors.

fV <- as.factor(V)

#4. Use R to show how many levels the vector in the previous question has.

levels(fV)

#5. Use R to create a vector that takes the vector from question 1 and performs on it the formula 3x^2???4x+1.

V2 <- 3*(V^2)-(4*V)+1

#6. Implement ordinary least-squares regression in matrix form: ((X^t*X)^-1)*(X^t)*y
 
X<-matrix(c(1,1,1,1,1,1,1,1,5,4,6,2,3,2,7,8,8,9,4,7,4,9,6,4),8)

y<-matrix(c(45.2,46.9,31.0,35.3,25.0,43.1,41.0,35.1),8)

b<-((t(X)%*%X)^-1)%*%(t(X)%*%y)#Formular wasn't work I think im mssing something

fit <- lm(y ~ X)
lm(formula = y ~ X)


#7. Create a named list. That is, create a list with several elements that are each able to be referenced by name.

namedlist <- list(one = 1, two = 2, three = 3)

#8. Create a data frame with four columns - one each character, factor (with three levels), numeric, and date. Your data frame should have at least 10 observations (rows). 
char <- c('D','V','Z','W','R','A','J','S','X','N')
V <- c("First", "Second","Third","First","Second","Third","First","Second","Third","First")
fV<-as.factor(V)
n<-(1:10)
datelist<-c("4/8/2001","4/8/2002","4/8/2003","4/8/2004","4/8/2005","4/8/2006","4/8/2007","4/8/2008","4/8/2009","4/8/2010")
date <- as.Date(datelist, "%m/%d/%Y")

theDF <- data.frame(Characters = char,factor = fV,number = n,date = date)

#9. Illustrate how to add a row with a value for the factor column that isn't already in the list of levels. (Note: You do not need to accomplish this with a single line of code.) 
newdate <- as.Date("4/8/2011", "%m/%d/%Y")
charr<-c('E')
VV<-c("Forth")
newrow = c(charr,VV,11,newdate)
theDF = rbind(theDF,newrow)

#10. Show the code that would read in a CSV file called temperatures.csv from the current working directory. 
path <- "\"
myfile <- read.table(file = path, header = TRUE)

#11. Show the code that would read in a Txt file called measurements.txt from a directory other than the working directory on your local machine. 

path <- "C:\Users\Tablet\Documents\measurements.txt""
myfile <- read.table(file = path, header = TRUE)

#12. Show the code that will read in a delimited file with a pipe separator (the "|" symbol) from a website location. (You may make up an appropriate URL.) 

aURL <- "http://www.smash.com/data/thefile.csv"
myfile <- read.table(file = aURL, header = TRUE, sep = "|")

#13. Write a loop that calculates 12-factorial. 

n =12
i=1
fact = 1
for (i in 1:n)
fact = fact*i


#14. Use a loop to calculate the final balance, rounded to the nearest cent, in an account that earns 3.24% interest compounded monthly after six years if the original balance is $1,500. 

FinBal <- (1500)*((1+0.0324/12)^6)

#15. Create a numeric vector of length 20 and then write code to calculate the sum of every third element of the vector you have created. 

numVect <- c(1:20)

sum=0
for(i in 1:length(numVect))
  {
    if(numVect[i]%%3==0)
    sum=sum+numVect[i]
    
  }

#16. Use a for loop to calculate sigma 10 i=1 x^i for the value x=2. 

x=2
y=0
for(i in 1:10)
{
  y=y+x^i
  
}

#17. Use a while loop to accomplish the same task as in the previous exercise. 


#18. Solve the problem from the previous two exercises without using a loop. 
ans=0
x=2
ex<-c(1:10)
ans=ans+x^ex
ans
#19. Show how to create a numeric vector that contains the sequence from 20 to 50 by 5. 

nubseq <- seq(20,50,by = 5)
#20. Show how to create a character vector of length 10 with the same word, "example", ten times

wordseq <-c(rep("example",10))

#21. Show how to take a trio of input numbers a, b, and c and implement the quadratic equation. 

a=-5
b=14
c=3


first_sol=(-b+sqrt((b^2)-(4*a*c)))/(2*a)
sec_sol=(-b-sqrt((b^2)-(4*a*c)))/(2*a)
