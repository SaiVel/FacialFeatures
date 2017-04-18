Data_Actual <- read.csv("ActualData.csv")

mturk_data1 = read.csv("Iteration1_results.csv");
aggregate(mturk_data1$Answer.age, list(mturk_data1$Input.image_url), mean) -> aggregated_data1
aggregated_data1$Group.1 <- sub("https://github.com/SaiVel/FaceImages/blob/master/", "", aggregated_data1$Group.1)
aggregated_data1$Group.1 <- gsub("[?raw=true]", "", aggregated_data1$Group.1)


mturk_data2 = read.csv("Iteration2_results.csv");
aggregate(mturk_data2$Answer.age, list(mturk_data2$Input.image_url), mean) -> aggregated_data2
aggregated_data2$Group.1 <- sub("https://github.com/SaiVel/FaceImages/blob/master/", "", aggregated_data2$Group.1)
aggregated_data2$Group.1 <- gsub("[?raw=true]", "", aggregated_data2$Group.1)


Act <- as.data.frame(Data_Actual)
names(Act)<- c("Image", "Actual_Age")

Pred1 <- as.data.frame(aggregated_data1)
names(Pred1)<- c("Image", "Predicted_Age1")

Pred2 <- as.data.frame(aggregated_data2)
names(Pred2)<- c("Image", "Predicted_Age2")

Merge_Pred1 <- merge(Act, Pred1)
Merge_Pred2 <- merge(Act, Pred2)
Merge_TwoPred <- merge(Pred1, Pred2)

rmse(Merge_Pred1$Actual_Age, Merge_Pred1$Predicted_Age1)
rmse(Merge_Pred2$Actual_Age, Merge_Pred2$Predicted_Age2)