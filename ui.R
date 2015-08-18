library(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel('Newspaper Advertisement Cost'),
        sidebarPanel(
            h4('Documentation'),
            h5('This app computes the cost of advertisement space.  Input the column width and length of the advertisement.  Additional surcharges apply if selected.  Premium pages surcharges are summed before multiplying to the ads space cost.'),
            numericInput('width', 'Column Width (1 to 6 col)', 1, min = 1, max = 6, step = 1),
            numericInput('length', 'Length (3 to 54 cm)', 3, min = 3, max = 54, step = 1),
            
            radioButtons('dayrate', 'Day of Publication (base rate)',
                         c('Mon-Wed ($55 per col cm)' = '55',
                           'Thu-Fri ($61 per col cm)' = '61',
                           'Sat ($62 per col cm)' = '62')),
            
            radioButtons('colourrate', 'Colour Surcharge',
                         c('Black & white (+$0)' = '0',
                           '1 spot colour (+$3,800)' = '3800',
                           'Full colour (+$9,900)' = '9900')),
                        
            checkboxGroupInput('optionid', 'Premium Pages Surcharge',
                               c('News (+20%)' = '0.20',
                                 'Front Part (+15%)' = '0.15',
                                 'Right Hand (+15%)' = '0.15'))
            
#            submitButton('Submit')
        ),
        mainPanel(
            h3('Cost Computation'),
            h4('You entered width of (col)'),
            verbatimTextOutput('inputwidth'),
            h4('You entered length of (cm)'),
            verbatimTextOutput('inputlength'),
            h4('The cost is ($)'),
            h6('Cost = Col Width x Length x Base Rate x (1 + Sum of Premium Pages Surcharges) + Colour Surcharge'),
            verbatimTextOutput('cost')
        )
    )
)