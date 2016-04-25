
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

getBMI <- function(x, y){
  BMI <- ( y / ( x * x ) ) * 703
  BMI
}

getBMICategory <- function(x){ 
  if (x < 18.5) {
      BMICategory <- "Underweight"
    }  else if( x >= 18.5 & x < 24.9 ) {
      BMICategory <- "Normal Weight"
    } else if (x >= 25 & x < 29.9 ) {
      BMICategory <- "Over Weight"
  } else if (x >= 30) {
      BMICategory <- "Obesity"
  }
  BMICategory
}

shinyServer(
  function(input, output) {
  height <- reactive({
    input$height
  })  
  output$oheight <- renderPrint({height()})
  weight <- reactive ({
    input$weight
  })
  output$oweight <- renderPrint({weight()})
  output$ogender <- renderPrint({input$gender})
  output$odate<- renderPrint({input$date})
  output$bmi<- renderPrint({getBMI(input$height, input$weight)})
  output$BMICategory<- renderPrint({getBMICategory(getBMI(input$height, input$weight))})
  })


