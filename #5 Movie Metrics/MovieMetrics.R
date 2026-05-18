
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

users = read.csv("users.csv")
activity = read.csv("activity.csv")
activity$id = NULL

users$first_date = ""
users$first_name = ""
users$last_date = ""
users$last_name = ""
users$started = 0
users$finished = 0

# activity is already sorted by date, so we can just loop through it and update the users data frame
for (i in 1:nrow(users)) {
  # i = 1
  users$first_date[i] = subset(activity,user_id == users$id[i] & finished == 1,select = date,drop = T)[1]
  users$first_name[i] = subset(activity,user_id == users$id[i] & finished == 1,select = movie_name,drop = T)[1]
  
  users$last_date[i]  = tail( subset(activity,user_id == users$id[i] & finished == 1,select = date,drop = T) ,1)
  users$last_name[i]  = tail( subset(activity,user_id == users$id[i] & finished == 1,select = movie_name,drop = T) ,1)
  
  users$started[i]    = nrow( subset(activity,user_id == users$id[i]) )
  users$finished[i]   = nrow( subset(activity,user_id == users$id[i] & finished == 1) )
}













