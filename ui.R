# ui.R - C:/Users/Jen Li/Documents/GitHub/Data_Product/

library(rCharts)

dat <- read.csv('stat3.csv')

# Define UI 
shinyUI(fluidPage(
  # Application title.
  titlePanel("Bank XYZ Transactions Analysis"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "Region", 
                  label = "Select a Region:", 
                  choices = c("A", "B", "C", "D"), 
                  selected = "A"), 
      
 

    helpText("Data are collected from various regions ", 
               "in S.Cal housholds' consumer banking  ", 
               "transactions from 2011 to 2012. ", 
               " ", 
               "The chart illustrates how each region household", 
               "make their banking business - ex by deposit over", 
               "the counter(pod), by online, or transer", 
               " ", 
               "(data from XYZ bank.)")
    ),
    
    # Show the plot 
    mainPanel(
      h3("Summary"),
      verbatimTextOutput("summary"),
      
      h3("Transaction type over time"),
      showOutput("lexplot", "highcharts")

    )
  )
))