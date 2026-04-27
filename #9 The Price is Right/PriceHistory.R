
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

# Problem: https://www.youtube.com/watch?v=qQ51wuIgM7E
minifunctions::displaymedia()

price_history = read.csv("price_history.csv")
unique(price_history$effective_date)

products = read.csv("products.csv")
transactions = read.csv("transactions.csv")

products$current_price = NULL
transactions$order_detail_id = NULL
transactions$order_id = NULL
transactions$price = 0

for (i in 1:nrow(transactions)) {
  # i = 1
  price = subset(price_history,
      pizza_id == transactions$pizza_id[i] & 
      effective_date <= transactions$order_date[i], 
      select = c(price), drop=T )
  
  transactions$price[i] = tail(price,1)
}

total = sum(transactions$price * transactions$quantity)








