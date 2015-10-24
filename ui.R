shinyUI(pageWithSidebar( 
  headerPanel("There are more earthquakes than you might think!"),
  
  sidebarPanel(
    h3("Let's look at the last 30 days.."), 
    textInput(inputId="Abb", label = "US state of interest (abbreviation)"), 
    textInput(inputId="MinMag", label = "Minimum magnitude of earthquake"), 
    actionButton("goButton", "Go!")
  ), 
  mainPanel(
    p('Your US State of interest:', textOutput('name')), 
    p('Your Earthquake Magnitude of interest'), 
    textOutput('MinMag'),    
    textOutput('info'),
    plotOutput('EQhist1'),
    plotOutput('EQhist2')
  ) 
))