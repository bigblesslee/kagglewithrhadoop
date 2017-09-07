library(ggmap)

drop_location = data.frame(taxi_tmp$id, taxi_tmp$dropoff_latitude, taxi_tmp$dropoff_longitude) 
colnames(drop_location) = c("id","d_latitude","d_longtitude") 


drop_location_out1= subset(drop_location,drop_location$d_latitude >37)
drop_location_out2= subset(drop_location_out1, drop_location_out1$d_latitude <43)
drop_location_out3= subset(drop_location_out2, drop_location_out2$d_longtitude >-76)
drop_location_out4= subset(drop_location_out3, drop_location_out3$d_longtitude < -70)

newyork_map <- get_map("newyork", zoom=9, maptype = "roadmap")

map <- ggmap(newyork_map) + geom_point(data = drop_location_out4,
                                       aes(x=d_longtitude, y=d_latitude, color = "blue"),
                                       size = 2)
map
