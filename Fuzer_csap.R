library(ncdf4)
csap <- nc_open("fuzer_csap.nc") 
aktdate <- as.Date("2007-01-01") + ncvar_get(csap,"time")/24
which(ncvar_get(csap,"lat") == 47.50) # 1
which(ncvar_get(csap,"lon") == 21.45) # 2

csapdata <- ncvar_get(csap,"t", start = c(2, 2, 1), count = c(1, 1, 220)) - 273.15

nc_close(csap)

library(xts)
fuzer <- xts(csapdata, aktdate)
plot("Csapadék változása 2007-2019 Füzér és környéke",
     xlab="idő", ylab="csapadék", type="o", col="orange")
