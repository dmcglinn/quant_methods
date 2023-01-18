#' ---
#' title: "R intermediate"
#' author: "Dan McGlinn"
#' date: '`r paste("First created on 2015-01-29. Updated on", Sys.Date())`'
#' output: html_document
#'---
#'
#' Home Page - http://dmcglinn.github.io/quant_methods/ 
#' GitHub Repo - https://github.com/dmcglinn/quant_methods 
#' 
#' ## Source Code Link
#' https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/lessons/R_intermediate.R
#' 
#' ## Lesson Outline
#' * <a href="#rep">Programming for repetitive tasks</a>
#' * <a href="#for">For loops</a>
#'   - <a href="#cap">Capturing output</a>
#'   - <a href="#gen">Make loops general</a>
#' * <a href="#if">If statements</a>
#'   - <a href="#else">Else statements</a>
#'   - <a href="#nest">Nested operations</a>
#'   - <a href="#elseif">Else if statements</a>
#' * <a href="#fun">Define Functions</a>
#' * <a href="#debug">Debug Functions</a>
#' * <a href="#doc">Document Functions</a>
#'   
#+ echo=FALSE
# specify that the root directory should be the parent directory of where this
# script is stored this is because this .Rmd file is in ./quant_methods/lessons
# and the data file that will be read into is located in ./quant_methods/data .
# If your data file located in the same directory as or in a subdirectory of
# your .R file then you don't need to specify this.
knitr::opts_knit$set(root.dir = '../')

#' The goals of this lesson are to increase student's
#' familiarity with the R programming language by discussing
#' how to control program flow and use functions

#' read in some data to work with
dat <- read.csv('./data/tgpp.csv')
#' or equally
dat <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/tgpp.csv')

#' ## <a href="#rep" name="rep">#</a> Programming for repetive tasks

#' Frequently in programming you have to carry out repetitive tasks
#' for example you might want to know what the class of column of a data.frame
#' you could simply write this as 
class(dat[,1])
class(dat[,2])
class(dat[,3])

#' and so on, but this is not only laborious but highly prone to typos and thus
#' errors. 
#' 
#' Based on the last HW assignment we know that the best approach to carrying out 
#' this repetitive task is to use the `sapply()` function
sapply(dat, class)

#' However, it is very common that we need a more general approach to carrying out 
#' a repetitive task then simply applying a single function (in the example above 
#' applying the function class() to each column of dat

#' ## <a href="#for" name="for">#</a> For Loop 
#' For loops are common feature of almost all programming languages. They are
#' typically not the most efficient way to carry out a repetitive or iterative
#' task however, they are frequently easy to understand and relatively easy to 
#' modify to include additional tasks. 
#' To use a for loop we need to create an iterator that will provide an index for
#' the operation we would like to repeat. An iterative this is any variable you
#' wish typically i, j, or k and so forth but could just as easily be "index" or
#' "my_iterator" although that is not recommended.

#' In the example below we will assign the iterator the value of "i"
for (i in 1:11) {
    print(class(dat[ , i]))
}
#' 
#' To break this example down we can see that 
#' 
1:11
#' 
#' Generates a vector of numbers from 1 to 11. 
#' The portion of code for(i in 1:11) sets the value of i to each value of 
#' this vector as the for loop completes its tasks. 
#' 
#' Note the usage of `i in 1:11` this is somewhat unique to R because many other
#' languages use `i = 1:11` and thus this is a frequent error for many students.
#' Again I just want to emphasize we could have used a different name for our index
#' something like `j` or `my_index` it did not have to be `i` this is simply the
#' most common choice of an index in programming like in alebgra.
#' 
#' Also here it is important to note the syntax and code style of the for loop: 
#+ eval = FALSE
for (i in 1:11) { 
    ... # note this line is 4 spaces from the left margin, 2 spaces is also common, 0 spaces is bad form
}
#' 
#' Above the `...` just represents anything you want the loop to do each iteration 
#' of the loop. This loop will iterate 11 times as `i` counts from 1 to 11. Note the 
#' spacing of the code and the placement of the curly brackets to start and stop the 
#' for loop. Note: it is possible to use different spacing (but not recommended):
#' 
#' cramped example
for(i in 1:11){print(class(dat[,i]))}
#' 
#' **Question**: Why do you think the code style in the above chunk is not generally recommended?
#' 
#' ### <a href="#cap" name="cap">#</a>Capturing output
#' Right now our for loop just prints output to the console but often times we want
#' to capture that output and do something with it. To do this first we will have
#' to define an empty object we'll call this `dat_classes`
#' 
dat_classes <- NULL
#' 
#' Once the empty object is initialized we can simply index is R is smart enough to
#' convert this object to a vector of arbitrary size on the fly. This is not a wise
#' move if memory or time is a necessity but it makes for easy programming. 
#' 
for (i in 1:11) {
  dat_classes[i] <- class(dat[ , i])
}

dat_classes

#' alternatively you can concatenate but the first approach is a bit cleaner
dat_classes <- NULL
for (i in 1:11) {
  dat_classes <- c(dat_classes, class(dat[ , i]))
}

#' the gold star approach to this is to set aside exactly how much 
#' memory you will need in your holder variable. In our case this is a 
#' vector of strings 11 elements long so we can use:

dat_classes <- vector("character", 11)
for (i in 1:11) {
  dat_classes[i] <- class(dat[ , i])
}

#' The three approaches above all give the same results but the third approach is 
#' typically considered best practice and the first approach is probably the
#' easiest to read. We'll use the first approach for the reminder of this lesson.
#' 
#' ### <a href="#gen" name="gen">#</a>Make your loops general
#' You don't want it to break if the number of columns of dat changes so you need
#' to write the loop such that it will always count to the appropriate number of 
#' columns in dat
#' 
dat_classes <- NULL
for (i in 1:ncol(dat)) {
  dat_classes[i] <- class(dat[ , i])
}
#' 
#' ## <a href="#if" name="if">#</a> If statements
#' If statements, like for loops, are a staple of programming. They allow
#' the user to specify that a particular task be executed based on a logical
#' TRUE / FALSE test. 
dat_classes <- NULL
for (i in 1:ncol(dat)) {
  dat_classes[i] <- class(dat[ , i])
  if(dat_classes[i] == "integer") {
    print('sweet!')
  }
}
#' 
#' Note above because this if statement is only a single line it is not required
#' that we include the brackets {} however it does make it more explicit to a
#' reader what your code is doing
#'
#' ### <a href="#else" name="else">#</a> Else statement
#' You can use an else clause to specify an alternative task to be carried out
#' if the logical test is FALSE.
#' 
dat_classes <- NULL
for (i in 1:ncol(dat)) {
  dat_classes[i] <- class(dat[ , i])
  if(dat_classes[i] == "integer") {
    print('sweet!')
  }
  else {
    print('sour')
  }
}
#' 
#' ###<a href="#nest" name="nest">#</a>Nested statements
#' You can nest if statements (and for loops) within one another
#' 
dat_classes <- NULL
for (i in 1:ncol(dat)) {
  dat_classes[i] <- class(dat[ , i])
  if (dat_classes[i] == "integer") {
    print('sweet!')
  }
  else {
    if (dat_classes[i] == 'factor') {
      print('ok')
    }
    else {
      print('sour')
    }
  }
}
#' 
#' ### <a href="#elseif" name="elseif">#</a>Else if statement
#' An alternative to the above syntax is to use an else if statement which are 
#' sometimes a bit easier to read 
#' 
dat_classes <- NULL
for (i in 1:ncol(dat)) {
  dat_classes[i] <- class(dat[ , i])
  if (dat_classes[i] == "integer") {
    print('sweet!')
  }
  else if (dat_classes[i] == 'factor') {
    print('ok')
  }
  else {
    print('sour')
  }
}
#' 
#' In one liner situations you can also use the function `ifelse()`
#' 
x <- 1:10
ifelse(x > 5 , 'sweet!', 'sour!')
#' 
#' Which produces the same result as:
for (i in x) {
  if (i > 5)
    print('sweet')
  else
    print('sour')
}
#' 
#' ## <a href="#fun" name="fun">#</a>Define functions
#' Functions are one of the most important objects for unlocking R's power. The 
#' provide a way to modularize repetitive tasks that we need for our analyses. 
#' For example we can take the for loop that we wrote above which works on 
#' the data.frame called "dat" and place it in a function so that the same
#' code can work on any data.frame we provide it.
#' Function names should be verbs when possible and also avoid other known R 
#' function names when known.
#' 
eval_class <- function(x) {
    dat_classes <- NULL
    for (i in 1:ncol(x)) {
        dat_classes[i] <- class(x[ , i])
        if (dat_classes[i] == "integer") {
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

eval_class(dat)
#' 
#' Above the only change we have made to our for loop is to substitute the object
#' name `dat` for `x`. For our function `eval_class()`, `x` is a variable or argument. 
#' Additionally we added the line `return(dat_classes` which ensures that the object
#' is output by the function
#' 
#' What if dat had twice as many columns?
dbl_dat <- cbind(dat, dat)

eval_class(dbl_dat)
#' 
#' It is best practice to program defensively by ensuring that the user
#' supplies an object for the variable x that is sensible. In our case it 
#' has to be a data.frame or a matrix object other types should return an 
#' error with a reasonable explanation
#' 
eval_class <- function(x) {
    if (class(x) %in% c('data.frame', 'matrix')){
        x_classes <- NULL
        for (i in 1:ncol(x)) {
            x_classes[i] <- class(x[ , i])
            if (x_classes[i] == "integer") {
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

#+ error = TRUE
my_obj <- 1:10
eval_class(my_obj)

#' ## <a href="#debug" name="debug">#</a>Debug functions
#' To debug your function in R use the functions `debug()` and `undebug()`. 
#' Rstudio has made the debugging experience for R users much better than previously.
#' Try out the following lines of code
#+ eval = FALSE
debug(eval_class)
eval_class(dat)
undebug(eval_class)
#'
#' ## <a href="#doc" name="doc">#</a>Document functions
#' Documentation is critical particularly when it comes to using functions which 
#' usually have a least one argument and some type of output. 
#' 
#' One best practice to follow when documenting functions is to use Roxygen which is
#' a package that helps to build R help files (i.e., .Rd files) which are accessed
#' when the function `help` or `?` is used preceding a function name. Here is a 
#' page that goes into detail about how to do this: https://jozef.io/r102-addin-roxytags/, but
#' for simplity here is an example with our function: 

# #' Evaluate the class of each column in a matrix or data.frame
# #' 
# #' @param x a matrix or data.frame
# #' @return a vector of strings that indicates the class of each column of `x` 
# #' 
# #' @export
# #' @examples
# #' eval_class(cars)
eval_class <- function(x) {
  if (class(x) %in% c('data.frame', 'matrix')){
    x_classes <- NULL
    for (i in 1:ncol(x)) {
      x_classes[i] <- class(x[ , i])
    }
  }    
  else {
    stop('x must be either a data.frame or matrix')
  }
  return(x_classes)
}

#' Note above you would remove the preceeding `#` from each line of documentation
#' I had to include that here because R spin uses `#+` to identify formatted text.
#' 
#' This provides a nice format that is easily understandable by a human, and if 
#' you ever decide to package your function this can can now be used to generate
#' a help file for your function. Learn more at https://roxygen2.r-lib.org/articles/roxygen2.html 

#'
#' Home Page - http://dmcglinn.github.io/quant_methods/ 
#' GitHub Repo - https://github.com/dmcglinn/quant_methods 
#' 