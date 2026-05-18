
# set snippet ----
# Use Ctrl+Shift+k to Compile Report from R Script
# usethis::edit_rstudio_snippets()
# Ctrl+Shift-P - Show Command Palette
# Ctrl+Alt-T - execute Section
rstudiotools::setcwd()
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
rstudiotools::showinfo()

rstudiotools::displaymedia()

sales = read.csv("coffee_shop_sales.csv")
sales$date = as.Date(sales$date, format="%Y-%m-%d")
sales$order_id = NULL
sales$quantity = NULL
sales$product = NULL
# what's the time range
print(paste("Time range:", min(sales$date), "to", max(sales$date)))
#how many stores
unique(sales$store)

# Create a Year-Month string (e.g., "2024-01")
sales$month = format(sales$date, "%Y-%m")

# Aggregate
monthly_sales = aggregate(sales ~ month + store,data = sales,FUN = sum)

ggplot(monthly_sales, aes(x = month, y = sales, color = store, group = store)) +
  geom_line(linewidth = 1) +
  geom_point() + # Adds dots to the data points for better visibility
  theme_minimal() +
  labs(title = "Monthly Sales by Store",
       x = "Month",
       y = "Total Sales") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Tilts labels so they don't overlap


monthly_sales = monthly_sales %>%
  # 1. Arrange by store and month so the 'previous' row is actually the previous month
  dplyr::arrange(store, month) %>%
  # 2. Group by store so the calculation resets for each location
  dplyr::group_by(store) %>%
  # 3. Subtract the previous row (lag) from the current row
  dplyr::mutate(sales_diff = sales - lag(sales)) %>%
  dplyr::ungroup()





