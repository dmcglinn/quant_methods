## The goals of this lesson are to increase student's
## familarity with the R programming language by discussing
## how to control program flow and use functions

# read in some data to work with
dat = read.csv('./data/tgpp.csv')

## Programming for repetive tasks ------------------

# frequently in programming you have to carry out repretitive tasks
# for example you might want to know what the class of column of a data.frame
# you could simply write this as 

class(dat[,1])
class(dat[,2])
class(dat[,3])

# and so on, but this is not only laborious but highly prone to typos and thus
# errors. 

# Based on the last HW assignment we know that the best approach to carrying out 
# this repetitive task is to use the sapply() function

sapply(dat, class)

# However, it is very common that we need a more general approach to carrying out 
# a repetitive task then simply applying a single function (in the example above 
# applying the function class() to each column of dat

## For Loop ---------------------------------------
# For loops are common feature of almost all programming languages. They are
# typically not the most efficient way to carry out a repetive or iterative
# task however, they are frequently easy to understand and relatively easy to 
# motify to include additional tasks. 
# To use a for loop we need to create an iterator that will provide an index for
# the operation we would like to repeat. An iterative this is any variable you
# wish typically i, j, or k and so forth but could just as easily be "index" or
# "my_interator" although that is not recommended.

# In the example below we will asign the iterator the value of "i"
for(i in 1:11) {
    print(class(dat[ , i]))
}

# to break this example down we can see that 
1:11
# generates a vector of numbers from 1 to 11. 
# The portion of code for(i in 1:11) sets the value of i to each value of 
# this vector as the for loop completes its tasks. 

# Note the usage of i in 1:11 this is somewhat unique to R because many other 
# languages use i = 1:11 and thus this is a frequent error for many 
# students

## Beyond printing - capturing the output of a for loop
# first we have to define an empty object
# we'll call this dat_classes

dat_classes = NULL

# once the empty object is initialized we can simply index is
# R is smart enough to convert this object to a vector of arbitrary size
# on the fly. This is not a wise move if memory or time is a necessity 
# but it makes for easy programming. 

for(i in 1:11) {
    dat_classes[i] = class(dat[ , i])
}

dat_classes

## alternatively you can concatenate
# but the first approach is a bit cleaner
dat_classes = NULL
for(i in 1:11) {
    dat_classes = c(dat_classes, class(dat[ , i]))
}

## the gold star approach to this is to set aside exactly how much 
# memory you will need in your holder variable. In our case this is a 
# vector of strings 11 elements long so we can use:

dat_classes = vector("character", 11)
for(i in 1:11) {
    dat_classes[i] = class(dat[ , i])
}

# the three approaches above all give the same results but the third approach
# is typically considered best practice and the first approach is probably
# the easiest to read. We'll use the first approach for the reminder of this
# lesson

## make your loops general
# in other words you don't want it to break if the number of columns of dat
# changes
dat_classes = NULL
for(i in 1:ncol(dat)) {
    dat_classes[i] = class(dat[ , i])
}

## if statements ------------------------------------------------
# If statements, like for loops, are a staple of programming. They allow
# the user to specify that a particular task be executed based on a logical
# TRUE / FALSE test. 
dat_classes = NULL
for(i in 1:ncol(dat)) {
    dat_classes[i] = class(dat[ , i])
    if(dat_classes[i] == "integer") {
        print('sweet!')
    }
}

# Note above because this if statement is only a single line it is not 
# required that we include the brackets {} however it does make it more 
# explicit to a reader what your code is doing

## else statement
# You can use an else clause to specify an alternative task to be carried out
# if the logical test is FALSE.

dat_classes = NULL
for(i in 1:ncol(dat)) {
    dat_classes[i] = class(dat[ , i])
    if(dat_classes[i] == "integer") {
        print('sweet!')
    }
    else {
        print('sour')
    }
}

## nested ifs 
# You can nest if statements (and for loops) within one another
dat_classes = NULL
for(i in 1:ncol(dat)) {
    dat_classes[i] = class(dat[ , i])
    if(dat_classes[i] == "integer") {
        print('sweet!')
    }
    else {
        if(dat_classes[i] == 'factor') {
            print('ok')
        }
        else {
            print('sour')
        }
    }
}

## alternatively we can use an else if statement
# which are sometimes a bit easier to read 
dat_classes = NULL
for(i in 1:ncol(dat)) {
    dat_classes[i] = class(dat[ , i])
    if(dat_classes[i] == "integer") {
        print('sweet!')
    }
    else if (dat_classes[i] == 'factor') {
            print('ok')
    }
    else {
            print('sour')
    }
}


# In one liner situations you can also use the 
# function ifelse()

x = 1:10
ifelse(x > 5 , 'sweet!', 'sour!')

for(i in x) {
    if(i > 5)
        print('sweet')
    else
        print('sour')
}

## Functions ------------------------------
# Functions are one of the most important objects for unlocking R's power. The 
# provide a way to modularize repetive tasks that we need for our analyses. 
# For example we can take the for loop that we wrote above which works on 
# the data.frame called "dat" and place it in a function so that the same
# code can work on any data.frame we provide it.
# Function names should be verbs when possible and also avoid other known R 
# function names when known.

eval_class = function(x) {
    dat_classes = NULL
    for(i in 1:ncol(x)) {
        dat_classes[i] = class(x[ , i])
        if(dat_classes[i] == "integer") {
            print('sweet!')
        }
        else if (dat_classes[i] == 'factor') {
            print('ok')
        }
        else {
            print('sour')
        }
    }
    return(dat_classes)
}

# above the only change we have made to our for loop is to substitue the
# object name "dat" for "x". For our function eval_class() x is a variable or
# argument. 

# we can test our fucntion by providing by using dat

eval_class(dat)

# what if dat had twice as many columns

dbl_dat = cbind(dat, dat)

eval_class(dbl_dat)

# It is best practice to program defensively by ensuring that the user
# supplies an object for the variable x that is sensiable. In our case it 
# has to be a data.frame or a matrix object other types should return an 
# error with a resonable explanation

eval_class = function(x) {
    if (class(x) %in% c('data.frame', 'matrix')){
        x_classes = NULL
        for(i in 1:ncol(x)) {
            x_classes[i] = class(x[ , i])
            if(x_classes[i] == "integer") {
                print('sweet!')
            }
            else if (x_classes[i] == 'factor') {
                print('ok')
            }
            else {
                print('sour')
            }
        }
    }    
    else {
        stop('x must be either a data.frame or matrix')
    }
    return(x_classes)
}

my_obj = 1:10
eval_class(my_obj)

## debug functions using
debug(eval_class)

## you have to turn off the debugger when your done
undebug(eval_class)
