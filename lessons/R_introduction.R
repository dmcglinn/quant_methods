## arithmetic ------------------------------------------------------------------

3 + 4

3 > 4

3 != 4

3 == 4

3 == 3

## variable assignment ---------------------------------------------------------

# you can use "<-" or "=" to assign a value to a variable
weight_kg <- 55

# print the value of the variable by simply calling its name
weight_kg

# weight in pounds:
2.2 * weight_kg

weight_kg <- 57.5
# weight in kilograms is now
weight_kg

weight_lb <- 2.2 * weight_kg
# weight in kg...
weight_kg
# ...and in pounds
weight_lb

weight_kg <- 100.0
# weight in kg now...
weight_kg
# ...and in weight pounds still
weight_lb

## Reading in Data-------------------------------------------------------------

# first check what your working directory is:
getwd()
# [1] "/home/danmcglinn/Dropbox/teaching/quant_methods"
# because I have setup a Project in the quant_methods folder I can make my
# path's releative to this location.

# let's read in the datafile "inflammation-01.csv" which is located in the
# directory: "/home/danmcglinn/Dropbox/teaching/quant_methods/data".  Because
# my working directory is already set to:
# "/home/danmcglinn/Dropbox/teaching/quant_methods/" I can shorten the path to
# "./data/inflammation-01.csv"
 
dat <- read.csv(file = "./data/inflammation-01.csv", header = FALSE)

## Using the help --------------------------------------------------------------

# above we used the function "read.csv" to find out more about this function see
?read.csv 
# or equivalently 
help(read.csv) 
# to do a fuzzy help search use
help.search('read') 
help.search('csv')

## Visual examination of data --------------------------------------------------

# visual summary of first 6 rows
head(dat)
# visual summary of last 6 rows
tail(dat)

# what kind of object is dat
class(dat)

# what are the dimensions of dat
dim(dat)

## Subseting portions of the data-----------------------------------------------
# first value in dat
dat[1, 1]

# middle value in dat
dat[30, 20]

# chunk of data in dat
dat[1:4, 1:10]

# select specific rows and columns
dat[c(3, 8, 37, 56), c(10, 14, 29)]

# all columns from row 5
dat[5, ]
# all rows from column 16
dat[ , 16]
dat[1:nrow(dat), 16]

## Compute summary statistics on data-------------------------------------------
# first row, all of the columns
patient_1 <- dat[1, ]
# max inflammation for patient 1
max(patient_1)

# max inflammation for patient 2
max(dat[2, ])

# minimum inflammation on day 7
min(dat[, 7])

# mean inflammation on day 7
mean(dat[, 7])
# median inflammation on day 7
median(dat[, 7])
# standard deviation of inflammation on day 7
sd(dat[, 7])

summary(dat[ , 7])

## Aggregate information across rows or columns---------------------------------
# Thus, to obtain the average inflammation of each patient we will need to
# calculate the mean of all of the rows (`MARGIN = 1`) of the data frame.

avg_patient_inflammation <- apply(dat, 1, mean)

# And to obtain the average inflammation of each day we will need to calculate
# the mean of all of the columns (`MARGIN = 2`) of the data frame.

avg_day_inflammation <- apply(dat, 2, mean)


# standard deviation of day
sd_day_inflammation <- apply(dat, 2, sd)

# standard deviation of patients
sd_patient_inflammation <- apply(dat, 1, sd)

## Plot data--------------------------------------------------------------------
# use the function plot() to plot data
?plot
# provides a long list of potential arguments and examples
# at a minimum you must provide a single quantitative variable, for example:
plot(avg_day_inflammation)
# notice how R fills in lots of pieces of missing information automatically. 
# specifcially it assumes that the independent variable is simply an index from
# 1 to the length of the object in this case avg_day_inflamation. A safer more 
# clear way to accomplish the same plot is to use the following:

plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='day', 
    ylab='inflammation')

# this makes it clearer that the x-variable is simply an index from 1 to the
# length of avg_day_inflammation, and it makes the x and y axis labels more 
# sensical. 

# to output multi-panel plots use for example
par(mfrow=c(1,2))
# which will create a single plotting row with two columns
plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='day', 
     ylab='inflammation')
plot(1:length(avg_patient_inflammation), avg_patient_inflammation,
     xlab='patient identity', ylab='inflammation')

# to output the figure to file you can use Rstudio's GUI features or you can use
# the command line which is what I recommend so that the code is fully 
# reproducible:

pdf('./lessons/inflammation_fig1.pdf')
par(mfrow = c(2,1))
plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='Day',
     ylab='Inflammation', frame.plot=F, col='magenta', pch=2, cex=2)
plot(1:length(avg_patient_inflammation), avg_patient_inflammation,
     xlab='patient identity', ylab='inflammation', col='dodgerblue')
dev.off()







