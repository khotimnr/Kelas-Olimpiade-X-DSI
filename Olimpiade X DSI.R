#Basic Statistic 
"Selain analisis deskriptif baiknya mengetahui visualisasi dari data yang digunakan"

#Analisis Deskriptif
summary(X_1_Dataset_Kelas_Olimpiade)

#Membuat Boxplot
boxplot(X_1_Dataset_Kelas_Olimpiade$`Lama terdiagnosa (bulan)`)

#Modifikasi Box Plot
boxplot(X_1_Dataset_Kelas_Olimpiade$`Umur (tahun)`,
main = "Boxplot Umur",
xlab = "X",
ylab = "Y",
col = "orange",
border = "brown",
horizontal = TRUE,
notch = TRUE
)

# Multiple Box Plot
# prepare the data
Umur <- X_1_Dataset_Kelas_Olimpiade$`Umur (tahun)`
Diagnosa <- X_1_Dataset_Kelas_Olimpiade$`Lama terdiagnosa (bulan)`
Ketaatan <- X_1_Dataset_Kelas_Olimpiade$`Tingkat ketaatan`
# gererate normal distribution with same mean and sd
umur_norm <- rnorm(200,mean=mean(Umur, na.rm=TRUE), sd=sd(Umur, na.rm=TRUE))
Diagnosa_norm <- rnorm(200,mean=mean(Diagnosa, na.rm=TRUE), sd=sd(Diagnosa, na.rm=TRUE))
Ketaatan_norm <- rnorm(200,mean=mean(Ketaatan, na.rm=TRUE), sd=sd(Ketaatan, na.rm=TRUE))

boxplot(Umur, umur_norm, Diagnosa, Diagnosa_norm, Ketaatan, Ketaatan_norm,
        main = "Multiple boxplots for comparision",
        names = c("Umur", "normal", "Diagnosa", "normal", "Ketaatan", "Normal"),
        las = 2,
        col = c("blue","red"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#Plot
plot(X_1_Dataset_Kelas_Olimpiade$`Lama terdiagnosa (bulan)`, type="o", col="blue")
title(main="Lama Diagnosa", col.main="red", font.main=4)

#Bar Plot
table(X_1_Dataset_Kelas_Olimpiade$`Jenis kelamin`)
barplot(table(X_1_Dataset_Kelas_Olimpiade$`Jenis kelamin`),
        main="Jenis Kelamin",
        xlab="Jenis Kelamin",
        ylab="Jumlah",
        border="red",
        col="darkred",
        density=10
)

#Pie Chart
table(X_1_Dataset_Kelas_Olimpiade$`Jenis kelamin`)
pie(table(X_1_Dataset_Kelas_Olimpiade$`Tingkat pendidikan`),
    labels=as.character(X_1_Dataset_Kelas_Olimpiade$`Tingkat pendidikan`),
    main="Pendidikan",
    col=c("red","yellow","blue","green"),
    border="brown",
    clockwise=TRUE
)


