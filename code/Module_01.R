#-------------------#
#MB5370: Thechniques in Marine Science 1
#Programming Fundamentals
#Brihatee
# 15 September 2026

#--------------#
#Workshop 01. Introduction ####

#1.1 R syntax and working in scripts ####
##this section introduces us to R by running simple calculations inside a script

#Indexed outputs
#running simple calculations
2+1

#index
#[1] will give first value of result
##important when you get lots pf results from your code
1:30

#incomplete lines of code
##the code will not work if incomplete e.g 6*
##need to fix to 6*2
6*2

#syntax error
6*2
##fix the error to 6*2


#1.2 functions and arguments ####

#using built in functions of round and floor
#using round and floor
years_old <- 25.7  #defines that year_old is 25.7
round(years_old)  #rounds up the number to highest number-26
floor(years_old)  #rounds the number to lowest- 25

#arguments
##if round has an argument it allows you to specify how many decimal placesto round number to
years_old <- 25.765
round(years_old, 2) #comma is used after the object to specify the argument

?round #used to go into help to know how to use the function

args(round) #shows how to use arguments in the console


#1.3 Objects and the assignment operator ####
##section will introduce to the types of data that programming languages know
##focuses on understanding how data is stored in R and why it matters

#assignment operator
##using the <- means that R saves the number on the right hand side into the object on the left hand side
##e.g years_old <- 25.7 means that years_old= 27.5

#saving a single value
coral_count <- 42

#saving a vector of multiple fish lengths (in mm)
fish_lengths <- c(124,152,98,221,146)

##shortcut to add <- is ALT+-

#manipulating objects 
##when r encounters an object, it will substitute it with the data saved inside the object
coral_count + 1
coral_count + coral_count

##also cases matter! will identify as a different object
Coral_Count <- 1
coral_count + Coral_Count

#object naming rules
##cannot use a number at the beginning of an object name
##cannot use special symbols including spaces
##object names are case sensitive and some things are reserved only for the programme e.g for and if

#01_age <- 25 #starts with number
#!_age <- 25 #starts with special character
#coral count <- 25 #there is space

#using back ticks will make it readable
`coral count` <-  25 #not recommended- makes difficult to read

#1.4 Debugging code ####

# Field survey data
quadrat_area_m2 <- 0.25
number_of_quadrats <- 16
total_area_surveyed <- quadrat_area_m2 * number_of_quadrats

# Let's print out the result
#print(total_area_surveyd) #error in total_area_surveyed
print(total_area_surveyed)

#1.5 Packages ####
#installing and loading packages
#practice: install tidyverse

#load the package to access it and use the package
##use function library(tidyverse) to load into current session
##or just on right hand side pick packages and search for the package and tick it
##if you need only one package from tidyverse you can load them individually
## e.g library (dplyr) and library (ggplot2)

#getting help with packages
##easiest way is to use ? e.g. ?round

#1.6 Data types ####

##R categorises data to know what mathematical operations or transformations are permitted. 
##four primary atomic vectors:
##1. Numeric (numeric / double): Continuous decimals (e.g., pH levels: 8.1, 7.95).
##2. Integer (integer): Whole numbers (e.g., count of sea turtles spotted: 5L)
##3. Character (character): Text strings enclosed in quotation marks (e.g., species name: "Acanthaster planci").
##4. Logical (logical): Boolean values that are either TRUE or FALSE (e.g., Bleaching observed: TRUE).

#checking structures #
##R includes checking functions like class() and str() (structure) to verify your data categories

# Assign variable values
site_name <- "Heron_Island"
transect_depth_m <- 12.5
bleaching_present <- TRUE

# Check using function class()
class(site_name)
class(transect_depth_m)
class(bleaching_present)

# Check using function str()
str(site_name)
str(transect_depth_m)
str(bleaching_present)

#rounding numbers #
##task: identify spelling and fix mismatch

# Tracking the age of an old-growth Porites coral colony
years_old <- 25.765

# Clean this up for our summary report
round(years_old, 2) #fixed olld

#manipulating outputs #

# Make variables
years_old <- 25.765
rounded_age <- round(years_old, 1)

# Combine text and data variables
paste("Average colony age is", rounded_age, "years old")

##if the field protocol is one decimal place, correct the round() function to match the field protocol

#1.7 Data structures ####

##Elements of data types can be combined to form a data structure
##Elements may be something that you would put in a single cell in excel
##Data structure would then be the whole spreadsheet

##R has many data structures- atomic vector, list, matrix, data frame, factors
##vector is most common and considered the workhorse of R
##vector= collection of elements that are most commonly of the type character, numeric, integer, logical.
##all elements inside vector must be of same type

#vector with numeric elements
fish_lengths <- c(124, 152, 98, 221, 146)

#vector full of character elements
coral_spp <- c("Porites", "Acropora", "Montastrea")

#Vectors #

##What happens when you interrogate the type of your character vector?

class(fish_lengths) #vector is numeric
class(coral_spp) #the vector is character

#What happens if you try to make a vector of mixed variable types?

notes <- c("Acropora", 27.5, TRUE)

#Lists #

##unlike vectors, values inside list can be of several types

notes <- list("Acropora", 27.5, TRUE)
notes #will show in console 

##The great thing about lists and vectors is that you can retrieve individual elements using double square brackets to reference their index.

notes[[1]] #will fetch what is the first element of the list

#Data frames and tibbles # 

##In addition to data structures such as lists, R can also handle two-dimensional or “rectangular” data files
##spreadsheets are known as data frames in R
##store data in same format as excel, rows and columns
##can import data fram from external file .csv or .xlsx
##The function data.frame lets you make them by adding together some different vectors (lists in this case) and giving each one a column name.

my_data_frame <- data.frame (no = c(1,2,3), c("Plectropomus", "Scarus", "Pomacentrus"), c(TRUE, FALSE, TRUE))
my_data_frame
str (my_data_frame)

#there was errors in the lines so always check 
#changed to my_data_frame

my_data_frame$no = as.factor(my_data_frame$no)
str (my_data_frame)

#also had errors in each line 
#changed to my_data_frame


##A factor is a categorical type, so here we are telling R that column 1 is actually storing a category (a group membership, say a numeric code for which team each of these people are in) rather than a real continuous number. 
##It’s important that each vector is the same length (number of rows) because R won’t allow you to have different columns with different lengths. 
##This is where you can use NA if you need something in a cell but have no data to go in it. Some others use an obvious number (e.g. 9999) but it’s always better to use R’s “Not Available” indicator because there are functions that can interpret it, such as na.omit (remove rows with NAs) or is.na (check if a value is not available).

#1.8 RProjects and workspace architecture ####
#Directory tree
## MB5370_Module_1_Coding/
#│
#├── MB5370_Module_1_Coding.Rproj
#├── data/       <- For raw, unedited data files (CSVs, shapes, etc.)
#├── code/    <- For dirty/heavy data manipulation code
#├── output/    <- For processed tables, figures, and saved objects
#└── docs/       <- For your rendered write-ups and final documents

#Workshop 2: Visualisation ####

#2.16 Load packages and Data ####

#Data set that is already available in R
?mpg


#2.17 Create first ggplot ####

#plot data (data = mpg), size of engine (displ) on x axis and fuel efficiency (hwy) on y axis

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
 
##plot shows negative relationship btw engine size and fuel efficiency
##ggplot() creates a coordinate system that you can add layers to
##first argument of ggplot() is the dataset to use in the graph
##ggplot(data = mpg) creates empty graph
##adding more layers to ggplot 
##geom_point() adds layer of points to plot
##ggplot() has different geom functions that add different layers to a plot
##each geom function takes a map argument - defines how variables in dataset are mapped to visual properties
##The mapping argument is always paired with aes()
## the x and y arguments of aes() specify which variables to map to the x and y axes

#2.18 Understand 'grammar of graphics' ####

#1.Graphic template #

##templates help develop plots with ggplot2

#template example
##show exactly what need to offer ggplot2, how you can offer it, supporting development of you 'foundations' of data viz
##can slowly add complexity as you develop more advanced visualisation

# ggplot(data = <DATA>) + <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

ggplot() #simply provides coordinate system

ggplot(data = mpg) #created plot window but no data argument so no axis limits

#2. Aesthetic mappings #

##third variable in addition to x,y data
##class can be mapped to an aesthetic represented as aes()
## aesthetic is visual property of objects already plotted
##aesthetic incl. size, shape and colour

##when creating plot- 2 attributes of a plot - geom and aesthetics

##can map colours of your point to class variable to reveal class of each car

#to map aesthetic
##associate name of aesthetic to name of variable inside aes()
##ggplot2 automatically assigns a unique level (colour) to each unique value of variable


#changing point colour by class

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))


#size can be mapped the same way
##note: ggplot2 gives you at least a little bit of guidance about what makes good data visualisation
## don't plot a variable which is not continuous to a continuous aesthetic like size

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
## gives warning that size is a discrete variable and is not advised to use


#mapping transparency (alpha)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#mapping shape by class

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#the properties can be set manually
##e.g. offering a number or colour 

#making the points blue

##simply changes the appearance of plot
##does not show anything about nature of variable
##range of manual aesthetics to alter appearance of plot
##1.name of colour as a character string
##2.size of point in mm
##3.shape of point as a number

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy,displ < 5))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,colour = displ < 5))

#2.19 Troubleshooting ####

#ggplot(data = mpg) 
#+ geom_point(mapping = aes(x = displ, y = hwy)) 
# the + should be on top line

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) 
# the + should be on top line


#2.20 Facet and panel plots ####

##break a single complex plot into many sub plots (or panels)
## allows you to develop separate plots for a range of reasons, most often to show a subset of your data.
## do this using facets

#use facet_wrap() for single and discrete variable in plot

## Facet wrap syntax is in the function of a formula (kind of like a linear model formula)
## the ~ dictates which variable you want to subset your data with. 


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#use facet_grid() for more than one variable
# need two variables using ~ to split them up.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

#Use a . if you do not want to facet in the rows or column dimension.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(. ~ cyl)

?facet_wrap

## note that with a tool like this, you can get very close to building publication quality plots directly in ggplot2
## at a quality where you probably don’t need to do any formatting in Microsoft Word to handle the panelling problem


#2.21 Fitting simple lines ####

##ggplot2 can use a variety of geom objects to represent the data
## can use bar plots, line charts, box plots, etc...
## can use different geom to plot same data

#Plotting smooth line #
##use geom_smooth() for smooth line

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

## geom is an object that your plot uses to represent data
## change geom function to change geom type
## try a few things and use comments to help remember what worked and what didn't

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) 
# points horrible - scattered

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) 
# smooth line

#***Change line type***  #

##same as colours, we can use variables to control it
## we have different types of dashes when we use the linetype argument with geom_smooth(), which separate the cars into three lines based on their drv (front wheel, rear wheel or 4wd) value.

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

#Using 'group' argument #

##shows the data is grouped
##won't add new legend but can be used to vary your plots by discrete variable
##set 'group' aesthetic to categorical variable to draw multiple objects

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
#no legend compared to line type 


#changing the colour of each line based on 'drv' value

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, colour =  drv), 
              show.legend = FALSE,)


#INCREASING COMPLEXITY
#Plotting multiple geoms in single plot
## add them together
## good for showing underlying data and how it relates to 'geom_smooth' line

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
#creates a plot with smooth line and points

##however!!!
##the two lines are duplicated in the code
##will have to change every x variable in the plot 
##not efficient - increase chance of error

##how to resolve!!!
##add the 'mapping =' to the ggplot argument
##makes a global mapping applied to all geom in the code



#making code more efficient to change variable in plot #

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + geom_smooth()
#reduces duplication in code
##can be used to change point styles or develop own customisations

##IMPORTANT
##'mapping =' can be used in specific layers to display differnt aesthetics
##note that the line is not styled by class 
##can style the points by themselves

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) + geom_smooth()
#smooth line with points colour coordinated based on class



##if want to specify different data for each layer
##use filter (class = "subcompact") to select subset of data and plot only that subset

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point(mapping = aes(colour = class)) + geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
#graph has points plotted with colour sorted by class, the smooth line only is for the subclass subcompact



#GEOM for different plot types
##geom for line chart = geom_smooth
##geom for boxplot = geom_boxplot
##geom for histogram = geom_histogram
##geom for area chart = geom_area

#WHAT IS THE DIFFERENCE?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
 
##same graph but first code is more efficient and less error in x and y variables



#2.22 Transformations and Stats ####

##Learning easy transformations and data summaries using another dataset 
##diamonds dataset uses information price, carat, colour, clarity and cut of each diamond

#***1. Plotting Statistics***

#first bar chart showing more diamonds available with high quality cuts than low quality cuts

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

##x axis is cut and y axis is count
##count is not part of the variable, so where it comes from?
##Many graphs, like scatterplots, plot the raw values of your dataset. Other graphs, like bar charts, calculate new values to plot
## 1. bar charts, histograms, and frequency polygons “bin” your data and then plot bin counts (the number of points that fall in each bin)
## 2. smoothers fit a model to your data and then plot predictions from the model
## 3. boxplots compute a robust summary of the distribution and then display a specially formatted box.

##The algorithm used to calculate new values for a graph is called a stat, short for statistical transformation. 

## helps visualise data without using stats models or summarising dataset

##can use geoms and stats interchangeably
##use either stat_count or geom_bar

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))
#gives barchart

##every geom has a default stat and every stat has a default geom, which means you don’t need to worry about what’s going on.

#***2.Overriding defaults in ggplot2***

##defaults are not the only thing you can do
##the fact that defaults are there in the first place can have big implications for your results, so you should always make an effort to understand any of these ‘black box’ outputs. 

##What is the default? How can it change? What’s it doing to my work?

##might want to override a default stat now that you understand what the defaults are

##Change the default stat (which is a count, a summary) to identity (which is the raw value of a variable).

##Don’t worry yet about the “tribble()” function from the code below. It’s just used to make a tibble and we will learn about those in a bit (they’re basically a dataframe).


demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
demo

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

##can override a default mapping from transformed variables to aesthetics
##can display a bar chart of the proportion of total diamon dataset instead of using count


#ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
#Warning message:`stat(prop)` was deprecated in ggplot2 3.4.0.
#Please use `after_stat(prop)` instead.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))


#**3.Plotting Statistical details*

##to be transparent- show transformations in your plot
##good practice to be transparent about uncertainty and any other limitation of your data
## can be done using 'stat_summary()'

ggplot(data = diamonds) +
  stat_summary(mapping = aes(x = cut, y = depth),
               fun.min = min,
               fun.max = max,
               fun = median)

#2.23 Aesthetic adjustments ####

##aesthetics like colour or fill can be used to convey information with plots
##used to change aspects of bar colours

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, colour = cut))
##changes the outline colour of barchart depending on category

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))
##changes the colour filled of the bar

#using aesthetics on 'clarity' variable 

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))
##stacking is done automatically
##there is a gradient in the bar chart depending on clarity of the cut
##this is done behind the scenes with a position argument

##ability to make position adjustments is vital
##allows to customise plots in 3 ways:
##1. 'identity' - raw data
##2. 'fill' - changes heights
##3. 'dodge' - forces ggplot to not stack things on top of each other


#using 'position = "identity"'
##can be used to place each object exactly where it falls in the context of the graph. 
##vital for point charts-scatterplots
##but makes a mess in bar plot- show too much info
##need to alter bar aesthetics

#to alter transparency (alpha)
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = "identity")

#to colour the bar outlines with no fill colour
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +
  geom_bar(fill = NA, position = "identity")

#'position = "fill"' works as stacking
##makes each set of stacked bars the same height 

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

#'position = "dodge"' places overlapping objects directly beside one another

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#'position ="jitter"' adds a small amount of random noise to each point to avoid overplotting when points overlap
##useful for scatterplots but not barplots.
##slightly moves points so you can see them all (especially when they overlap)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")


#2.24 The layered grammar of graphics ####

##It’s good now to update our template for making a ggplot2
##Here it is, with position adjustments, stats, and faceting (recall how facets made us panel plots of subsets?
##Most of the time you won’t need to populate all of these, because ggplot2 has defaults for most of them
## overall you have enough here to build almost any plot.

# ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(
#    mapping = aes(<MAPPINGS>),
#    stat = <STAT>, 
#    position = <POSITION>
#  ) +
#  <FACET_FUNCTION>

gitcreds::gitcreds_set()

