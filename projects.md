---
layout: page
title: Projects
---

Class projects may cover any topic that involves quantitative methods. 

Students are expected to contribute:

* project code
* oral presentation

Graduate students are also required to contribute: 

* written description of analysis (e.g., Methods and Results section of a paper)

### Project Code

The project code will be submitted via your personal project specific github 
repository. 
If your repository is private you will need to invite your instructor to be a 
collaborator so that they can examine the code and test it out.
The home directory of all projects should contain at least the following directories:

* scripts
* figs
* data (only if the project actually used data)

All R code in the scripts directory must assume that the working directory is 
the project home directory and all file paths must be relative to the project
home directory. 
**Points will be deducted for absolute file pathes** as these decrease the portability
and readability of code.

Do not commit very large > 100 MB data files to the git repo. Instructions for 
how to download these files or other justifications for why the data are not
included with the code are sufficient. 

The project directory should also contain a `README.md` file that describes:

* the objective of the project
* the structure of the code-base
* instructions on how to recreate your results
* any relevant acknowledgements

Although not required your instructor and your future-self will find it very
useful if you include a master script that controls project flow. 
See for example https://github.com/weecology/mete-spatial/blob/master/ddr_run_all.R

### Oral Presentation

A 10 minute presentation accompanied by slides on your: 

* question
* methods
* results
* interpretation

The oral presentation should summarize the broader context within which your 
work falls by citing the peer-reviewed literature. 
It should be clear what your over-arching question is and what specific questions
you have attempted to address
Your data and statistical methods need to be adequately described.
We do not need to know which R packages or what R code you used but we do need to
know the names of the methods you used and how you examined your hypotheses.
Some projects will not use data and thus that portion can be skipped in those
contexts.

### Written Description
At a minimum this should include:

* Thesis statement (i.e., your question and predictions)
* Methods
* Results
* Interpretation

However those that wish to tackle an entire scientific paper are encouraged to 
do so and your instructor will give you comments on your entire document. 
The sections of the written description should be formatted and prepared in the 
style of a relevant scientific peer-reviewed journal in your field that you 
would like to submit the finished product to. 
Scientific literature should be cited in the methods and interpretation sections
of the document. 

### Links to past student projects
* Spring 2015
    - Public repos:
        - [Spatial decomposition of community variance in forests](https://github.com/claydustin/tree_vario)
        - [Spatial cross validation methods](https://github.com/lesliedb/spatial_cv) 
        - [Modeling influenza across the US](https://github.com/tswilkin/Influenza-Quant-Project)
    - Private repos:
        - [Response of roots to CO2 enrichment](https://github.com/Kvcross/Duke_FACE_Belowground)
        - [Response of rhizomorphs to CO2 and N2 enrichment](https://github.com/davidmhood/Rhizomorph_FACE)
        - [Coral community composition in reponse to substrate](https://github.com/MRittinghouse/ThesisProject)
        - [Modeling fish abundance and size](https://github.com/friedrichknuth/project)


