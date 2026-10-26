# 🔐 Aplicación de Cifrado César con Interfaz Gráfica (GUI)

Una herramienta de escritorio desarrollada en **Python** para el cifrado y descifrado de texto y documentos utilizando el algoritmo de **Cifrado César**. El proyecto combina conceptos de ciberseguridad, procesamiento de texto y desarrollo de interfaces gráficas nativas.

---

## 🚀 Características Principales

- **Interfaz Gráfica Intuitiva:** Desarrollada con `tkinter` en un diseño sobrio y moderno con tema oscuro (*Dark Mode*).
- **Procesamiento de Archivos Multiformato:** Extrae y cifra contenido directamente desde archivos `.txt`, `.docx` (Word) y `.pdf`.
- **Exportación Flexible:** Permite guardar el resultado cifrado o descifrado en el formato deseado (`.txt` o `.docx`) a través de la ventana nativa del sistema operativo.
- **Seguridad en la Entrada:** Campo de clave numérica enmascarado (`•`) para la protección visual de credenciales.
- **Integración con Portapapeles:** Copiado rápido del texto procesado directamente al portapapeles.

---

## 🛠️ Tecnologías y Librerías Utilizadas

- **Lenguaje:** Python 3.12+
- **GUI:** `tkinter` (Librería nativa)
- **Manipulación de Documentos Word:** `python-docx`
- **Lectura de Documentos PDF:** `pypdf`

---

## 📦 Instalación y Configuración

### 1. Clonar el repositorio
```bash
git clone https://github.com/TU_USUARIO/TU_REPOSITYORIO.git
cd TU_REPOSITYORIO
```

### 2. Instalar las dependencias
Asegúrate de tener un entorno virtual o Anaconda activo y ejecuta:
```bash
pip install -r requirements.txt
```

### 3. Ejecutar la aplicación
```bash
python App_Cifrado.py
```

---

## 🛡️ Estructura del Proyecto

```text
├── App_Cifrado.py        # Código fuente principal de la aplicación GUI
├── requirements.txt      # Archivo de dependencias del proyecto
└── README.md             # Documentación del proyecto
```

---

## 👤 Autor
Wilder Santiago Rodríguez Osorio
Ingeniero químico | M.Sc. (c) en Ingeniería de Procesos
santiago22.sr@gmail.com
Desarrollado como parte de mi portafolio en ingeniería, analítica de datos y ciberseguridad.