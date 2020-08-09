---
title: "Laboratorio 1"
output:
  html_document:
    keep_md: true
---



```r
library(readxl)
library(readr)
```

# Problema #1

Creamos una lista de los archivos por cargar.


```r
files = list.files(pattern = ".xlsx")
```

Creamos una función que cargue los archivos y seleccione las columnas que necesitamos.


```r
read_excel_files = function(path,cols){

  # Leemos el archivo
  df = read_excel(path)
  
  # Creamos las columnas de mes y año
  fecha = strsplit(path,".xlsx")[[1]]
  df["FECHA"] = fecha
  
  sliced_df = df[cols]
  print(nrow(sliced_df))
  return(sliced_df)
}
```

Ejecutamos la función y guardamos el output a una *lista*.


```r
columnas = c("COD_VIAJE","CLIENTE","UBICACION","CANTIDAD",
             "PILOTO","Q","CREDITO","UNIDAD","FECHA")

df_list = lapply(files, read_excel_files,columnas)
```

Unimos los archivos a una sola tabla y la guardamos como *csv*.


```r
# Tabla final
concat_df = do.call(rbind,df_list)
write_excel_csv(concat_df,"entregas_2018.csv")
```



# Problema #2

Creamos una funcion que calcule la moda de una lista (R no tiene un función que calcule la moda). Si existen multiples modas entonces devulve varias modas. Si no existen modas devuelve un valor *NULL*.


```r
moda <- function(lista){
  tbl = table(lista)
  cond = (tbl>1)&(tbl==max(tbl))
  modas = names(tbl)[cond]
  
  if(length(modas)==0) modas=NULL
  
  return(modas)
}
```

Creamos una lista de vectores para probar la función.


```r
lista_vec = list(c(1,2,3),c(1,2,2,2,3),c(1,2,2,3,3))
lapply(lista_vec,moda)
```

```
## [[1]]
## NULL
## 
## [[2]]
## [1] "2"
## 
## [[3]]
## [1] "2" "3"
```



# Problema #3

Cargamos el archivo de la pagina de la SAT usando la funcion *read_delim*


```r
PATH = "C:/Users/Jose/Documents/UFM/4th_year/2ndo_Semestre/Data Wrangling/Data/datos_sat/INE_PARQUE_VEHICULAR_080720.txt" # Path en mi maquina
data_sat = read_delim(PATH,delim ="|") # Columna X11 parseada por error (prob. un simbolo "|" extra)
```

```
## Parsed with column specification:
## cols(
##   ANIO_ALZA = col_double(),
##   MES = col_character(),
##   NOMBRE_DEPARTAMENTO = col_character(),
##   NOMBRE_MUNICIPIO = col_character(),
##   MODELO_VEHICULO = col_character(),
##   LINEA_VEHICULO = col_character(),
##   TIPO_VEHICULO = col_character(),
##   USO_VEHICULO = col_character(),
##   MARCA_VEHICULO = col_character(),
##   CANTIDAD = col_double(),
##   X11 = col_character()
## )
```

