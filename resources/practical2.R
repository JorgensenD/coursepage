#### Practical 2 ####

# install packages into R #
install.packages("gapminder")
install.packages("dplyr")
install.packages("ggplot2")

# load newly installed packages into R 
library(gapminder) #dataset we are using 
library(dplyr) # tidyverse package for cleaning and manipulating data
library(ggplot2) # data visualisation 

#load gapminder data 
gapminder # tibble is a type of dataframe stored in R 

# store gapminder in the enviroment 
gapminder <- gapminder # normal not necessary but is a dummy dataset so won't store automatically

# structure function, str(), shows structure of gapminder
str(gapminder)

#names() prins the name of columns in console in case you forget 
names(gapminder)

#head function, head(), shows first few rows
head(gapminder)
head(gapminder$year)

#tail function, tail() shows last few rows
tail(gapminder)
tail(gapminder$country)

#select rows, in this case, all rows with continent Africa, all columns
gapminder[gapminder$continent == "Africa",]

#select all rows, only year column 
gapminder[, "year"]

#unique values in country
unique(gapminder$country)

#order unique values (very useful with big data)
sort(unique(gapminder$year))


# FILTER VERB 
# example, filter for continent == Oceania and year == 2002
gapminder %>% 
  filter(year == 2002 & continent == "Oceania")
# what do you see?

# same thing with comma 
gapminder %>% 
  filter(year == 2002, continent == "Oceania")

# example filter, filter for Germany and France in 2002 
gapminder %>% 
  filter(year == 2002 & (country == "Germany" | country == "France")) # | means or 
# who had a larger population in 2002?

# filter for Canada in 2002 and 2007 
gapminder %>% 
  filter() # fill in the missing variables and filter values 
# when is the gdp per capita higher?

#filter and store gapminder data for only year 2007  
gapminder_2007 <- gapminder %>% 
  filter()  # what variable do you need to put in here? 

#table function, table(), shows observations in table  
table(gapminder_2007$country, gapminder_2007$year)


# The arrange verb 
# Arrange by life expectancy, if you can't remember column name use names() 
gapminder %>% 
  arrange()

#Arrange by descending order of life expectancty (hint: you need to add desc() in somewhere)
gapminder %>% 
  arrange()  
# who has the highest life expectanct?

# filter for  year 2007 and then arranged in descending population size 
gapminder %>%
  filter() %>% 
  arrange() 
#who has the largest population in 2007?

# mutate verb 

# Use mutate to change lifeExp to be in months
gapminder %>% 
  mutate(lifeExp = )

# Use mutate to instead create a new column called lifeExpMonths
gapminder %>% 
  mutate(lifeExpMonths = )



# Filter, mutate, and arrange the gapminder dataset for 2007 and descending life exptancy in months 
gapminder %>% 
  filter() %>% 
  mutate() %>%
  arrange()
# who has the highest life expectancy in 2007? 
# how would you look quickly at the lowest life expectancy? 


### Stop here #### 
### Introduction to ggplot ####
# create gapminder dataframe filtering for year == 1952 

gapminder_1952 <- 

  
# scatterplot of pop and gdpPercap (change ggplot so pop is on x axis and gdpPercap is on y axis)
ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# create scatterplot with pop on x axis and lifeExp on y axis 
ggplot(,aes()) + geom_point()
  
# create same scatterplot with log scale on x axis 

# The color aesthetic, to add in color, we add color = to aes() call 
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() + scale_x_log10()

# The size aesthetic, allows you to map additional variables to the plot
# We add size to aes() call as well. Try is here, by making size = population 

ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent,size = pop)) + 
  geom_point() + scale_x_log10()

# facet wrap example, add a title! 
ggplot(gapminder_1952, aes(pop, lifeExp)) + geom_point() + 
  scale_x_log10() + 
  facet_wrap(~continent)

## Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year

# Summarize

#Use summarize to find the median life expectancy and total population size 
gapminder %>% 
  summarize( = median())

#Filter for 1957 then summarize the median life expectancy and max gdp per capita 

#Group_by 
#Find the median life expectancy (lifeExp) and maximum GDP per capita (gdpPercap) 
#within each year, saving them into medianLifeExp and maxGdpPercap, respectively


#Find median life expectancy and maximum GDP per capita in each continent in 1957


#Find median life expectancy and maximum GDP per capita in each continent/year combination


#Set up by_year as data_frame with median life expectancy and maxgdppercap 
#grouped by year 
by_year <- gapminder %>%

#Create a scatter plot showing the change in medianLifeExp over time

  
  
#Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

#Plot the change in medianGdpPercap in each continent over time, where continent is color 



#replace geom_point with geom_line, you've made a line plot! 





