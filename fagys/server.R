#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   dataf<- reactive({mtcars})
   reg <- reactive({
     as.formula(paste(input$variable, '~', input$variable2))
   })
  output$v1 <- renderPrint({ input$v1 })
  output$v2 <- renderPrint({ input$v2 })
  output$v3 <- renderPrint({ input$v3 })
  output$model <- renderTable({
    mtcars[, c("mpg", input$variable), drop = FALSE]
  }, rownames = TRUE)
  
  
  output$model2 <- renderPlot({
    plot(dataf()[,input$variable2], dataf()[,input$variable],
         xlab = input$variable2, ylab = input$variable,  main = "Scatter Plot of Predicted and Predictor Variables", pch = 9, 
         col = "red", cex = 1)})
  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
  #output$info<- renderText({ paste0("x=", input$plot_click$x, "\ny=",input$plot_click$y)})
  #output$model2 <- renderPlot(reactive({lm(reg(), data=dataf)}))
  
  
  #output$model2 <- renderPlot(lm(input$variable2[length(input$variable)]~ + input$variable, data=mtcars))
  
  
})
