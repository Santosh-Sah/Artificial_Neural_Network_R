source("ArtificialNeuralNetworkUtils.R")
library(h2o)

#reading testing set data
artificialNeuralNetworkTestingSet <- readRDS("ArtificialNeuralNetworkTestingSet.RDS")

#feature scaling
artificialNeuralNetworkTestingSet[-11] = scale(artificialNeuralNetworkTestingSet[-11])

#taking two onservation 
artificialNeuralNetworkTestingSet = artificialNeuralNetworkTestingSet[2:3,]

#reading ArtificialNeuralNetwork model
artificialNeuralNetworkModel = readRDS("ArtificialNeuralNetworkModel.RDS")

#initiating h20 library
h2o.init(port = 4800, nthreads = -1)

#predicting testing set result.
prob_pred = h2o.predict(artificialNeuralNetworkModel, newdata = as.h2o(artificialNeuralNetworkTestingSet[-11]))

y_pred = ifelse(prob_pred > 0.5, 1, 0)

y_pred

h2o.shutdown()