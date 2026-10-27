# Balance de Materia y Energía en Planta de Tratamiento de Crudo (Python)

Este proyecto presenta el desarrollo completo de un simulador y memoria de cálculos en **Python (Jupyter Notebook)** para el balance de materia y energía en estado estacionario de una planta industrial de tratamiento de crudo[cite: 17, 20]. El sistema modela la separación de fases, el consumo de servicios industriales (vapor y energía eléctrica), la autogeneración y los indicadores económicos de operación[cite: 17].

---

## 🎯 Alcance y Objetivos

* **Balance de Materia Riguroso:** Resolución de balances globales y por componentes (agua y crudo) mediante algoritmos de convergencia iterativa para la recirculación de corrientes[cite: 18, 19, 20].
* **Balance Térmico y Mecánico:** Determinación de requerimientos caloríficos en calentadores de proceso ($H-202$, $H-203$) y cálculo de la potencia hidráulica consumida en sistemas de bombeo multietapa mediante la ecuación de Bernoulli modificada[cite: 19, 21].
* **Eficiencia Energética y Combustión:** Estimación de la eficiencia de calderas por el método indirecto (Siegert) y cálculo de la demanda de crudo combustible para autogeneración y servicios térmicos[cite: 19, 22].

---

## 📊 Principales Resultados e Indicadores Clave (KPIs)

* **Calidad del Producto Final:** Reducción del contenido de agua en el crudo tratado hasta alcanzar una fracción de crudo del **99,45%** ($7,32 \text{ KBPD}$)[cite: 20, 23].
* **Consumo Energético Total:** Demanda de energía térmica de $1\,339\,216.45 \text{ MJ/d}$ (86,1%) y potencia eléctrica de $2\,502.16 \text{ kW}$ distribuidas en el tren de bombeo[cite: 23].
* **Indicadores Económicos de Planta:** 
  * Consumo interno de crudo combustible: **5,02%**[cite: 22].
  * Costo energético por barril entregado a transporte: **$4.94 USD/bbl**[cite: 22].

---

## 🛠️ Estructura del Repositorio

| Archivo / Carpeta | Descripción |
| :--- | :--- |
| **`Balance_plant_crude_oil.ipynb`** | Jupyter Notebook con la programación de funciones termodinámicas, resolución de balances y exportación de resultados. |
| **`Memoria_calculos_Crudo.pdf`** | Memoria de cálculos formal con diagramas P&ID, bases de diseño y referencias normativas. |
| **`Tabla_resultados.xlsx`** | Consolidado tabular de temperatura, fracciones másicas, densidades, capacidades caloríficas y flujos volumétricos por corriente. |

---

## 🚀 Tecnologías y Herramientas Utilizadas

* **Lenguaje:** Python (Jupyter Notebook, Pandas, NumPy)[cite: 20]
* **Principios de Ingeniería:** Termodinámica aplicada, mecánica de fluidos (Bernoulli modificado), estequiometría de combustión y gestión de servicios industriales[cite: 19, 20].
