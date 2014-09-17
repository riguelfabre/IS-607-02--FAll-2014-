
#entropy Project
#Riguel Fabre


entropy<-function(p){
  
  if (min(p) < 0 || sum(p) <= 0)
    return(NA)
  p.norm <- p[p>0]/sum(p)
  -sum(log2(p.norm)*p.norm)
  
  
  
}



infogain<-function(target, attribute){
  
  count <- 0
  info <- c()
  group_A <- c()
  x <- 1
  y <- 1
  dist <- unique(attribute[!is.na(attribute)])
  distlght <- length(dist)
    
    
    for(x in 1:distlght)
    {
      for(y in 1:length(attribute))
      {
        if(attribute[y] == dist[x])
        {
          group_A <- c(group_A,target[y])    
        }
      }
      count <- length(group_A)
      probability <- count/length(target) 
      entropy <- entropy(group_A)  
      info <- c(info,probability*entropy)
      group_A <- c()
      y <- 1
    }
    all_info <- (entropy(target) - sum(info))
    
    return(all_info)

  
}


decide<-function(input, in_target){
  
    decision <- list(max=NA, gains=NA)
    gainList <- data.frame()
    for(i in 1:length(input))
    {
      if(i == in_target)
      {
        i <= i + 1
      }
      else
      {
        gainList[1,i] <- infogain(input[,in_target],input[,i])
        colnames(gainList)[i] <- names(input)[i]
      }
    }
    max <- which.max(gainList)
    decision["max"] <- max
    decision["gains"] <- list(gainList)
    
    return(decision)
  
  
}



#*************************Testing*************************


location <- "C:/Users/Tablet/Documents/R/Project/entropy-test-file.csv"
datafile <- read.table(file = location, header = TRUE, sep = ",")

entropy(datafile$answer)

infogain(datafile$answer,datafile$attr1)
infogain(datafile$answer,datafile$attr2)
infogain(datafile$answer,datafile$attr3)

decide(datafile,4)


