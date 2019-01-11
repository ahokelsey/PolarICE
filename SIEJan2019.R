#Sea Ice Records
#data source
#http://nsidc.org
#ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv
#Antarctic Data
#ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/south/daily/data/S_seaice_extent_daily_v3.0.csv


ARC <- read.csv("ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv", header = FALSE, skip = 2)

ARC <- ARC[,1:4]
###paste the Year, Month, Day columns and utrn them into a date that R can recovgnize

ARC_tm <- paste(ARC[,1], ARC[,2], ARC[,3], sep = "-")
ARC_tm <- strptime(ARC_tm, format = "%Y-%m-%d", tz = "GMT")

#Designate the 4th column as the SIE
ARC_SIE <- ARC[,4]

ANT <- read.csv("ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/south/daily/data/S_seaice_extent_daily_v3.0.csv", header = FALSE, skip = 2)
ANT <- ANT[,1:4]
ANT_tm <- paste(ANT[,1], ANT[,2], ANT[,3], sep = "-")
ANT_tm <- strptime(ANT_tm, format = "%Y-%m-%d", tz = "GMT")

#Designate the 4th column as the SIE
ANT_SIE <- ANT[,4]

#plot the record of Arctic and Antarctic sea ice extent from 1979 to present

plot(x= ANT_tm, y=ANT_SIE, type = "l", lwd = 2, col = "grey", xlab = "Date", ylab = "Sea Ice Extent", main = "Daily Sea Ice Extent (millions sq. km)" , ylim = c(0, 20))

lines(x = ARC_tm, y =ARC_SIE, type = "l", lwd = 2, col = "black")
legend(x = "bottomright", legend = c("Arctic", "Antarctic"), lwd = 2, col = c("black" , "grey"), bty = "n", horiz = TRUE)

##read in the Arctic March and Sept 

ARC_MAR <- read.csv("ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/monthly/data/N_03_extent_v3.0.csv", header = TRUE)
ARC_SEP <- read.csv("ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/monthly/data/N_09_extent_v3.0.csv", header = TRUE)

#Read in Ant 
ANT_MAR <- read.csv("ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/south/monthly/data/S_03_extent_v3.0.csv", header = TRUE)
ANT_SEP <- read.csv("ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/south/monthly/data/S_09_extent_v3.0.csv", header = TRUE)

plot(x = ARC_MAR[,1], y = ARC_MAR[,5], type = "o", lwd = 2, xlab = "Year", ylab = "Sea Ice Extent", main = "Arctic Monthly Sea Ice Extent \n (million sq. km.)", ylim = c(0,20), pch = 1)

points(x = ARC_SEP[,1], y = ARC_SEP[,5], type = "o", lwd = 2, pch = 20)
legend(x = "bottomleft", legend = c("Mar." , "Sep."), pch = c(1,20), lwd = 2, horiz = TRUE, bty = "n")

plot(x = ANT_MAR[,1], y = ANT_MAR[,5], type = "o", lwd = 2, xlab = "Year", ylab = "Sea Ice Extent", main = "Antarctic Monthly Sea Ice Extent \n (million sq. km.)", ylim = c(0,20), pch = 1)

points(x = ANT_SEP[,1], y = ANT_SEP[,5], type = "o", lwd = 2, pch = 20)
legend(x = "bottomleft", legend = c("Mar." , "Sep."), pch = c(1,20), lwd = 2, horiz = TRUE, bty = "n")

