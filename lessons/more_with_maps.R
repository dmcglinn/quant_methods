#'---
#'title: More with maps
#'author: Dan McGlinn
#'output: html_notebook
#'---

#+ echo=FALSE
# setup the R environment for knitting markdown doc properly
knitr::opts_knit$set(root.dir='../')

#' import GIS libraries
library(maps)
library(sf)
library(leaflet)
library(viridis) # a color palette for maps
library(readxl)

#' ## Ancient Human DNA
#' Let's examine an ancient human DNA project 
# https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/FFIDCW
dat <- read.csv('./data/v62.0_HO_public.csv', skip = 1, na.strings = '..')
head(dat)

# drop samples without coordinates
dat <- subset(dat, !is.na(long) & !is.na(lat))
dat <- st_as_sf(dat, coords = c('long', 'lat'))

map('world')
points(dat)

#
m <- leaflet(data = dat) %>% addTiles() %>%
  addCircleMarkers(col = ~ as.factor(mtDNA_hap), label = ~mtDNA_hap)
m

# make a simplier haplotype using just first two letters
dat$mtDNA_hap_simp <- substr(dat$mtDNA_hap, 1, 2)

happal <- colorFactor(viridis(length(unique(dat$mtDNA_hap_simp))),
                      dat$mtDNA_hap_simp)

leaflet(dat) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addCircleMarkers(radius = 1.5, 
                   fillColor = ~happal(mtDNA_hap_simp),
                   stroke=FALSE,
                   fillOpacity = 0.8,
                   popup = ~mtDNA_hap_simp) %>%
  addLegend("bottomright", pal = happal,
            values = ~mtDNA_hap_simp, labels = "haplotypes",
            title = "mtDNA haplotype")

#' ## Blue Crab Project
#' let's import and map data on matrue Female bluecrabs
dat <- read_excel('./data/crabdat(MF).xlsx')
head(dat)
dat <- st_as_sf(dat, coords = c('longitude', 'latitude'))


pal <- colorNumeric("viridis", domain = dat$width_mm)

leaflet(dat) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addCircleMarkers(fillColor = ~pal(width_mm),
                   stroke=FALSE,
                   fillOpacity = 0.8,
                   label = ~width_mm)  %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
  addLegend(data = dat,
            position = "bottomright",
            pal = pal, values = ~width_mm,
            title = "Legend",
            opacity = 1)


