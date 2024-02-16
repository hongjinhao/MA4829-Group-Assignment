Suronehot <- read.csv("SURVEY RESULTS_2024_one-hotcsv.csv") #Read one-hot encoding csv file

View(Suronehot)

install.packages("arules")

ms = as.matrix(Suronehot) #putting the one-hot encoding as a matrix

ms = as(ms,"transactions") 

rules=apriori(ms, parameter=list(supp=0.3,conf=0.8,minlen=2))

inspect(rules)