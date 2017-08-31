foo = data.frame(taxi_temp$trip_duration,taxi_temp$pickup_wday)
k_res = kmeans(foo,3,nstart = 25)
plot(foo,col=k_res$cluster)
points(k_res$center,col=1:3,pch=8,cex=15)


pick_location = data.frame(taxi_temp$id,taxi_temp$pickup_latitude,taxi_temp$pickup_longitude)
drop_location = data.frame(taxi_temp$id, taxi_temp$dropoff_latitude, taxi_temp$dropoff_longitude)
colnames(pick_location) = c("id","p_latitude","p_longtitude")
colnames(drop_location) = c("id","d_latitude","d_longtitude")
pl = data
ggplot(data = pick_location, aes(x=pick_location$p_latitude,y=pick_location$p_longtitude))+geom_point()
pl1 = pick_location[pick_location$p_latitude<43,]
pl2 = pl1[pl1$p_latitude>37,]
pl3 = pl2[pl2$p_longtitude>-120,]
pl4 = pl3[pl3$p_longtitude< -70,]

ggplot(data = pl4, aes(x=pl4$p_latitude,y=pl4$p_longtitude))+geom_point()

summary(pick_location)
