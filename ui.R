library(shiny) 
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Cholestorol Calculator (Friedewald formula)"),
                
                sidebarPanel(
                        numericInput('tc', 'Insert your Total Cholestorol in mg/dL', 200) ,
                        numericInput('hdl', 'Insert your HDL in Cholestorol in mg/dL', 74, min = 30, max = 100, step = 5),
                        numericInput('tg', 'Insert your Triglycerides in mg/dL', 44),
                        submitButton('Submit')
                ), 
                mainPanel(
                        p('Friedewald (1972) Formula: LDL = TC - HDL - TG/5.0 (mg/dL)'),
                        p('TEST CASE: (to ensure calculator is working correctly on your computer).'),
                        tags$div(
                                tags$ul(
                                        tags$li('Total Cholesterol = 201 (mg/dL)'),
                                        tags$li('HDL Cholesterol = 74 (mg/dL)'),
                                        tags$li('Triglycerides = 44 (mg/dL)'),
                                        tags$li('LDL (estimated) = 118.2 (mg/dL) as per Friedewald formula')
                                )
                        ),
                     
                        h4('Taking into account the values entered by you:'), 
                        p('Total Cholesterol:'), verbatimTextOutput("inputtcvalue"),
                        p('HDL Cholesterol:'), verbatimTextOutput("inputhdlvalue"),
                        p('Triglycerides:'), verbatimTextOutput("inputtgvalue"),                
                        h4('Your LDL is:'),
                        verbatimTextOutput("estimation")
                        
                        
                        
                )
                
        )   
)