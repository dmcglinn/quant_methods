---
layout: page
---

## Univariate Assignment

Read in tree data

```r
trees = read.csv('./data/treedata_subset.csv')
```

Examine this dataset and see how the data is structured, see function `str` 

The contents of the metadata file (`./data/tree_metadata.txt`) is provided here:


The dataset includes tree abundances from a subset of a vegetation database of Great Smoky Mountains National Park (TN, NC).

* plotID: unique code for each spatial unit (note some sampled more than once)
* date: when species occurrence recorded
* plotsize: size of quadrat in m2
* spcode: unique 7-letter code for each species
* species: species name
* cover: local abundance measured as estimated horizontal cover (ie, relative area of shadow if sun is directly above) classes 1-10 are: 1=trace, 2=0-1%, 3=1-2%, 4=2-5%, 5=5-10%, 6=10-25%, 7=25-50%, 8=50-75%, 9=75-95%, 10=95-100%
* utme: plot UTM Easting, zone 17 (NAD27 Datum)
* utmn: plot UTM Northing, zone 17 (NAD27 Datum)
* elev: elevation in meters from a digital elevation model (10 m res)
* tci: topographic convergence index, or site "water potential"; measured as the upslope contributing area divided by the tangent of the slope angle (Beven and Kirkby 1979)
* streamdist: distance of plot from the nearest permanent stream (meters)
* disturb: plot disturbance history (from a Park report); CORPLOG=corporate logging; SETTLE=concentrated settlement, VIRGIN="high in virgin attributes", LT-SEL=light or selective logging
* beers: transformed slope aspect ('heat load index'); 0 is SW (hottest), 2 is NE (coolest)

1
![Some text]({{site.url}}{{site.baseurl}}/images/smokies_transects.png)

2
<img href="{{ "/sitemap" | relative_url }}">images/smokies_transects.png/>

3
<img src=./images/smokies_transects.png/>

4
![](./images/smokies_transects.png) 

Above shows a map of the regional and local location of the elevational transects included in the dataset (from [Fridley 2009](http://plantecology.syr.edu/fridley/Fridley2009_jamc.pdf)).


1\. Carry out an exploratory analysis using the tree dataset. Metadata for the
tree study can be found [here](../data/tree_metadata.txt). Specifically, I would
like you to develop and compare models for species cover for a habitat
generalist [*Acer rubrum* (Red
maple)](http://www.durhamtownship.com/blog-archives/pix/November1407.jpg) and a
habitat specialist [*Abies fraseri* (Frasier
fir)](https://upload.wikimedia.org/wikipedia/commons/d/d0/Abies_fraseri_Mitchell.jpg).
Because this dataset includes both continuous and discrete explanatory variables
use the function `Anova` in the packages `car` as such

```r
library(car)
Anova(my_mod, type=3)
```

This will estimate partial effect sizes, variance explained, and p-values for 
each explanatory variable included in the model. 

Compare the p-values you observe using the function `Anova` to those generated
using `summary`. 

For each species address the following additional questions:

* how well does the exploratory model appear to explain cover?
* which explanatory variables are the most important?
* do model diagnostics indicate any problems with violations of OLS assumptions?
* are you able to explain variance in one species better than another, 
  why might this be the case?

2\. You may have noticed that the variable cover is defined as 
positive integers between 1 and 10. and is therefore better treated
as a discrete rather than continuous variable. 
Re-examine your solutions to the question above but from the
perspective of a General Linear Model (GLM) with a Poisson error term
(rather than a Gaussian one as in OLS). 
The Poisson distribution generates integers 0 to positive infinity so this may provide a good first approximation. 
Your new model calls will look as follows:

```r
acer_poi = glm(cover ~ tci + elev + ... , data = my_data, 
           family='poisson')
```

For assessing the degree of variation explained you can use a 
pseudo-R-squared statistic (note this is just one of many possible)

```r
pseudo_r2 = function(glm_mod) {
                1 -  glm_mod$deviance / glm_mod$null.deviance
            }
```

Compare your qualatitive assessment of which variables were most important in each model. 
Does it appear that changing the error distribution changed the results much? In what ways? 

3\. Provide a plain English summary (i.e., no statistics) of what you have
found and what conclusions we can take away from your analysis?

4\. (optional) Examine the behavior of the function `stepAIC()` using the 
exploratory models developed above. This is a very simple and not very
robust machine learning stepwise algorithm that uses AIC to select a 
best model. By default it does a backward selection routine. 

5\. (optional) Develop a model for the number of species in each site 
(i.e., unique plotID). This variable will also be discrete so the Poisson
may be a good starting approximation. Side note: the Poisson
distribution converges asymptotically on the Gaussian distribution as the 
mean of the distribution increases. Thus Poisson regression does not differ
much from traditional OLS when means are large. 
