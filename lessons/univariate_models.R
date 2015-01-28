
## content from this lesson is modified from the following sources:

http://www.unc.edu/courses/2010fall/ecol/563/001/docs/lectures/lecture1.htm

http://plantecology.syr.edu/fridley/bio793/lm.html

## hypothetical models ---------------------------------------------------

# All models are wrong 
# but some models are useful

# In R linear modeling is a very common task and is carryed out by the function
# lm()

#generate data for example
set.seed(10)
x1 = runif(90)
x2 = rbinom(90, 10, .5)
x3 = rgamma(90, .1, .1)

#organize predictors in data frame
sim_data = data.frame(x1, x2, x3)
#create noise b/c there is always error in real life
epsilon = rnorm(90, 0, 3)
#generate response: additive model plus noise, intercept=0
sim_data$y = 2*x1 + x2 + 3 * x3 + epsilon
#simple linear regression with x1 as predictor
mod1 = lm(y ~ x1, data=sim_data)
mod1
#plot regression line and mean line
plot(y ~ x1, data=sim_data)
abline(h=mean(sim_data$y), col='pink', lwd=3)
abline(mod1, lty=2)
#simple linear regression with x3 as a predictor
mod3 = lm(y ~ x3, data=sim_data)
#graph regression line and mean line
plot(y ~ x3, data=sim_data)
abline(mod3)
abline(h=mean(sim_data$y), col=2, lwd=2)

# let's examine the statistics of these model fits
#remove outlier in x3 space
sim_data_sub = sim_data[sim_data$x3 < 25,]
#verify that one observation was removed
dim(sim_data)
dim(sim_data_sub)
#refit model to reduced data
mod3_sub = lm(y ~ x3, data=sim_data_sub)
summary(mod3_sub)

# so R^2 is highly sensative to outliers but coefficients not so much

## Question: create a plot of both models along side the data, how much
## to they visually differ from one another. Examine the arguments to abline()
## including lty and lwd

## multiple regression --------------------------------------------------
mod_main = lm(y ~ x1 + x2 + x3, data=sim_data)
mod_main
summary(mod_main)

## interaction effects -----------------------------------------------

mod_full = update(mod_main, ~ . + x1*x2*x3)
summary(mod_main)

anova(mod_main, mod_full)

AIC(mod_full)
AIC(mod_main)

library(MASS)
stepAIC(mod_full)

