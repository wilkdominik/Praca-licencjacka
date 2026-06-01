install.packages("readxl")
library(readxl)

df <- read_excel('C:/Users/wolfd/Documents/GitHub/Praca-licencjacka/Eksperyment koncowy/dane_syntetyczne.xlsx')
dane_df <- as.data.frame(df)
