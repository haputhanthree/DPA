#load data from CSV
Paddy_Yala = read.csv("paddy_production_in_yala_season_1952_2012.csv" , header = TRUE)
Paddy_Maha = read.csv("paddy_production_in_maha_season_1952-2012.csv" , header = TRUE)

#get 2011, 2012 data fro yala
Paddy_Yala = Paddy_Yala[60:61,]
Paddy_Yala

#asign values to variable
val_Season_yala = c("Yala")
val_Season_maha = c("Maha")
val_year = c("2011","2012")
library(dplyr)

#add year and season colums to data
Paddy_Yala =mutate(Paddy_Yala, Season = val_Season_yala , Year =val_year)
Paddy_Yala[2:11]
Paddy_Maha = Paddy_Maha[60:61,]
Paddy_Maha

#add year and season colums to data
Paddy_Maha =mutate(Paddy_Maha, Season = val_Season_maha , Year =val_year)
Paddy_Maha[2:11]
paddy_Combine = rbind(Paddy_Yala[2:11],Paddy_Maha[2:11])
paddy_Combine

# library
library(ggplot2)

# plot Sown area
p1 = ggplot(paddy_Combine, aes(fill=Season, y=Sown.000.Acres, x=Year)) +
  geom_bar(position="dodge", stat="identity")+ylab("Acres Sown") +
  ggtitle("Sown Area")
# plot Harvested area
p2 = ggplot(paddy_Combine, aes(fill=Season, y=Harvested.000.Acres, x=Year)) +
  geom_bar(position="dodge", stat="identity")+ylab("Acres Harvested")+
  ggtitle("Harvested Area")

library(gridExtra)
grid.arrange(p1, p2, nrow = 1)


# Plot Production in Bushels
p3 = ggplot(paddy_Combine, aes(fill=Season, y=Production.000.Bushels, x=Year)) +
  geom_bar(position="dodge", stat="identity")+ylab("Production Bushels")+
  ggtitle("Production in Bushels")

# plot Average yield in Bushels per Acre
p4 = ggplot(paddy_Combine, aes(fill=Season, y=Average.Yield.Bushels.Acre, x=Year)) +
  geom_bar(position="dodge", stat="identity")+ylab("Yield Bushels Acre")+
  ggtitle("Average yield in Bushels per Acre")

grid.arrange(p3, p4, nrow = 1)
