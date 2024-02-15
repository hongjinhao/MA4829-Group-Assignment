install.packages("arules")

library(arules)

data(Epub)

summary(Epub)

inspect(Epub[1:10])

itemFrequency(Epub[ ,1:10])

itemFrequencyPlot(Epub, support = 0.015, main = "item frequency plot above support 1%")

itemFrequencyPlot(Epub, topN = 30, main = "support top 30 items")

Epub_rule <- apriori(data= Epub, parameter = list(support = 0.001, confidence = 0.2, minlen = 2))

summary(Epub_rule)

inspect(Epub_rule[1:10])

inspect(sort(Epub_rule, by = "lift")[1:10])

detach("package:arules", unload = TRUE)  # For arules

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L
