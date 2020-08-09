
# LIBRERIAS ####
library(readxl)
library(readr)

# PROBLEMA 1 ####
files = list.files(pattern = ".xlsx")

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

columnas = c("COD_VIAJE","CLIENTE","UBICACION","CANTIDAD",
             "PILOTO","Q","CREDITO","UNIDAD","FECHA")

df_list = lapply(files, read_excel_files,columnas)

# Tabla final
concat_df = do.call(rbind,df_list)

# Exportamos la tabla como .csv
write_excel_csv(concat_df,"entregas_2018.csv")


# PROBLEMA 2 ####

lista_vec = list(c(1,2,3),c(1,2,2,2,3),c(1,2,2,3,3))

moda <- function(lista){
  tbl = table(lista)
  cond = (tbl>1)&(tbl==max(tbl))
  modas = names(tbl)[cond]
  
  if(length(modas)==0) modas=NULL
  
  return(modas)
}

lapply(lista_vec,moda)

# PROBLEMA 3 ####

PATH = "C:/Users/Jose/Documents/UFM/4th_year/2ndo_Semestre/Data Wrangling/Data/datos_sat/INE_PARQUE_VEHICULAR_080720.txt" # Path en mi maquina
data_sat = read_delim(PATH,delim ="|") # Columna X11 parseada por error (prob. un simbolo "|" extra)

