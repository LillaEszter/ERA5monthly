library(ncdf4)
hom <- nc_open("adaptor.mars.internal-1570982526.5532598-9802-27-ec441651-d2d9-43fb-8b59-22b1d12186d0.nc") 
aktdate <- as.Date("1900-01-01") + ncvar_get(hom,"time")/24
which(ncvar_get(hom,"latitude") == 47.50) # 171
which(ncvar_get(hom,"longitude") == 16.50) # 67

homdata <- ncvar_get(hom,"t2m", start = c(67,171,1), count = c(1,1,12)) - 273.15

nc_close(hom)

library(xts)
sopron2002 <- xts(homdata, aktdate)
plot(sopron2002)
