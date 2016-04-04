---
layout: page
title: Projects
---

Class projects may cover any topic that involves quantitative methods.
Take a look at the page of links to [datasets](../data) which could be 
analyzed as part of a project.

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
**Points will be deducted for absolute file paths** as these decrease the portability
and readability of code.

Do not commit very large > 100 MB data files to the git repo. Instructions for 
how to download these files or other justifications for why the data are not
included with the code are sufficient. 

If the data are not available to reproduce the results then at minimum a representative example portion of the data must be included to provide a means
of generating example results.  

The project directory should also contain a `README.md` file that describes:

* the objective of the project
* the structure of the code-base
* instructions on how to recreate your results
* any relevant acknowledgements

Although not required your instructor and your future-self will find it very
useful if you include a master script that controls project flow. 
See for example <https://github.com/weecology/mete-spatial/blob/master/ddr_run_all.R>
Another very effective approach is to use an Rmarkdown document that walks a reader
through you analysis with $ code and results interspersed with plain English 
descriptions of motivations and methodology. See for example <http://richfitz.github.io/wood/wood.html>

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

### Links to student projects
* Spring 2016
    - Public repos:
        - [Modeling disease outbreaks](https://github.com/TomNash/vaccine-project)
        - [Crab incubation](https://github.com/mackk1/Incubation-Analysis)
        - [Congitive skill as a predictor of infarct volume](https://github.com/andersenme/infarct_volume_analysis)
        - [Spatial analysis of shots from NBA players](https://github.com/oshimamh/nbaProj)
        - [Salt intrusion in freshwater aquifiers](https://github.com/mikala-randich/fwsw_proj)
        - [Horse-shoe crab bleeding induced mortality](https://github.com/kristinlinesch/HSC_tagrecap)
        - [Shark morphometrics](https://github.com/Jordylacrosse/Shark-Morphometrics)
        - [Post-hurricane Hugo recovery of the Santee long-term fire experiment](https://github.com/smccau/santee_fire)
        - [Spatial and temporal trends in south Atlantic reef fish](https://github.com/walkermf/Reef_fish-)
        - [Contemporary patterns of refugee migration](https://github.com/sarahwie/refugee_migration_trends)
        - [Modeling DMSP across depths along a longitudinal transect](https://github.com/shoresk/Savannah-June-2015-DMSP-Predictors)
* Spring 2015
    - Public repos:
        - [Spatial decomposition of community variance in forests](https://github.com/claydustin/tree_vario)
        - [Spatial cross validation methods](https://github.com/lesliedb/spatial_cv) 
        - [Modeling influenza across the US](https://github.com/tswilkin/Influenza-Quant-Project)
    - Private repos:
        - [Response of roots to CO2 enrichment](https://github.com/Kvcross/Duke_FACE_Belowground)
        - [Response of rhizomorphs to CO2 and N2 enrichment](https://github.com/davidmhood/Rhizomorph_FACE)
        - [Coral community composition in response to substrate](https://github.com/MRittinghouse/ThesisProject)
        - [Modeling fish abundance and size](https://github.com/friedrichknuth/project)


