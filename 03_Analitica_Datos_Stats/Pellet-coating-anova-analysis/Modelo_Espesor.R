library(ggplot2)
library(rsm)
# --- Datos Promedio: Naranja ---
ganancia_naranja <- c(0, 0.00747674, 0.01407096, 0.02750314, 0.03875475, 0.06514736, 0.08310138, 0.09681996, 0.11493824, 0.12770242, 0.13111775)
espesor_naranja  <- c(0, 0.01143333, 0.0143, 0.01936667, 0.02893333, 0.03486667, 0.03736667, 0.04116667, 0.04393333, 0.04816667, 0.0534)

# --- Datos Promedio: Rosada ---
ganancia_rosada <- c(0, 0.01646443, 0.0361523, 0.05050363, 0.06395113, 0.07678652, 0.08935854, 0.12193986, 0.1495537, 0.17517851, 0.19294651)
espesor_rosada  <- c(0, 0.00643333, 0.01153333, 0.01746667, 0.0266, 0.0306, 0.03723333, 0.04436667, 0.05003333, 0.0543, 0.0563)


df <- data.frame(
  Color = c(rep("Naranja", 11), rep("Rosada", 11)),
  Ganancia = c(ganancia_naranja,ganancia_rosada),
  Espesor = c(espesor_naranja,espesor_rosada)
)

#Modelo unificado lineal
modelo_l <- lm(Espesor ~ 0 + Ganancia, data = df)
summary(modelo_l)
coef(modelo_l)

pendiente <- round(coef(modelo_l), 4)
etiqueta_ec <- paste("y =", pendiente, "x")
ggplot(df, aes(x = Ganancia, y = Espesor)) +
  # Dibujamos los puntos diferenciados por color
  geom_point(aes(color = Color), size = 3, alpha = 0.7) +
  # Dibujamos UNA SOLA línea para el modelo global (y ~ 0 + x)
  geom_smooth(method = "lm", formula = y ~ 0 + x, se = TRUE, color = "black", linetype = "dashed") +
  # Insertar la ecuación dentro del gráfico
  annotate("text", x = 0.05, y = 0.08, label = etiqueta_ec, color = "black", fontface = "bold", size = 5, hjust = 0) +
  # Colores para identificar las formulaciones
  scale_color_manual(values = c("Naranja" = "#E69F00", "Rosada" = "#CC79A7")) +
  # Etiquetas
  labs(
    x = "Ganancia de Peso",
    y = "Espesor [mm]"
  ) +
  theme_minimal()


#Modelo cuadrático por formulación de la cubierta
# Modelo específico para Naranja
mod_naranja <- rsm(Espesor ~ SO(Ganancia), data = subset(df, Color == "Naranja"))
summary(mod_naranja)
coef(mod_naranja)

# Modelo específico para Rosada
mod_rosada <- rsm(Espesor ~ SO(Ganancia), data = subset(df, Color == "Rosada"))
summary(mod_rosada)
coef(mod_rosada)

# Ecuación Naranja
c_n <- round(coef(mod_naranja), 4)
eq_naranja <- paste0("y = ", c_n[1], " + ", c_n[2], "x ", c_n[3], "x²")

# Ecuación Rosada
c_r <- round(coef(mod_rosada), 4)
eq_rosada <- paste0("y = ", c_r[1], " + ", c_r[2], "x ", c_r[3], "x²")

ggplot(df, aes(x = Ganancia, y = Espesor, color = Color, fill = Color)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = TRUE, alpha = 0.15) +
  annotate("text", x = 0.01, y = 0.050, label = eq_naranja, 
           color = "#E69F00", hjust = 0, fontface = "italic") +
  annotate("text", x = 0.07, y = 0.015, label = eq_rosada, 
           color = "#CC79A7", hjust = 0, fontface = "italic") +
  scale_color_manual(values = c("Naranja" = "#E69F00", "Rosada" = "#CC79A7")) +
  scale_fill_manual(values = c("Naranja" = "#E69F00", "Rosada" = "#CC79A7")) +
  labs(
    x = "Ganancia de Peso",
    y = "Espesor [mm]",
    caption = "Naranja: R²adj = 0.9592 | Rosada: R²adj = 0.9895"
  ) +
  theme_minimal()


# Grafica de la distancia de Cook para el modelo naranja
plot(mod_naranja, which = 4)

#Excluimos el dato 11 y calculamos nuevo modelo naranja
datos_naranja_limpios <- subset(df, Color == "Naranja")[-11, ]
mod_naranja_final <- rsm(Espesor ~ SO(Ganancia), data = datos_naranja_limpios)
summary(mod_naranja_final)
coef(mod_naranja_final)

#Ecuaciones de los modelos finales
c_n <- round(coef(mod_naranja_final), 4)
label_nar <- paste0("Naranja: y = ", c_n[1], " + ", c_n[2], "x ", c_n[3], "x²")

c_r <- round(coef(mod_rosada), 4)
label_ros <- paste0("Rosada: y = ", c_r[1], " + ", c_r[2], "x ", c_r[3], "x²")

#Graficamos datos limpios y modelos
df_limp <- rbind(
  subset(df, Color == "Naranja")[0:10, ], 
  subset(df, Color == "Rosada")
)

# Gráfica final
ggplot(df_limp, aes(x = Ganancia, y = Espesor, color = Color, fill = Color)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = TRUE, alpha = 0.15) +
  scale_color_manual(values = c("Naranja" = "#E69F00", "Rosada" = "#CC79A7")) +
  scale_fill_manual(values = c("Naranja" = "#E69F00", "Rosada" = "#CC79A7")) +
  annotate("text", x = 0.01, y = 0.052, label = label_nar, 
           color = "#E69F00", fontface = "bold", hjust = 0, size = 3.5) +
  annotate("text", x = 0.07, y = 0.010, label = label_ros, 
           color = "#CC79A7", fontface = "bold", hjust = 0, size = 3.5) +
  labs(
    x = "Ganancia de Peso",
    y = "Espesor [mm]",
    caption = "Naranja: R²adj = 0.9662 | Rosada: R²adj = 0.9895"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 14),
        axis.title = element_text(face = "bold"))
