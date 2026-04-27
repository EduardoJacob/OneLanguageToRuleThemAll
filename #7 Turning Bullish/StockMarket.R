
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
xfunctions::XLibrary("zoo")
# xfunctions::XFunctions("zoo")
help(package="zoo")
packageDescription("zoo")
# devtools::install_github("author_name/zoo", build_vignettes = TRUE, dependencies = TRUE)
# browseVignettes(package="zoo")
# vignette(package="zoo")
# vignette("vignette-name",package="zoo")
# https://cranlogs.r-pkg.org/badges/last-month/zoo
xfunctions::XShowInfo()

minifunctions::displaymedia()

source("StockMarketFunctions.R")

# minifunctions::displaymedia("https://www.youtube.com/watch?v=FjVSnnFEVs4")
# minifunctions::displaymedia()
prices = read.csv("SPY_close_price_5Y.csv")
prices$Date = as.Date(prices$Date)
prices$gc = 0

prices$ma_50 = zoo::rollmeanr(prices$Close, k = 50, fill=NA)
prices$ma_200 = zoo::rollmeanr(prices$Close, k = 200, fill=NA)

PlotPrices()

for (i in 201:nrow(prices)) {
  if (prices$ma_50[i] > prices$ma_200[i] && prices$ma_50[i-1] <= prices$ma_200[i-1]) prices$gc[i] = 1
}

minifunctions::printdataframe(prices[prices$gc == 1, ])







