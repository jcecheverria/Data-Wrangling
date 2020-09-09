dw-2020-parcial-1
================
Tepi
9/3/2020

Examen parcial
==============

Indicaciones generales:

-   Usted tiene el período de la clase para resolver el examen parcial.

-   La entrega del parcial, al igual que las tareas, es por medio de su
    cuenta de github, pegando el link en el portal de MiU.

-   Pueden hacer uso del material del curso e internet (stackoverflow,
    etc.). Sin embargo, si encontramos algún indicio de copia, se
    anulará el exámen para los estudiantes involucrados. Por lo tanto,
    aconsejamos no compartir las agregaciones que generen.

Sección I: Preguntas teóricas.
------------------------------

-   Existen 10 preguntas directas en este Rmarkdown, de las cuales usted
    deberá responder 5. Las 5 a responder estarán determinadas por un
    muestreo aleatorio basado en su número de carné.

-   Ingrese su número de carné en `set.seed()` y corra el chunk de R
    para determinar cuáles preguntas debe responder.

<!-- -->

    set.seed(20170018)
    v<- 1:10
    preguntas <-sort(sample(v, size = 5, replace = FALSE ))

    paste0("Mis preguntas a resolver son: ",paste0(preguntas,collapse = ", "))

    ## [1] "Mis preguntas a resolver son: 1, 4, 7, 8, 9"

### Listado de preguntas teóricas

1.  Para las siguientes sentencias de `base R`, liste su contraparte de
    `dplyr`:
    -   `str()` = `glimpse()`
    -   `df[,c("a","b")]` = `dat %>% select(a,b)`
    -   `names(df)[4] <- "new_name"` donde la posición 4 corresponde a
        la variable `old_name` = `rename(df, new_name = old_name)`
    -   `df[df$variable == "valor",]` =
        `dat %>% filter(variable == "valor")`
2.  Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas
    funciones que el keyword `OR` para filtrar uno o más elementos una
    misma columna?
3.  ¿Por qué en R utilizamos funciones de la familia apply
    (lapply,vapply) en lugar de utilizar ciclos?
4.  ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

Asignación de variables se hace por medio de `=` mientras que `==` actua
como operador logico, es decir determina si ambos elementos son iguales
y devuelve un Boolean (`TRUE`/`FALSE`).

1.  ¿Cuál es la forma correcta de cargar un archivo de texto donde el
    delimitador es `:`?
2.  ¿Qué es un vector y en qué se diferencia en una lista en R?
3.  ¿Qué pasa si quiero agregar una nueva categoría a un factor que no
    se encuentra en los niveles existentes?

Puedo cambiar esa variable a char/string y agregarle las cambios de
categorias o nuevas obs. con diferentes categorias y despues parsear esa
columna como factor. O bien puedo cambiar los niveles de esa columna y
agregarle el otro nivel que quiero.

Ejemplo:
`levels(data$categoria) <- c(levels(data$categoria),"nueva_categoria")`

1.  Si en un dataframe, a una variable de tipo `factor` le agrego un
    nuevo elemento que *no se encuentra en los niveles existentes*,
    ¿cuál sería el resultado esperado y por qué?
    -   El nuevo elemento
    -   `NA`

Deberia esperar un `NA` porque ese nivel no se reconocería ya que es
nuevo y no estaba registrado en los niveles del factor.

1.  En SQL, ¿para qué utilizamos el keyword `HAVING`?

Es un keyword importante para filtrar los resultados de nuestro query
luego de usar un `group by`. La razón por la que se usa `HAVING` se debe
a que no podemos usar un simple `WHERE` para filtrar los resultados POR
GRUPO. El keyword `WHERE` solo nos filtraria por rows.

1.  Si quiero obtener como resultado las filas de la tabla A que no se
    encuentran en la tabla B, ¿cómo debería de completar la siguiente
    sentencia de SQL?

    -   SELECT \* FROM A \_\_\_\_\_\_\_ B ON A.KEY = B.KEY WHERE
        \_\_\_\_\_\_\_\_\_\_ = \_\_\_\_\_\_\_\_\_\_

Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar
utilizando como banco las diez acá presentadas?

Sección II Preguntas prácticas.
-------------------------------

-   Conteste las siguientes preguntas utilizando sus conocimientos de R.
    Adjunte el código que utilizó para llegar a sus conclusiones en un
    chunk del markdown.

A. De los clientes que están en más de un país,¿cuál cree que es el más
rentable y por qué?

B. Estrategia de negocio ha decidido que ya no operará en aquellos
territorios cuyas pérdidas sean “considerables”. Bajo su criterio,
¿cuáles son estos territorios y por qué ya no debemos operar ahí?

### I. Preguntas teóricas

A
-

    dat <- readRDS("parcial_anonimo.rds")

    dat %>% 
      group_by(Pais,Cliente) %>%
      summarise(n(),sum_pais = sum(Venta)) %>%
      group_by(Cliente) %>% 
      summarise(paises_no = n(),ventas_cliente_total =sum(sum_pais) ) %>% 
      filter(paises_no >1) %>% 
      arrange(desc(ventas_cliente_total))

    ## # A tibble: 7 x 3
    ##   Cliente  paises_no ventas_cliente_total
    ##   <chr>        <int>                <dbl>
    ## 1 a17a7558         2               19818.
    ## 2 ff122c3f         2               15359.
    ## 3 c53868a0         2               13813.
    ## 4 044118d4         2                9436.
    ## 5 f676043b         2                3635.
    ## 6 f2aab44e         2                 400.
    ## 7 bf1e94e9         2                   0

El cliente más rentable (ventas totales a lo largo del periodo
estudiado) es el cliente `a17a7558`. La forma de determinar la
rentabilidad del cliente fue agregando los ingresos y perdidas generados
por este cliente a lo largo de todo el tiempo estudiado.

B
-

    dat %>%
      group_by(Territorio) %>% 
      summarise(ventas_territorio = sum(Venta)) %>% 
      arrange(ventas_territorio)

    ## `summarise()` ungrouping output (override with `.groups` argument)

    ## # A tibble: 104 x 2
    ##    Territorio ventas_territorio
    ##    <chr>                  <dbl>
    ##  1 e6fd9da9                18.2
    ##  2 13b223c9                49.9
    ##  3 368301e2               121. 
    ##  4 79428560               132  
    ##  5 e034e3c8               247. 
    ##  6 0bfe69a0               384. 
    ##  7 456278b8               493. 
    ##  8 4163fa3f               580. 
    ##  9 3e0d75d0               647. 
    ## 10 aed8e579               747. 
    ## # ... with 94 more rows

No tengo perdidas netas en ningun territorio. Pero si tengo territorios
con ingresos bajos. Especificamente los territorios de `e6fd9da9` y
`13b223c9`.

    df_perdidas <-dat %>% 
                group_by(Territorio) %>%
                filter(Venta < 0) %>% 
                summarise(perdidas_territorio = sum(Venta)) %>% 
                arrange(perdidas_territorio)

    df_ingresos <-dat %>% 
                group_by(Territorio) %>%
                filter(Venta >= 0) %>% 
                summarise(ingresos_territorio = sum(Venta)) %>% 
                arrange(ingresos_territorio)

    df_consolidado <- inner_join(df_perdidas,
                                 df_ingresos,
                                 by="Territorio") %>%
                      mutate(rate_perdida_porcentaje = abs(perdidas_territorio/ingresos_territorio*100))

    # OJO a aca solo considero los territorios donde perdi dinero. Al hacer el inner join perdi
    # positivos que no tenian ninguna venta "negativa"
    df_consolidado %>% arrange(desc(rate_perdida_porcentaje))

    ## # A tibble: 79 x 4
    ##    Territorio perdidas_territorio ingresos_territorio rate_perdida_porcentaje
    ##    <chr>                    <dbl>               <dbl>                   <dbl>
    ##  1 68de9759                -226.                3930.                    5.74
    ##  2 8682908b                -245.                4857.                    5.05
    ##  3 45c0376d                -475.               11121.                    4.27
    ##  4 0320288f                 -33.6                879.                    3.82
    ##  5 4814799f                -664.               24928.                    2.67
    ##  6 5a464f3f                -126.                4921.                    2.57
    ##  7 0bbe6418                -218.                9110.                    2.39
    ##  8 d43e8f6a                -136.                5847.                    2.33
    ##  9 6eff1266                -176.                7616.                    2.31
    ## 10 c31adb2f                -230.               10114.                    2.28
    ## # ... with 69 more rows

En terminos generales no tengo territorios con rates de perdidas muy
grandes. El maximo es casi de 6%, siendo el territorio `68de9759`
seguido por el territorio de `8682908b` con un rate de perdida de poco
más del 5%. La manera en que se calculo el rate de venta fue sumando las
perdidas de ese territorio y dividirlas dentro de los ingresos de ese
mismo territorio, para determinar asi cuanto estamos perdiendo por cada
unidad monetaria que vendemos.

Bajo mi criterio deberiamos dejar de operar en
`68de9759`,`8682908b`,`e6fd9da9` y `13b223c9`.
