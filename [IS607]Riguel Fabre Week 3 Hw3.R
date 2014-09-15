#1. Write a function that takes a vector as input and returns the 
#   number of missing values in the vector.

v<-c(2,NA,3,NA,NA,NA,4,8,11,45,NA)


na.county<-function(vector){
  count=0
  for(i in 1:length(vector))
  {
    
    if(is.na(vector[i]==TRUE))
      {count=count+1}
    
  }
  return(count)
}



#2. Write a function that takes a data frame as input and returns 
#a named vector with the number of missing values in each column of 
#the data frame. (The names of the entries should be the corresponding 
#column names of the data frame.) You may use the 
#function from the previous question as part of your solution.

v1<-c(2,NA,8,NA,NA,5,0,NA,NA,NA,3,2)
v2<-c(1,2,NA,4,NA,NA,7,8,NA,10,NA,12)
v3<-c(1,2,NA,NA,NA,6,723,23,21,34,1,NA)

theDF<-data.frame(Vec1=v1,Vec2=v2,Vec3=v3)

df.county<-function(DF){
  count=NA
  for(i in 1:ncol(DF)){
  
    col<-theDF[,i]
  count<-c(count,na.county(col))
  }
  return(count)
}

#3. Write a function that takes a numeric vector as input and uses it 
#to determine the minimum, the maximum, the mean, the median, the first 
#quartile, the third quartile, the standard deviation of the vector, 
#and the number of missing values. Do not use any built-in functions 
#to do this. Return a named list with the eight desired values in an 
#order you deem best. (You may, if you like, use the function you wrote 
#for question 1.)

numlist<-c(5,NA,3,NA,2,NA,4,NA,1,NA,NA,NA,NA)

my.stat<-function(numlist){
  nanumvec<-numlist[is.na(numlist)]#makes vec of miss vals
  miss<-length(nanumvec)
  numslist <- numlist[!is.na(numlist)]
  #min and max
  
  count<-0
  sum<-0
  min<-numslist[1]
  max<-min
  i=1
  for (i in 1:length(numslist)) 
  { 
    
    #mean
    
    count<-count+1
    sum<-sum+numslist[i]
    
    if(numslist[i]<min)
      {
      min = numslist[i]
      }
    
    else if(numslist[i]>max) 
      {
      max = numslist[i]
      }
    else if(numslist[i]=='NA')
      {
      next
      }
  } 
  
  mean<-sum/count
  
  
  
  i=1
  while(i <length(numslist))
  {
    
    if(numslist[i+1] < numslist[i])
    {
      t <- numslist[i]
      numslist[i] <- numslist[i+1]
      numslist[i+1] <- t
        i=1
    }
    else
    {
      i <- i + 1
      
    }
  }
  
  median<-numslist[(length(numslist)/2)+1]
  
  firstQlist <- subset(numslist,numslist <= median)
  firstQ<-firstQlist[(length(firstQlist)/2)+1]
  thirdQlist <- subset(numslist,numslist >= median)
  thirdQ<-thirdQlist[(length(thirdQlist)/2)+1]
  
  standev<-mean^1/2
  

  stats<-list(min=min,max=max,mean=mean,Median=median,FirstQ=firstQ,thirdQ=thirdQ,standev=standev,missing=miss)
  stats
}


#4. Write a function that takes a character or factor vector and 
#determines the number of distinct elements in the vector, the most 
#commonly occurring element, the number of times the most commonly 
#occurring element occurs, and the number of missing values. 
#(Be sure to handle ties gracefully.) Have the function return a named 
#list with the desired information in a logical order.

fvec<-as.character(c(2,3,6,2,NA,8,1,6,3,NA,NA))

dist_el<-function(fvec){
  nvec<-as.numeric(fvec)
  
  nafvec<-fvec[is.na(nvec)]#makes vec of miss vals
  missel<-length(nafvec)
  nvec <- nvec[!is.na(nvec)]#takes out na in the vec
  
  tab<-as.data.frame(table(fvec))
  r<-c()
  hold <-which(tab[,2]==2)
  for(i in 1:length(hold))
  {
    r<-append(r,as.character(tab[hold[i],1]))
}

r<-as.numeric(r)

  reocur<-r
  univec<-unique(nvec, incomparables = FALSE)#vec of unique val
  univals<-length(univec)#num of unique val
  
  distlist<-list(occurances=reocur,unique=univec,Missing=missel)
  distlist

}


#5. Write a function that takes a logical vector and determines the 
#number of true values, the number of false values, the proportion of 
#true values, and the number of missing values. Have the function return 
#a named list with the desired information in a logical order.

fvec2<-c(TRUE,TRUE,TRUE,NA,FALSE,TRUE,FALSE,NA,TRUE)



logi<-function(fvec2){
  
  logmiss<-fvec2[is.na(fvec2)]#makes vec of miss vals
  miss<-length(logmiss)
  count1=0
  count2=0
  
  for(i in 1:length(fvec2))
  {
    if(fvec2[i] == TRUE)
      {
      count1=count1+1
    }
    else
      {
      count2=count2+1
    }
    
  }
  print(count1)
  print(count2)
  print(miss)
  
  logistats<-list(truevals=count1,falsevals=count2,missing=miss)
  
}

#6. Write a function that takes as its input a data frame and returns 
#a summary of its columns using the functions you write for questions 
#3-5. You may assume that all columns will be of the three types in those 
#questions. You are expected to use the functions you have written in the 
#previous questions, so you do not have to write them again by scratch. 
#Return the desired information in a format that you deem best. 
#(One suggestion would be a named list of lists, but I leave it to your 
#judgment.)


MYnumlist<-c(5,NA,3,NA,2,NA,4,NA,1,NA,4,7,1,NA,NA)
MYcvec<-as.character(c(2,3,6,2,NA,8,1,6,NA,4,2,3,NA,6,NA))
MYlogvec<-c(TRUE,TRUE,TRUE,NA,FALSE,TRUE,FALSE,NA,TRUE,FALSE,NA,TRUE,NA,FALSE,TRUE)

MultiDF<-data.frame(MYnumlist,MYcvec,MYlogvec)

allinfo<-function(MultiDF)
{
  
  firstlist<-list(my.stat(MultiDF[,1]))
  secondlist<-list(dist_el(MultiDF[,2]))
  thirdlist<-list(logi(MultiDF[,3]))
 
  all_list<-list(firstlist,secondlist,thirdlist)
  all_list
}

