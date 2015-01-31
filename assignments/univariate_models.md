

##Univariate Assignment

Read in tree data, metadata can be found in 
`./data/tree_metadata.txt`

`trees = read.csv('./data/treedata.csv')`

1) Using the tree's dataset develop separate models for the following species:
"Acer rubrum", "Pinus strobus", "Abies fraseri". For the cover of each species
which of the available explanatory variables seems to be the srongest
explanatory variable?

2) From the tree data construct a new species richness variable which summarizes
how many unique species occur in each plot. Summarize this richness variable 
using the summary() function. Hint: the function tapply() could be helpful
in this case.

3) What kind of a variable is richness (continuous, discrete, categorical)? 
Given richness's properties what kind of error structure would likely be best
to use when modeling this variable. Hint its not normal error. 

4) For each of the unique plot id's extract the environmental information 
available for that plot.

5) Construct a model of richness using the glm() function. See Chp 13 in 
_The R book_ by Crawley. 
Use the stepAIC() function to carry out a forward and also a backward stepwise
selection of a best fitting model. Compare the results of this to the classic
function step() Which model appears to be the best according to each approach?
Why do you think this approach could be considered "dangerous" or potentially 
misleading?

