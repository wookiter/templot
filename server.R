library (plotly)
#library (tidyr)
#library (dplyr)
#library (rjson)
#library (jsonlite)
library(shiny)

load ("saveddf_temp.RData")

dfIMZKONOT10 <- filter (df, station_id == "IMZKONOT10")
dfIMZPIAST3 <- filter (df, station_id == "IMZPIAST3")
dfIMZPIAST2 <- filter (df, station_id == "IMZPIAST2")
dfIMAZOWIE61 <- filter (df, station_id == "IMAZOWIE61")
dfIMZPECIC2 <- filter (df, station_id == "IMZPECIC2")
dfALL <- df

df_disp <- df

shinyServer(function(input, output) {
    
    output$plot <- renderPlotly({
      
      df_disp <- switch(input$station,
                     ALL = dfALL,
                     IMZKONOT10 = dfIMZKONOT10,
                     IMZPIAST3 = dfIMZPIAST3,
                     IMZPIAST2 = dfIMZPIAST2,
                     IMAZOWIE61 = dfIMAZOWIE61,
                     IMZPECIC2 = dfIMZPECIC2,
                     dfALL)
      
      
      plot_ly (df_disp, x = ~local_time_rfc822, y = ~temp_c, color = ~station_id, type = "scatter", mode = "lines") %>% layout (xaxis = list (title = "Time of temperature observations", range = input$daterange), yaxis = list (title = "Temperature in C", range = c(input$minimum, input$maximum)) )
    })
   
})
