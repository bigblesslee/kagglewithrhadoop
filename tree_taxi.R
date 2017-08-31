hdfs.init()

hdfs.ls("/")

hdfs.rm("/taxi_data/taxi_tree")

Sys.getenv()
Sys.setenv("HADOOP_CMD"="/usr/local/hadoop-2.7.4/bin/hadoop")
Sys.setenv("HADOOP_STREAMING"="/usr/local/hadoop-2.7.4/share/hadoop/tools/lib/hadoop-streaming-2.7.4.jar")


frac.per.model = 0.1
num.model = 50

poisson.subsample = function(k,input){
  generate.sample = function(i) {
    draws = rpois(n=nrow(input), lambda = frac.per.model)
    indices = rep((1:nrow(input)),draws)
    keyval(i,input[indices,])
  }
  c.keyval(lapply(1:num.model,generate.sample))
}

fit.trees = function(k,v){
  rf = randomForest(formula= model.formula,
                    data = v,
                    ntree = 10,
                    do.trace = FALSE)
  # keyval(k,list(forest=rf))
}

model.formula = trip_duration ~ pickup_wday+vendor_id+passenger_count


mapreduce(input = "/taxi_data/taxi_com",
          input.format = make.input.format("csv",sep=","),
          map = poisson.subsample,
          reduce = fit.trees,
          output = "/taxi_data/taxi_tree")
  
      