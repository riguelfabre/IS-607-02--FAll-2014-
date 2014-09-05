#1. Suppose that you have five customers - James, Mary, Steve, Alex, and Patricia - in line at a store. Use R operations to perform the following tasks in sequence. 
#a. Assign the five individuals to a vector called queue.

queue <- c('James','Mary', 'Steve', 'Alex', 'Patricia')

#b. Update the queue for the arrival of a new patron named Harold.
queue<-c(queue,'Harold')

#c. Update the queue to reflect the fact that James has finished checking out.


queue[1]=NA

#d. Update the queue to reflect the fact that Pam has talked her way in front of Steve with just one item.

queue<-c(queue,'')

 queue[7]= queue[6]
queue[6]=queue[5]
queue[5]=queue[4]
queue[4]="Pam"


#e. Update the queue to reflect the fact that Harold has grown impatient and left. 
queue<-queue [!queue %in% queue[8]]

#f. Update the queue to reflect the fact that Alex has grown impatient and left. (Do this as if you do not know what slot Alex currently occupies by number.) 

queue<-queue [!queue %in% 'Alex']

#g. Identify the position of Patricia in the queue.

match('Patricia',queue)


#h. Count the number of people in the queue.
length(queue)

#2. Modify your answer to quiz exercise 21 so that when you implement the quadratic equation, meaningful output is given whether there are one, two, or no solutions. (Hint: Use the discriminant.) 
a=-5
b=14
c=3

#Discriminant

Disc<-b^2-(4*a*c)
if(Disc>0)
{
  first_sol=(-b+sqrt((b^2)-(4*a*c)))/(2*a)
  sec_sol=(-b-sqrt((b^2)-(4*a*c)))/(2*a)
  print('There are two solutions')
  
  print(first_sol)
  print(sec_sol)
}else if(Disc==0)
{
  print('There is one solution')
  first_sol=(-b+sqrt((b^2)-(4*a*c)))/(2*a)
 
  
}else
  print('There is no solution')

#3. Use R to determine how many numbers from 1 to 1000 are not divisible by any of 3,7, and 11.


num<-c(1:1000)

remove<-which(num%%3!=0&num%%7!=0&num%%11!=0)
length(remove)


#4. Write R code that takes three input constants f, g, and h and determines whether they form a Pythagorean Triple (
f<-3
g<-4
h<-5
  
conts=c(f,g,h)

largestsq<-max(conts)
rest<-conts[!conts%in%largestsq]
rest<-rest*rest
sum<-sum(rest)

if(largestsq^2==sum)
{
  print("True")
}else
print("False")