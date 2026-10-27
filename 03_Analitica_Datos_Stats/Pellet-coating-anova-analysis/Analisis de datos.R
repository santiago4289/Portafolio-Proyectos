Naranja <- c(1345, 1353, 1322, 1341, 1350, 
             1325, 1344, 1342, 1344, 1356, 
             1359, 1329, 1340, 1336, 1331)

Rosada <- c(1283, 1292, 1276, 1302, 1298, 
            1293, 1287, 1284, 1294, 1294, 
            1275, 1296, 1285, 1285, 1291)

Roja <- c(1308, 1306, 1304, 1312, 1301, 
          1307, 1303, 1306, 1325, 1296, 
          1293, 1309, 1297, 1318, 1307)
datos <- data.frame(Naranja,Rosada,Roja)

#Generamos los estadistícos descriptivos

resumen <- data.frame(
  Media = apply(datos, 2, mean),
  Mediana = apply(datos,2,median),
  Desviacion_Estandar = apply(datos, 2, sd),
  n = apply(datos, 2, length)
)
resumen


# Convertir los datos a formato largo
datos_long <- data.frame(
  formulacion = factor(rep(c("Naranja", "Rosada", "Roja"), each = 15)),
  conteo = c(Naranja, Rosada, Roja)
)

#Verificamos normalidad y homocedasticidad
by(datos_long$conteo, datos_long$formulacion, shapiro.test) # Normalidad por grupo

install.packages("car")
library(car)
leveneTest(conteo ~ formulacion, data = datos_long)

#Generamos histograma

par(mfrow = c(1,3))

hist(Naranja, main = "Naranja", xlab = "Conteo", col = "orange")
hist(Rosada,  main = "Rosada",  xlab = "Conteo", col = "pink")
hist(Roja,    main = "Roja",    xlab = "Conteo", col = "red")

par(mfrow = c(1,1))

#Generamos diagrama Q-Q

par(mfrow = c(1,3))

qqnorm(Naranja, main = "Naranja"); qqline(Naranja)
qqnorm(Rosada,  main = "Rosada");  qqline(Rosada)
qqnorm(Roja,    main = "Roja");    qqline(Roja)

#Generamos diagarma de cajas

datos_long$formulacion <- factor(
  datos_long$formulacion,
  levels = c("Naranja", "Roja", "Rosada")
)

boxplot(conteo ~ formulacion, data = datos_long,
        ylab = "Conteo de pellets por gramo",
        xlab = "Formulación",
        col = c("orange", "red", "pink"))


# Aplicamos ANOVA

modelo <- aov(conteo ~ formulacion, data = datos_long)
summary(modelo)
alfa <- 0.01
qf(1-alfa,2,42)

#Aplicamos prueba Tukey
TukeyHSD(modelo)
