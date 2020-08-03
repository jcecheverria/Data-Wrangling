# Strings
string <- "This is a string"
  
class(string)
length(string)
nchar(string)

# Double
number <- 234

class(number)
typeof(number)
length(number)

number_2 <- 1/8

typeof(number_2)

# Integer

integer <- 2L

class(integer)

# Logical

logical <- FALSE

logical*1

class(logical)

as.logical(0)
as.logical(1)

# Vectores
num_vector <- c(1,2,3,4)
length(num_vector)

num_vector_2 <- c(1,2,3,4,"a")
num_vector_2

class(num_vector)
class(num_vector_2)

vec1 <- 1:100
vec2 <- sample(x=1:10,size=5,replace=FALSE)

log_vec <- c(F,F,T)
class(log_vec)

as.numeric(num_vector_2)
as.character(num_vector)

 # Broadcasting sirve un montón para aplicar transformaciones 
# y operaciones a vectores o arrays, en lugar de generar un 
# ciclo que aplique la operación a cada uno de los elementos
# del vector o del array

factor_1 <- c("Mon","Tue","Wed","Thu","Fri","Sat","Sun",
            "Mon","Tue","Wed","Thu","Fri","Sat","Sun")
factor_1 <- factor(factor_1)

# Ordered Factors

factor_2 <- c("Mon","Tue","Wed","Thu","Fri","Sat","Sun",
              "Mon","Tue","Wed","Thu","Fri","Sat","Sun")
factor_2 <- ordered(factor_2,levels = c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))

vector1 <- c(1,2,3,4,5)
vector2 <- c(F,F,T)
vector3 <- letters[1:6]

list_1 <- list(vector1,vector2,vector3)
names(list_1) <- c("A","B","C")
list_1$C

# Matrix
mat <- matrix(1:10,nrow=2,ncol=5)
mat[2,]


c(1,2,3,4,5)[c(1,2,3,4,5)]

a <- c(1,2,3,4,5,4,5,4,5)
a[a>=4]


# Data Frames
df <- data.frame(
  col1 = c("This","is","a","vector","of","strings"),
  col2 = 1:6,
  col3 = letters[1:6],
  stringsAsFactors = FALSE
)

View(df)
str(df)

names(df) <- c("column1","column2","column3")

head(df,3)
tail(df,2)

nrow(df)
ncol(df)

# Functions of base R (ufunc)
num_vector_3 <- as.numeric(num_vector_2)
num_vector_3[!is.na(num_vector_3)]

mean(num_vector_3,na.rm=TRUE)
mean(num_vector_3[!is.na(num_vector_3)])

df_copy <- data.frame(
  col1 = c("This","is","a",NA,"of","strings"),
  col2 = c(1:5,NA),
  col3 = letters[1:6]
)

df_copy[!is.na(df_copy$col2),]
df_copy 








