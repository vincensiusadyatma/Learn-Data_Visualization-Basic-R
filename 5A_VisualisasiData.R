library('ggplot2')

#membuat canvas
ggplot()

#menambah title
ggplot()+labs(title="Judul Visualisasi Baru")

#simpan plot ke dalam variabel
contohplot <- ggplot()
contohplot <- contohplot+labs(title="Judul Perbaikan")
contohplot

#Menambahkan subjudul, label sumbu x dan sumbu y
contohplot <- contohplot+labs(title="Judul Perbaikan",subtitle="subtitle",x="sumbu x",y="sumbu y")
contohplot

# Menambahkan data dan Aesthetic Mapping
penduduk <- read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv")
penduduk

#mengakses kolom tertentu 
penduduk[c("NAMA.KELURAHAN","LUAS.WILAYAH..KM2.")];

#membuat plot dari data
plot_penduduk <- ggplot(data=penduduk)
plot_penduduk

#Memetakan x,y dan color dengan function aes
plot_penduduk <- ggplot(data=penduduk,aes(x = LUAS.WILAYAH..KM2.,  y=KEPADATAN..JIWA.KM2.,color=NAMA.KABUPATEN.KOTA))
plot_penduduk

#menambahkan layer
plot_penduduk+layer(geom = "point", stat = "identity", position = "identity")

#Menambahkan Judul dan label
plot_penduduk <- ggplot(data=penduduk,aes(x = LUAS.WILAYAH..KM2.,  y=KEPADATAN..JIWA.KM2.,color=NAMA.KABUPATEN.KOTA))
plot_penduduk+geom_histogram(binwidth = 10000)

