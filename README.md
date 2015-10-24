---
title: "ReadMe for Coursera Developing Data Products Course Project"
author: "Adrienne Lehnert"
date: "October 24, 2015"
---
Folder contains  
- server.R: server file for shiny App  
- ui.R: user interface file for shiny App  
- this ReadMe  

## Description of the shiny App
This app is designed to facilitate exploration of a database containing information on all earthquakes in the USA and its territories for the last month. The data is provided by the USGS and is available at the link:

http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv  

The app will take input from the user in the form of a US state abbreviation and minimum earthquake magnitude of interest and provide the following output:  
1.	Echo the state (by name) and minimum magnitude provided by the user  
2.	Short paragraph describing the number of earthquakes in the state, the number over the magnitude specified (if any), and the magnitude of the largest earthquake in the state.  
3.	Histogram of the earthquakes by magnitude in the state  
4.	Histogram of the earthquakes by magnitude in the USA  

## Instructions for use of the shiny App  
1.	Enter the two letter abbreviation of a USA state or territory  
2.	Enter the minimum magnitude of earthquake (this must be greater than or equal to zero)  
3.	Press “Go”  
4.	Subsequent updates to #1 and #2 will update the information and figures immediately  
5.	If an incorrect abbreviation is provided a red error message will appear reading “invalid pattern argument” but the histogram of all earthquakes in the US will still appear  


