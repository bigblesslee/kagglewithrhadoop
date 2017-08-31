pick_location = data.frame(taxi_tmp$id, taxi_tmp$pickup_latitude, taxi_tmp$pickup_longitude)
drop_location = data.frame(taxi_tmp$id, taxi_tmp$dropoff_latitude, taxi_tmp$dropoff_longitude)
colnames(pick_location) = c("id","p_latitude","p_longtitude")
colnames(drop_location) = c("id","d_latitude","d_longtitude")

plot(pick_location$p_latitude,pick_location$p_longtitude)
