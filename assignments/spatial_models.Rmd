---
title: "Spatial Modeling Assignment"
output: html_document
---

```{r eval=FALSE}
library(vegan)
data(BCI)
## UTM Coordinates (in metres)
BCI_xy = data.frame(x = rep(seq(625754, 626654, by=100), each=5), 
                    y = rep(seq(1011569,  1011969, by=100), len=50))
```

1) Examine if there is evidence of spatial dependence in a rare and a common
species in the BCI tree dataset


2) Build two generalized linear models to predict the abundance of the species
*Drypetes standleyi* using the abundance of other tree species in the study site.
Specifically examine the following species as predictor variables:

```{r eval=FALSE}
sp_ids = c("Cordia.lasiocalyx", "Hirtella.triandra", "Picramnia.latifolia",
           "Quassia.amara", "Tabernaemontana.arborea", "Trattinnickia.aspera", 
           "Xylopia.macrantha")
```
Note renaming the species ids to something a little easier to work with like
"sp_a", "sp_b" will make model construction a little less cumbersome

* Model 1: only include a single species as a predictor variable

* Model 2: include all of the species as predictor variables

With both models examine the spatial dependence of the residuals using the 
function `Variogram`. Model the spatial dependence in the residuals using one
of the error structures available. 

* Did including the spatial error term have a large impact on the coefficients
of the model?

* Did including the spatial error terms significantly improve model fit (use 
function `anova` to carry out model comparison)?

* Explain why modeling the spatial errors has a large influence in the first
model but not in the second model. 


