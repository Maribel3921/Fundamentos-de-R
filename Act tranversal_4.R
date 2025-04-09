# 1️ CARGAR LIBRERÍAS NECESARIAS ----
library(readr)   # Para leer archivos CSV
library(dplyr)   # Para manipulación de datos
library(ggplot2) # Para visualización de datos

# 2️ CARGAR DATOS DESDE UN ARCHIVO CSV ----
print("2. Cargando el dataset desde un archivo CSV...")

# Abrir una ventana para elegir el archivo CSV
datos_csv <- file.choose()

# Cargar datos en un data frame
datos <- read_csv(datos_csv)

# 3️ REVISAR EL DATASET ----
print("3. Explorando el dataset cargado...")

# Ver las primeras filas
print("Primeras 6 filas del dataset:")
print(head(datos))

# Información general del dataset
print("Información general del dataset:")
print(str(datos))

# Dimensiones del dataset
print("Dimensiones del dataset (filas x columnas):")
print(dim(datos))

# Nombres de las columnas
print("Nombres de las columnas:")
print(names(datos))

# Resumen estadístico del dataset
print("Resumen estadístico del dataset:")
print(summary(datos))

# Calcular estadísticas de la columna 'Edad'
media <- mean(datos$Edad, na.rm = TRUE)
print("Promedio de la columna Edad:")
print(media)

mediana <- median(datos$Edad, na.rm = TRUE)
print("Mediana de la columna Edad:")
print(mediana)

# 4️ LIMPIEZA DE DATOS 
print("4. Limpiando los datos")

# Convertir la columna de Edad a numérico
datos$Edad <- as.numeric(datos$Edad)

# Verificar valores NA después de la conversión
print("Número de valores NA por columna después de la conversión:")
print(colSums(is.na(datos)))

# Reemplazar valores NA con la media
datos$Edad[is.na(datos$Edad)] <- mean(datos$Edad, na.rm = TRUE)

# Verificación final
print("Número de valores NA después del remplazo")
print(colSums(is.na(datos)))

# 5️ VISUALIZACIÓN: HISTOGRAMA 
print("5. Creando un histograma")

ggplot(datos, aes(x = Edad)) +
  geom_histogram(binwidth = 2, fill = "darkgreen", color = "black", alpha = 0.7) +
  labs(title = "Distribución de Edades",
       x = "Edad (años)",
       y = "Frecuencia") +
  theme_minimal()


