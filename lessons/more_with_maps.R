library(maps)
library(sf)
library(leaflet)
library(viridis) # a color palette for maps

# ancient human DNA project
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

