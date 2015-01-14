## arithmitic ----------------------------------------


## variable assignment --------------------------------
weight_kg <- 55

weight_kg

# weight in pounds:
2.2 * weight_kg

weight_kg <- 57.5
# weight in kilograms is now
weight_kg

weight_lb <- 2.2 * weight_kg
# weight in kg...
weight_kg
# ...and in pounds
weight_lb

weight_kg <- 100.0
# weight in kg now...
weight_kg
# ...and in weight pounds still
weight_lb

###---------------------------
dat <- read.csv(file = "./lessons/inflammation-01.csv", header = FALSE)

head(dat)

class(dat)

# first value in dat
dat[1, 1]
# middle value in dat
dat[30, 20]

dat[1:4, 1:10]

dat[c(3, 8, 37, 56), c(10, 14, 29)]

# All columns from row 5
dat[5, ]
# All rows from column 16
dat[, 16]

# first row, all of the columns
patient_1 <- dat[1, ]
# max inflammation for patient 1
max(patient_1)

# max inflammation for patient 2
max(dat[2, ])

# minimum inflammation on day 7
min(dat[, 7])
# mean inflammation on day 7
mean(dat[, 7])
# median inflammation on day 7
median(dat[, 7])
# standard deviation of inflammation on day 7
sd(dat[, 7])

# Thus, to obtain the average inflammation of each patient we will need to
# calculate the mean of all of the rows (`MARGIN = 1`) of the data frame.

avg_patient_inflammation <- apply(dat, 1, mean)

# And to obtain the average inflammation of each day we will need to calculate
# the mean of all of the columns (`MARGIN = 2`) of the data frame.

avg_day_inflammation <- apply(dat, 2, mean)






