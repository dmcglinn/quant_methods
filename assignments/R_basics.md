---
title: R basics
layout: page
---

We covered some of the basics of creating and working with objects in R during
our first meeting. Now it is time to apply those skills to address some common
tasks faced when processing data in R. **Indicate what R commands and their
output are for each question.**

Download and read in the datafile `tgpp.csv` from the class
website using the R function `read.csv`. Use these steps:

* Navigate to the class website: https://github.com/dmcglinn/quant_methods
* Click the `data` folder
* Click the `tgpp.csv` file
* Now click the button in the top right corner of the spreadsheet called `raw`

This will take you to a plain text view of the file. At this point you have to options for getting this file into R:

1) Manual download and import

* Save the file to your local machine to the directory you would like to use for
this course. 
* Now you just have to point the function `read.csv` to the file so it knows where
the file is located. For example if I save the file in the following directory:
`C:/users/dan/Rclass/data/` then I would use the following R command

```
tgpp <- read.csv('C:/users/dan/Rclass/data/tgpp.csv')
```

2) Alternatively I could just supply the function `read.csv` the url of the raw 
file that I navigated to on github: 

```
tgpp <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/tgpp.csv')
```

The second option is faster but if the file is ever taken offline then that code will break.

This dataset represents the vascular plant species richness that was
collected from the Tallgrass Prairie Preserve from 10 x 10 m quadrats. Species
richness is simply the number of species that occur within a quadrat. 

Read the data into R, note this datafile has a header (i.e., it has column
names) unlike the example we examined in class.  

1. What are the names of the columns in this dataset?

2. How many rows and columns does this data file have?

3. What kind of object is each data column? Hint: checkout the function sapply().

4. What are the values of the the datafile for rows 1, 5, and 8 at columns 3, 
7, and 10

5. Create a pdf of the relationship between the variables "scale" and "richness". 
Scale is the area in square meters of the quadrat in which richness was
recorded. Be sure to label your axes clearly, and choose a color you find
pleasing for the points. To get a list of available stock colors use the
function colors(). Also see this link: https://r-charts.com/colors/.

6. What happens to your plot when you set the plot argument log equal to 'xy'.
`plot(..., log='xy')`






