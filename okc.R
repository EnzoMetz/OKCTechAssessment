library(dplyr)
data <- read.csv("shots_data.csv")

data["distance"] <- sqrt(data["x"]^2 + data["y"]^2)
data_ta <- subset(data, team == "Team A")
data_tb <- subset(data, team == "Team B")

# team A subsets
data_c3a <- subset(data_ta, (x > 22 | x < -22) & y <= 7.8)
data_nc3a <- subset(data_ta, distance >= 23.75 & y > 7.8)
data_3pta <- rbind(data_c3a, data_nc3a)
data_2pta <- anti_join(data_ta, data_3pta)

# percentage of shots in 2PT zone
print(nrow(data_2pta) / nrow(data_ta))
# percentage of shots in NC3 zone
print(nrow(data_nc3a) / nrow(data_ta))
# percentage of shots in C3 zone
print(nrow(data_c3a) / nrow(data_ta))
# eFG 2PT zone
print(nrow(subset(data_2pta, fgmade == 1)) / nrow(data_2pta))
# eFG NC3 zone
print((1.5 * nrow(subset(data_nc3a, fgmade == 1))) / nrow(data_nc3a))
# eFG NC3 zone
print((1.5 * nrow(subset(data_c3a, fgmade == 1))) / nrow(data_c3a))

data_c3b <- subset(data_tb, (x > 22 | x < -22) & y <= 7.8)
data_nc3b <- subset(data_tb, distance >= 23.75 & y > 7.8)
data_3ptb <- rbind(data_c3b, data_nc3b)
data_2ptb <- anti_join(data_tb, data_3ptb)

# percentage of shots in 2PT zone
print(nrow(data_2ptb) / nrow(data_tb))
# percentage of shots in NC3 zone
print(nrow(data_nc3b) / nrow(data_tb))
# percentage of shots in C3 zone
print(nrow(data_c3b) / nrow(data_tb))
# eFG 2PT zone
print(nrow(subset(data_2ptb, fgmade == 1)) / nrow(data_2ptb))
# eFG NC3 zone
print((1.5 * nrow(subset(data_nc3b, fgmade == 1))) / nrow(data_nc3b))
# eFG NC3 zone
print((1.5 * nrow(subset(data_c3b, fgmade == 1))) / nrow(data_c3b))