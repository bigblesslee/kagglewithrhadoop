library(ggmap)


pick_location = data.frame(taxi_tmp$id, taxi_tmp$pickup_latitude, taxi_tmp$pickup_longitude) 
colnames(pick_location) = c("id","p_latitude","p_longtitude") 
plot(pick_location$p_latitude,pick_location$p_longtitude)




#pick_location_out = subset(pick_location,pick_location$p_latitude < 50) 
#pick_location_out2 = subset(pick_location_out, pick_location$p_longtitude>-100) 


pick_location_out1= subset(pick_location,pick_location$p_latitude >37)
pick_location_out2= subset(pick_location_out1, pick_location_out1$p_latitude <43)
pick_location_out3= subset(pick_location_out2, pick_location_out2$p_longtitude >-76)
pick_location_out4= subset(pick_location_out3, pick_location_out3$p_longtitude < -70)

#plot(pick_location_out4$p_latitude,pick_location_out4$p_longtitude) 

pairs(pick_location_out4)

newyork_map <- get_map("newyork", zoom=10, maptype = "roadmap")
#ggmap(newyork_map)


#ggmap(newyork_map,
#  base_layer =  ggplot(data = pick_location, aes(x = pick_location$p_logntitude, y = pick_location$p_latitude))+
#             geom_point(size=4,
#             alpha=0.8,
#             fill="blue"))

map <- ggmap(newyork_map) + geom_point(data = pick_location_out4,
                                       aes(x=p_longtitude, y=p_latitude, color = "blue"),
                                       size = 3)
map
