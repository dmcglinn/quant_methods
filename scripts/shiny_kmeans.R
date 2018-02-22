library(shiny)


ui = pageWithSidebar(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris)),
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]])
  ),
  mainPanel(
    verbatimTextOutput('lm_sum')
  )
)

        
server = function(input, output, session) {
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  
  output$lm_sum <- renderPrint(
    summary(lm(selectedData()))
  )

}

shinyApp(ui, server)