

PlotNetwork = function() {
  
  edges = paste0("'", Employee$Manager.Name, "' -> '", Employee$Employee.Name, "'")
  edges_string <- paste(edges, collapse = " ")
  
  # 2. Build the DOT graph
  grViz(paste0("
  digraph G {
    # Global settings for a top-down tree
    graph [layout = dot, rankdir = TB]
    
    # Node style
    node [shape = box, style = filled, fillcolor = White, fontname = Helvetica]
    
    # Edge style (Arrows)
    edge [color = Grey, arrowhead = normal, arrowsize = 0.8]

    # The actual Employeehips
    ", edges_string, "
  }
  "))
  
  
} 

GetReportingHierarchy = function(i) {
  call_count <<- call_count + 1 # Update global counter
  if ( Employee$ReportingHierarchy[i] != "" ) return(Employee$ReportingHierarchy[i])
  
  if ( Employee$Manager.Name[i] == "" ) {
    return(Employee$Employee.Name[i])
  } else {
    k = which(Employee$Employee.Name == Employee$Manager.Name[i])
    return( paste0(GetReportingHierarchy(k)," > ",Employee$Employee.Name[i]) )
  }
}

