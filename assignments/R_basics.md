---
title: "R basics"
author: "Dan McGlinn"
date: "01/16/2015"
output: html_document
---

We covered some of the basics of creating and working with objects in R during
our first meeting. Now it is time to apply those skills to address some common
tasks faced when processing data in R. **Indicate what R commands and their
output are for each question.**

Download and read in the datafile "./quant_methods/data/tgpp.csv" from the class
website. This dataset represents the vascular plant species richness that was
collected from the Tallgrass Prairie Preserve from 10 x 10 m quadrats. Species
richness is simply the number of species that occur within a quadrat. 

Read the data into R, note this datafile has a header (i.e., it has column
names) unlike the example we examined in class.  

1. What are the names of the columns in this dataset?

2. How many rows and columns does this data file have?

3. What kind of object is each data column? Hint: combine two functions that we
learned in lecture. 

4. What are the values of the the datafile for rows 1, 5, and 8 at columns 3, 
7, and 10

5. Create a pdf of the relationship between the variables "scale" and "richness". 
Scale is the area in square meters of the quadrat in which richness was
recorded. Be sure to label your axes clearly, and choose a color you find
pleasing for the points. To get a list of available stock colors use the
function colors(). Also see this link: 
http://research.stowers-institute.org/efg/R/Color/Chart/index.htm .

6. What happens to your plot when you set the plot argument log equal to 'xy'.
`plot(..., log='xy')`






