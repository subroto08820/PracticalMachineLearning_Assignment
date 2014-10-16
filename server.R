library(shiny) 

CHOL<-function(tc,hdl,tg) {tc-hdl-(tg/5)}

shinyServer(
        function(input, output) {
                
                output$inputtcvalue <- renderPrint({input$tc})
                output$inputhdlvalue <- renderPrint({input$hdl})
                output$inputtgvalue <- renderPrint({input$tg})
                output$estimation <- renderPrint({CHOL(input$tc,input$hdl,input$tg)})                
        } 
)