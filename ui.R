library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Area Of An Ellipse And  A Triangle Calculated Using \n Monte Carlo Simulation"),
  sidebarPanel(
    h3("Simultaion parameters:"),
    checkboxInput("useSeed", label = "Use seed", value = TRUE),
    numericInput("seedv", label = "Seed value", value = 1),  
    sliderInput('N', 'Number of points',value = 100, min = 50, max = 1000, step = 50),    
    h3("Ellipse"),
    sliderInput('a', 'Semi-axis a',value = 0.5, min = 0.25, max = 1, step = 0.05),
    sliderInput('b', 'Semi-axis b',value = 0.5, min = 0.25, max = 1, step = 0.05),
    h3("Triangle"),
    sliderInput('Ax', 'X coordinate of the vertex A',value = 0.0, min = -1, max = 1, step = 0.05),
    sliderInput('Ay', 'Y coordinate of the vertex A',value = 0.0, min = -1, max = 1, step = 0.05),
    sliderInput('Bx', 'X coordinate of the vertex B',value = 1, min = -1, max = 1, step = 0.05),
    sliderInput('By', 'Y coordinate of the vertex B',value = 0, min = -1, max = 1, step = 0.05),
    sliderInput('Cx', 'X coordinate of the vertex C',value = 0, min = -1, max = 1, step = 0.05),
    sliderInput('Cy', 'Y coordinate of the vertex C',value = 1, min = -1, max = 1, step = 0.05)
    
    
  #  submitButton('Submit')
    
  ),
  mainPanel(
    tabsetPanel(type = "tabs", 
                tabPanel("Application", 
                         plotOutput("Application"),
                         h3('Results of simulation'),
                         h4('Estimated value of an ellipse area'),
                         verbatimTextOutput("area"),
                         
                         withMathJax(),
                         
                         #areaTriangle
                         
                         h4('Exact area of an ellipse: $$ S = \\pi a b $$'),
                         verbatimTextOutput("exactEllipse"),
                         
                         h4('Estimated area of a triangle'),
                         verbatimTextOutput("areaTriangle"),
                         
                         
                         h4('Exact area of a triangle: $$ S_{\\Delta} = \\frac{1}{4} \\sqrt{4BC^2 AC^2 -(BC^2+AC^2-AB^2)^2 }$$'),
                         verbatimTextOutput("exactTriangle")
                         ), 
                tabPanel("Help", includeHTML("help.html"))                 
    )
    
    #plotOutput('ellipse'),
    
    
  )
))
