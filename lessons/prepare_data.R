
library(ecoretriever)

## create a clean subset of the McGlinn2010 Tallgrass Prairie dataset
## metadata available here: http://esapubs.org/archive/ecol/E091/124/
dat = fetch('McGlinn2010')
cols_of_interest = c('plot', 'year', 'easting', 'northing', 'slope', 'ph', 'yrsslb')
tgpp = merge(dat$richness, dat$environment[ , cols_of_interest],
             all.x = T, all.y=F)
write.csv(tgpp, file='./data/tgpp.csv', row.names=F)
