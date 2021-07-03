
server <- function(input, output,session) {
  
  output$contents <- renderTable({
   
    req(input$file1)
    
    
    tryCatch(
      {
        df <- read.csv(input$file1$datapath,
                       header = input$header,
                       sep = input$sep,
                       quote = input$quote)
      },
      error = function(e) {
        stop(safeError(e))
      }
    )
    
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }
    
  })
  
  output$summ<-renderPrint({
    req(input$file1)
    
    tryCatch(
      {
        df <- read.csv(input$file1$datapath,
                       header = input$header,
                       sep = input$sep,
                       quote = input$quote)
      },
      error = function(e) {
        
        stop(safeError(e))
      }
    )
    
    summary(df)
  })
  
  output$summary<-renderPrint({
    req(input$file1)
    
    tryCatch(
      {
        df <- read.csv(input$file1$datapath,
                       header = input$header,
                       sep = input$sep,
                       quote = input$quote)
      },
      error = function(e) {
        
        stop(safeError(e))
      }
    )
    
    tryCatch(
      {
        fit <- lm(df[,input$y] ~ df[,input$x])
        names(fit$coefficients) <- c("Intercept", input$x)
        summary(fit)
      },
      error = function(e) {
        print("Anda belum memasukan nilai")
      }
    )
  })
  
    output$scatterplot <- renderPlot({
      req(input$file1)
      
      tryCatch(
        {
          df <- read.csv(input$file1$datapath,
                         header = input$header,
                         sep = input$sep,
                         quote = input$quote)
        },
        error = function(e) {
          
          stop(safeError(e))
        }
      )
      
      tryCatch(
        {
          plot(df[,input$x], df[,input$y], main = "ScatterPlot",
              xlab = input$x, ylab = input$y, pch = 19)
          abline(lm(df[,input$y] ~ df[,input$x]), col = "blue")
          lines(lowess(df[,input$y] ~ df[,input$x]), col = "red")
        },
        error = function(e) {
          print("")
        }
      )
    })
    
    output$distribution1 <- renderPlot({
      req(input$file1)
      
      tryCatch(
        {
          df <- read.csv(input$file1$datapath,
                         header = input$header,
                         sep = input$sep,
                         quote = input$quote)
        },
        error = function(e) {
          
          stop(safeError(e))
        }
      )
      
      tryCatch(
        {
          hist(df[,input$y], main = "", xlab = input$y)
        },
        error = function(e) {
          print("")
        }
      )
      
      })
    
    output$distribution2 <- renderPlot({
      req(input$file1)
      
      tryCatch(
        {
          df <- read.csv(input$file1$datapath,
                         header = input$header,
                         sep = input$sep,
                         quote = input$quote)
        },
        error = function(e) {
          
          stop(safeError(e))
        }
      )
      
      tryCatch(
        {
          hist(df[,input$x], main = "", xlab = input$x)
        },
        error = function(e) {
          print("")
        }
      )
      
    })
      
}
    
    
  
  
