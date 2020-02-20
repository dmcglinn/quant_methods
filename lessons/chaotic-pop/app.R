#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# simple model of logistic growth
dNt <- function(r, N) r * N * (1 - N)

# iterate growth through time
Nt <- function(r, N, t) {
  for (i in 1:(t - 1)) {
    # population at next time step is population at current time + pop growth
    N[i + 1] <- N[i] + dNt(r, N[i])
  }
  N
}

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Logistic Population Dynamics, dN/dt = rN(1 - N)"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("r",
                     "Population growth rate (r):",
                     min = 0.01,
                     max = 3,
                     value = 0.1),
        sliderInput("t",
                    "Length of time series (t):",
                    min = 10,
                    max = 1000,
                    value = 100),
        sliderInput("N",
                    "Starting population abundance (N(t=0))",
                    min = 0.01,
                    max = 2,
                    value = 0.5)
        
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plotNt")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$plotNt <- renderPlot({
     plot(1:input$t, Nt(input$r, input$N, input$t), type = 'l', xlab = 'Time (t)',
          ylab = 'Population size (N)', ylim = c(0, 2))
     abline(h = 1, lty = 2, col='grey')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

