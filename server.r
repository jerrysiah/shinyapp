library(shiny)
adcost <- function(width, length, optionid, dayrate, colourrate) {
    if (length(optionid)==0)
        factor <- 1
    else 
        factor <- sum(as.numeric(optionid)) + 1
    baserate <- as.numeric(dayrate)
    coloursurcharge <- as.numeric(colourrate)
    return(width * length * factor * baserate + coloursurcharge)
}

shinyServer(
    function(input, output) {
        output$inputwidth <- renderText({input$width})
        output$inputlength <- renderText({input$length})
        output$cost <- renderText({adcost(input$width, input$length, input$optionid, input$dayrate, input$colourrate)})
    }
)