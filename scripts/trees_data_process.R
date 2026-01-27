trees <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/treedata_subset.csv')

trees$disturb <- as.factor(trees$disturb)

# we wish to model species cover across all sampled plots

# create site x sp matrix for two species 
sp_cov <- with(trees, tapply(cover, list(plotID, spcode), 
                             function(x) round(mean(x))))
sp_cov <- ifelse(is.na(sp_cov), 0, sp_cov)
sp_cov <- data.frame(plotID = row.names(sp_cov), sp_cov)

# create environmental matrix
cols_to_select <- c('elev', 'tci', 'streamdist', 
                    'disturb', 'beers')
env <- aggregate(trees[ , cols_to_select], by = list(trees$plotID), 
                 function(x) x[1])
names(env)[1] = 'plotID'

# merge species and enviornmental matrices
site_dat <- merge(sp_cov, env, by='plotID')

# subset species of interest
abies <- site_dat[ , c('ABIEFRA', cols_to_select)]
acer  = site_dat[ , c('ACERRUB', cols_to_select)]
names(abies)[1] = 'cover'
names(acer)[1] = 'cover'

write.csv(abies, file = './data/fir.csv')
write.csv(acer, file = './data/maple.csv')
