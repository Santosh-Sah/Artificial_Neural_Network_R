importArtificialNeuralNetworkDataset <- function(artificialNeuralNetworkDatasetFileName) {
  
  #importing dataset
  artificialNeuralNetworkDataset = read.csv(artificialNeuralNetworkDatasetFileName)
  
  #getting the required columns
  artificialNeuralNetworkDataset = artificialNeuralNetworkDataset[4:14]
  
  # Encoding the categorical variables as factors
  artificialNeuralNetworkDataset$Geography = as.numeric(factor(artificialNeuralNetworkDataset$Geography,
                                        levels = c('France', 'Spain', 'Germany'),
                                        labels = c(1, 2, 3)))
  artificialNeuralNetworkDataset$Gender = as.numeric(factor(artificialNeuralNetworkDataset$Gender,
                                     levels = c('Female', 'Male'),
                                     labels = c(1, 2)))
  
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  artificialNeuralNetworkDatasetSlpit = sample.split(artificialNeuralNetworkDataset$Exited, SplitRatio = 0.80)
  
  artificialNeuralNetworkTrainingSet = subset(artificialNeuralNetworkDataset, artificialNeuralNetworkDatasetSlpit == TRUE)
  
  artificialNeuralNetworkTestingSet = subset(artificialNeuralNetworkDataset, artificialNeuralNetworkDatasetSlpit == FALSE)
  
  
  returnList <- list(artificialNeuralNetworkTrainingSet, artificialNeuralNetworkTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(artificialNeuralNetworkTrainingSet, artificialNeuralNetworkTestingSet){
  
  saveRDS(artificialNeuralNetworkTrainingSet, file = "ArtificialNeuralNetworkTrainingSet.RDS")
  saveRDS(artificialNeuralNetworkTestingSet, file = "ArtificialNeuralNetworkTestingSet.RDS")
  
}

#Save ArtificialNeuralNetwork Model
saveArtificialNeuralNetworkModel <- function(artificialNeuralNetworkModel) {
  
  saveRDS(artificialNeuralNetworkModel, file = "ArtificialNeuralNetworkModel.RDS")
}

#Save prediced values for testing set
saveArtificialNeuralNetworkPredictedValuesForTestingSet <- function(artificialNeuralNetworkPredictedValuesForTestingSet) {
  
  saveRDS(artificialNeuralNetworkPredictedValuesForTestingSet, file = "ArtificialNeuralNetworkPredictedValuesForTestingSet.RDS")
}
