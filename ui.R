ui <- fluidPage(theme = shinytheme('cerulean'),
  titlePanel("Liquor Store prices","Sameer App"),
  
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "priceInput",
        label = "Price",
        min = 0,
        max = 100,
        value = c(25, 50),
        pre = "$"
      ),
      br(),
      
      conditionalPanel(
        condition = "input.mytabs == 'panel1'",
        shinyjs::colourInput("bcol", "Bar colour", "blue", showColour = c("background")),
        shinyjs::colourInput("lcol", "Line colour", "black", showColour = "background")
        
      ),
      
      conditionalPanel(
        condition = "input.mytabs == 'panel2'",
        checkboxInput("sortPrice", "Sort by Price", FALSE)
      ),
      
      uiOutput("countryOutput"),
      uiOutput("typeOutput"),
      uiOutput("subTypeOutput")
    ),
    
    mainPanel(
      h2(textOutput("itemCounty")),
      h3(textOutput("priceRange")),
      
      tabsetPanel(id = "mytabs",
        tabPanel(title = "Plot",plotlyOutput("coolplot"), value = "panel1"),
        tabPanel(title = "Table",DT::dataTableOutput("results"), value = "panel2")
      )
    )
    
  )
)





