# server.R C:/Users/Jen Li/Documents/GitHub/Data_Product/

library(rCharts)

dat <- read.csv('stat3.csv')

options(RCHART_WIDTH = 1000, RCHART_HEIGHT = 500)

shinyServer(function(input, output) {


  # Generate a summary of the dataset
  output$summary <- renderPrint({
    selected <- input$Region
    region <- subset(dat, Region == selected) 
    summary(region)
  })
  
  output$lexplot <- renderChart2({
    selected <- input$Region
    region <- subset(dat, Region == selected) 
                     #& date %in% seq(input$range[1], input$range[2], 1))
    h1 <- hPlot(
      x = "mm_yy", 
      y = "tot_trans", 
      group = "Channel", 
      data = region, 
      type = "line")
    
    #h1$colors(c("red", "blue"))
    h1$yAxis(title = list(enabled = TRUE, text = 'tot transactions by region'))
    return(h1)
  })
})

