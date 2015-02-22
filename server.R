library(shiny)

triangleArea <- function( x1, y1, x2, y2, x3, y3){
  
  d1 <- ((x2-x1)^2+(y2-y1)^2)
  d2 <- ((x3-x1)^2+(y3-y1)^2)
  d3 <- ((x2-x3)^2+(y2-y3)^2)
  S<-0.25*sqrt(4 * d1 * d2 - (d1+d2-d3)^2)
  
  return(S)   
  
  
}

belongsToTriangle <- function(xP,yP, x1, y1, x2, y2, x3, y3){
  rez <- (xP^2 >= 0)
  for(i in 1:length(xP)){ 
    s1 <- sign((x1-xP[i])*(y2-y1)-(x2-x1)*(y1-yP[i]))
    s2 <- sign((x2-xP[i])*(y3-y2)-(x3-x2)*(y2-yP[i]))
    s3 <- sign((x3-xP[i])*(y1-y3)-(x1-x3)*(y3-yP[i]))
    if ( ( (s1 * s2) >=0) && ( (s2 * s3) >= 0) ){
      rez[i] <- TRUE
    }  
    else { 
      rez[i] <- FALSE
    }       
  }
  return(rez)
}

shinyServer(
  function(input, output) {
    output$Help <- renderPrint({})
    output$Application <- renderPlot({
      if (input$useSeed) {
        set.seed(input$seedv)        
      }
      fi <- seq(0, 2*pi, 0.05) 
      x <- input$a * cos(fi)   
      y <- input$b * sin(fi)   
      #Plot the ellipse:
      plot(x,y, type="l", col="red", xlim=c(-1.2,1.2), ylim=c(-1.2,1.2))
      #Plot the triangle:
      lines(c(input$Ax,input$Bx,input$Cx,input$Ax), c(input$Ay,input$By,input$Cy,input$Ay), col="brown")
    
      xP <- runif(input$N,-1,1)
      yP <- runif(input$N,-1,1)
      fromEllipse <- (xP^2/input$a^2+yP^2/input$b^2)<=1
      xBlue <- xP[fromEllipse]
      yBlue <- yP[fromEllipse]
      xBlack <- xP[!fromEllipse]
      yBlack <- yP[!fromEllipse]
      
      points(xBlue,yBlue, type="p", col="blue", xlim=c(-1.2,1.2), ylim=c(-1.2,1.2))
      points(xBlack,yBlack, type="p",  col="black", xlim=c(-1.2,1.2), ylim=c(-1.2,1.2))
      output$area <- renderPrint({length(xBlue)*4.0/input$N})
        
      output$exactEllipse <- renderPrint({pi* input$a * input$b})
      
      fromTriangle <- belongsToTriangle(xP, yP, 
                      input$Ax, input$Ay, input$Bx, input$By, input$Cx, input$Cy)

      xGreen <- xP[fromTriangle]
      yGreen <- yP[fromTriangle]

      points(xGreen,yGreen, type="p", col="green", xlim=c(-1.2,1.2), ylim=c(-1.2,1.2))

      output$areaTriangle <- renderPrint({length(xGreen)*4.0/input$N})
      output$exactTriangle <- renderPrint({triangleArea(input$Ax, input$Ay, input$Bx, input$By, input$Cx, input$Cy)})
      
      
      xYellow <- xP[fromTriangle & fromEllipse]
      yYellow <- yP[fromTriangle & fromEllipse]
      
      points(xYellow, yYellow, type="p", col="yellow", xlim=c(-1.2,1.2), ylim=c(-1.2,1.2))
      
      # 
    #  hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
    #  mu <- input$mu
      #mu <- input$mean
    #  lines(c(mu, mu), c(0, 200),col="red",lwd=5)
    #  mse <- mean((galton$child - mu)^2)
    #  text(63, 150, paste("mu = ", mu))
    #  text(63, 140, paste("MSE = ", round(mse, 2)))
    })
    
  }
)