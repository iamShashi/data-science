#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
  basicPage(
    sidebarPanel(
    #checkboxInput("v1", "Number Of Cylinders", FALSE),
    #verbatimTextOutput("v1"),
    
    #checkboxInput("v2", "Total HorsePower", FALSE),verbatimTextOutput("v2"),
    
    #checkboxInput("v3", "Total Weight of car", FALSE),
    #verbatimTextOutput("v3"),
    h3('Select One of the which will be used to Predict'),
    checkboxGroupInput("variable","Select Only one of the Following:",
                       c("Cylinders usage" = "cyl",
                         "Horsepower of the vehicle" = "hp",
                         "Weight of the Vehicle" = "wt")),
    h3('Select the Element to be Predicted'),
    checkboxGroupInput("variable2", "Select one of the Following:",
                      c("Miles per Gallon" = "mpg","Cylinders usage" = "cyl",
                        "Horsepower of the vehicle" = "hp",
                        "Weight of the Vehicle" = "wt")),
    
    submitButton('Submit')
    ),
    
    mainPanel(
      h2('Making prediction models using shinyApp :'),
      br(),
      h3('*Select the one to Be predicted and one who predicts'),
      br(),
    h3('*The Selected Dataset in Rows and Columns'),
    br(),
    
    tableOutput("model"),
    #plotOutput("model2", click = "plot_click"),
    #verbatimTextOutput("info")
    h3('The plot Finally between the predictor and the one to be predicted'),
    br(),
   plotOutput("model2", click = "plot_click"),
    verbatimTextOutput("info")
  
    )
    
  
)
)

