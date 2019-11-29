library(ncdf4)
csap <- nc_open("fuzer_csap.nc") 
csap
aktdate <- as.Date("1900-01-01") + ncvar_get(csap,"time")/24
ncvar_get(csap,"lat")
which(ncvar_get(csap,"lat") == 47.50) # 3
ncvar_get(csap,"lon")
which(ncvar_get(csap,"lon") == 21.4) # 5
ncvar_get(csap,"lon")

csapdata <- ncvar_get(csap,"tp_NON_CDM", start = c(3, 5, 1), count = c(1, 1, 148))

nc_close(csap)

library(xts)
fuzer <- xts(csapdata, aktdate)
fuzer.mm <- fuzer * 1000
plot(fuzer, main="Csapadék változása 2007-2019 Füzér és környéke",
     xlab="idő", ylab="csapadék", type="o", col="orange")
