# Evaluación y Modelado Estadístico de la Eficiencia de Recubrimiento de Pellets en Lecho Fluido

Este proyecto evalúa el impacto de la formulación de cubiertas comerciales sobre la ganancia en peso de pellets farmacéuticos en un lecho fluido con inserto Wurster, aplicando análisis de varianza (**ANOVA de un factor**) y **modelado de regresión no lineal (cuadrático)** bajo el marco de **Quality by Design (QbD)**.

---

## 🎯 Objetivos del Proyecto

1. **Evaluación de Formulación (QbD):** Determinar si la composición de la cubierta (polímero, plastificante, pigmento) actúa como un *Critical Material Attribute* (CMA) con impacto significativo sobre la ganancia en peso (*Critical Quality Attribute* - CQA).
2. **Validación Estadística Robustecida:** Verificar supuestos de normalidad y homocedasticidad para la ejecución de ANOVA y pruebas *post-hoc* de Tukey.
3. **Modelado Predictivo:** Ajustar modelos matemáticos cuadráticos que relacionen el espesor de la cubierta en función de la ganancia de peso, permitiendo la estimación en tiempo real sin requerir ensayos microscópicos destructivos frecuentes.

---

## 🔬 Metodología y Flujo de Trabajo

* **Diseño Experimental:** 9 lotes experimentales distribuidos en 3 formulaciones comerciales (Opadry® QX Naranja, Opadry® AMB II Rosada y Opadry® AMB II Roja).
* **Parámetros Controlados de Proceso:** Temperatura de entrada (60 °C), flujo de cubierta (13 g/min), velocidad de aire y presión de atomización.
* **Procesamiento de Datos en R:**
  * **Verificación de Supuestos:** Pruebas de Shapiro-Wilk (normalidad) y Levene (homocedasticidad).
  * **Análisis de Varianza:** ANOVA de un factor y comparaciones múltiples mediante la prueba de Tukey ($p < 0.001$).
  * **Regresión y Diagnóstico:** Modelos lineales/cuadráticos y evaluación de puntos de influencia mediante la **Distancia de Cook**.

---

## 📈 Resultados Clave

* **Efecto Dominante de la Formulación:** El ANOVA demostró que la formulación explica el **86% de la variabilidad total** en la ganancia en peso ($p < 2 \times 10^{-16}$), confirmando que la formulación es un atributo crítico del material.
* **Desempeño de Cubiertas:** La prueba de Tukey confirmó diferencias significativas entre las tres formulaciones:
  $$\text{Opadry® AMB II Rosada} > \text{Opadry® AMB II Roja} > \text{Opadry® QX Naranja}$$
* **Modelo Predictivo de Espesor ($R^2_{\text{adj}} > 0.96$):** Se ajustaron modelos cuadráticos que describen la cinética física del crecimiento de la película en relación con el aumento de área superficial del pellet.

---

## 🛠️ Archivos del Repositorio

| Archivo | Descripción |
| :--- | :--- |
| **`Analisis de datos.R`** | Script en R para la verificación de supuestos, ejecución de ANOVA, gráficos (Histogramas, Q-Q Plots, Boxplots) y prueba de Tukey. |
| **`Modelo_Espesor.R`** | Script en R para el ajuste de modelos de regresión lineal y cuadrática, incluyendo el análisis de influencia por Distancia de Cook. |
| **`Datos.xlsx`** | Conjunto de datos brutos y consolidados de conteos por gramo, ganancias en peso y mediciones de espesor. |
| **`Proyecto.docx`** | Documento del informe técnico y científico estructurado. |

---

## 🚀 Tecnologías Utilizadas

* **Lenguaje:** R (RStudio)
* **Librerías principales:** `car`, `ggplot2`, `readxl`, `dplyr`
* **Herramientas complementarias:** Excel, Microscope Measure / Omax ToupView
