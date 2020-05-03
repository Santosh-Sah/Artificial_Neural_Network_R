source("ArtificialNeuralNetworkUtils.R")

#reading ArtificialNeuralNetwork model
artificialNeuralNetworkModel = readRDS("ArtificialNeuralNetworkModel.RDS")

#reading testing set data
artificialNeuralNetworkTestingSet <- readRDS("ArtificialNeuralNetworkTestingSet.RDS")

#reading predicted values of the testing set
artificialNeuralNetworkPredictedValuesForTestingSet <- readRDS("ArtificialNeuralNetworkPredictedValuesForTestingSet.RDS")

artificialNeuralNetworkConfusionMatrix = table(artificialNeuralNetworkTestingSet[, 11], artificialNeuralNetworkPredictedValuesForTestingSet)

artificialNeuralNetworkConfusionMatrix

#     0    1
# 0 1515   78
# 1  209  198
