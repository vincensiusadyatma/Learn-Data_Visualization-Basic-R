## Memanggil library ggplot2
library(ggplot2)

## Membaca data dan memasukan ke dalam variable
setwd("E:/MATERI KULIAH SADHAR/Semester 6/Data Mining/Belajar Visualisasi Data R/Visualisasi Data Dasar Dengan R")
inflasi.indo.sing<- read.csv("dataset/inflasi.csv", sep=",")

str(inflasi.indo.sing)

#Membuat Plotting Line Chart

# Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data=inflasi.indo.sing, aes(x = Bulan,  y=Inflasi,  color=Negara))   

# Menambah Layer

plot.inflasi +  geom_line()


#Pengelompokan Data (Grouping)

# Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data=inflasi.indo.sing, aes(x = Bulan,  y=Inflasi,  color=Negara, group=Negara)) 

# Menambah Layer

plot.inflasi +  geom_line()

#Memperbaiki urutan bulan dengan Factoring
factor(inflasi.indo.sing$bulan, levels = c("Jan-2017", "Feb-2017", "Mar-2017", "Apr-2017", "May-2017", "Jun-2017", "Jul-2017", "Aug-2017", "Sep-2017", "Oct-2017"))

inflasi.indo.sing$Bulan <- factor(inflasi.indo.sing$Bulan, levels = c("Jan-2017", "Feb-2017", "Mar-2017", "Apr-2017", "May-2017", "Jun-2017", "Jul-2017", "Aug-2017", "Sep-2017", "Oct-2017"))

# Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data=inflasi.indo.sing, aes(x = Bulan,  y=Inflasi,  color=Negara, group=Negara)) 

# Menambah Layer dan labels

plot.inflasi +  geom_line() +geom_text(aes(label=Inflasi),hjust=-0.2, vjust=-0.5)