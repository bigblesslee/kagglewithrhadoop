pick_location = data.frame(taxi_tmp$id, taxi_tmp$pickup_latitude, taxi_tmp$pickup_longitude)
drop_location = data.frame(taxi_tmp$id, taxi_tmp$dropoff_latitude, taxi_tmp$dropoff_longitude)
colnames(pick_location) = c("id","p_latitude","p_longtitude")
colnames(drop_location) = c("id","d_latitude","d_longtitude")

pick_location_out = subset(pick_location,pick_location$p_latitude < 50)
pick_location_out2 = subset(pick_location, pick_location_out2$p_longtitude>-100)

plot(pick_location_out2$p_latitude,pick_location_out2$p_longtitude)

