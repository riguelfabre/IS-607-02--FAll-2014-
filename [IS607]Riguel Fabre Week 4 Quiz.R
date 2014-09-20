#1. Show an appropriate visualization that displays the total number of movies for each decade.

movie_data <-("C:/Users/Tablet/Documents/R/Data Files/movies.tab")
movies <- read.table(movie_data, sep="\t", header=TRUE, quote="", comment="")

movies[4:17] <- list(NULL)

a <-subset(movies, year<=1899)
b <-subset(movies, year >1899 & year<=1909)
c <-subset(movies, year >1909 & year<=1919)
d <-subset(movies, year >1919 & year<=1929)
e <-subset(movies, year >1929 & year<=1939)
f <-subset(movies, year >1939 & year<=1949)
g <-subset(movies, year >1949 & year<=1959)
h <-subset(movies, year >1959 & year<=1969)
i <-subset(movies, year >1969 & year<=1979)
j <-subset(movies, year >1979 & year<=1989)
k <-subset(movies, year >1989 & year<=1999)
l <-subset(movies, year >2000 & year<=2010)




MovDec<- c("1890s"=(nrow(a)),"1900"=(nrow(b)),"1910"=(nrow(c)),"1920"=(nrow(d)),"1930"=(nrow(e)),"1940"=(nrow(f)),"1950"=(nrow(g)),"1960"=(nrow(h)),"1970"=(nrow(i)),"1980"=(nrow(j)),"1990"=(nrow(k)),"2000"=(nrow(l)))
barplot(MovDec, main="Movies thru the Decades", xlab="Decades",ylab="# of Movies") 

#2. Show the average IMDB user rating for different genres of movies? Has this changed over time?

Act<-subset(movies, Action==1)
Ani<-subset(movies, Animation==1)
Doc<-subset(movies, Documentary==1)
Dra<-subset(movies, Drama==1)
Com<-subset(movies, Comedy==1)
Rom<-subset(movies, Romance==1)
Sho<-subset(movies, Short==1)

Avr_rat<-data.frame("Action"=mean(Act$rating),"Animation"=mean(Ani$rating),"Com"=mean(Com$rating),"Documentary"=mean(Doc$rating),"Drama"=mean(Dra$rating),"Romance"=mean(Rom$rating),"Short"=mean(Sho$rating))

#3. Is there a relationship between length of movie and movie rating?
plot(movies$length ~ movies$rating, data = movies)

# Looking at this plot, you can see that there isn't a relationship
# between length and ratings


#4. Is there a relationship between length of movie and genre?
Avr_lgth<-data.frame("Action"=mean(Act$length),"Animation"=mean(Ani$length),"Com"=mean(Com$length),"Documentary"=mean(Doc$length),"Drama"=mean(Dra$length),"Romance"=mean(Rom$length),"Short"=mean(Sho$length))

#Shorts are the shortest by average and and Romances are the longest.
# Animations come in as the second shortest while Action and and Drama
#round out as the second and third longest by average. Comedies and
# Documentaries are are very close in movie lengths.



#5. Which other variable best predicts total number of votes that a movie received.
plot(rating ~ votes, data=movies)

# rating would be the next best predictor of votes


