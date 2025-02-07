---
layout: page
title: multivariate models
---

For this assignment will be analyzing data on the Vegetation
and Environment in Dutch Dune Meadows.

To import the data and read the metadata run the following:

```{r}
library(vegan)
data(dune)
data(dune.env)
?dune
# there are few nomial variables in the dataset that make modeling a 
# bit of a pain let's convert those to numeric vectors or 
# to plain un-ranked factors so that they are easier to work with and interpret. 
dune.env$Moisture <- as.numeric(dune.env$Moisture)
dune.env$Manure <- as.numeric(dune.env$Manure)
dune.env$Management <- factor(dune.env$Management, ordered = FALSE)
dune.env$Use <- factor(dune.env$Use, ordered = FALSE)
# clean up names so they are easier to work with
names(dune.env) <- c('A1', 'Moist', 'Mang', 'Use', 'Man')
```

1. Conduct an indirect ordination on the dune plant community. Specifically,
visually examine a NMDS plot using the bray-curtis distance metric. Below is 
some code to help you develop a potential plot that emphasizes the role of the
environmental variable "Moisture". Describe how you interpret the
graphic. What is the goal of creating such a plot? Does this analysis suggest
any interesting findings with respect to the dune vegetation?

    ```{r}
    plot(dune_mds, type='n')
    text(dune_mds, 'sp', cex=.5)
    # generate vector of colors 
    color_vect = rev(terrain.colors(6))[-1]
    points(dune_mds, 'sites', pch=19, 
           col=color_vect[dune.env$Moisture])
    legend('topright', paste("Moisture =", 1:5, sep=''), 
           col=color_vect, pch=19)
    ```

2. Carry out a direct ordination using CCA in order to test any potential 
hypotheses that you developed after examining the MDS plot. Specifically,
carry out a test of the entire model (i.e., including all constrained axes)
and also carry out tests at the scale of individual explanatory variables
you included in your model if you included more than one variable. Interpret
the tests and the overall fit of the model to your data. Plot and interpret your 
results.

3. Do your two analyses agree with one another or complement one another or do
these two analyses seem to be suggesting different take home messages? Which
analysis do you find to be more useful?

