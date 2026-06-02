library(readxl)

df <- read_excel('C:/Users/wolfd/Documents/GitHub/Praca-licencjacka/Eksperyment koncowy/dane_syntetyczne.xlsx')
dane_df <- as.data.frame(df)


m1<-lm(Y~.,data=dane_df)
m2<-step(m1,direction = 'backward',k=2)
m3<-step(m1,direction = 'backward',k=log(nrow(dane_df)))



library(leaps)
# 2. Pobranie wyników
m_subset <- regsubsets(Y ~ ., data = dane_df, nvmax = 10, method = "exhaustive")
res <- summary(m_subset)

# 3. Wybór modelu z 10 zmiennymi
# Uwaga: w regsubsets 'which' zwraca tablicę logiczną, gdzie 10 to indeks dla 10 zmiennych
vars_10 <- colnames(res$which)[res$which[10, ]][-1] # Lista 10 zmiennych

# 4. Budowa modelu finalnego z wybranymi zmiennymi
formula_10 <- as.formula(paste("Y ~", paste(vars_10, collapse = "+")))
model_final <- lm(formula_10, data = dane_df)

