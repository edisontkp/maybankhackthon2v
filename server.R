library(shiny)

data_file<-read.table("http://www.fabioveronesi.net/ShinyApp/point_grid.csv",sep=";",header=T) 

shinyServer(function(input,output){
  
  output$plot <- renderPlot({
    sub<-data_file[input$row,]
    data<-rnorm(10000,mean=sub$Wind_Media,sd=sub$StDev_smoo)
    hist(data)
  })
  
  
})
