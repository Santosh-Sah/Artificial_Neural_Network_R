source("ArtificialNeuralNetworkUtils.R")
library(h2o)

#reading training set 
artificialNeuralNetworkTrainingSet <- readRDS("ArtificialNeuralNetworkTrainingSet.RDS")

#feature scaling
artificialNeuralNetworkTrainingSet[-11] = scale(artificialNeuralNetworkTrainingSet[-11])

#initiating h20 library
h2o.init(port = 4800, nthreads = -1)

# Fitting ArtificialNeuralNetwork to the Training set
#I am going to use h2o.deeplearning to create artificial neural network
#hidden is one of the parameter. It takes two values. 
#One is the nymber of hidden layer.
#second is the number of nodes in each hidden layer.
#Ex c(5,5) it means two hidden layer and first hidden layer has 5 neurons and second hidden layer has 5 neurons.
#train_samples_per_iteration is for the batch size. It has some default value 0, -1, and -2.
#If we will choose -2 then artificial neural network will auto tune itself.
artificialNeuralNetwork = h2o.deeplearning(y = 'Exited',
                                           training_frame = as.h2o(artificialNeuralNetworkTrainingSet),
                                           activation = 'Rectifier',
                                           hidden = c(5,5),
                                           epochs = 100,
                                           train_samples_per_iteration = -2)
  
#saving ArtificialNeuralNetwork model
saveArtificialNeuralNetworkModel(artificialNeuralNetwork)

h2o.shutdown()
