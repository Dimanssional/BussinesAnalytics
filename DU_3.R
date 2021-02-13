

brno <- read.csv("brno.csv", header = TRUE, sep = ",")
brno <- as.data.frame(brno)

ostrava <- read.csv("ostrava.csv", header = TRUE, sep = ",")
ostrava <- as.data.frame(ostrava)


bratislava <- read.csv("bratislava.csv", header = TRUE, sep = ",")
bratislava <- as.data.frame(bratislava)

brno <- read.csv("brno.csv", header = TRUE, sep = ",")
brno <- as.data.frame(brno)

kosice <- read.csv("kosice.csv", header = TRUE, sep = ",")
kosice <- as.data.frame(kosice)

nitra <- read.csv("nitra.csv", header = TRUE, sep = ",")
nitra <- as.data.frame(nitra)


ostrava$cena <- ostrava$cena * 0.037
brno$cena <- brno$cena * 0.037



brno$produkt[brno$produkt=="Mleko"] <- "Mlieko"
brno$produkt[brno$produkt=="Chleb"] <- "Chlieb"
brno$produkt[brno$produkt=="Triko"] <- "Tricko"
brno$produkt[brno$produkt=="Svetr"] <- "Sveter"

ostrava$produkt[ostrava$produkt=="Mleko"] <- "Mlieko"
ostrava$produkt[ostrava$produkt=="Chleb"] <- "Chlieb"
ostrava$produkt[ostrava$produkt=="Triko"] <- "Tricko"
ostrava$produkt[ostrava$produkt=="Svetr"] <- "Sveter"


krajina <- 'SK'
kosice <- cbind(kosice, krajina)
nitra <- cbind(nitra, krajina)
bratislava <- cbind(bratislava, krajina)



krajina <- 'CZ'
brno <- cbind(brno, krajina)
ostrava <- cbind(ostrava, krajina)

kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "01"] <- "Jan"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "02"] <- "Feb"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "03"] <- "Mar"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "04"] <- "Apr"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "05"] <- "Maj"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "06"] <- "Jun"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "07"] <- "Jul"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "08"] <- "Aug"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "09"] <- "Sep"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "10"] <- "Okt"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "11"] <- "Nov"
kosice$cas_nakupu[substr(kosice$cas_nakupu, 6, 7) == "12"] <- "Dec"


brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "01"] <- "Jan"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "02"] <- "Feb"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "03"] <- "Mar"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "04"] <- "Apr"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "05"] <- "Maj"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "06"] <- "Jun"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "07"] <- "Jul"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "08"] <- "Aug"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "09"] <- "Sep"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "10"] <- "Okt"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "11"] <- "Nov"
brno$cas_nakupu[substr(brno$cas_nakupu, 6, 7) == "12"] <- "Dec"


ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "01"] <- "Jan"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "02"] <- "Feb"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "03"] <- "Mar"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "04"] <- "Apr"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "05"] <- "Maj"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "06"] <- "Jun"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "07"] <- "Jul"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "08"] <- "Aug"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "09"] <- "Sep"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "10"] <- "Okt"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "11"] <- "Nov"
ostrava$cas_nakupu[substr(ostrava$cas_nakupu, 6, 7) == "12"] <- "Dec"


bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "01"] <- "Jan"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "02"] <- "Feb"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "03"] <- "Mar"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "04"] <- "Apr"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "05"] <- "Maj"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "06"] <- "Jun"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "07"] <- "Jul"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "08"] <- "Aug"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "09"] <- "Sep"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "10"] <- "Okt"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "11"] <- "Nov"
bratislava$cas_nakupu[substr(bratislava$cas_nakupu, 6, 7) == "12"] <- "Dec"


nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "01"] <- "Jan"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "02"] <- "Feb"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "03"] <- "Mar"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "04"] <- "Apr"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "05"] <- "Maj"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "06"] <- "Jun"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "07"] <- "Jul"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "08"] <- "Aug"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "09"] <- "Sep"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "10"] <- "Okt"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "11"] <- "Nov"
nitra$cas_nakupu[substr(nitra$cas_nakupu, 6, 7) == "12"] <- "Dec"


kosice$quartal[kosice$cas_nakupu == "Jan"] <- "Q1"
kosice$quartal[kosice$cas_nakupu == "Feb"]  <- "Q1"
kosice$quartal[kosice$cas_nakupu == "Dec"] <- "Q4"
kosice$quartal[kosice$cas_nakupu == "Mar"] <- "Q1"
kosice$quartal[kosice$cas_nakupu == "Apr"] <- "Q2"
kosice$quartal[kosice$cas_nakupu == "Maj"] <- "Q2"
kosice$quartal[kosice$cas_nakupu == "Jun"] <- "Q2"
kosice$quartal[kosice$cas_nakupu == "Jul"] <- "Q3"
kosice$quartal[kosice$cas_nakupu == "Aug"] <- "Q3"
kosice$quartal[kosice$cas_nakupu == "Sep"] <- "Q3"
kosice$quartal[kosice$cas_nakupu == "Okt"] <- "Q4"
kosice$quartal[kosice$cas_nakupu == "Nov"] <- "Q4"


brno$quartal[brno$cas_nakupu == "Jan"] <- "Q1"
brno$quartal[brno$cas_nakupu == "Feb"]  <- "Q1"
brno$quartal[brno$cas_nakupu == "Dec"] <- "Q4"
brno$quartal[brno$cas_nakupu == "Mar"] <- "Q1"
brno$quartal[brno$cas_nakupu == "Apr"] <- "Q2"
brno$quartal[brno$cas_nakupu == "Maj"] <- "Q2"
brno$quartal[brno$cas_nakupu == "Jun"] <- "Q2"
brno$quartal[brno$cas_nakupu == "Jul"] <- "Q3"
brno$quartal[brno$cas_nakupu == "Aug"] <- "Q3"
brno$quartal[brno$cas_nakupu == "Sep"] <- "Q3"
brno$quartal[brno$cas_nakupu == "Okt"] <- "Q4"
brno$quartal[brno$cas_nakupu == "Nov"] <- "Q4"

ostrava$quartal[ostrava$cas_nakupu == "Jan"] <- "Q1"
ostrava$quartal[ostrava$cas_nakupu == "Feb"]  <- "Q1"
ostrava$quartal[ostrava$cas_nakupu == "Dec"] <- "Q4"
ostrava$quartal[ostrava$cas_nakupu == "Mar"] <- "Q1"
ostrava$quartal[ostrava$cas_nakupu == "Apr"] <- "Q2"
ostrava$quartal[ostrava$cas_nakupu == "Maj"] <- "Q2"
ostrava$quartal[ostrava$cas_nakupu == "Jun"] <- "Q2"
ostrava$quartal[ostrava$cas_nakupu == "Jul"] <- "Q3"
ostrava$quartal[ostrava$cas_nakupu == "Aug"] <- "Q3"
ostrava$quartal[ostrava$cas_nakupu == "Sep"] <- "Q3"
ostrava$quartal[ostrava$cas_nakupu == "Okt"] <- "Q4"
ostrava$quartal[ostrava$cas_nakupu == "Nov"] <- "Q4"


bratislava$quartal[bratislava$cas_nakupu == "Jan"] <- "Q1"
bratislava$quartal[bratislava$cas_nakupu == "Feb"]  <- "Q1"
bratislava$quartal[bratislava$cas_nakupu == "Dec"] <- "Q4"
bratislava$quartal[bratislava$cas_nakupu == "Mar"] <- "Q1"
bratislava$quartal[bratislava$cas_nakupu == "Apr"] <- "Q2"
bratislava$quartal[bratislava$cas_nakupu == "Maj"] <- "Q2"
bratislava$quartal[bratislava$cas_nakupu == "Jun"] <- "Q2"
bratislava$quartal[bratislava$cas_nakupu == "Jul"] <- "Q3"
bratislava$quartal[bratislava$cas_nakupu == "Aug"] <- "Q3"
bratislava$quartal[bratislava$cas_nakupu == "Sep"] <- "Q3"
bratislava$quartal[bratislava$cas_nakupu == "Okt"] <- "Q4"
bratislava$quartal[bratislava$cas_nakupu == "Nov"] <- "Q4"


nitra$quartal[nitra$cas_nakupu == "Jan"] <- "Q1"
nitra$quartal[nitra$cas_nakupu == "Feb"]  <- "Q1"
nitra$quartal[nitra$cas_nakupu == "Dec"] <- "Q4"
nitra$quartal[nitra$cas_nakupu == "Mar"] <- "Q1"
nitra$quartal[nitra$cas_nakupu == "Apr"] <- "Q2"
nitra$quartal[nitra$cas_nakupu == "Maj"] <- "Q2"
nitra$quartal[nitra$cas_nakupu == "Jun"] <- "Q2"
nitra$quartal[nitra$cas_nakupu == "Jul"] <- "Q3"
nitra$quartal[nitra$cas_nakupu == "Aug"] <- "Q3"
nitra$quartal[nitra$cas_nakupu == "Sep"] <- "Q3"
nitra$quartal[nitra$cas_nakupu == "Okt"] <- "Q4"
nitra$quartal[nitra$cas_nakupu == "Nov"] <- "Q4"


kosice$kategoria[kosice$produkt == "Mlieko"] <- "Jedlo"
kosice$kategoria[kosice$produkt == "Chlieb"] <- "Jedlo"
kosice$kategoria[kosice$produkt == "Mobil"] <- "Elektro"
kosice$kategoria[kosice$produkt == "Laptop"] <- "Elektro"
kosice$kategoria[kosice$produkt == "Tablet"] <- "Elektro"
kosice$kategoria[kosice$produkt == "Tricko"] <- "Oblecenie"
kosice$kategoria[kosice$produkt == "Sveter"] <- "Oblecenie"


bratislava$kategoria[bratislava$produkt == "Mlieko"] <- "Jedlo"
bratislava$kategoria[bratislava$produkt == "Chlieb"] <- "Jedlo"
bratislava$kategoria[bratislava$produkt == "Mobil"] <- "Elektro"
bratislava$kategoria[bratislava$produkt == "Laptop"] <- "Elektro"
bratislava$kategoria[bratislava$produkt == "Tablet"] <- "Elektro"
bratislava$kategoria[bratislava$produkt == "Tricko"] <- "Oblecenie"
bratislava$kategoria[bratislava$produkt == "Sveter"] <- "Oblecenie"


nitra$kategoria[nitra$produkt == "Mlieko"] <- "Jedlo"
nitra$kategoria[nitra$produkt == "Chlieb"] <- "Jedlo"
nitra$kategoria[nitra$produkt == "Mobil"] <- "Elektro"
nitra$kategoria[nitra$produkt == "Laptop"] <- "Elektro"
nitra$kategoria[nitra$produkt == "Tablet"] <- "Elektro"
nitra$kategoria[nitra$produkt == "Tricko"] <- "Oblecenie"
nitra$kategoria[nitra$produkt == "Sveter"] <- "Oblecenie"


brno$kategoria[brno$produkt == "Mlieko"] <- "Jedlo"
brno$kategoria[brno$produkt == "Chlieb"] <- "Jedlo"
brno$kategoria[brno$produkt == "Mobil"] <- "Elektro"
brno$kategoria[brno$produkt == "Laptop"] <- "Elektro"
brno$kategoria[brno$produkt == "Tablet"] <- "Elektro"
brno$kategoria[brno$produkt == "Tricko"] <- "Oblecenie"
brno$kategoria[brno$produkt == "Sveter"] <- "Oblecenie"


ostrava$kategoria[ostrava$produkt == "Mlieko"] <- "Jedlo"
ostrava$kategoria[ostrava$produkt == "Chlieb"] <- "Jedlo"
ostrava$kategoria[ostrava$produkt == "Mobil"] <- "Elektro"
ostrava$kategoria[ostrava$produkt == "Laptop"] <- "Elektro"
ostrava$kategoria[ostrava$produkt == "Tablet"] <- "Elektro"
ostrava$kategoria[ostrava$produkt == "Tricko"] <- "Oblecenie"
ostrava$kategoria[ostrava$produkt == "Sveter"] <- "Oblecenie"


bratislava$kluc <- "BA"
kosice$kluc <- "KE"
nitra$kluc <- "NT"

brno$kluc <- "BR"
ostrava$kluc <- "OS"


predaje <- rbind(bratislava, kosice, nitra, brno, ostrava, by="produkt")
predaje <- predaje[-c(75001),]

write.csv(predaje,"C:/Users/root/PycharmProjects/BA_Assigment1/predaje.csv", row.names = FALSE)

