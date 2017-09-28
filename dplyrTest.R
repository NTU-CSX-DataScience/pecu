library(dplyr)
library(hflights)

head(hflights)
dataOrg = hflights

temp = filter(dataOrg, Month == 1 | dataOrg$DayOfWeek == 3)
SelTemp = select(dataOrg, DayOfWeek, Month, DepTime, UniqueCarrier) %>%
  filter(Month == 1 | DayOfWeek == 3)
