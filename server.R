server <- function(input, output) {

      output$itemCounty <- renderText({
      
      if(input$subTypeInput == "Select all" || input$subTypeInput == "BEER")
      {
        paste(
          "Distribution of",
          capwords(as.character(input$typeInput), TRUE),
          "in",
          capwords(as.character(input$countryInput), TRUE)
        ) 
      }else{
      
    paste(
      "Distribution of",
      capwords(as.character(input$subTypeInput), TRUE),
      "(",
      capwords(as.character(input$typeInput), TRUE),
      ")",
      "in" ,
      capwords(as.character(input$countryInput), TRUE)
      
    )}
    #  paste("Distribution of",as.character(input$typeInput),"in",as.character(input$countryInput))
    
    
  })
  
  output$priceRange <- renderText({
    paste("Price Range : $",input$priceInput[1], "- $",input$priceInput[2])
  })
  
  filtered <- reactive({
    if (is.null(input$countryInput))
    {
      return(NULL)
    }
    
    if (input$subTypeInput == "Select all") {
      return(
        bc1 %>%
          filter(
            Price >= input$priceInput[1],
            Price <= input$priceInput[2],
            Type == input$typeInput,
            Country == input$countryInput
          )
      )
    }
    else{
      return(
        bc1 %>%
          filter(
            Price >= input$priceInput[1],
            Price <= input$priceInput[2],
            Type == input$typeInput,
            Country == input$countryInput,
            Subtype == input$subTypeInput
          )
      )
    }
  })
  
  
  
  output$coolplot <- renderPlotly({

# Checking if output dataset is empty
# Select "GUATEMALA" for default price range
    
    if (nrow(filtered())==0)
    {
      msg2 <- c('No data available for given input','Please increase the price range')
      Alcohol_count <- c(5,5)
      count <- c(3,2.5)
      data <- data.frame(msg2,Alcohol_count,count)
      
      q <- plot_ly(data,x = ~Alcohol_count, y = ~count,type = 'scatter',
                   mode = 'text', text = ~msg2, textposition = 'middle right',
                   textfont = list(color = '#000000', size = 16))  %>%
        layout(
          xaxis = list(range = c(0, 20)),
          yaxis = list(range = c(0,6)))
      q
      }   
    else{
    x <- ggplot(filtered(), aes(Alcohol_Content)) + geom_histogram(fill = input$bcol, color = input$lcol)
    Plot1 <- ggplotly(x)
    }
  })


  
  output$results <- DT::renderDataTable({

    if (is.null(filtered()))
    {
      renderText({
        paste("Price Range :", input$priceInput[1], "-", input$priceInput[2])
      })    }


 if (input$sortPrice == FALSE)
    {
      filtered()
    }
    else
    {
      (arrange(filtered(), (Price)))
    }
  })
  
  
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bc1$Country)),
                selected = "ITALY")
  })
  
  typeFilter <- reactive({
    bc1 %>%
      filter(Country == input$countryInput)
  })
  
  output$typeOutput <- renderUI({
    radioButtons("typeInput", "Product Type",
                 sort(unique(typeFilter()$Type))
    )
              #   selected = "SPIRITS")
  })
  
  output$subTypeOutput <- renderUI({
    subTypeFilter <-
      
      typeFilter() %>%
      filter(Type == input$typeInput)
    selectInput(
      "subTypeInput",
      "Sub Type",
      choices = c("Select all", as.character(sort(
        unique(subTypeFilter$Subtype)
      ))),
      selected = NULL,
      multiple = FALSE
    )
  })
}
