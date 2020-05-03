source("ArtificialNeuralNetworkUtils.R")

artificialNeuralNetworkDatasetList <- importArtificialNeuralNetworkDataset("Artificial_Neural_Network_Churn_Modelling.csv")

saveTrainingAndTestingDataset(artificialNeuralNetworkDatasetList[[1]], artificialNeuralNetworkDatasetList[[2]])
