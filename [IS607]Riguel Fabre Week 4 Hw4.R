#For my interpretation for the best top movie years is to focus on
# the best ratings for movies each year. I would need to norrow down
# the years with the most best rated movies.

#Read in movie data from tab file and place it into a Data Frame
movie_data <-("C:/Users/Tablet/Documents/R/Data Files/movies.tab")
movies <- read.table(movie_data, sep="\t", header=TRUE, quote="", comment="")


#Extract the title, year and rating columns from the data frame
#since thats all we need
mv<-movies[,c("title","year","rating")]

#Order mv by rating in acending order
mv<-arrange(mv, rating)

#Subset only the movies that are 9.0 or higher. I feel that 
#anything below a 9.0 is not consider a best movie
high_rate<-subset(mv, rating >=9.0)

#I create a table with a count of best movies per year
most_yr_count<-count(high_rate, "year")

#I order most_yr_count by freq in acending order
most_yr_count<-arrange(most_yr_count, freq)


#Grab the top five years that have the most best movie years
top_five_yr<-most_yr_count$freq[59:63]

#Put each year with their respective year name
t<-c("1999"=top_five_yr[1],"2002"=top_five_yr[2],"2005"=top_five_yr[3],"2003"=top_five_yr[4],"2004"=top_five_yr[5])

#Plot the top five best movie years and compare them in a bar chart
barplot(t, main="Top five best movies years", xlab="Year",ylab="# of high rated Movies")

#Grabs the year with the most best movies
most_yr_max<-most_yr_count[which.max(most_yr_count$freq),1]

#creates a table with the movies from the year that had the most best movies
yr_with_most<-subset(high_rate, year==most_yr_max)
