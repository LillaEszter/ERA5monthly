library(ncdf4)
hom <- nc_open("TempMoreYearsSopron.nc") 
aktdate <- as.Date("1900-01-01") + ncvar_get(hom,"time")/24
which(ncvar_get(hom,"lat") == 47.50) # 2
which(ncvar_get(hom,"lon") == 16.50) # 2

homdata <- ncvar_get(hom,"t2m_NON_CDM", start = c(2, 2, 1), count = c(1, 1, 220)) - 273.15

nc_close(hom)

library(xts)
sopron <- xts(homdata, aktdate)
plot(sopron)
