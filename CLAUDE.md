# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an R-based solutions library for data engineering and analytics challenges from Maven Analytics' "Data Drill Showdowns" YouTube playlist. The repository contains 9 projects covering various technical skills including recursive logic, data modeling, time-series analysis, JSON parsing, and visualization.

## Architecture

### Project Structure
```
OneLanguageToRuleThemAll/
├── #1 Org Chart Overhaul/         # Recursive hierarchies, org charts
│   ├── OrgChart.R                 # Main script
│   └── OrgChartFunctions.R        # PlotNetwork(), GetReportingHierarchy()
├── #2 Flatten the Stack/           # JSON parsing and flattening
│   └── FlattenStack.R             # Main script
├── #3 Rolling Up Looking Back/     # Time-series, month-over-month analysis
│   └── RollingUp.R                # Main script
├── #4 Spot the Sale/               # Date range joins (promotions)
│   └── Spot.R                     # Main script
├── #5 Movie Metrics/               # Activity aggregation, feature engineering
│   └── MovieMetrics.R             # Main script
├── #6 Streak Leaderboard/          # Streak tracking algorithms
│   └── Streak.R                   # Main script (LessonStreaks.csv data)
├── #7 Turning Bullish/             # Moving averages, golden cross detection
│   ├── StockMarket.R              # Main script (SPY_close_price_5Y.csv data)
│   └── StockMarketFunctions.R     # PlotPrices()
├── #8 Splitting the Field/         # Multi-value field aggregation
│   └── Splitting_the_Field.R      # Main script
├── #9 The Price is Right/          # Slowly Changing Dimensions (SCD)
│   └── PriceHistory.R             # Main script
├── README.md                      # Project documentation
├── Setup.R                        # Common setup code
└── Images/                        # Solution screenshots
```

### Common Script Pattern

Each project script follows this standard structure:

1. **Setup section** (lines 2-22):
   - Clear workspace: `rm(list=ls())`, `gc()`, console clear
   - Load `xfunctions` package for library management
   - Display media with `minifunctions::displaymedia()`

2. **Data loading** (project-specific):
   - Read CSV files into data frames
   - Parse dates with `as.Date()`

3. **Analysis logic** (problem-specific):
   - Data transformation, aggregation, or recursive computation

4. **Visualization** (project-specific):
   - ggplot2 charts or grViz diagrams

5. **Results display**:
   - `minifunctions::printdataframe()` for data frames
   - Media images for visual outputs

### Key Packages Used

- **dplyr**: Data manipulation (arrange, group_by, mutate, summarize)
- **jsonlite**: JSON parsing (`fromJSON()`, `prettify()`)
- **zoo**: Rolling calculations (`rollmeanr()`)
- **ggplot2**: Visualization (geom_line, geom_point, geom_rect)
- **grViz/DiagrammeR**: Graph visualization for org charts
- **stringr**: String operations (`str_count`, `strsplit`)
- **xfunctions**: Custom library management wrapper

### Recursive Functions

The Org Chart project demonstrates recursive logic via `GetReportingHierarchy()` which builds reporting hierarchies by recursively traversing manager-employee relationships. The function uses a global counter `call_count` to track recursion depth.

### Data Drill Context

Each project corresponds to a specific problem from Maven Analytics' Data Drill series:
- Problems are documented in README.md with YouTube links
- Solution screenshots are in the Images/ folder
- CSV data files are included in each project directory

## Development Workflow

### Running a Project

1. Open the project's R script (e.g., `#6 Streak Leaderboard/Streak.R`)
2. In RStudio: Ctrl+Shift+K to compile from script
3. Or source the file: `source("Streak.R")`

### Common Commands

- **Clear workspace**: `rm(list=ls())`
- **Clear console**: `cat("\014")` or Ctrl+L
- **Show package info**: `xfunctions::XShowInfo()`
- **Display media**: `minifunctions::displaymedia()`

### Package Installation

When new packages are needed, use the commented-out installation blocks:
```r
# devtools::install_github("author_name/package_name", 
#                          build_vignettes = TRUE, 
#                          dependencies = TRUE)
```

## Important Notes

- All scripts start with workspace clearing (`rm(list=ls())`) for reproducible runs
- `.Rproj.user` is gitignored to prevent RStudio session state from being committed
- CSV data files are included in each project directory
- The `xfunctions` package provides a wrapper for managing external libraries
- Media images (PNG) are used to display solutions alongside code
