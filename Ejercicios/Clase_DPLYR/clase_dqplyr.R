library(tidyverse)
library(highcharter)
library(readr)

df <- read_delim("2010-2019-top.csv",";", escape_double = FALSE,trim_ws = TRUE)

### Explorando la estructura
str(df)
glimpse(df)

#### Base R: renonmbrando columnas
names(df)[4] <- "top_genre"
names(df)

### dplyr: renombrando columnas
rename(df, top_genre = `top genre`)

### pipe operator %>% 
%>% 

### select
head(select(df,artist,year))

### utilizando el operador %>% 
df %>% 
  select(artist,year) %>% 
  head()

### rename, con operador
df %>% 
  rename(top_genre = `top genre`)

### rename_with
df <- rename_with(df,(~gsub(" ","_",.x)))


### Base R: Selec. Cols
df$title
head(df)

df[c(1,2)]
df[,c(1,2)]


# dplyr: selec. cols.
df %>% 
  select(1,2) %>% 
  head()

df %>% 
  select(X1,title) %>% 
  head()

### Quitando columnas base r
df[-1]
df$X1 <- NULL
df

### quitando cols usando dplyr
df %>% 
  select(-1) %>% 
  head()

df %>% 
  select(-X1) %>% 
  head()

#### transformar a otro tipo
as.factor(df$artist)


### mutate

df <- mutate_if(df,is.character,as.factor)
df


df %>% 
  select(artist,title,year) %>% 
  filter(year=='210' | year == '2011')

df %>% 
  select(year,artist) %>% 
  group_by(year) %>% 
  summarise(cantidad_artistas = n())

### Cuantos artistas tenemos
df %>% 
  summarise(artistas_unicos = n_distinct(artist))

### cuantos artistas distintos tenemos por año
df %>%
  select(year,artist) %>% 
  group_by(year) %>% 
  summarise(artistas_unicos = n_distinct(artist))

#### Cuatas canciones distintas tenemos
df %>% 
  summarise(canciones_unicas = n_distinct(title))

### Cuantas canciones aparecen mas de una vez
df %>% 
  group_by(title,artist) %>% 
  summarise(repetidas = n()) %>% 
  filter(repetidas > 1) %>% nrow()
