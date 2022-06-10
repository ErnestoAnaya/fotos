#dashboard para el proyecto de visualización

# el df fue generado en otro script.

library(ggplot2)
library(shiny)
library(dplyr)
library(tidyr)
library(shinydashboard)
library(GGally)
library(plotly)


#datos3 <- read.csv("datos_proyecto_vis/datos_proy_vis.csv")

ui <- dashboardPage(
  skin = "yellow",
  dashboardHeader(title = "ODS objetivo 11"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Mapa", tabName = "mapa_bar"), #tiene mapas y barplots
      menuItem("Relación entre variables", tabName = "par_coords_sc"), #tiene coordenadas paralelas y scatterplots
      menuItem("Read Me", tabName = "readme") #el reporte
    )
  ),
  
  dashboardBody(
    
    tabItems(
      #cosas de mapas
      tabItem(tabName = "mapa_bar",
              
              
              fluidRow(
                column(4,
                       h4("Ernesto Anaya Olivares 190656"),
                       selectInput("val1", "Metrica a graficar:",
                                   c("Densidad unidades económicas" = "due_tot",
                                     "Sin drenaje" = "sin_dre",
                                     "Inversión por metro cuadrado" = "Inversión.por.metro.cuadrado",
                                     "Porcentaje de población sin acceso a agua entubada" = "porc_no_entub",
                                     "Porcentaje de viviendas con servicios básicos" = "serv_prom")),
                       selectInput("val2", "Ajustar por población (se ajusta la métrica por cada 100 mil habitantes):",
                                   c("Población total" = "pop",
                                     "Hombres" = "pop_male",
                                     "Mujeres" = "pop_female",
                                     "Afromexicana" = "afromexican",
                                     "De habla indígena"="indigenous_language")),
                       selectInput("num_clusters", "Número de clusters a visualizar",
                                   c("Sin clusters" = 16,
                                     "2" = 2,
                                     "3" = 3,
                                     "4" = 4,
                                     "5" = 5,
                                     "6" = 6,
                                     "7" = 7,
                                     "8" = 8,
                                     "9" = 9,
                                     "10" = 10,
                                     "11" = 11,
                                     "12" = 12,
                                     "13" = 13,
                                     "14" = 14,
                                     "15" = 15
                                   )),
                       
                ),
                
                fillPage(
                  tabsetPanel(
                    type = "pills",
                    tabPanel("Mapa", plotlyOutput("map")),
                    tabPanel("Barplot", plotOutput("barplot")),
                    tabPanel("Mapa con clusters", plotlyOutput("mapa_clusters")),
                    tabPanel("Barplot con clusters", plotOutput("barplot_clusters"))
                  ),
                  
                )
                
              )
              
      ),
      tabItem(tabName = "par_coords_sc",
              fluidRow(
                column(4,
                       selectInput("valx", "Metrica a graficar en el eje X:",
                                   c("Densidad unidades económicas" = "due_tot",
                                     "Sin drenaje" = "sin_dre",
                                     "Inversión por metro cuadrado" = "Inversión.por.metro.cuadrado",
                                     "Porcentaje de población sin acceso a agua entubada" = "porc_no_entub",
                                     "Porcentaje de viviendas con servicios básicos" = "serv_prom")),
                       selectInput("valy", "Metrica a graficar en el eje Y:",
                                   c("Densidad unidades económicas" = "due_tot",
                                     "Sin drenaje" = "sin_dre",
                                     "Inversión por metro cuadrado" = "Inversión.por.metro.cuadrado",
                                     "Porcentaje de población sin acceso a agua entubada" = "porc_no_entub",
                                     "Porcentaje de viviendas con servicios básicos" = "serv_prom")),
                       selectInput("num_clusters2", "Número de clusters a visualizar",
                                   c("Sin clusters" = 16,
                                     "2" = 2,
                                     "3" = 3,
                                     "4" = 4,
                                     "5" = 5,
                                     "6" = 6,
                                     "7" = 7,
                                     "8" = 8,
                                     "9" = 9,
                                     "10" = 10,
                                     "11" = 11,
                                     "12" = 12,
                                     "13" = 13,
                                     "14" = 14,
                                     "15" = 15
                                   ))
                       ),
                column(12,
                       fillPage(
                         tabsetPanel(
                           type = "pills",
                           tabPanel("Coordenadas paralelas", plotOutput("par_coords")),
                           tabPanel("Scatterplot", plotlyOutput("scatterplot"))
                         )
                       )
                  
                )
                
              )
      ),
      tabItem(tabName = "readme",
              fluidRow(
                tabPanel("Read Me", includeMarkdown("readme.md"))
                
              )
              )
      
    )
      
    
  )
    
  
)


server <- function(input, output){
  
  mis_datos <- reactive({  #para recalcular cuando cambian las entradas. queremos que el resumen cambie segun lo que se indica 
    datos <- datos3 
  })
  
  #crear el scatterplot
  output$scatterplot <- renderPlotly({
    ejex <- switch(input$valx, 
                   "due_tot" = datos3$due_tot,
                   "sin_dre" = datos3$sin_dre,
                   "Inversión.por.metro.cuadrado" = datos3$Inversión.por.metro.cuadrado,
                   "porc_no_entub" = datos3$porc_no_entub,
                   "serv_prom" = datos$serv_prom
    )
    ejey <- switch(input$valy, 
                   "due_tot" = datos3$due_tot,
                   "sin_dre" = datos3$sin_dre,
                   "Inversión.por.metro.cuadrado" = datos3$Inversión.por.metro.cuadrado,
                   "porc_no_entub" = datos3$porc_no_entub,
                   "serv_prom" = datos3$serv_prom
    )
    labx <- switch(input$valx, 
                   "due_tot" = "Densidad de Unidades económicas",
                   "sin_dre" = "Viviendas sin drenaje",
                   "Inversión.por.metro.cuadrado" = "Inversión por metro cuadrado (pesos)",
                   "porc_no_entub" = "Porcentaje de población sin acceso a agua entubada",
                   "serv_prom" = "Porcentaje de viviendas con servicios básicos"
    )
    laby <- switch(input$valy, 
                   "due_tot" = "Densidad de Unidades económicas",
                   "sin_dre" = "Viviendas sin drenaje",
                   "Inversión.por.metro.cuadrado" = "Inversión por metro cuadrado (pesos)",
                   "porc_no_entub" = "Porcentaje de población sin acceso a agua entubada",
                   "serv_prom" = "Porcentaje de viviendas con servicios básicos"
    )
    jerC <- hclust(dist(datos3[26:31]))
    clus1 <- cutree(jerC, k = input$num_clusters2)
    cluster <- factor(clus1)
    
    datos2 <- cbind(datos, cluster)
    
    
    p <- ggplot(datos2, aes(x=ejex, y=ejey, text = municipio_name, fill = cluster)) +
      geom_point() +
      geom_smooth(method = "lm") +
      labs(title= "Scatterplot, comparar entre 2 variables",
           x = labx,
           y = laby
           )
    
    
    ggplotly(p)
  })
  
  #crear el barplot
  output$barplot <- renderPlot({
    datos <- mis_datos() %>%
      group_by(municipio_name)
  #hay que cambiar la forma para que se pueda hascer el stacked bar chart
  
  
    data_long <- datos #gather(datos, poblacion, value, pop, pop_male, pop_female, afromexican, indigenous_language)
    poblacion <- switch(input$val2,
                        "pop" = data_long$pop,
                        "pop_male" = data_long$pop_male,
                        "pop_female" = data_long$pop_female,
                        "afromexican" = data_long$afromexican,
                        "indigenous_language" = data_long$indigenous_language
    )

    metrica_elegida <- switch(input$val1, 
                    "due_tot" = data_long$due_tot,
                    "sin_dre" = data_long$sin_dre,
                    "Inversión.por.metro.cuadrado" = data_long$Inversión.por.metro.cuadrado,
                    "porc_no_entub" = data_long$porc_no_entub,
                    "serv_prom" = data_long$serv_prom
                    )
    
    
    datos_c_metrica <- cbind(data_long,metrica_elegida, poblacion)
    names(datos_c_metrica)[29] <- "metrica"
    names(datos_c_metrica)[33] <- "poblacion"
    data_long2 <- datos_c_metrica %>%
      group_by(municipio_name, metrica, poblacion) %>%
      tally()
    
    ggplot(data_long2, aes(x=reorder(municipio_name,metrica/poblacion*100000), y=metrica/poblacion*100000)) +
      geom_bar(stat="identity") +
      labs(x="Alcaldía",
           y=paste(input$val1, " ajustado por población")) +
      coord_flip()
    
    
    })
  
  
  #barplot con clusters
  output$barplot_clusters <- renderPlot({
    datos <- mis_datos() %>%
      group_by(municipio_name)
    #hay que cambiar la forma para que se pueda hascer el stacked bar chart
    
    jerC <- hclust(dist(datos[26:31]))
    clus1 <- cutree(jerC, k = input$num_clusters)
    cluster <- factor(clus1)
    
    datos2 <- cbind(datos, cluster)
    
    data_long <- datos2#gather(datos2, poblacion, value, pop, pop_male, pop_female, afromexican, indigenous_language)
    
    poblacion <- switch(input$val2,
                        "pop" = data_long$pop,
                        "pop_male" = data_long$pop_male,
                        "pop_female" = data_long$pop_female,
                        "afromexican" = data_long$afromexican,
                        "indigenous_language" = data_long$indigenous_language
    )
    
    metrica_elegida <- switch(input$val1, 
                              "due_tot" = data_long$due_tot,
                              "sin_dre" = data_long$sin_dre,
                              "Inversión.por.metro.cuadrado" = data_long$Inversión.por.metro.cuadrado,
                              "porc_no_entub" = data_long$porc_no_entub,
                              "serv_prom" = data_long$serv_prom
    )
    names(data_long)[32] <- "cluster"
    
    datos_c_metrica <- cbind(data_long,metrica_elegida,poblacion)
    names(datos_c_metrica)[33] <- "metrica"
    names(datos_c_metrica)[34] <- "poblacion"
    data_long2 <- datos_c_metrica %>%
      group_by(municipio_name, metrica,cluster,poblacion) %>%
      tally()

    ggplot(data_long2, aes(x=reorder(municipio_name, metrica/poblacion*100000), y=metrica/poblacion*100000, fill=cluster)) +
      geom_bar(stat="identity") +
      labs(x="Alcaldía",
           y=input$val1) +
      coord_flip()
    
    
  })
      
  
  #crear el mapa
  output$map <- renderPlotly({
    datos <- mis_datos()
    
    poblacion <- switch(input$val2,
                        "pop" = datos$pop,
                        "pop_male" = datos$pop_male,
                        "pop_female" = datos$pop_female,
                        "afromexican" = datos$afromexican,
                        "indigenous_language" = datos$indigenous_language
    )
    
    valor <- switch(input$val1, 
                   "due_tot" = datos$due_tot,
                   "sin_dre" = datos$sin_dre,
                   "Inversión.por.metro.cuadrado" = datos$Inversión.por.metro.cuadrado,
                   "porc_no_entub" = datos$porc_no_entub,
                   "serv_prom" = datos$serv_prom
                   )
    variable_tit <- switch(input$val1, 
                       "due_tot" = "Densidad de unidades económicas",
                       "sin_dre" = "Viviendas sin drenaje",
                       "Inversión.por.metro.cuadrado" = "Inversión por metro cuadrado",
                       "porc_no_entub" = "Porcentaje de viviendas sin agua entubada",
                       "serv_prom" = "Porc de viviendas con servicios básicos"
                       )
    
    p <- ggplot(datos, aes(long.x , lat.x, group=group, fill = valor/poblacion*100000, text = municipio_name)) +
      geom_polygon(colour="black") +
      coord_quickmap() +
      labs(title= variable_tit,
           x = "",
           y = "",
           fill = paste(variable_tit," 
por cada 100 mil habitantes")) +
      theme(panel.border = element_rect(color = "grey",
                                        fill = NA,
                                        size = 2),
            panel.background = element_blank(),
            axis.title.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            text = element_text(size=11))
    ggplotly(p)
  })
  
  #mapa con clusters
  output$mapa_clusters <- renderPlotly({
    datos <- mis_datos()
    
    jerC <- hclust(dist(datos[26:31]))
    clus1 <- cutree(jerC, k = input$num_clusters)
    cluster <- factor(clus1)
    
    datos2 <- cbind(datos, cluster)
    
    p <- ggplot(datos, aes(long.x , lat.x, group=group, fill = cluster, text = municipio_name)) +
      geom_polygon(colour="black") +
      coord_quickmap() +
      labs(title= "Clusters",
           x = "",
           y = "") +
      theme(panel.border = element_rect(color = "grey",
                                        fill = NA,
                                        size = 2),
            panel.background = element_blank(),
            axis.title.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            text = element_text(size=11))
    ggplotly(p)
    
    
  })
  
  #crear coordenadas paralelas
  output$par_coords <- renderPlot({
    
    jerC <- hclust(dist(datos3[26:31]))
    clus1 <- cutree(jerC, k = input$num_clusters2)
    cluster <- factor(clus1)
    
    datos2 <- cbind(datos, cluster)
    
    cor_par <- ggparcoord(datos2, columns = 26:31, scale="uniminmax", 
                          alphaLines = 0.4, groupColumn = "cluster") +
      labs(title="Relación entre variables")
    cor_par
    
  })
  
  
}

shinyApp(ui,server)