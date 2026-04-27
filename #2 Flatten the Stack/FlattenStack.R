
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
xfunctions::XLibrary("jsonlite")
# xfunctions::XFunctions("jsonlite")
help(package="jsonlite")
packageDescription("jsonlite")
# devtools::install_github("author_name/jsonlite", build_vignettes = TRUE, dependencies = TRUE)
# browseVignettes(package="jsonlite")
# vignette(package="jsonlite")
# vignette("vignette-name",package="jsonlite")
# https://cranlogs.r-pkg.org/badges/last-month/jsonlite
xfunctions::XShowInfo()

minifunctions::displaymedia()
sales = read.csv("sales_orders.csv")
sales$index = 1:nrow(sales)
 
# Print a Json value as example
cat(prettify(sales$line_items[1]))

line_items = data.frame()
for ( i in 1:nrow(sales) ) {
  # i = 1
  df = jsonlite::fromJSON(sales$line_items[i],flatten = TRUE)
  df = data.frame(
    index=i,
    line_item=1:nrow(df),
    product_name=df$product.product_name,
    product_price=df$product.product_price,
    quantity=df$quantity
  )
  
  line_items = rbind(line_items,df)
}
sales$line_items = NULL

# full join sales with line_items by index
sales_line_items = merge(sales, line_items, by = "index", all.x =T)
sales_line_items$index = NULL


