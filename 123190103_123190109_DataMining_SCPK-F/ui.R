library(markdown)
library(shiny)
library(ggplot2)

ui <- fluidPage(theme = NULL,
                navbarPage("Data Mining",
                           tabPanel("Plot",
                                    sidebarLayout(
                                      sidebarPanel(
                                        # Input: Select a file ----
                                        fileInput("file1", "Choose CSV File",
                                                  multiple = FALSE,
                                                  accept = c("text/csv",
                                                             "text/comma-separated-values,text/plain",
                                                             ".csv")),
                                        
                                        # Horizontal line ----
                                        tags$hr(),
                                        
                                        # Input: Checkbox if file has header ----
                                        checkboxInput("header", "Header", TRUE),
                                        
                                        # Input: Select separator ----
                                        radioButtons("sep", "Separator",
                                                     choices = c(Comma = ",",
                                                                 Semicolon = ";",
                                                                 Tab = "\t"),
                                                     selected = ","),
                                        
                                        # Input: Select quotes ----
                                        radioButtons("quote", "Quote",
                                                     choices = c(None = "",
                                                                 "Double Quote" = '"',
                                                                 "Single Quote" = "'"),
                                                     selected = '"'),
                                        
                                        # Horizontal line ----
                                        tags$hr(),
                                        
                                        # Input: Select number of rows to display ----
                                        radioButtons("disp", "Display",
                                                     choices = c(Head = "head",
                                                                 All = "all"),
                                                     selected = "head")
                                      ),
                                      mainPanel(
                                        tableOutput("contents")
                                      )
                                    )
                           ),
                           tabPanel("Summary",
                                    verbatimTextOutput("summ")
                           ),
                           tabPanel("Regresi",
                                    sidebarLayout(
                                      sidebarPanel(
                                        textInput("x","Enter Variable Independen"),
                                        textInput("y","Enter Variable Dependen")
                                      ),
                                      mainPanel(
                                        tabsetPanel(type = "tabs",
                                                    tabPanel("Model Summary", verbatimTextOutput("summary")),
                                                    tabPanel("Scatterplot", plotOutput("scatterplot")),
                                                    tabPanel("Distribution",
                                                             fluidRow(
                                                               column(6, plotOutput("distribution1")),
                                                               column(6, plotOutput("distribution2")))
                                                    )
                                        )
                                      )
                                    )
                          )      
)
)
