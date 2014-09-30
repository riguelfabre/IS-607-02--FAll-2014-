library(tidyr)
library(dplyr)
library(plyr)


#1. Write down 3 questions that you might want to answer based on this data.

#A) What are the total people that said Yes in the Study
#B) What is the ratio of Yeses to Noes
#C) Which age group had the most responses


#2. Create an R data frame with 2 observations to store this data in its current "messy" state. Use whatever method you want to re-create and/or load the data.

Edinburge<-data.frame(c("YES","NO"),c(80100,35900),c(143000,214800))

Glasgow<-data.frame(99400,150400)
Glasgow<-rbind(Glasgow, c(43000,207000))
Full<-cbind(Edinburge,Glasgow)
colnames(Full) <- c("Answers","Edinburge 16-24","Edinburge 25+","Glassgow 16-24", "Glassgow 25+")





#3. Use the functionality in the tidyr package to convert the data frame to be "tidy data."

Full2<-Full%>%gather(AgeGroup,Population, 2:5)

Full3 <- Full2 %>%
    separate(AgeGroup, c('Group','Age'), sep =" ") 
#4. Use the functionality in the plyr package to answer the questions that you asked in step 1.

#Answer for Question A
Yesans<-subset(Full3, Answers=="YES")

Yes<-sum(take(Yesans, 2, 4))

#Answer for Question B
Noans<-subset(Full3, Answers=="NO")

NO<-sum(take(Noans, 2, 4))

cat("The Ratio of Yeses to Noes is",Yes,":",NO) 
  
#Answer for Question C

MostAns<-Full3[which.max(Full3$Population),]


#5. Having gone through the process, would you ask different questions and/or change the way that you structured your data frame?

# I probably would of asked a different question. Having to use plyr
# on the tidy data was a bit difficult.
