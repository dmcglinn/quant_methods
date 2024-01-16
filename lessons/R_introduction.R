#' ---
#' title: Introduction to R
#' author: Dan McGlinn
#' date: '`r paste("First created on 2015-01-16. Updated on", Sys.Date())`'
#' ---
#' 
#' Home Page - http://dmcglinn.github.io/quant_methods/ 
#' GitHub Repo - https://github.com/dmcglinn/quant_methods 
#' 
#' ## Source Code Link
#' https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/lessons/R_introduction.R
#'
#' ## Readings
#' * Chapters 1-7 of *The R Book* (1st ed) by Crawley
#' * Chapters 1-4 of *MASS* (4th ed)by Venables and Ripley
#'
#' ## Lesson Outline
#' * <a href="#arith">Arithmetic</a>
#' * <a href="#logic">Logical operations</a>
#' * <a href="#vars">Variable assignment</a>
#' * <a href="#read">Reading in data</a>
#' * <a href="#help">Using the help</a>
#' * <a href="#data">Examine data</a>
#' * <a href="#subset">Subsetting the data</a>
#' * <a href="#summary">Summary statistics</a>
#' * <a href="#aggr">Aggregate across rows or columns</a>
#' * <a href="#plot">Plot data</a>
#' 

#+ echo=FALSE
library(knitr)
opts_knit$set(root.dir='../')

#' The purpose of this lesson is to introduce students to the R programming 
#' environment for the first time. The lesson builds off the Software Carpentry
#' Lesson developed here: 
#' http://swcarpentry.github.io/r-novice-inflammation/
#'
#' ## <a href="#arith" name="arith">#</a>Arithmetic
3 + 4       # summation

3 * 4       # multiplication

3 / 4       # division

3^4         # exponents

log(3)      # log base e

log(3, 10)  # log base 10

log10(3)    # log base 10

exp(log(3)) # e

#' ## <a href="#logic" name="logic">#</a>Logical operations

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

# useful functions
# any() and all()
any(c(T, F))
all(c(T, F))

#' ## <a href="#vars" name="vars">#</a>Variable assignment 
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

#' Coming up with good object and file names can be difficult, but there 
#' are two general rules that can help guide you: 
#'  
#' 1) be descriptive
#' 2) don't make names you must type a lot too long
#' 
#' So for something like a file name which you'll only type probably once at read and
#' write you should use a long descriptive name, but for objects in your R code you
#' need to consider typeability and readability when designing the name. A long name
#' like root_rhiz_prod_total_mm is very clear but is a pain to read and worse to 
#' type. R has a built-in name completion system but this doesn't completely 
#' remove the burden on you for using long object names. 
#'

#' ## <a href="#read" name="read">#</a>Reading in data

#' first check what your working directory is:
getwd()

#' I am using an Rstudio Project that I called "quant_methods". Projects
#' help you to organize your R code for a specific project into a single directory. 
#' To create your own project simply go to File -> New Project then click either 
#' "New Directory" or "Existing Directory". Be default the directory and the project name
#' will be identical - it is not recommended to diverge from that behavior as it can
#' make it very confusing.
#' 
#' The working directory within a project is the main project directory so 
#' for me it returns:  `/home/mcglinndj/quant_methods` 
#' 
#' All file paths can be made relative to this directory. 

#' let's read in the datafile `inflammation-01.csv` which is located in the
#' directory: `./quant_methods/data)` where the `.` indicates the directory
#' location in which the directory `quant_methods` is stored in. The usage of 
#' the `./` is a shorthand way to create relative paths. 
#' Because my working directory is already set to: ``r normalizePath('.')``
#' I can shorten the path to `./data/inflammation-01.csv` where again `.` 
#' indicates my current working directory path. 

dat <- read.csv(file = "./data/inflammation-01.csv", header = FALSE)

#' two other quick notes about path shorthand: 
#' 
#' 1.  `../` is shorthand for the
#' parent directory of the working directory, these can be nested like `../../`
#' but not recommended. 
#' 
#' 2. `~` is shorthand for the home directory on your
#' machine. On my machine `~` refers to `/home/mcglinndj`
#' 
#' Rather than a relative path, I could have used an absolute path like:
#' `"/home/mcglinndj/quant_methods/data/inflammation-01.csv"` but that path
#' would only work on my specific machine. For that reason we generally prefer
#' relative paths over absolute paths for making your code more reproducible and
#' future proof.
#' 
#' Another option is to simply put in the url where the data is stored: 

dat <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/inflammation-01.csv', 
                header = FALSE)

#' this is not always a great option though because remote data and urls can break
#' 
#' Last note about the usage of the function `read.csv`. Notice the argument, 
#' `header` is set to `FALSE`. This is because this inflammation dataset is a bit
#' strange because it does not include column names. Most datasets will include 
#' column names so `header = TRUE` is the more common setting of this argument, 
#' in fact that is the default setting for `read.csv`. So in most cases (such as
#' on the homework) you will simply use `read.csv('mycsvfile.csv')` without 
#' specifying the `header` argument explicitly. 
#' 
#' 
#' ## <a href="#help" name="help">#</a>Using the help

#' above we used the function "read.csv" to find out more about this function see
#+ eval = FALSE
?read.csv 
#' or equivalently 
#+ eval = FALSE
help(read.csv) 
#' to do a fuzzy help search use
#+ eval = FALSE
help.search('read') 
help.search('csv')

#' ## <a href="#data" name="data">#</a>Examine data

#' visual summary of first 6 rows
head(dat)
#' visual summary of last 6 rows
tail(dat)

#' what kind of object is dat
class(dat)

#' what are the dimensions of dat
dim(dat)

#' You may notice that the data did not have column names and R auto assigned the
#' columns the names V1, V2, V3, and so on. In this dataset, each column represent
#' different times. We can assign column names using the function `names`
names(dat)
names(dat) <- paste("day", 1:ncol(dat), sep='')
names(dat)

#' Above the function `paste` was used to construct text strings that combined the
#' word "patient" with a given index in this case from 1 to the total number of 
#' columns in the object `dat`. By default the function `paste` inserts a space 
#' between strings that you wish to paste together, I've set the `sep` argument 
#' to `''` to ensure that no space is inserted (see also `?paste0`)
#' 

#' ## <a href="#subset" name="subset">#</a>Subsetting the data
#' There are a variety of ways to subset data in `data.frames`. This section
#" demonstrates how to subset data using indices. 
#' first value in dat
dat[1, 1]

#' middle value in dat
dat[30, 20]

#' chunk of data in dat
dat[1:4, 1:10]

#' select specific rows and columns
dat[c(3, 8, 37), c(10, 14, 29)]
#' The code above provides the values of `dat` at 
#' 3,10 ; 8,14 ; and 37,29 where the first number is the row index and the 
#' second number is the column index

#' all columns from row 5
dat[5, ]
#' all rows from column 16
dat[ , 16]
dat[1:nrow(dat), 16]

#' you can also exclude certain indices using the `-` sign
dat[1:5 , -16]      # gives every column but 16
dat[1:5 , -(1:10)]  # gives every column except the first 10

#' An alternative way to carry out subsetting is to reference specific column 
#' names or to use the `subset` function.

#' Here to avoid printing too much information to the screen I'll just focus on
#' on the first 5 rows of each subset
dat$patient10[1:5]
dat[1:5 , 'day10']
dat[1:5 , c('day10', 'day15')]
#' notice that the following would give and error
#+ error=TRUE
dat[ , -c('patient3')]
#' but that the following would accomplish the intended goal of dropping patient 3
dat[1:5 , -3]

#' let's try using the subset function
#' only data for day 3
subset(dat, select = day3)[1:5, ]
#' data on all days but 3
subset(dat, select = -day3)[1:5, ]
#' data only on day 3 when inflammation in day 1 is equal to 0
subset(dat, subset = day1 == 0, select = day3)[1:5, ]

#' ## <a href="#summary" name="summary">#</a>Summary statistics
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

#' ## <a href="#aggr" name="aggr">#</a>Aggregate across rows or columns
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

#' ## <a href="#plot" name="plot">#</a>Plot data
#' use the function plot() to plot the data summaries
?plot
#' provides a long list of potential arguments and examples
#' at a minimum you must provide a single quantitative variable, for example:
plot(avg_day_inflammation)
#' notice how R fills in lots of pieces of missing information automatically. 
#' specifically it assumes that the independent variable is simply an index from
#' 1 to the length of the object in this case avg_day_inflamation. A safer more 
#' clear way to accomplish the same plot is to use the following:

plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='day', 
    ylab='inflammation')

#' this makes it clearer that the x-variable is simply an index from 1 to the
#' length of avg_day_inflammation, and it makes the x and y axis labels more 
#' understandable. 
#'
#' Note that in most cases in R you have a specific columns in your `data.frame`
#' you wish to plot against one another. If for example my `data.frame` was 
#' called `dat` and there were two columns `growth` and `temperature`. I could
#' plot growth as a function of temperature using 
#' `plot(dat$temperature, dat$growth)`
#' This will come up in the homework as well.
#'
#' To output multi-panel plots use for example
par(mfrow=c(1,2))
#' which will create a single plotting row with two columns
plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='day', 
     ylab='inflammation')
plot(1:length(avg_patient_inflammation), avg_patient_inflammation,
     xlab='patient identity', ylab='inflammation')

#' to output the figure to file you can use Rstudio's GUI features or you can use
#' the command line which is what I recommend so that the code is fully 
#' reproducible:

#+ fig.height = 8
# png('./inflammation_fig1.png') # to create a png file
par(mfrow = c(2,1))
plot(1:length(avg_day_inflammation), avg_day_inflammation, xlab='Day',
     ylab='Inflammation', frame.plot=F, col='magenta', pch=2, cex=2)
plot(1:length(avg_patient_inflammation), avg_patient_inflammation,
     xlab='patient identity', ylab='inflammation', col='dodgerblue')
# dev.off()                      # to stop writing to the png file. 

#'
#' Home Page - http://dmcglinn.github.io/quant_methods/ 
#' GitHub Repo - https://github.com/dmcglinn/quant_methods 
#' 