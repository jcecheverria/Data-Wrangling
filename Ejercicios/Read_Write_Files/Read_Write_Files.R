
# installed.packages("readr")
# installed.packages("readxl")
library(readr)
library(readxl)

# Importar de Excel a R ####
# Libreria readxl

excel <- read_excel("data/example_1.xlsx")
str(excel)

excel_sheets("data/example_1.xlsx")

excel_2 <- read_excel("data/example_1.xlsx",sheet=2)
str(excel_2)

excel_3 <- read_excel("data/example_1.xlsx",sheet="Sheet1")
str(excel_3)


# Exportar de R a Excel ####


write_excel_csv2(excel,"nuevo_excel.xls",delim=",")
# Recomiendan xls en lugar de xlsx por estabilidad y
# a veces xlsx cambia el tipo de alguna columna (i.e. 1 -->  "1")

# Importar csv a R ####
# Libreria readr

# readr::read_csv() <- especifica de que libreria usar la funcion

# read_csv() <- Recomiendan esta porque la de abajo asume algunos factores/classes
# read.csv()


csv <- read_csv("data/example_2.csv")
str(csv)

# Diferente DELIM

txt_1 <- read_delim("data/example_3.txt",delim=";")
txt_1

# enconding = "Latin"/"Latin1"

# Texto

dorian <- read_lines("data/dorian_gray.txt",skip_empty_rows = TRUE)
dorian

# install.packages("tidyverse")
install.packages("tidytext")
library(tidyverse)
library(tidytext)

dorian_frame = tibble(dorian)
dorian_words = unnest_tokens(dorian_frame,output = word,input = dorian,token = "words")
dorian_words



































