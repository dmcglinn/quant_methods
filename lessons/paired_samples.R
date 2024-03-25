#'---
#' title: The importance of controlling for block effects and the use of paired t-tests
#' author: Dan McGlinn
#' output: html_document
#'---
#'
#' 
#' In complex systems such as a forest it is rare that the variable you are
#' interested is only influenced by a single other variable. In fact, the driver
#' variable that you are testing the effect of may be obscured because of
#' variation due to a different variable.
#' 
#' For example, you might be interested in comparing the effect of 
#' nutrient addition on plant growth but you know that plant growth is also 
#' strongly driven by salinity. If we wish to apply our inference about nutrients
#' across a salinity gradient then we should replicate our nutrient addition 
#' at different salinities. Since we are not necessarily interested in the 
#' salinity effect we are treating it more as a nuisance variable or a "block" 
#' effect. 
#' 
#' Let's examine the incorrect approach to this analysis using
#' a linear model that ignores the block effect, and then we will examine
#' how the model interpretation changes once the block effect is correctly 
#' considered. We will see that controlling for the block effect is the
#' same as using a paired (aka 1 sample) t-test. 

set.seed(1)

#' First setup the block variable
nblock <- 20 
block <- rep(1:nblock, each = 2)
block

#' Treatment will just have two levels: 0 = control, 1 = treatment
trt <- rep(0:1, nblock)
trt

#' set error or uncertainty of model
noise <- 0.1
err <- rnorm(length(trt), mean = 0, sd = noise)

#' Now we can generate response variable y using a
#' linear model where we know the coefficients. 
#' Note the last term with Gaussian noise is added in. 
y <- 0.33 * block + 0.25 * trt + err

par(mfrow=c(1,2))
boxplot(y ~ trt)
boxplot(y ~ block)

#' note above that the figures show that most of 
#' the variation in `y` is due to block effects rather 
#' than treatment effects. These strong block effects
#' have the potential to obsurce treatment effects if 
#' they are ignored.  

# recode block and treatment as factors
block <- as.factor(block)
trt <- as.factor(trt)

#' Let's fit models. We will find that if block is ignored
#' then treatment has no effect similar to ignoring
#' important biology you get wrong answer (i.e., not
#' signifianct). Note tje `trt` coefficient is still correct
#' (i.e., matches what we set in our model) which is 
#' impressive. 
summary(lm(y ~ trt))

#' if you include block with treatment in the model
#' now you get correct inference (i.e., trt p-value < 0.05)
summary(lm(y ~ block + trt))

#' now let's consider that each sample in each block is a
#' paired sample. In other words we are most interested
#' in the comparison of the samples within the blocks not
#' between the blocks
#'
#' To carry out paired test we need to compute the 
#' differences in y in the two treatment levels. This is 
#' easiest if we reshape the data to wide format
dat <- data.frame(y, block, trt)
dat_pair <- tidyr::pivot_wider(dat, names_from = trt, 
                              names_prefix = 'trt_',
                              values_from = y)
head(dat_pair)
#' now we can compute diff directly for testing
dat_pair$diff <- dat_pair$trt_1 - dat_pair$trt_0
#' we can use the `t.test` function with the formula
#' response ~ 1 here the 1 indicates that this is a paired
#' 1 sample test. Usually the 1 is the grouping variable
t.test(dat_pair$diff ~ 1)
#' Rather than compute the difference manually in trt_1 and
#' trt_0 we can use the `Pair` function
t.test(Pair(trt_1, trt_0) ~ 1, data = dat_pair)
#' Ok let's see if the paired t-test gave us a different
#' result to our simple linear model 
summary(lm(y ~ block + trt))
#' the coefficient estimate and t values of `trt` is identical
#' between the paired t-test and the linear model which
#' includes block as a factor. 
#' In this special case if we want to summary the test results
#' using ANOVA we can use the default `anova` function
#' which carries out sequential tests (i.e., the order of 
#' the variables in the models matters!). Here we want to 
#' first factor out block effects then test `trt` effect
anova(lm(y ~ block + trt))
#' we can verify that this is identical to the more usual
#' type 3 anova test we are typically interesed when using
#' observational (rather than experimental) datasets. 
car::Anova(lm(y ~ block + trt), type = 3)

