
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Calculating BMI Index"),

  # Sidebar with a slider input for in
 
    sidebarPanel(
      numericInput('height','Enter your height (in inches) ? ',200,min = 0, max = 10, step = 1),
      numericInput('weight','Enter your weight (in pounds) ?', 1500,min = 0, max = 10, step = 1),
      radioButtons("gender", "Gender :", 
                   c("Male" = "Male",
                           "Female" = "Female") ,selected = NULL, inline= FALSE, width = NULL),
      dateInput("date", "Enter Date:")
   ),
  
    # display the input given by users to calculate BMI index
    mainPanel(
      h3(' Result '),
      h4('Height :'),
      verbatimTextOutput("oheight"),
      h4('Weight :'),
      verbatimTextOutput("oweight"),
      h4('Gender :'),
      verbatimTextOutput("ogender"),
      h4('Date :'),
      verbatimTextOutput("odate")  ,
      h4('Your Body mass index (BMI) is :'),
      verbatimTextOutput("bmi"),
      h4('Category :'),
      verbatimTextOutput("BMICategory"),
      p('This is used to calculate the BMI index. After user inputs height and weight,then BMI is calculated according to the standard formula. And based on BMI calculated, 
      and an overview is provided.', style  = "color:blue")
  )  
))
