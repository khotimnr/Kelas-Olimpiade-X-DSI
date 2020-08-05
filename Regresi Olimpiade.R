# Model Regresi Berganda
# Syarat Regresi Linier Berganda adalah
# 1. Pastikan data dapat diuji parametrik
# 2. Pastikan variabel Y memiliki hubungan secara teori dengan variabel X
# 3. Jenis data Y adalah interval atau rasio dan X minimal ada 1 variabel yang Interval atau rasio


#Library yang disiapkan antara lain
library(car) 
library(tseries)
library(lmtest)
library(stats)
library(ggplot2)

#Melakukan Pemodelan dengan membuat persamaan model
# fit <- lm(`Pertumbuhan Ekonomi` ~ Import+ Pengangguran+ `Kepadatan Penduduk`, data = Data_Soal_Olimpiade)
fit
step(fit)
# syntax untuk mendapatkan koefisien, confidence interval, predicted value, residual, tabel anova, matrix kovarian
coefficients(fit)
confint(fit, level=0.95) # Confidence Interval
fitted(fit) # Predicted value
resids <- residuals(fit) #Residuals
anova(fit) # Anova Table
vcov(fit) # Covariance Matrix
layout(matrix(c(1,2,3,4),2,2))
plot(fit)
#Uji Asumsi pada Regresi Linier Berganda antara lain Normalitas, Heteroskedastisitas, Multikolinieritas dan autokorelasi
#Uji Normalitas dapat menggunakan 

shapiro.test(resids)
jarque.bera.test(resids)

#Heteroskedastisitas menggunakan uji Breusch Pagan
bptest(fit, studentize=F, data=Data_Soal_Olimpiade)

# Uji multikolinieritas dengan menggunakan perintah
vif(fit)

#Jika ada model sudah di temukan maka terdapat asumsi yang tidak terpenuhi maka dilakukan beberapa cara
#Salah satunya adalah transformasi variabel Y
a<-boxCoxVariable(Data_Soal_Olimpiade$`Pertumbuhan Ekonomi`)
a
trans <- lm(a~ Import+ Pengangguran+ `Kepadatan Penduduk`, data = Data_Soal_Olimpiade)
summary.lm(trans)

#Setelah transformasi dilakukan uji asumsi lagi dan mendapatkan model terbaik

