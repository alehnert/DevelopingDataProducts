library(shiny) 
data(state)
URL <- "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv"
Earthquake_30Days <- read.table(URL, sep = ",", header = T)
Earthquake_30Days <- Earthquake_30Days[Earthquake_30Days$type=="earthquake",] # only keep actual earthquakes
Earthquake_30Days <- Earthquake_30Days[Earthquake_30Days$mag>0,] # only keep actual earthquakes
StateID<-data.frame(abb=state.abb,name=state.name)
name<-""

ReturnName <- function(A) {
  Abb<-toupper(A)
  N<-as.character(StateID[StateID$abb==Abb,]$name)
  return(N)
}

NQuakes <- function(state) {
  EID<-grep(state,Earthquake_30Days$place)
  return(length(EID))
}

GetInfo <- function(state,MM){
  EID<-grep(state,Earthquake_30Days$place)
  if (length(EID)>0){
    Earthquakes<-Earthquake_30Days[EID,]
    LargeOnes<-Earthquakes[Earthquakes$mag>=MM,]
    maxEQ<-Earthquakes[Earthquakes$mag==max(Earthquakes$mag),]  
    if (nrow(maxEQ)>1){maxEQ<-maxEQ[1,]}
    info<-paste("There have been",length(EID),"earthquakes in",state,"this month.", 
                "Of these,", nrow(LargeOnes),"have been at or over magnitude",MM,
                ". The largest earthquake was",maxEQ$place,"and had a magnitude of",maxEQ$mag,".") 
  }
  if (length(EID)==0) info<-paste("There were no earthquakes in",state,", why not try another state?")  
  return(info)
}

PlotInfo <- function(state){
  if (state=="all") {return(Earthquake_30Days$mag)}
  EID<-grep(state,Earthquake_30Days$place)
  Earthquakes<-Earthquake_30Days[EID,]  
  if (length(EID)>0) {return(Earthquakes$mag)}
}

shinyServer(   
  function(input, output) {
    output$name <- renderText({ReturnName(input$Abb)})
    output$MinMag <- renderText({input$MinMag})    
    output$info <- renderText({
      if(input$goButton>=1){
        info<-GetInfo(ReturnName(input$Abb),input$MinMag)
      }      
    })
    
    output$EQhist1 <- renderPlot({
      if(input$goButton>=1){      
        if(NQuakes(ReturnName(input$Abb))>0){        
          hist(PlotInfo(ReturnName(input$Abb)),
               main="All earthquakes in the last 30 days in your state of interest",
               xlab="Earthquake magnitude")
        }         
      }
    })
    output$EQhist2 <- renderPlot({
      if(input$goButton>=1){      
        hist(PlotInfo("all"),
             main="All earthquakes in the last 30 days in the US",
             xlab="Earthquake magnitude")
      }
    })    
  })





