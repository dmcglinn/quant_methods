# metadata url:
# https://fsapps.nwcg.gov/afm/data/fireptdata/modisfire_2007_conus.htm
# data from  MODIS is from 2007 to 2020 but some years are missing(?)

yrs <- c(2007, 2009, 2010, 2013:2021)

for (i in seq_along(yrs)) { 
  url <- paste0('https://fsapps.nwcg.gov/afm/data/fireptdata/modis_fire_', yrs[i],
                '_365_conus_shapefile.zip')
  folder <- paste0('./data/modis_fire/modis_fire_', yrs[i], '_365_conus')
  file <- paste0('modis_fire_', yrs[i], '_365_conus_shapefile.zip')
  dir.create(folder)
  download.file(url, paste(folder, file, sep ='/'))
  unzip(paste(folder, file, sep ='/'), exdir = folder)
}
