


PlotPrices = function() {
  
  # 1. Reshape the data from wide to long format
  prices_long <- prices %>%
    pivot_longer(
      cols = c(Close, ma_50, ma_200), 
      names_to = "Metric", 
      values_to = "Price"
    )
  
  # 2. Create the plot
  ggplot(prices_long, aes(x = Date, y = Price, color = Metric)) +
    geom_line(size = 1) +
    labs(
      title = "Stock Prices and Moving Averages",
      x = "Date",
      y = "Price (USD)",
      color = "Legend"
    ) +
    theme_minimal() +
    scale_color_manual(values = c("Close" = "black", "ma_50" = "red", "ma_200" = "blue"))
  
  
}

 
