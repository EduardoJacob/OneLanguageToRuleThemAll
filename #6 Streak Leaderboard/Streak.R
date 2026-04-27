
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
streaks$streak = 1

# sort streaks by user_name and date no duplicates
streaks = streaks[order(streaks$user_name, streaks$date),]
streaks = unique(streaks)

start_time = Sys.time()
for ( i in 2:nrow(streaks) ) {
  if ( streaks$user_name[i] == streaks$user_name[i-1] && 
       streaks$date[i] - streaks$date[i-1] == 1 ) streaks$streak[i] = streaks$streak[i-1] + 1
}
end_time = Sys.time()

user_max_streaks = streaks %>%
  dplyr::group_by(user_name) %>%
  dplyr::summarize(max_streak = max(streak, na.rm = TRUE))






