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
  filter((year == 2002 | year == 2007) & country == "Canada") # fill in the missing variables and filter values 
# when is the gdp per capita higher?

#filter and store gapminder data for only year 2007  
gapminder_2007 <- gapminder %>% 
  filter(year == 2007)  # what variable do you need to put in here? 

#table function, table(), shows observations in table  
table(gapminder_2007$country, gapminder_2007$year)
#a more useful example 
table(gapminder_2007$continent, gapminder_2007$year)


# The arrange verb 
# Arrange by life expectancy, if you can't remember column name use names() 
gapminder %>% 
  arrange(lifeExp)

#Arrange by descending order of life expectancty (hint: you need to add desc() in somewhere)
gapminder %>% 
  arrange(desc(lifeExp))  
# who has the highest life expectanct?

# filter for  year 2007 and then arranged in descending population size 
gapminder %>%
  filter(year == 2007) %>% 
  arrange(desc(pop)) 
#who has the largest population in 2007?

# mutate verb 

# Use mutate to change lifeExp to be in months
gapminder %>% 
  mutate(lifeExp = liefExp * 12)

# Use mutate to instead create a new column called lifeExpMonths
gapminder %>% 
  mutate(lifeExpMonths = lifExp*12)



# Filter, mutate, and arrange the gapminder dataset for 2007 and descending life exptancy in months 
gapminder %>% 
  filter(year == 2007) %>% 
  mutate(lifeExp = lifeExp*12) %>%
  arrange(desc(lifeExp))
# who has the highest life expectancy in 2007? 
# how would you look quickly at the lowest life expectancy? 

# arrange in the oppoisitve way 
gapminder %>% 
       filter(year == 2007) %>% 
       mutate(lifeExp = lifeExp*12) %>%
       arrange(lifeExp)
#OR 
# tail() gives you last few varibles 
tail(gapminder %>% 
  filter(year == 2007) %>% 
  mutate(lifeExp = lifeExp*12) %>%
  arrange(desc(lifeExp)))
  

### Stop here #### 
### Introduction to ggplot ####
# create gapminder dataframe filtering for year == 1952 

gapminder_1952 <- gapminder %>% 
  filter(year == 1952)

  
# scatterplot of pop and gdpPercap (change ggplot so pop is on x axis and gdpPercap is on y axis)
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()

# create scatterplot with pop on x axis and lifeExp on y axis with gapminder_1952 
ggplot(gapminder_1952,aes(x= pop, y = lifeExp)) + geom_point()

### NOTE, you don't have to write x = and y = if you put the x value first and the y second 
ggplot(gapminder_1952,aes(pop, lifeExp)) + geom_point()
### however if you wrote this the other way, lifeExp will be x axis and pop will be y   
ggplot(gapminder_1952,aes(lifeExp, pop)) + geom_point()
### R automatically assigns x first then y unless specified, see below 
ggplot(gapminder_1952,aes(y = lifeExp, x = pop)) + geom_point()
# I think it is best to always assing x then y anyways so you are consistent but 
# of course the decision is up to you 

# create same scatterplot with log scale on x axis 
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) + 
  geom_point() + scale_x_log10()

# The color aesthetic, to add in color, we add color = to aes() call 
ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() + scale_x_log10()

# The size aesthetic, allows you to map additional variables to the plot
# We add size to aes() call as well. Try is here, by making size = population 

ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp, color = continent,size = pop)) + 
  geom_point() + scale_x_log10()

# facet wrap example, add a title! 
ggplot(gapminder_1952, aes(pop, lifeExp)) + geom_point() + 
  scale_x_log10() + 
  facet_wrap(~continent) + ggtitle("My title")

## Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year

# Summarize

#Use summarize to find the median life expectancy and total population size 
gapminder %>% 
  summarize(mlexp = median(lifeExp))

#Filter for 1957 then summarize the median life expectancy and max gdp per capita 
gapminder %>% 
  filter(year == 1957) %>% 
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))


#Group_by 
#Find the median life expectancy (lifeExp) and maximum GDP per capita (gdpPercap) 
#within each year, saving them into medianLifeExp and maxGdpPercap, respectively
 gapminder_median_and_max <- gapminder %>%
    summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
 
medianLifeExp <- gapminder %>%
   summarize(medianLifeExp = median(lifeExp))

maxGdpPercap <- gapminder %>%
  summarize(maxGdpPercap = max(gdpPercap))
 
# notice what you see in your environment. whats the differnece between these three?   

#Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
  filter(year == 1957) %>% 
  group_by(continent) %>% 
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))


#Find median life expectancy and maximum GDP per capita in each continent/year combination

gapminder %>%
  group_by(continent, year) %>% 
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

#Set up by_year as data_frame with median life expectancy and maxgdppercap 
#grouped by year 
by_year <- gapminder %>% 
  group_by(year) %>% 
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
#Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year, aes(year, medianLifeExp)) + geom_point()

## notice y axis doesn't start at 0, can fix this with ylim
ggplot(by_year, aes(year, medianLifeExp)) + geom_point() + ylim(0,75)
## other methods include expand(), look these up on ggplot help page! 

  
#Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>% 
  group_by(year, continent) %>% 
  summarize(medianLifeExp = median(lifeExp))

#Plot the change in medianGdpPercap in each continent over time, where continent is color 
ggplot(by_year_continent, aes(year, medianLifeExp, color = continent)) + geom_point()

#replace geom_point with geom_line, you've made a line plot! 
ggplot(by_year_continent, aes(year, medianLifeExp, color = continent)) + geom_line()

## extra for you here 
ggplot(by_year_continent, aes(year, medianLifeExp, color = continent)) + geom_line() + 
  ylab("Median Life Expectancy") + xlab("Year") + ggtitle("My plot yay! \n") + #\n makes the script start a new line, give sspace between title and plo
  theme_bw() + # makes background black and white
  labs(color = "New legent title") + theme(legend.position = "bottom") # can move legend position




