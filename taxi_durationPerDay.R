hdfs.init()
hdfs.ls('/')
hdfs.mkdir("/taxi_data")
hdfs.put('/home/hadoop/R/taxi_com.csv','/taxi_data/taxi_com')
#### map function 

mapper_taxi = function(.,fields) { 
  w_day = as.character(fields[[13]]) 
  trip_duration = as.numeric(as.character(fields[[12]]))
  output = data.frame(num = 1, trip_duration = trip_duration)
  keyval( w_day , output ) 
}

reducer_taxi =function(k,v){
  duration_sum = sum(v$trip_duration)
  num_sum = sum(v$num)
  result = data.frame(duration_sum,num_sum)
  keyval(k,result)
}
mapreduce(input = "/taxi_data/taxi_com",
          input.format = make.input.format("csv",sep=","),
          map = mapper_taxi,
          reduce =reducer_taxi
)
test1 = from.dfs('/tmp/file244615e19e42')
test2 = from.dfs('/tmp/filefe7a2c9af3')
wday_duration = as.data.frame(test1)
wday_duration = wday_duration[complete.cases(wday_duration),]
pairs(wday_duration)
colnames(wday_duration)  = c("wday","total_duration","taxi_amount")
pairs(wday_duration)
