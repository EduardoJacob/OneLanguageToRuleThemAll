
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

orders = read.csv("orders.csv")
orders$order_date = as.Date(orders$order_date, format="%Y-%m-%d")
orders$promo_id = ""

promotions = read.csv("promotions.csv")
promotions$start_date = as.Date(promotions$start_date, format="%Y-%m-%d")
promotions$end_date = as.Date(promotions$end_date,  format="%Y-%m-%d")

for ( i in 1:nrow(orders) ) {
  for ( j in 1:nrow(promotions) ) {
    if ( dplyr::between(orders$order_date[i],promotions$start_date[j],promotions$end_date[j]) ) orders$promo_id[i] = promotions$promo_id[j]
  }
}

# How many promotions ?
table(orders$promo_id)
 


# 1. Calculate the midpoint for label placement
promotions$midpoint <- promotions$start_date + (promotions$end_date - promotions$start_date) / 2

ggplot(promotions) +
  # 2. Use geom_rect to create bars that start at y=0 and go up to y=1
  geom_rect(aes(xmin = start_date, xmax = end_date, ymin = 0, ymax = 1), 
            fill = "steelblue", color = "white") +
  
  # 3. Add labels inside the bars at the midpoint
  geom_text(aes(x = midpoint, y = 0.5, label = promo_name), 
            color = "white", fontface = "bold", size = 3, angle = 90) + # Angle 90 if names are long
  
  theme_minimal() +
  # 4. Clean up the Y-axis so it doesn't look like a coordinate system
  scale_y_continuous(expand = c(0,0), limits = c(0, 1.2)) + 
  theme(axis.text.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()) +
  labs(title = "Promotion Timeline", x = "Date")




