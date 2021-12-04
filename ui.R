#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinycssloaders)
library(shinydashboard)

source("dataPrep.R")

# Define UI for application that draws a histogram
shinyUI(dashboardPage(

    # Application title
    dashboardHeader(title = "Analisis Sentimen Pada Tripadvsisor"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("K-Means", tabName = "kmeans", icon = icon("poll")),
            menuItem("Wordcloud", tabName = "wdsh", icon = icon("poll")),
            menuItem("Topic Modelling", tabName = "topic",icon = icon("poll"))
        )
    ),
    
    dashboardBody(
        tags$style(HTML("
                    .box.box-solid.box-primary>.box-header {
                    background:#000000
                    }
                    .box.box-solid.box-primary{
                    border-color:#000000;
                    background:#48A868
                    }
                    .btn{
                    width: 100%
                    }
                    .control-label h5{
                    color: white;
                    }
                    ")),
        tabItems(
            tabItem(
                tabName = "dashboard",
                #3box diatas
                fluidRow(
                    box(
                        #input data yang ingin ditampilkan
                        sliderInput(
                            "sizeReview",
                            "Total reviews",
                            min = 0,
                            max = 100,
                            value = 25
                        ),
                        width=12,
                        solidHeader = T
                    )
                ),

                    
                #hasil sentimen
                fluidRow(
                    box(plotOutput("most", height = 500, width = 1250), width = 750),
                    
                ),
            ),
            tabItem(
                tabName = "kmeans",
                #3box diatas
                fluidRow(
                    box(plotOutput("silhoutte", height = 400), width = 750),
                ),
                fluidRow(
                    box(
                        #input data yang ingin ditampilkan
                        sliderInput(
                            "sizeKmeans",
                            "Total Kluster(Recomended 2)",
                            min = 1,
                            max = 5,
                            value = 2
                        ),
                        width=12,
                        solidHeader = T
                    )
                ),
                
                
                #hasil sentimen
                
                fluidRow(
                    box(plotOutput("kmeans", height = 750), width = 750),
                )
            ),
            tabItem(
                tabName = "wdsh",
                #hasil cloud
                fluidRow(
                    box(plotOutput("wordcloud", height = 750), width = 750),
                ),
            ),
            tabItem(
                tabName = "topic",
                fluidRow(
                    box(plotOutput("topic", height = 750), width = 750),
                ),
            )
        )
        
    )
))
