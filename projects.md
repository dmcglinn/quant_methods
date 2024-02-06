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

The project directory should also contain a `README.md` file that describes (at a minimum):

* the objective of the project
* the structure of the code-base including dependencies
* the structure of the data that is required as input including the metadata
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
* Spring 2022
    - Public repos: 
        - [Emphemeral Wetland Bird Biodiversity](https://github.com/jacksonbarrattheitmann/RclassProject)
        - [Microplastic and Algae Distribution in Coastal SC Stormwater Drainage Ponds](https://github.com/a-apint4/MP_Algae_Project)
        - [Indian River Lagoon - Community Ecosystem Function Project](https://github.com/Lexie-DelViscio/IRLCommunityEcosystemFunction)
        - [Using Hemolymph Chemistry to Predict and Assess Molting in Green Crabs, Carcinus maenas](https://github.com/emilydombrowski/green_crab_phys_2022)
        - [The effect of elevated salinity on survival of southern toad embryos](https://github.com/Regan-Honeycutt/Embryo-Survival)
        - [The ingestion of microplastics by young-of-the-year sharks in South Carolina estuaries](https://github.com/lattomusme/shark_plastics)
        - [Phenotypic and developmental effects of T-DNA inserts within auxin related genes on the development of A. thaliana](https://github.com/sydowpw/APA-Development-Project)
        - [The effects of Eastern mud snails on benthic microalgae community structures](https://github.com/Timara-Vereen/RClass-Project)
        - [Model abundance of 3 target species of deep-sea corals in the Pinnacles Trend Mesophotic Area](https://github.com/MorganWill13/Pinnacles_Trend)
        - [Dolphin Vocalization and Sighting Analyses](https://github.com/ctribss/Projectfiles)
    - Private repos:
        - [Resource partitioning among Caribbean sponges](https://github.com/huntjones88/summer_2021_pulse-chase_data)


* Spring 2020
   - Public repos:
       - [Chara_Ecosystem_Dynamics](https://github.com/CassandraEvanchuk/Chara_Ecosystem_Dynamics.git)
       - [Exposureof Nanobubble Ozonation on Red Drum](https://github.com/radchenkoa5/Exposure-of-Nanobubble-Ozonation-on-Red-Drum)
       - [Sciaenops ocellatus feeding trial metabolomics](https://github.com/daveklett/David-Klett-Sciaenops-Ocellatus-Feeding-Trial-Metabolomics)
       - [Wood tracking Method](https://github.com/millertp1/Wood_Tracking_Method.git)
       - [Fertilization results of pairwise crosses of Staghorn coral](https://github.com/eeparsons42/cervicornis_analysis)
       - [The effect of headstarting on bite force in the diamondback terrapin](https://github.com/reisenfeldk/Thesis)
       - [Sea trout physiological relationship between myxospore density in the muscle tissue and swimming performance](https://github.com/dalyjm/SST-project/)
       - [Life history parameters and the interacting abiotic variables of the brief squid, Lolliguncula brevis](https://github.com/jtgood/Lbrevis.git)
       - [Herptafauna response to prescribe fire](https://github.com/mcglinnlab/fire_herps)
       - [Global shark and ray beta diversity](https://github.com/mosscr/Shark-Ray-Beta-Diversity)
       - [Analysis of Enterococcus in Charleston waterways](https://github.com/Vwilcox98/R-Project---CWK)

* Spring 2019 (incomplete list)
    - Public repos: 
        - [Food consumption patterns in the Philippines](https://github.com/jbalipal/PhFoodExpenditures)
    - Private repos:
        - [Analysis of Shark Distribution in Bulls Bay, South Carolina](https://github.com/strangebb/shark-dist-bullsbay)
        

* Spring 2018
    - Public repos:
        - [Mapping relgion affiation](https://github.com/katiebalcewicz/quant-methods/tree/master/Project)
        - [NFL statistics](https://github.com/g-rock/nfl.git)
        - [Rshiny app for the measurement of biodiversity](https://github.com/caroliver/mobr.git)
        - [Black Coral habitat suitability model](https://github.com/prouxzs/BlackCoralMesoscaleHabitatSuitabilityModel.git)
        - [Fitting thermal performance curves](https://github.com/Wellingem/Metabolic_thermal_performance_curves.git)
        - [Analysis of Avian Conservation Center bird strikes](https://github.com/conradcd/ACC_Bird_Strikes)
        - [Multiple Paternity Analysis Program](https://github.com/sporrema/Multiple-Paternity-Analysis-Program)
        - [How much will people pay for eco-friendly flowers](https://github.com/rachelwiser/WiserThesisRCode)
* Spring 2016
    - Public repos:
        - [Modeling disease outbreaks](https://github.com/TomNash/vaccine-project)
        - [Crab incubation](https://github.com/mackk1/Project)
        - [Congitive skill as a predictor of infarct volume](https://github.com/andersenme/infarct_volume_analysis)
        - [Spatial analysis of shots from NBA players](https://github.com/oshimamh/nbaProj)
        - [Salt intrusion in freshwater aquifiers](https://github.com/mikala-randich/fwsw_proj)
        - [Horse-shoe crab bleeding induced mortality](https://github.com/kristinlinesch/HSC_bleed)
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


