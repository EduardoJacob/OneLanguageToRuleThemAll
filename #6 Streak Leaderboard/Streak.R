
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

minifunctions::displaymedia()
streaks = read.csv("LessonStreaks.csv")

# How many users
length(unique(streaks$user_id))
# How many user_names
length(unique(streaks$user_name))

# id and lesson_id doesn't count for streaks, so we can ignore those columns
streaks$id = NULL
streaks$lesson_id = NULL
# We can also ignore user_id since there are no repeated user names
streaks$user_id = NULL
streaks$date = as.Date(streaks$date)

users = data.frame(user_name = unique(streaks$user_name), streak = 0)

for ( i in 1:nrow(users) ) {
  # i = 383
  dates = unique( subset(streaks, user_name == users$user_name[i],select=date) )
  dates$streak = 1
  if ( nrow(dates) > 1 ) {
    for ( j in 2:nrow(dates) ) if ( dates$date[j] - dates$date[j-1] == 1 ) dates$streak[j] = dates$streak[j-1] + 1
  }
  users$streak[i] = max(dates$streak)
  cat(i,"User",users$user_name[i],"has a max streak of",users$streak[i],"\n")
}








