53 + 23
53 +
23
53 +
3 + 5 * 2

3 + 5 * 2
(3 + 5) * 2
LOG(1) # natural logarithm
log(1) # natural logarithm
log10(10)
exp(0.5) # exponent

# variable assignment
x <- 1/40
x
log(x)
x <- 100
x <- x+1
x
x
y <- x * 2
# naming
# periods.between.words
# underscores_between_words
# camelCaseToSeparateWords
# can't start with a number
# can't start with a symbol
# can't use equation signs like + -
.mass <- 3
# period in .mass creates a hidden variable
# underscores between words is preferred
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
# can highlight several lines of code
# and then ctrl enter to run them all at once
# that's running a code chunk
# can copy and paste code from elsewhere and
# run the code chunk
mass
age

#vectorization
1:5
2^(1:5)

x <- 1:4
y <- 5:8
x + y

# managing our environment
ls()
# ls () will print the names of all the stored variables
ls
# ls is a function. if you just run the name of a function
# r will give you info about that function
# rm command will remove a variable from the list
rm (age)
ls()
rm(list = ls())
ls()


# R packages
installed.packages()
# R comes with some packages already installed
# installed.packages() will give a list of packages
# that are installed
# or can click on Packages tab on lower R windowpane

#can update a specific package with 
update.packages("packagename")

# for reproducibility of code its better to install or 
# update packages using this script box so its documented

install.packages("gapminder")

# package names need to be in quotes

# once a package is installed you don't have to do again
# but need to make it available using library function

library(gapminder)

# when calling a package in library doesn't need quotes


installpackages("ggplot2")
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)
library(ggplot2)

# its a good idea to put all the library functions at the
# top of a script so if you share it with anyone they
# can see what's used. also good to put a comment
# to explain why its needed

# project in top right corner creates dedicated directory

# getting help
help(ls)
# help function opens a new tab to the right with info
?ls
# question mark does same thing
?rm

# fuzzy search if you cant remember the name of a function
??read.ta

vignette("coin")

# stack overflow
?dput
sessionInfo()
# sessionInfo() will tell you all the current info about
# versions etc if you need help troubleshooting

# Data Structures

# make a data frame

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
cats

cats$weight
cats$coat
cats$weight + 2

cats$weight + cats$coat
class(cats$weight)
class(cats$coat)
str(cats)
str(cats$coat)
cats$coat

# factors default ordered alphabetical
# change order of factors
cats$coat_reorder <-factor(x = cats$coat,
                           levels = c("tabby", "calico", "black"),
                           ordered = TRUE)

# change order of factors
cats$coats_reorder <- factor(x = cats$coat, 
                             levels = c("tabby", "calico", "black"), 
                             ordered = TRUE)

str(cats$coats_reorder)
levels(cats$coats_reorder)

write.csv(x = cats, file = "data/feline_data.csv")

# Exploring Data Frames
# read in data
gap <- read.csv(file = "data/gapminder-FiveYearData.csv")

cats <-read.csv(file = "Data/feline_data.csv")

head(gap)
str(gap)

nrow(gap)
ncol(gap)
dim(gap)
colnames(gap)


# subsetting data
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
x
names(x) <- c("a", "b", "c", "d", "e")
x

# can access single parts of a vector
x[1]
x[3]
x[c(1, 3)]

# slices

x[1:4]

# will give us the first four numbers in the vector called x

x[-2]
x[-(2:4)]

# subsetting gapminder data
head(gap[1])
head(gap[pop])
head(gap["pop"])
head(gap[, 1])

gap[3, ]

# the gap[, 1] shows first six rows for column 1.
# the gap [3, ] shows row 3 in dataframe gap

gap[138, ]

# if only want data from albania, last four columns

albania <- gap[13:24, 3:6]

# makes new table of just this data and can be saved as a csv


afghanistan <- gap[1:12, ]

afghanistan

cats$coat_reorder <-factor(x = cats$coat,
                           levels = c("tabby", "calico", "black"),
                           ordered = TRUE)

# factor is used for creating categories, so it's not needed for simply
# multiplying or adding columns in a table


afghanistan$gdp <-afghanistan$pop * afghanistan$gdpPercap

write.csv(x = afghanistan, file = "results/afghanistan.csv")

str(afghanistan)
colnames(afghanistan)

# ------------------------------------------------------------#
# ------------------------------------------------------------#

# DAY TWO - CONDITIONAL STATEMENTS, FUNCTIONS, AND GGPLOT

# conditinoal statements

number <- 37
if (number > 100){
  print("greater than 100")
} else {
  print("less than 100")
}
print("finished checking")

#comparison operators:
# greater than >
# less than <
# equal to ==
# not equal to !=
# greater than or equal to >=
# less than or equal to <=

number <- 120
if (number > 100){
  print("greater than 100")
  }

# more than one test in a conditional statement

if (number > 0){
  print(1)
} else if (number <0){print(-1)} else{print(0)}

# combine tests

number1 <- 15
number2 <- 40

# and

if (number1 >= 0 & number2 >= 0){
  print("both numbers are positive")
} else{print("at least one is negative")
  }

# or

if (number1 >= 0 | number2 >= 0){
  print("at least one number is positive")
} else{print("both numbers are negative")
}

number1 <- -15
number2 <- 40
if (number1 >= 0 | number2 >= 0){
  print("at least one number is positive")
} else{print("both numbers are negative")
}

# creating and using functions

fahr_to_kelvin <- function(temp){
  kelvin <-((temp - 32) *(5 / 9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin(32) # freezing point
fahr_to_kelvin(212) # boiling point

kelvin_to_celsius <- function(temp){
  celsius <-temp - 273.15
  return(celsius)
}

kelvin_to_celsius(0) # absolute zero

# variable scope means any variable that is defined within the function
# as in within the curly braces, stays within the function
# so we don't overwrite anything in the Global Environment

# mixing and matching functions

fahr_to_celsius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celsius(temp_k)
  return(temp_c)
}

fahr_to_celsius(32)
fahr_to_celsius(95)

# nesting function
kelvin_to_celsius()


kelvin_to_celsius <- function(temp){
  celsius <-temp - 273.15
  return(celsius)
}

CtoF <- function(temp){
  fahrenheit <- ((temp*9)/5) +32
  return(fahrenheit)
}

CtoF(20)

# ----------------------------------------------------#
# making reproducible graphics
# ----------------------------------------------------#

library(ggplot2)

# read in some data
read.csv(file = "data/gapminder-FiveYearData")
read.csv(file = "data/gapminder-FiveYearData.csv")

gap <- read.csv(file = "data/gapminder-FiveYearData.csv")
head(gap)
plot(x = gap$gdpPercap, y = gap$lifeExp)

# ggplot image

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp))

# aes tells ggplot which axes we want to plot
# next, geom_point tells it to make a point graph with the data

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp)) + 
  geom_point()


plot(x = gap$year, y = gap$lifeExp)

ggplot(data = gap, aes(x=gap$year, y = gap$lifeExp)) + geom_point()

head(gap)

ggplot(data = gap, aes(x = gap$year, y = gap$lifeExp, by = country,
                       color = continent)) + 
  geom_line()+
  geom_point()

# because we wrote geom_line and then geom_point it plotted lines first
# and points on top of lines
# we can take the points out of the aesthetic so they aren't colored
# take color out of the global aes and move it to the geom_line layer


ggplot(data = gap, aes(x = gap$year, y = gap$lifeExp, by = country
                       )) + 
  geom_line(aes(color = continent))+
  geom_point(color = "blue")


ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp)) + 
  geom_point()

# outliers make this hard to read
# so we can change scale

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp)) + 
  scale_x_log10() +
  geom_point()

# can change transparency of points if lots are overlapping


ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp)) + 
  scale_x_log10() +
  geom_point(alpha = 0.5)

# then can add a trendline with linear method of smoothing

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp)) + 
  scale_x_log10() +
  geom_point(alpha = 0.5) + 
  geom_smooth(method = "lm")

# can change line thickness

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp)) + 
  scale_x_log10() +
  geom_point(alpha = 0.5) + 
  geom_smooth(method = "lm", size = 4)

# can add titles, change background or change theme 

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp)) + 
  scale_x_log10() +
  geom_point(alpha = 0.5) + 
  geom_smooth(method = "lm")+
  theme_bw()+
  ggtitle("Effects of per-capita GPD on Life Expectancy") + 
  xlab("GDP per capita ($)") + 
  ylab("Life Expectancy (Yrs)")

# can export the graph as pdf or to clipboard but more reproducible to
# use code

# can use ?ggsave to see list of arguments and options for saving

ggsave(file = "results/life_expectancy.pdf")


#faceting

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp, color = continent)) + 
  geom_point() + 
  scale_x_log10() +
  geom_smooth(method = "lm") +
  facet_wrap(~year)

# Day 2 Part 2 with James 

##### Data Manipulation #####

# Make sure packages are installed
install.packages(c("tidyr", "dplyr", "knitr", "rmarkdown", "formatR"))

library(dplyr) # Needed for subsetting data
library(tidyr) # Needed for reshaping data
library(ggplot2) # Needed for graphing

# Read in our dataset
gap <- read.csv(file = "data/gapminder-FiveYearData.csv")

#### dplyr ###

head(gap)
yr_country_gdp <- select(gap, year, country, gdpPercap)
head(yr_country_gdp)

# %>% is a "pipe" that sends data to another function
yr_country_gdp <- gap %>% select(year, country, gdpPercap)
head(yr_country_gdp)

# so now these three columns in gap are the first argument in select

# can subset data by rows using "filter"

yr_country_gdp_eu <- gap %>% 
  select(year, country, gdpPercap) %>%
  filter(continent == "Europe")

# get error because order of operations is reversed - can't choose continent
# because only have year, country, gdpPercap columns

yr_country_gdp_eu <- gap %>% 
  filter(continent == "Europe")%>%
  select(year, country, gdpPercap)

africa_2007 <- gap %>%
  filter(continent == "Africa", year == "2007")%>%
  select(year, country, lifeExp)

nrow(africa_2007)
dim(africa_2007)

# Filters don't cancel each other out, so can do like this
africa_2007 <- gap %>%
filter(continent == "Africa")%>%
filter(year == "2007")%>%
  select(year, country, lifeExp)

nrow(africa_2007)

# figure out meanGDP

mean_gdp <- gap %>% 
  summarize(meanGDP = mean(gdpPercap))

mean_gdp
mean(gap$dgpPercap)
mean(gap$gdpPercap)

gpd_by_cont <- gap %>%
  group_by(continent) %>%
  summarize(meanGDP = mean(gdpPercap))

gdp_by_cont
gpd_by_cont

gdp_by_cont <- gap %>%
  group_by(continent, year) %>%
  summarize(meanGDP = mean(gdpPercap),
                           sd_gdp = sd(gdpPercap),
            mean_pop = mean(pop),
            sample_size = n()
  )

gdp_by_cont



#put resulting table gdp_by_cont back in regular data frame

gdp_by_cont %>%
  data.frame() %>%
  head()

gdp_by_cont %>%
  ggplot(aes(x = mean_pop, y = meanGDP)) +
  geom_point()

# can't do + in dplyr or %>% in ggplot, make sure you don't mix em up
# mutate is how we make new columns

#express gpd by billion per people


gap <- read.csv(file = "data/gapminder-FiveYearData.csv")

bill_gdp <- gap %>%
  filter(year == "2007") %>%
  mutate(bill_gdp) = gdpPercap * pop / 10^9


gap_wide <- read.csv(file = "data/gapminder_wide.csv")
gap_wide

gap_long <- gap_wide %>%
  gather(obstype_year, obs_values, starts_with('pop'),
         starts_with('lifeExp'), starts_with('gdpPerCap'))
head(gap_long)
str(gap_long)

gap_long <- gap_long %>%
  separate(obstype_year, into = c("obs_type", "year"),
           sep = "_")


head(gap_long)
str(gap_long)

# unite is the opposite of separate

wide <- gap_long %>%
  unite(var_names, obs_type, year, sep = "_") %>%
  spread(var_names, obs_values)

head(wide)
structure(wide)
str(wide)

