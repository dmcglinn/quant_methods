#' ---
#' title: Introduction to R
#' author: Dan McGlinn
#' date: '`r paste("First created on 2015-01-16. Updated on", Sys.Date())`'
#' ---

#+ echo=FALSE
library(knitr)
opts_knit$set(root.dir='../')


#' The purpose of this lesson is to introduce students to the R programming 
#' enviornment for the first time. The lesson builds off the Software Carpentry
#' Lesson developed here: 
#' http://software-carpentry.org/v5/novice/r/01-starting-with-data.html
#'
#' The source code (i.e., a plain text file containing the R code aka an Rscript
#' or .R file) for this lesson can be downloaded
#' here: https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/lessons/R_introduction.R
#'
#' ## Arithmetic 

3 + 4       # summation

3 * 4       # multiplication

3 / 4       # division

3^4         # exponents

log(3)      # log base e

log(3, 10)  # log base 10

log10(3)    # log base 10

exp(log(3)) # e

#' ## Logical operations 

3 > 4        # greater than

3 < 4        # less than

3 >= 4       # greater than or equal to

3 <= 4       # less than or equal to 

3 != 4       # not equal to 

3 == 4       # equal to

TRUE         # True
T            # True
TRUE == 1    # True is set to one in R

FALSE        # False
F            # False
FALSE == 0   # False is set to zero in R

T + T + F    # what would this equal?

#' ## Variable assignment 
#' you can use `<-` or `=` to assign a value to a variable but `<-` is recommended
weight_kg <- 55

#' print the value of the variable by simply calling its name
weight_kg

#' weight in pounds:
2.2 * weight_kg

weight_kg <- 57.5

#' weight in kilograms is now
weight_kg

weight_lb <- 2.2 * weight_kg

#' weight in kg...
weight_kg
#' ...and in pounds
weight_lb

weight_kg <- 100.0
#' weight in kg now...
weight_kg
#' ...and in weight pounds still
weight_lb

#' ## Reading in Data

#' first check what your working directory is:
getwd()

#' I am using an Rstudio Project that I called "quant_methods". Projects
#' help you to organize your R code for a specific project into a single directory. 
#' To create your own project simply go to File -> New Project then click either 
#' "New Directory" or "Existing Directory". Be default the directory and the project name
#' will be identical - it is not recommended to diverge from that behavior as it can
#' make it very confusing.
#' The working directory within a project is the main project directory so 
#' for me it returns /home/mcglinndj/quant_methods
#' All file paths can be made relative to this directory. 

#' let's read in the datafile `inflammation-01.csv` which is located in the
#' directory: `./quant_methods/data)` where the `.` indicates the directory
#' location in which the directory `quant_methods` is stored in. The usage of 
#' the `.` is a shorthand way to create relative paths. 
#' Because my working directory is already set to: ``r normalizePath('.')``
#' I can shorten the path to `./data/inflammation-01.csv` where again `.` 
#' indicates my current working directory path. 

dat <- read.csv(file = "./data/inflammation-01.csv", header = FALSE)

#' I could have used an absolute path like: `"/home/mcglinndj/quant_methods/data/inflammation-01.csv"`
#' but that path would only work on my specific machine. For that reason we 
#' generally prefer relative paths over absolute paths for making your code more
#' reproducible and future proof. 
#' 
#' Another option is to simply put in the url where the data is stored: 

dat <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/inflammation-01.csv', 
                header = FALSE)

#' this is not always a great option though because remote data and urls can break
#' 
#' ## Using the help 

#' above we used the function "read.csv" to find out more about this function see
?read.csv 
#' or equivalently 
help(read.csv) 
#' to do a fuzzy help search use
help.search('read') 
help.search('csv')

#' ## Visual examination of data 

#' visual summary of first 6 rows
head(dat)
#' visual summary of last 6 rows
tail(dat)

#' what kind of object is dat
class(dat)

#' what are the dimensions of dat
dim(dat)

#' ## Subseting portions of the data
#' first value in dat
dat[1, 1]

#' middle value in dat
dat[30, 20]

#' chunk of data in dat
dat[1:4, 1:10]

#' select specific rows and columns
dat[c(3, 8, 37, 56), c(10, 14, 29)]

#' all columns from row 5
dat[5, ]
#' all rows from column 16
dat[ , 16]
dat[1:nrow(dat), 16]

#' ## Compute summary statistics on data
#' first row, all of the columns
patient_1 <- dat[1, ]
#' max inflammation for patient 1
max(patient_1)

#' max inflammation for patient 2
max(dat[2, ])

#' minimum inflammation on day 7
min(dat[ , 7])

#' mean inflammation on day 7
mean(dat[ , 7])
#' median inflammation on day 7
median(dat[ , 7])
#' standard deviation of inflammation on day 7
sd(dat[ , 7])

summary(dat[ , 7])

#' ## Aggregate information across rows or columns
#' Thus, to obtain the average inflammation of each patient we will need to
#' calculate the mean of all of the rows (`MARGIN = 1`) of the data frame.

avg_patient_inflammation <- apply(dat, 1, mean)

#' And to obtain the average inflammation of each day we will need to calculate
#' the mean of all of the columns (`MARGIN = 2`) of the data frame.

avg_day_inflammation <- apply(dat, 2, mean)


#' standard deviation of day
sd_day_inflammation <- apply(dat, 2, sd)

#' standard deviation of patients
sd_patient_inflammation <- apply(dat, 1, sd)

#' ## Plot data
#' use the function plot() to plot data
?plot
#' provides a long list of potential arguments and examples
#' at a minimum you must provide a single quantitative variable, for example:
plot(avg_day_inflammation)
#' notice how R fills in lots of pieces of missing information automatically. 
#' specifcially it assumes that the independent variable is simply an index from
#' 1 to the length of the object in this case avg_day_inflamation. A safer more 
#' clear way to accomplish the same plot is to use the following:

plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='day', 
    ylab='inflammation')

#' this makes it clearer that the x-variable is simply an index from 1 to the
#' length of avg_day_inflammation, and it makes the x and y axis labels more 
#' sensical. 

#' to output multi-panel plots use for example
par(mfrow=c(1,2))
#' which will create a single plotting row with two columns
plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='day', 
     ylab='inflammation')
plot(1:length(avg_patient_inflammation), avg_patient_inflammation,
     xlab='patient identity', ylab='inflammation')

#' to output the figure to file you can use Rstudio's GUI features or you can use
#' the command line which is what I recommend so that the code is fully 
#' reproducible:

#+ eval = FALSE
pdf('./inflammation_fig1.pdf')
par(mfrow = c(2,1))
plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='Day',
     ylab='Inflammation', frame.plot=F, col='magenta', pch=2, cex=2)
plot(1:length(avg_patient_inflammation), avg_patient_inflammation,
     xlab='patient identity', ylab='inflammation', col='dodgerblue')
dev.off()


