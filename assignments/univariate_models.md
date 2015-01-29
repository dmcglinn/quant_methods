

##Univariate Assignment

Fead in tree data, metadata can be found in 
`./data/tree_metadata.txt`

`trees = read.csv('./data/treedata.csv')`

1) Using the tree's dataset develop seperate models for the following species:
"Acer rubrum", "Pinus strobus", "Abies fraseri". For each species which of the 
available explanatory variables seems to be most strongly correlated to the 
cover of that tree. 

2) From the tree data construct a new species richness variable wich summarizes
how many unique species occur in each plot. Summarize this richness variable 
using the summary() function. Hint: the function tapply() could be helpful
in this case.

3) What kind of a variable is richness (continuous, discerte, categorical)?

4) For each of the unique plot id's extract the enviornmental information 
available for that plot

5) Construct a model of richness using the glm() function. Use the stepAIC()
function to carry out a forward and also a backward stepwise selection of a 
best fitting model. Compare the results of this to the classic function step()
Which model appears to be the best according to each approach? 
Why do you think this approach could be considered "dangerous" or potentially 
misleading?

