library(shiny) 
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Cholestorol Calculator (Friedewald formula)"),
                
                sidebarPanel(
                        numericInput('tc', 'Insert your Total Cholestorol (mg/dL)', 201) ,
                        numericInput('hdl', 'Insert your HDL in Cholestorol (mg/dL)', 74, min = 30, max = 100, step = 5),
                        numericInput('tg', 'Insert your Triglycerides (mg/dL)', 44),
                        submitButton('Submit')
                ), 
                mainPanel(
                                h4('The values entered by you are:'), 
                                p('Total Cholesterol:'), verbatimTextOutput("inputtcvalue"),
                                p('HDL Cholesterol:'), verbatimTextOutput("inputhdlvalue"),
                                p('Triglycerides:'), verbatimTextOutput("inputtgvalue"),                
                                h4('Caculated LDL is:'),
                                verbatimTextOutput("estimation"),
                        
                                h5('Formula used: LDL = TC - HDL - TG/5.0 (mg/dL)'),
                                p('where TC = Total Cholesterol, HDL = HDL Cholesterol, TG = Triglycerides and LDL = LDL Cholesterol'),
                        
                        
                                p('TEST CASE: (to verify accuracy of calculation use following inputs and check caclulated LDL).'),
                                tags$div(
                                tags$ul(
                                        tags$li('TC (Total Cholesterol) = 201 (mg/dL)'),
                                        tags$li('HDL (HDL Cholesterol) = 74 (mg/dL)'),
                                        tags$li('TG (Triglycerides) = 44 (mg/dL)'),
                                        tags$li('Verify caculated LDL = 118.2 (mg/dL)')
                                )
                        )
                        
                        
                        
                )
                
        )   
)