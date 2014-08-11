library(shiny)
data(mtcars)
shinyUI(
	pageWithSidebar(
		headerPanel("Linear Model MPG Predictor (Using mtcars dataset)"),
		sidebarPanel(
			h3('Predictors'),
			numericInput('wt', 'Weight (half-tons)', 3.217, min = 1.5, max = 5, step = 0.0001),
			submitButton('Submit'),
			numericInput('hp', 'Horsepower', 146.7, min = 0, max = 600, step = 0.001),
			submitButton('Submit')
		),
		mainPanel(
                        p('This application uses a multivariate regression model to calculate the estimated miles per gallon when provided the weight (in half-tons) and horsepower. The model was calculated from the mtcars dataset, and consequently may not apply to modern vehicles with more advanced engineering and efficiency.'),
                        p('Enter to the left either the weight or horsepower (or both) of a vehicle and click "submit" to calculate the predicted MPG. The default values are the mean from the dataset. Your inputs and the estimated MPG will appear below. The graphs below will automatically update, with the red intersection representing the predicted value.'),
			h3('Estimated Miles per Gallon'),
			h4('Weight (half-tons)'),
			verbatimTextOutput("inputValue"),
			h4('Horsepower'),
			verbatimTextOutput("inputValue2"),
			h4('Miles per Gallon'),
			verbatimTextOutput("prediction"),
                        p('The following graphics plot the above values with the data from the mtcars dataset'),
                        plotOutput('wtPlot'),
                        plotOutput('hpPlot')
		)
	)
)