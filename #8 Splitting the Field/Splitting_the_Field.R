
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
xfunctions::XLibrary("xfunctions")
# xfunctions::XFunctions("xfunctions")
help(package="xfunctions")
packageDescription("xfunctions")
# devtools::install_github("author_name/xfunctions", build_vignettes = TRUE, dependencies = TRUE)
# browseVignettes(package="xfunctions")
# vignette(package="xfunctions")
# vignette("vignette-name",package="xfunctions")
# https://cranlogs.r-pkg.org/badges/last-month/xfunctions
xfunctions::XShowInfo()

baseball = read.csv("baseball_positions.csv")
length(unique(baseball$Name))

minifunctions::displaymedia()

unique(baseball$Position)

# split a string into a list of strings based on a delimiter
position_list = strsplit(baseball$Position, split = "/")
position_list = unlist(position_list)
sort(table(position_list), decreasing = TRUE)

# Alternative using the native R Pipe operator |>
baseball$Position |> 
  strsplit(split = "/") |> 
  unlist() |> 
  table() |> 
  sort(decreasing = TRUE)







