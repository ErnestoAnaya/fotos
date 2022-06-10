![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/ONU_%E2%80%93_Objetivos_de_Desarrollo_Sostenible_%28Isologotipo%29.svg/236px-ONU_%E2%80%93_Objetivos_de_Desarrollo_Sostenible_%28Isologotipo%29.svg.png)

## Introducción

En 2015, todos los Estados Miembros de las Naciones Unidas  aprobaron los 17 Objetivos de Desarrollo sostenible que enfrentan a los desafíos globales, así como: la pobreza, desigualdad, clima, degradación ambiental y la paz. Se presentan 17 objetivos que se buscan cumplir para 2030.

El objetivo 11 se centra en lograr que las ciudades sean más sostenibles y un mejor ambiente para todos los habitantes que viven en alguna ciudad. Este objetivo es de gran importancia por la gran proporción de personas que vive en áreas metropolitanas. El proceso acelerado de urbanización ha colocado a mucha personas sin servicios adecuados. La Ciudad de México no es la excepción a estos problemas. Se debe de trabajar para mejorar la condición de vida de la población.

Abordar un problema tan amplio puede llegar a ser abrumador, por lo que se necesitan herramientas para entender el problema. También se podría transmitir el conocimiento al público general para que estén informados de la situación actual. Para permitir esto, se propone un tablero  que proyecte las métricas relevantes al objetivo de desarrollo sostenible de la Ciudad de México.


## Trabajo hecho

Se realizó un tablero que despliega varias visualizaciones de seis métricas que describen la distribución de recursos en las 16 alcaldías de la Ciudad de México y fueron obtenidas del sitio oficial del Gobierno de la Ciudad de México. Estas son representadas en un mapa y gráficas de barras.

Estas métricas se pueden ajustar por población, donde se puede especificar si se ajusta por toda la población, por hombres, mujeres, afromexicanos y gente que habla alguna lengua indígena. Estas métricas también se usan para crear clusters (el número de clusters lo especifica el usuario) para detectar similitudes entre las alcaldías. Estos clusters son visualizados a través de las gráficas de barras y mapas. Se pueden ver con o sin clusters.
Las métricas que se visualizan son:
- Densidad de unidades económicas. Una unidad económica es cualquier establecimiento asentado donde se producen o comercializan bienes o servicios
- Viviendas sin drenaje
- Inversión por metro cuadrado
- Población sin acceso a agua entubada
- Viviendas con servicios básicos

Adicionalmente, se pueden comparar las diferentes métricas con un scatterplot donde se indican las métricas. También se incluye una técnica de visualización llamada coordenadas paralelas donde se puede observar la correlación entre las variables. Están ordenadas según los pares de variables de menor a mayor correlación entre ellas. En ambas visualizaciones permiten especificar el número de clusters.


## Resultados y anáisis
Las visualizaciones nos permiten ver las distribuciones de recursos y servicios de la Ciudad de México. Se presenta un ejemplo del mapa que muestra las unidades ecnómicas por alcaldía. Se ve que la mayor cantidad de unidades económicas está situada en el noreste de la ciudad y la que más recibe es Iztapalapa. Sin embargo esto es principalmente porque es la alcladía más poblada de la ciudad. Es por esto que se ajusta por población para ver que zonas son las que están verdaderamente marginadas.

<img src="https://github.com/ErnestoAnaya/fotos/blob/main/proyecto_vis/mapa_due.png?raw=true" alt="drawing" width="350"/>

<img src="https://github.com/ErnestoAnaya/fotos/blob/main/proyecto_vis/mapa_pop.png?raw=true" alt="drawing" width="350"/>

Aquí que ya se ajusta por población total, se puede observar que Iztapalapa ya no resalta tanto, es Cuauhtémoc la que mas unidades económicas tiene relativo a la población. Sucede algo similar con las otras métricas. Las alcaldías del norte tienen una mayor cantidad de recursos que las del sur (especialmente las del suroeeste como Cuajimalpa, Álvaro Obregón y La Magdalena Contreras).

<img src="https://github.com/ErnestoAnaya/fotos/blob/main/proyecto_vis/mapa_due_pop.png?raw=true" alt="drawing" width="450"/>

La habilidad de hacer clusters nos permite confirmar estas afirmaciones e indica que cuando se incluyen a todas las métricas, las alcaldías del norte se diferencías al resto (Cuautémoc y Gustavo A.Madero de verde e Iztapalapa de azul). Si se separa en más clusters, se crean segmentos más especíificos pero los grupos suelen estar cerca geográficamente por lo  que las diferencias entre el norte y sur permanecen.

<img src="https://github.com/ErnestoAnaya/fotos/blob/main/proyecto_vis/mapa_clusters.png?raw=true" alt="drawing" width="500"/>

Las coordenadas paralelas nos permite ver a más detalle las diferencias entre los municipios. De inmediato se ve como las 3 alcaldías que están en diferentes clusters se separan del resto.

![](https://github.com/ErnestoAnaya/fotos/blob/main/proyecto_vis/coord_par.png?raw=true)

## Conclusiones

En conclusión se puede ver como las técnicas de visualización utilizadas nos permitieron segmentar la Ciudad de México de acuerdo con la distribución de recursos por alcaldías (con las seis métricas que se eligieron) de una forma intuitiva y rápida de entender. Permite presentar de una forma más simple la situación actual de la CDMX en temas de sostenibilidad. Así se facilita la difusión del problema y de los Objetivos de Desarrollo Sostenible. 
