library(shiny)
library (plotly)
shinyUI(fluidPage(
  titlePanel("Example plot_ly with shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("minimum", "Minimum temperature", -30, 0, -15),
      sliderInput("maximum", "Maximum temperature", 0, 40, 40),
      dateRangeInput("daterange", "Date range:",
                     start  = "2017-07-31",
                     end    = "2018-02-24",
                     min    = "2017-07-31",
                     max    = "2018-02-24",
                     format = "mm/dd/yy",
                     separator = " - "),
      radioButtons("station", "Station id:",
                   c("ALL" = "ALL",
                     "IMZKONOT10" = "IMZKONOT10",
                     "IMZPIAST3" = "IMZPIAST3",
                     "IMZPIAST2" = "IMZPIAST2",
                     "IMAZOWIE61" = "IMAZOWIE61",
                     "IMZPECIC2" = "IMZPECIC2"
                     )),
      tags$div(class="header", checked=NA,
               tags$p(""),
               tags$p("Data comes from https://www.wunderground.com"),
               img(src="https://icons.wxug.com/logos/PNG/wundergroundLogo_4c_horz.png", height="30", width="120")
      )
      
    ),
    mainPanel(
      h3("Temperatures in my neighbourhood"),
      textOutput("minimum"),
      textOutput("maximum"),
      plotlyOutput("plot")
    )
  )
))
