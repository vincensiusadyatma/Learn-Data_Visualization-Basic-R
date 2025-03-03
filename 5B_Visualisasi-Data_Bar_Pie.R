## Memanggil library ggplot2
library(ggplot2)

## Membaca data dan memasukan ke dalam variable
setwd("E:/MATERI KULIAH SADHAR/Semester 6/Data Mining/Belajar Visualisasi Data R/Visualisasi Data Dasar Dengan R")
penduduk<- read.csv("dataset/dkijumlahpenduduk_2_2013.csv", sep=";")

## Membuat Plot dengan geom_bar
plot_penduduk <- ggplot(data=penduduk, aes(x = NAMA.KABUPATEN.KOTA))
plot_penduduk+geom_bar()

#Aesthatic Y dan Stat Identity
plot_penduduk <- ggplot(data=penduduk, aes(x = NAMA.KABUPATEN.KOTA, y=JUMLAH))
plot_penduduk+geom_bar(stat="identity")                        

#Aesthetic Fill dan Position Dodge
plot_penduduk <- ggplot(data=penduduk, aes(x = NAMA.KABUPATEN.KOTA, y=JUMLAH, fill=JENIS.KELAMIN))
plot_penduduk+geom_bar(stat="identity",position="dodge")





#Fungsi Aggregate
penduduk<- read.csv("dataset/dkijumlahpenduduk_2_2013.csv", sep=";")

#Melakukan agregasi
p <- aggregate(x=list(JUMLAH=penduduk$JUMLAH), FUN=sum, by = list(NAMA.KABUPATEN.KOTA=penduduk$NAMA.KABUPATEN.KOTA, JENIS.KELAMIN=penduduk$JENIS.KELAMIN))
#Bagian plot
plot.dki <- ggplot(data=p, aes(x = NAMA.KABUPATEN.KOTA, y=JUMLAH,fill=JENIS.KELAMIN, label = JUMLAH))

#Bagian penambahan layer
plot.dki <- plot.dki + geom_bar(stat="identity", position="dodge")

plot.dki <- plot.dki + labs(title="Jumlah Penduduk DKI Jakarta Umur > 35 - Tahun 2013", x="Kabupaten / Kota", y="Jumlah Penduduk")
plot.dki <- plot.dki + theme(axis.text.x = element_text(angle=45,vjust = 0.5), plot.title = element_text(hjust=0.5))
plot.dki <- plot.dki + geom_text(position = position_dodge(1.2))
plot.dki



#Membuat grafik PIE
penduduk<- read.csv("dataset/dkijumlahpenduduk_2_2013.csv", sep=";")
p <- aggregate(x=list(JUMLAH=penduduk$JUMLAH), FUN=sum, by = list(NAMA.KABUPATEN.KOTA=penduduk$NAMA.KABUPATEN.KOTA))

#Plot grafik pie chart
plot.dki <- ggplot(data=p, aes(x="", y=JUMLAH, fill = NAMA.KABUPATEN.KOTA))

plot.dki <- plot.dki + geom_bar(width = 1, stat = "identity")
plot.dki <- plot.dki + coord_polar("y", start=0)
plot.dki

#Membagi Grafik dengan Faceting
penduduk<- read.csv("dataset/dkijumlahpenduduk_2_2013.csv", sep=";")
#Menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data=penduduk, aes(x = LUAS.WILAYAH..KM2.,  y=KEPADATAN..JIWA.KM2.,  color=NAMA.KABUPATEN.KOTA))

#Menambahkan layer
plot.dki <- plot.dki + layer(geom = "point", stat="identity", position = "identity")
plot.dki <- plot.dki + labs(x="Luas Wilayah (km2)", y="Kepadatan Jiwa (km2)", color="Kabupaten/Kota")
plot.dki + facet_wrap( ~ NAMA.KABUPATEN.KOTA, ncol=2)

#Faceting pada Histogram
penduduk<- read.csv("dataset/dkijumlahpenduduk_2_2013.csv", sep=";")
#Menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data=penduduk, aes(x=KEPADATAN..JIWA.KM2.,  fill=NAMA.KABUPATEN.KOTA))

#Menambahkan layer
plot.dki <- plot.dki + geom_histogram(binwidth=10000)
plot.dki <- plot.dki + labs(x="Kepadatan Jiwa (km2)", y="Jumlah Kelurahan", color="Kabupaten/Kota")
plot.dki + facet_wrap(~NAMA.KABUPATEN.KOTA, ncol=2)