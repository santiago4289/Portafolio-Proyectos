# Estudio de Simulación de Eventos Discretos y Optimización de Capacidad en Servicios Operativos Mediante FlexSim

Este proyecto presenta un estudio completo de simulación de eventos discretos, análisis estadístico de datos y optimización de líneas de espera aplicado a una oficina de atención al cliente de una caja de compensación. El estudio evalúa el desempeño de 8 servidores y diagnostica cuellos de botella operativos bajo condiciones de alta demanda.

---

## 🎯 Objetivos del Proyecto

1. **Limpieza y Análisis Estadístico:** Procesamiento de registros operacionales en Python para extraer tiempos entre llegadas (*interarrivals*) y detección de valores atípicos mediante el método de cuartiles.
2. **Ajuste de Distribuciones Probabilísticas:** Utilización del software *Stat::Fit* para caracterizar estadísticamente el comportamiento estocástico de la llegada de usuarios.
3. **Modelado y Simulación (FlexSim):** Construcción del modelo de red de flujos para evaluar la ocupación de servidores, tiempos de espera en cola y estancias totales en el sistema.
4. **Evaluación de Escenarios de Optimización:** Simulación de alternativas de mejora, incluyendo la expansión de la capacidad instalada (incorporación de un nuevo recurso) y el incremento de rendimiento por capacitación.

---

## 📊 Principales Hallazgos y Resultados

* **Caracterización de la Demanda:** Se determinó que los tiempos entre llegadas se ajustan rigurosamente a una distribución **Log-Normal**, reflejando la asimetría típica de sistemas de servicio masivo.
* **Diagnóstico de Línea Base:** El modelo inicial reveló una ocupación promedio de servidores del **98,28%** y un tiempo de espera en cola de **43,65 minutos**, evidenciando saturación crítica.
* **Impacto de la Optimización:** 
  * Agregar un servidor adicional redujo el tiempo promedio en el sistema en un **37,5%**, aunque mantuvo una alta utilización operativa.
  * Se concluyó que el desempeño del sistema está limitado por la carga global de demanda y no por deficiencias de recursos individuales (demostrado al evaluar la capacitación del operador con menor rendimiento).

---

## 🛠️ Estructura de Archivos del Repositorio

| Archivo | Descripción |
| :--- | :--- |
| **`Reporte_Simulación_Eventos_discretos_Optimización_capacidades.pdf`** | Memoria técnica y reporte formal del estudio, incluyendo diagramas PFD del modelo, análisis de histogramas y tablas comparativas de capacidad. |
| **`Tratamiento_de_datos.ipynb`** | Jupyter Notebook en Python con la lectura del dataset, depuración de datos atípicos y generación de distribuciones y gráficos estadísticos. |
| **`Observaciones_Turnos.csv`** | Conjunto de datos primarios con los registros de tiempos de atención y marcas temporales de llegadas. |

---

## 🚀 Tecnologías y Herramientas Utilizadas

* **Simulación de Procesos:** FlexSim
* **Análisis Estadístico:** Stat::Fit, Python (Pandas, Matplotlib)
* **Ingeniería Industrial:** Teoría de colas, simulación de eventos discretos, análisis de capacidad y planificación de recursos.
