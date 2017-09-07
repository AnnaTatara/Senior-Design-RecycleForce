TArea <- 1884*4124 # Area of the facility
facility_cost <- 700000 # Assumed yearly cost of the facility
gArea <- 48*48 # Area of a gaylord
## Load data
nochange <- as.matrix(read.table("costNoChange.csv", sep=","))
noNorm <- nochange / sum(nochange) #Normalize


fullchange <- as.matrix(read.table("costFullChange.csv", sep=","))
fullNorm <- fullchange / sum(fullchange)

kingchange <- as.matrix(read.table("costKing.csv", sep=","))
kingnorm <- kingchange / sum(kingchange)
# TV areas
tvNochangeRow <- c((48*21):(48*29),1:(6*48))
tvNochangeCol <- c((30*48):(62*48))
tvNo1 <- noNorm[(48*21):(48*29),(30*48):(62*48)]
tvNo2 <- noNorm[(1:(6*48)),(30*48):(62*38)]


tvFull1 <- fullNorm[1:(48*2),(30*48):(62*48)]
tvFull2 <- fullNorm[1:(48*16),(10*48):(26*48)]

kingRow1 <- (21*48):(36*48)
kingCol1 <- 1:(29*48)
king1 <- kingnorm[kingRow1,kingCol1]
king2 <- kingnorm[1:(48*2),(30*48):(62*48)]

noChangeCost <- mean(tail(sort(c(tvNo1,tvNo2)),gArea)) * facility_cost * gArea / 365 

fullCost <- mean(tail(sort(c(tvFull1,tvFull2)),gArea)) * facility_cost * gArea / 365

kingCost <- mean(tail(sort(c(king1,king2)),gArea)) * facility_cost * gArea / 365 

sprintf("No facility change: $%.2f /(day gaylord)", noChangeCost)
sprintf("Team change: $%.2f /(day gaylord)", fullCost)
sprintf("King change: $%.2f /(day gaylord)", kingCost)
