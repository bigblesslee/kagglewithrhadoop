
pickup_datetime =taxi_tmp[,4]
pickup_datetime = as.data.frame(pickup_datetime)
tmp1 = pickup_datetime[,1]
date = as.POSIXlt(tmp1)
month = date$mon
hour = date$hour

mhd = data.frame(taxi_tmp$trip_duration,month,hour)
colnames(mhd) = c("trip_duration","month","hour")
plot(hour,trip_duration)

library(plyr)
h_am =ddply(mhd,"hour",summarise,total.count=sum(1))
plot(h_d)
length(mhd$hour[hour==0])
