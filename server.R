##incorporate linear regression model from regression model course
##create predict function to predict results given certain variables
##create graphs/plots that can changes









data(mtcars) #load data

#library(manipulate)

#fit <- lm(mpg ~ wt + hp, data = mtcars) #regression model


mpg_calculator <- function(wt = 3.217, #wt/1000 lbs 
			hp = 146.7) 
			32.22727 + (wt * -3.878) + (hp * -0.0318)
                         

shinyServer(
	function(input, input2, output) {
		output$inputValue <- renderPrint({input$wt})
		output$inputValue2 <- renderPrint({input$hp})
		output$prediction <- renderPrint({mpg_calculator(input$wt, input$hp)})
                output$wtPlot <- renderPlot({
                                         plot(mtcars$wt, mtcars$mpg, main = "MPG versus Weight", ylab = "MPG", xlab = "Weight (/1000 lbs)")
                                                iwt <- input$wt
                                                ihp <- input$hp
                                                impg <- 32.22727 + (iwt * -3.878) + (ihp * -0.0318)
                                                points(iwt, impg, col = "red", pch = 19)
        			                abline(h = 0, v = iwt, col = "red")
				                abline(h = impg, v = 0, col = "red")
                })
                output$hpPlot <- renderPlot({
                                         plot(mtcars$hp, mtcars$mpg, main = "MPG versus horsepower", ylab = "MPG", xlab = "Horsepower")
                                                iwt <- input$wt
                                                ihp <- input$hp
                                                impg <- 32.22727 + (iwt * -3.878) + (ihp * -0.0318)
                                                points(ihp, impg, col = "red", pch = 19)
                		                abline(h = 0, v = ihp, col = "red")
				                abline(h = impg, v = 0, col = "red")
                })
	}
)
                
					