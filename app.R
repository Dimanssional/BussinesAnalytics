#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)

predaje <- read.csv("predaje.csv")
predaje <- as.data.frame(predaje)
View(predaje)

# Define UI for application that draws a histogram
ui <- dashboardPage( skin = "green",
    
    dashboardHeader(title = "Dashboard"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Data information", tabName = "data_information", icon = icon("th")),
            menuItem("Data graph", tabName = "data_graph", icon = icon("calendar")),
            menuItem("About", tabName = "about", icon = icon("address-card")),
            
            radioButtons("color", "Vyberte farbu grafu", 
                         choiceNames = list(HTML("<p style='color:orange;'>orange</p>"), HTML("<p style='color:green;'>green</p>")), 
                         choiceValues = list("orange", "green"))
        )
    ),
    dashboardBody(
       tabItems(
         tabItem(tabName = "dashboard",
            fluidRow(
                infoBoxOutput("progressBox3"),
                
                infoBoxOutput("progressBox"),
                
                infoBoxOutput("progressBox2")
            
               ),
            
            box(plotOutput('plot_01', height=400), title = "Predaje", status = "primary", solidHeader = TRUE),
            box(plotOutput('plot_02', height=400), title = "Produkty", status = "warning", solidHeader = TRUE)
            ),
            
        tabItem(tabName = "data_information",
                    DT::dataTableOutput("tablesales"),
                    br(),
                    box(title = HTML("<p style='font-weight:bold;'>Počet riadkov</p>"), br(),
                        HTML("<p align='center' style='font-weight:bold;font-size:16px;'>75000</p>"), status = "danger", 
                        solidHeader = TRUE, background = "maroon"),
                    box(title = HTML("<p align='center' style='font-weight:bold;'>Krajiny</p>"), br(),
                        HTML("<p align='center' style='font-weight:bold;font-size:16px;'>Slovensko <br> Česko</p>"), 
                        status = "info", solidHeader = TRUE, background = "light-blue"),
                box(title = HTML("<p align='center' style='font-weight:bold;'>Kategorie produktov</p>"), br(),
                    HTML("<p align='center' style='font-weight:bold;font-size:16px;'>Jedlo <br> Oblečenie <br> Elektro</p>"), 
                    status = "warning", solidHeader = TRUE, background = "orange"),
                box(title = HTML("<p align='center' style='font-weight:bold;'>Nakupné mesta</p>"), br(),
                    HTML("<p align='center' style='font-weight:bold;font-size:16px;'>Bratislava <br> Košice <br> Nitra <br> Brno <br> Ostrava</p>"), 
                    status = "success", solidHeader = TRUE, background = "olive")
                ),
        tabItem(tabName = "data_graph",
                box(plotOutput('plot_03', height = 500, width=600), title = "Predaje", status = "warning", solidHeader = TRUE),
                box(selectInput("X", label="Výber atribút", choices = names(predaje), selected = "cena"),
                    selectInput("Y", label="Výber druhý atribút", choices = names(predaje), selected = 'krajina'),
                    textInput("nazov", "Pridajte nazov", placeholder = "Nazov grafu"),
                    status = "primary", solidHeader = TRUE),
                
                
                ),
        tabItem(tabName = "about",
                box(title = "O aplikácie",HTML("<p align='justify'>Tato aplikácia služi na operácie s datasetom 'Predaje'.
                    <br>Sú tu možnosti získavania základných informácií o samotnom datasete napr. cena produktov v Česku resp. 
                    <br>na Slovensku alebo čas nakupu v rôzných mestoch,
                                         takisto aj možnosť vizualizácie dát</p>"), status="warning", solidHeader=TRUE),
                box(title="O autorovi",HTML("<p align='justify'>Dmytro Lahunov, 3 ročník, 
                                            odbor Inteligentné systémy, predmet Podniková analityka</p>"), status="info", solidHeader=TRUE)
                
                
                )
         
         )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$plot_03 <- renderPlot({
        ggplot(predaje, aes_string(x=input$X, y=input$Y))+ggtitle(input$nazov)+geom_point(color=input$color)
    })
    
    output$tablesales <- DT::renderDataTable({
        DT::datatable(predaje, options = list(lengthMenu = c(5, 15, 30, 60), pageLength = 5))
    })
    
    output$plot_01 <- renderPlot({
        ggplot(predaje, aes_string("cena", "krajina"))+geom_point(color=input$color)
    })
    
    output$plot_02 <- renderPlot({
        ggplot(predaje, aes_string("cena", "produkt"))+geom_point(color="blue")
    })
    
    output$progressBox <- renderInfoBox({
        infoBox(
            "Priemerna cena chliebu", paste0(median(predaje$cena[predaje$produkt=="Chlieb"]), " EURA"), icon = icon("money-check-alt"),
            color = "maroon", fill = TRUE
        )
    })
    
    output$progressBox2 <- renderInfoBox({
        infoBox("Priemerna cena tabletu", paste0(median(predaje$cena[predaje$produkt == "Tablet"]), " EUR"), icon = icon("tablet"),
                color = "light-blue", fill = TRUE)
    })
    
    output$progressBox3 <- renderInfoBox({
        infoBox("Priemerna cena produktov na Slovensku", paste0(median(predaje$cena[predaje$krajina == "SK"]), " EUR"), icon = icon("flag"),
                color = "olive", fill = TRUE)
    })
    
    

}

# Run the application 
shinyApp(ui = ui, server = server)
