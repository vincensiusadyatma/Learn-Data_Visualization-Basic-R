
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