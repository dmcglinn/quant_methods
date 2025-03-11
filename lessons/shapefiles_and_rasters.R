#' ---
#' title: "Working with Geospatial Data in R"
#' author: Dan McGlinn
#' output: html_document
#' ---

#' Home Page - http://dmcglinn.github.io/quant_methods/ 
#' GitHub Repo - https://github.com/dmcglinn/quant_methods 

#' ### Source Code Link
#' https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/lessons/shapefiles_and_rasters.R

#+ echo=FALSE
# setup the R environment for knitting markdown doc properly
knitr::opts_knit$set(root.dir='../')

#' This lesson covers how to map and work with geospatial data in R. 
#' First let's load the relevant libraries 
# install.packages(c("maps","sf", "raster", "ggplot2", "leaflet"))

library(maps)     # convenient pkg for maps of the world, state, and county
library(sf)       # spatial features package that is helpful working with polygons
library(raster)   # raster data class for working with grid data
library(ggplot2)  # has some mapping functions (geom_sf)
library(leaflet)  # for interactive maps

#' First, make some maps. The "maps" package has databases="world","usa","state",
#' or "county". (There are also a few for foreign countries like France and
#' Italy.) In each database, you can plot any region or group of regions.

world <- map(database="world")
names(world)
head(world$names)

#' Names in world database can all be plot as a region. For example:
map(database="world", regions=c("Cambodia", "Thailand", "Vietnam", "Laos"))

map(database="state", regions=c("virginia", "north carolina", "south carolina"))
#' You can add cities using `map.cities()` function.
#' Note: if the map is getting cropped on the edges close and clear the plotting
#' window using `dev.off()` then manually widen the plotting window and try 
#' the `map()` function again - it should not crop the map if the window is 
#' big enough. 
#'
#' Let's look at a county map:
nc_county <- map(database="county",regions="north carolina")
head(nc_county$names)
triangle <- map(database="county",
               regions=c("north carolina,orange","north carolina,wake","north carolina,durham"),
               fill=T, plot=F)
triangle$names

#' We can turn a map into a spatial polygons object and fill it with data,
#' turning it into a spatial polygon dataframe.

tri_sf <- st_as_sf(triangle)

plot(tri_sf, axes=T)

#' add data to make spatial polygons data frame
population <- c(266132, 132272, 892409) 

tri_sf$pop <- population

plot(tri_sf['pop'])

#' We can also use ggplot to produce a similar graphic with less hideous default
#' colors
ggplot(tri_sf) + 
  geom_sf(aes(fill = pop))

#' If your data are in different projections, you need to change the projection
#' so that they are all in 
#' the same coordinate reference system.

world <- map(database="world", fill=T, plot=F)
world_longlat <- st_as_sf(world) 

# Use function spTransform to transform to Mercator projection
world_merc <- st_transform(world_longlat, crs=st_crs("+proj=merc"))
# Lambert Azimuthal Equal Area
world_laea <- st_transform(world_longlat, crs=st_crs("+proj=laea"))
# sinusoidal
world_sinusoidal <- st_transform(world_longlat,
                                 crs=st_crs("+proj=sinu"))

#' plot the four together to see the difference. Mercator projection distorts
#' area far from the equator. LAEA is accurately represents area but not angles.
#' Sinusoidal is equal area and conserves distances along parallels.
par(mfrow=c(1,1))
plot(world_longlat)
plot(world_merc)
plot(world_laea)
plot(world_sinusoidal)

#' A four page cheat sheet about coordinate reference systems (CRSs), including
#' projections, datums, and coordinate systems, and the use of these in R: 
#' https://www.nceas.ucsb.edu/sites/default/files/2020-04/OverviewCoordinateReferenceSystems.pdf
#' A fun projection link: http://xkcd.com/977/
#'
#' OK, some slightly more complicated stuff. Data from MODIS fire detentions in
#' the US in 2021.
#' metadata and data link for MODIS fire data available at:
#' https://fsapps.nwcg.gov/afm/data/fireptdata/modisfire_2021_conus.htm
#'
#' To download the data use: 
#+ eval=FALSE 
download.file('https://fsapps.nwcg.gov/afm/data/fireptdata/modis_fire_2021_365_conus_shapefile.zip',
              destfile = './data/modis_fire_2021_365_conus_shapefile.zip')
unzip('./data/modis_fire_2021_365_conus_shapefile.zip', exdir = './data/')

#' read in data 
fire2021 <- sf::st_read(dsn = './data/modis_fire_2021_365_conus.shp')

#' the shape file is read in as a data.frame with spatial attributes
class(fire2021)    
names(fire2021)   # provides names of data table 
dim(fire2021)     # dimensions of data table (1 row per spatial feature)
st_crs(fire2021)  # retrieves coordinate reference system

#' make a map of Julian day of each fire
plot(fire2021["JULIAN"], pch = '.')

#' alternatively use ggplot (a bit slower option in this case)
ggplot(fire2021) + 
  geom_sf(aes(col = JULIAN), pch = '.') + 
  theme_minimal()

#' get summary statistics for each attribute just like we would for a dataframe

summary(fire2021)

#' We can also easily subset the object. 
#' Let's select fires that occurred in the last 6 months (days 182 to 365)
#' of 2021

fire <- subset(fire2021, JULIAN > 182)
class(fire)
names(fire)
dim(fire)
summary(fire)
plot(fire['JULIAN'], cex = 0.25)

#' It is a little more difficult to do a geographicaly defined subset. 
#' For example, let's select the fires in SC. First we'll identify which state
#' each fire occurred in, then subset the ones from SC. 
USA <- map(database='state', plot=FALSE, fill=TRUE)
names(USA)
USA$names
USA_sf <- st_as_sf(USA)

#' Let's make sure projection of USA polygon is same as fire points
USA_sf <- st_transform(USA_sf, st_crs(fire2021))

#' Now we overlay performs a "point in polygon" operation--meaning that it will
#' return us a vector giving the index of which polygon in USA_sp each point in
#' fire is. We then index that to names(USA_sp) to get the name of the state
#' for that index.
sf_use_s2(FALSE) 
fire_state <- st_intersection(fire2021, USA_sf)

#' Now let's subset the ones from SC. We have to use grep because there are actually
#' three polygons for SC.
firesc <- fire_state[grep("south carolina", fire_state$ID), ]
dim(firesc)


#' We'll setup a legend for the map of fires by temperature. 
addLegendToSFPlot <- function(values = c(0, 1), labels = c("Low", "High"), 
                              palette = c("blue", "red"), ...){

    # Get the axis limits and calculate size
    axisLimits <- par()$usr
    xLength <- axisLimits[2] - axisLimits[1]
    yLength <- axisLimits[4] - axisLimits[3]

    # Define the colour palette
    colourPalette <- leaflet::colorNumeric(palette, range(values))

    # Add the legend
    plotrix::color.legend(xl=axisLimits[2] - 0.1*xLength, xr=axisLimits[2],
                          yb=axisLimits[3], yt=axisLimits[3] + 0.1 * yLength,
                          legend = labels, rect.col = colourPalette(values), 
                          gradient="y", ...)
}

#' First make an SC spatial polygon to put around the fire points.

SC <- map(database='state', regions='south carolina', fill=T,
          plot=F)
                            
SC_st <- st_as_sf(SC)
SC_st <- st_transform(SC_st, crs=st_crs(firesc))

cuts <- cut(firesc$JULIAN, 10)
colors <- heat.colors(10)[as.numeric(cuts)] 

plot(st_geometry(SC_st))
plot(st_geometry(firesc['JULIAN']), add = TRUE,
     col = colors, pch = 19, cex = 0.5)


addLegendToSFPlot(values = seq(from = 183, to = 363, length.out = 10), 
                  labels = c("Low", "", "", "", "Medium", "", "", "", "", "High"),
                  palette = heat.colors(10))


#' Here's where ggplot shines as it makes it easy to combine multiple maps
ggplot() +                                            
  geom_sf(data = SC_st) +                              # add in SC polygon
  geom_sf(data = firesc, aes(col = JULIAN), cex = 0.25)  # add in fire data

#' For the last step, let's export this as a KML (readable by google earth) using
#' write OGR and plot the locations of fires in SC in google earth. The first
#' argument is the object we want to export, the second is the filename (by
#' default it will go in our working directory), the layer we want to export, and
#' the file format.
write_sf(firesc, "firesctemp.kml", driver="kml")

#' ## Rasters 
#' Rasters are grids of data. A common data grid to work with is 
#' climate data. 
#' You can download an Rdata file of bioclim climate data here:
## https://www.dropbox.com/s/gafxazc9575nf3j/bioclim_10m.Rdata?dl=0
#+ eval = FALSE
#' let's load load and plot the data
load('./data/bioclim_10m.Rdata')
bioStack
class(bioStack)
names(bioStack)
projection(bioStack)  # this is unprojected latlong like the fire data
plot(bioStack, "mat")

#' Let's extract the historical climate data at each of our fire locations
fire_climate <- extract(bioStack, firesc)
class(fire_climate)
head(fire_climate)
nrow(fire_climate)

#' merge the two datasets 
firesc <- cbind(firesc, fire_climate)
head(firesc)

# Fire temperatures in deg K at fire locations
ggplot() + 
  geom_sf(data = SC_st) + 
  geom_sf(data = firesc, aes(col = TEMP), cex = 0.25) 
# historical annual precip 
ggplot() + 
  geom_sf(data = SC_st) + 
  geom_sf(data = firesc, aes(col = ap), cex = 0.25) 
# relationship between annual precip and temp
plot(TEMP ~ mat, data=firesc, xlab = 'Annual precip', ylab = 'Fire temp (K)') 


#' These maps are cool but they are static. Let's make an interactive map using
#' the package `leaflet`
#' A quick demo of `leaflet` can be found here: https://rstudio.github.io/leaflet

mapStates <- map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)

#' we can add various provider tiles (i.e., maps) with additional data features
m <- leaflet(data = firesc) %>% addTiles() %>%
  addCircleMarkers(radius = 2, label = ~as.character(firesc$TEMP))
m %>% addProviderTiles(providers$Esri.NatGeoWorldMap)


#' it is possible to vary point radius and color based upon data fields
m <- leaflet(data = firesc) %>% addTiles() %>%
  addCircleMarkers(radius = ~(TEMP/max(TEMP)), label = ~as.character(firesc$TEMP))
m

m <- leaflet(data = firesc) %>% addTiles() %>%
  addCircleMarkers(radius = 2, color = ~TEMP,
                   label = ~as.character(firesc$TEMP))
m


