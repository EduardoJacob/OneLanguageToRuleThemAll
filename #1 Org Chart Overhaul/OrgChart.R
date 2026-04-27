
# set snippet ----
# Use Ctrl+Shift+k to Compile Report from R Script
# usethis::edit_rstudio_snippets()
# Ctrl+Shift-P - Show Command Palette
# Ctrl+Alt-T - execute Section
if ( interactive() ) setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
rm(list=ls()) # Clear Workspace
try( dev.off(dev.list()["RStudioGD"]),silent=T) # Clear Plots
gc()
cat("\014") # Clear Console ctrl+L
xfunctions::XLibrary("DiagrammeR")
# xfunctions::XFunctions("igraph")
help(package="minifunctions")
packageDescription("igraph")
# devtools::install_github("author_name/igraph", build_vignettes = TRUE, dependencies = TRUE)
# browseVignettes(package="igraph")
# vignette(package="igraph")
# vignette("vignette-name",package="igraph")
# https://cranlogs.r-pkg.org/badges/last-month/igraph
xfunctions::XShowInfo()

minifunctions::displaymedia()

source("OrgChartFunctions.R")

Employee = read.csv("OfficeSpace.csv")
Employee$OriginalOrder = 1:nrow(Employee)
Employee$ReportingHierarchy = ""
Employee$DirectReports = 0
Employee$TotalReports = 0

PlotNetwork()
# Shuffle Employee to test the solution is not order dependent
Employee = Employee[sample(1:nrow(Employee)), ]
PlotNetwork()

call_count = 0
for ( i in 1:nrow(Employee) ) {
  # i = 1
  Employee$ReportingHierarchy[i] = GetReportingHierarchy(i)
  
  # Compute DirectReports
  k = which(Employee$Employee.Name == Employee$Manager.Name[i])
  Employee$DirectReports[k] = Employee$DirectReports[k] + 1
}
 
# Compute TotalReports
TotalReports = paste(Employee$ReportingHierarchy, collapse = " > ")
TotalReports = unlist( strsplit(TotalReports, split = " > ") )
TotalReports = table(TotalReports) - 1
Employee$TotalReports = as.numeric( TotalReports[Employee$Employee.Name] )

# Compute depth of each employee in the hierarchy
Employee$depth = stringr::str_count(Employee$ReportingHierarchy, ">")
# Reorder Employee by original order
# Employee = Employee[order(as.numeric(rownames(Employee))), ]

















