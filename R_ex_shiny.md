Temperatures viewer
========================================================
author: Łukasz Sadalski
date: 26 February 2018
width: 1440
height: 900

Introduction
========================================================

This is a viewer to display temperatures of my neighbourhood between July 2017 and February 2018. 
Observations from five weather stations were used. 
You can display temperatures using:
- range of temperatures
  - min (-30, 0)
  - max (0, 40)
- range of dates (31/07/2017 - 24/02/2018)
- chosen weather station or all of them on the same chart

The plot will automatically refresh.

If you want to display two, three or four chosen stations at the same time, please click on the station names on the plot legend. The legend is visible when "ALL" stations are clicked on the sidbar.

You also have standard plotly menu when you keep mouse pointer over the chart.
Temperatures are displayed in Celsius.

Application - 
https://wookiter.shinyapps.io/r_ex_shiny/

How it looks
========================================================

Below is a screenshot how the viewer looks like.

![Screenshot](http://sadalski.net.pl/templot/R_ex_shiny_screenshot.png)


Data loading
========================================================

I used locally stored weather data to build a plot, I loaded almost 30000 flat files. Each json file has around 76 variables, I chose only necessary ones for a plot.


```r
library (jsonlite)
files <- list.files(path="/Users/wookiter/weather", pattern="*.txt", full.names=T, recursive=FALSE) 
tail(files,3)
```

```
[1] "/Users/wookiter/weather/2018-02-24-17-00-07-IJAWCZYC2.txt" 
[2] "/Users/wookiter/weather/2018-02-24-17-00-08-IMAZOWIE61.txt"
[3] "/Users/wookiter/weather/2018-02-24-17-00-09-IMZPECIC2.txt" 
```

```r
json_record <- read_json ("/Users/wookiter/weather/2018-02-24-17-00-09-IMZPECIC2.txt")
summary (json_record)
```

```
                    Length Class  Mode
response             3     -none- list
location            17     -none- list
current_observation 56     -none- list
```

Resources
========================================================

The application is available here - 
https://wookiter.shinyapps.io/r_ex_shiny/

Other resources are available on github -
https://github.com/wookiter/templot
- ui.R 
- server.R
- this presentation

As the data used was loaded from 30000 flat files (takes time and space), data frame object was
created and is located here as it exceeds github limit: 
- http://sadalski.net.pl/templot/.RData
- http://sadalski.net.pl/templot/saveddf_temp.RData


Source of data
========================================================

I gathered the data from wunderground.com.
This site gathers weather conditions from amateur weather stations.
Using scheduled python script and wunderground API I collect current weather conditions every hour and I save all the json formatted data as flat files.


Data comes from https://www.wunderground.com

![wunderground](https://icons.wxug.com/logos/PNG/wundergroundLogo_4c_horz.png)


