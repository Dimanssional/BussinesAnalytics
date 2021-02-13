library(shiny)
library(shinythemes)
library(ggplot2)
library(DT)




# Define UI for application that draws a histogram
ui <- fluidPage(
  mainPanel(
    tabsetPanel(
      tabPanel(title="Dáta iris", 
               shiny::tags$h1("Description"), 
               shiny::tags$p("This famous (Fisher's or Anderson's) iris data set gives the measurements in 
                                        centimeters of the variables sepal length and width and petal length and width,
                                        respectively, for 50 flowers from each of 3 species of iris. 
                                        The species are Iris setosa, versicolor, and virginica.")
      ),
      tabPanel(
        title="Tabuľka",
        sidebarLayout(
          sidebarPanel(
            shiny::tags$h3("Popis dát"),
            shiny::tags$p("Dáta sa skladaju zo 150 riadkov, 
                                 5 stlpcov a su voľne dostupne v programe RStudio.")
          ),
          mainPanel (
            DT::dataTableOutput("tableplots")
          )
        )
      ),
      
      tabPanel(
        title="Grafy",
        sidebarLayout(
          sidebarPanel(
            selectInput("X", label="Výber atribút", choices = names(iris), selected = "Petal.Length"),
            selectInput("Y", label="Výber druhý atribút", choices = names(iris), selected = 'Sepal.Width'),
            radioButtons("color", "Vyberte farbu grafu", 
                         choiceNames = list(HTML("<p style='color:red;'>red</p>"), HTML("<p style='color:blue;'>blue</p>")), 
                         choiceValues = list("red", "blue")),
            textInput("xAxis", "Pridajte popis pre x-ovú os", placeholder = "X"),
            textInput("yAxis", "Pridajte popis pre y-ovú os", placeholder = "Y"),
            textInput("nadpis", "Pridajte nadpis", placeholder = "Nadpis")
          ),
          
          mainPanel(
            column(12,plotOutput('plot_iris')),
            
          )
        )
        
        
        
      )
    )
  )
  
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$tableplots <- DT::renderDataTable({
    DT::datatable(iris, options = list(lengthMenu = c(5, 15, 30, 60), pageLength = 5))
  })
  
  output$plot_iris <- renderPlot({
    ggplot(iris, aes_string(x=input$X, y=input$Y))+geom_point(color=input$color)+xlab(input$xAxis)+ylab(input$yAxis)+ggtitle(input$nadpis)
    
  })
  
}


# Run the application 
shinyApp(ui = ui, server = server)





