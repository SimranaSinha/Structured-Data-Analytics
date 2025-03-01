#Lab16_Problem GENAI

# Load and preprocess the data
sales_data <- read.csv("sales_data.txt")

# Load necessary libraries
library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(lubridate)
library(DT)

# UI
ui <- dashboardPage(
  dashboardHeader(title = "Sales Data Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Product Category", tabName = "category", icon = icon("tag")),
      menuItem("Date Range", tabName = "date", icon = icon("calendar"))
    )
  ),
  dashboardBody(
    tabItems(
      # Overview Tab
      tabItem(tabName = "overview",
              fluidRow(
                valueBoxOutput("total_sales_box", width = 4),
                valueBoxOutput("total_profit_box", width = 4),
                valueBoxOutput("avg_sales_box", width = 4)
              ),
              fluidRow(
                box(
                  title = "Overall Sales by Category",
                  status = "primary",
                  solidHeader = TRUE,
                  plotOutput("overview_category_plot", height = 250)
                ),
                box(
                  title = "Daily Sales Trend",
                  status = "primary",
                  solidHeader = TRUE,
                  plotOutput("overview_daily_trend", height = 250)
                )
              ),
              fluidRow(
                box(
                  title = "Sales Data Table",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  DTOutput("overview_table")
                )
              )
      ),
      
      # Product Category Tab
      tabItem(tabName = "category",
              fluidRow(
                box(
                  title = "Filter by Category",
                  status = "primary",
                  solidHeader = TRUE,
                  selectInput("category_filter", "Select Product Category:",
                              choices = NULL, selected = NULL)
                )
              ),
              fluidRow(
                valueBoxOutput("category_sales_box", width = 6),
                valueBoxOutput("category_profit_box", width = 6)
              ),
              fluidRow(
                box(
                  title = "Top 5 Products by Sales",
                  status = "primary",
                  solidHeader = TRUE,
                  plotOutput("top_products_plot", height = 300)
                ),
                box(
                  title = "Sales by Subcategory",
                  status = "primary",
                  solidHeader = TRUE,
                  plotOutput("subcategory_plot", height = 300)
                )
              )
      ),
      
      # Date Range Tab
      tabItem(tabName = "date",
              fluidRow(
                box(
                  title = "Select Date Range",
                  status = "primary",
                  solidHeader = TRUE,
                  dateRangeInput("date_range", "Date Range:",
                                 start = NULL, end = NULL)
                )
              ),
              fluidRow(
                valueBoxOutput("date_sales_box", width = 6),
                valueBoxOutput("date_profit_box", width = 6)
              ),
              fluidRow(
                box(
                  title = "Daily Sales and Profit Trend",
                  status = "primary",
                  solidHeader = TRUE,
                  plotOutput("date_trend_plot", height = 300)
                ),
                box(
                  title = "Sales by Category for Selected Period",
                  status = "primary",
                  solidHeader = TRUE,
                  plotOutput("date_category_plot", height = 300)
                )
              )
      )
    )
  )
)

# Server
server <- function(input, output, session) {
  # Load and preprocess data
  sales_data <- reactive({
    # For demo purposes, using textConnection to read the data
    data_text <- '
"Order ID","Product Category","Product Subcategory","Sales","Profit","Date"
"CA-1234","Electronics","Smartphones",100,20,"2022-01-01"
"CA-1235","Fashion","Clothing",50,10,"2022-01-02"
"CA-1236","Home Goods","Kitchenware",200,40,"2022-01-03"
"CA-1237","Electronics","Laptops",300,60,"2022-01-04"
"CA-1238","Fashion","Shoes",150,30,"2022-01-05"
"CA-1239","Home Goods","Furniture",400,80,"2022-01-06"
"CA-1240","Electronics","Tablets",250,50,"2022-01-07"
"CA-1241","Fashion","Accessories",75,15,"2022-01-08"
"CA-1242","Home Goods","Decor",175,35,"2022-01-09"
"CA-1243","Electronics","Smartwatches",120,24,"2022-01-10"
"CA-1244","Fashion","Bags",90,18,"2022-01-11"
"CA-1245","Home Goods","Textiles",220,44,"2022-01-12"
'

data <- read.csv(text = data_text, stringsAsFactors = FALSE)

# Convert date to proper format
data$Date <- as.Date(data$Date)

return(data)
  })
  
  # Initialize category dropdown
  observe({
    categories <- unique(sales_data()$Product.Category)
    updateSelectInput(session, "category_filter", choices = categories)
  })
  
  # Initialize date range
  observe({
    date_range <- range(sales_data()$Date)
    updateDateRangeInput(session, "date_range", 
                         start = date_range[1], 
                         end = date_range[2])
  })
  
  # OVERVIEW TAB OUTPUTS
  
  # Total Sales Box
  output$total_sales_box <- renderValueBox({
    total_sales <- sum(sales_data()$Sales)
    valueBox(
      paste0("$", format(total_sales, big.mark = ",")),
      "Total Sales",
      icon = icon("dollar-sign"),
      color = "green"
    )
  })
  
  # Total Profit Box
  output$total_profit_box <- renderValueBox({
    total_profit <- sum(sales_data()$Profit)
    valueBox(
      paste0("$", format(total_profit, big.mark = ",")),
      "Total Profit",
      icon = icon("chart-line"),
      color = "blue"
    )
  })
  
  # Average Sales Box
  output$avg_sales_box <- renderValueBox({
    unique_days <- length(unique(sales_data()$Date))
    avg_sales <- sum(sales_data()$Sales) / unique_days
    valueBox(
      paste0("$", format(round(avg_sales, 2), big.mark = ",")),
      "Avg. Sales per Day",
      icon = icon("calculator"),
      color = "purple"
    )
  })
  
  # Overview Category Plot
  output$overview_category_plot <- renderPlot({
    data <- sales_data() %>%
      group_by(Product.Category) %>%
      summarise(Sales = sum(Sales))
    
    ggplot(data, aes(x = reorder(Product.Category, -Sales), y = Sales, fill = Product.Category)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      labs(x = "Category", y = "Total Sales ($)") +
      theme(legend.position = "none", axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  # Overview Daily Trend
  output$overview_daily_trend <- renderPlot({
    data <- sales_data() %>%
      group_by(Date) %>%
      summarise(Sales = sum(Sales), Profit = sum(Profit))
    
    ggplot(data, aes(x = Date)) +
      geom_line(aes(y = Sales, color = "Sales"), size = 1) +
      geom_line(aes(y = Profit, color = "Profit"), size = 1) +
      scale_color_manual(values = c("Sales" = "blue", "Profit" = "red")) +
      theme_minimal() +
      labs(x = "Date", y = "Amount ($)", color = "Metric") +
      theme(legend.position = "bottom")
  })
  
  # Overview Table
  output$overview_table <- renderDT({
    datatable(sales_data(), options = list(pageLength = 5))
  })
  
  # CATEGORY TAB OUTPUTS
  
  # Filtered data by category
  filtered_category_data <- reactive({
    req(input$category_filter)
    sales_data() %>%
      filter(Product.Category == input$category_filter)
  })
  
  # Category Sales Box
  output$category_sales_box <- renderValueBox({
    req(input$category_filter)
    category_sales <- sum(filtered_category_data()$Sales)
    valueBox(
      paste0("$", format(category_sales, big.mark = ",")),
      paste("Total Sales for", input$category_filter),
      icon = icon("dollar-sign"),
      color = "green"
    )
  })
  
  # Category Profit Box
  output$category_profit_box <- renderValueBox({
    req(input$category_filter)
    category_profit <- sum(filtered_category_data()$Profit)
    valueBox(
      paste0("$", format(category_profit, big.mark = ",")),
      paste("Total Profit for", input$category_filter),
      icon = icon("chart-line"),
      color = "blue"
    )
  })
  
  # Top Products Plot
  output$top_products_plot <- renderPlot({
    req(input$category_filter)
    data <- filtered_category_data() %>%
      group_by(Product.Subcategory) %>%
      summarise(Sales = sum(Sales)) %>%
      arrange(desc(Sales)) %>%
      slice_head(n = 5)
    
    ggplot(data, aes(x = reorder(Product.Subcategory, -Sales), y = Sales, fill = Product.Subcategory)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      labs(x = "Product", y = "Total Sales ($)", title = paste("Top 5 Products in", input$category_filter)) +
      theme(legend.position = "none", axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  # Subcategory Plot
  output$subcategory_plot <- renderPlot({
    req(input$category_filter)
    data <- filtered_category_data() %>%
      group_by(Product.Subcategory) %>%
      summarise(Sales = sum(Sales), Profit = sum(Profit))
    
    ggplot(data, aes(x = Sales, y = Profit, color = Product.Subcategory)) +
      geom_point(size = 5, alpha = 0.7) +
      theme_minimal() +
      labs(x = "Sales ($)", y = "Profit ($)", color = "Subcategory") +
      theme(legend.position = "bottom")
  })
  
  # DATE RANGE TAB OUTPUTS
  
  # Filtered data by date range
  filtered_date_data <- reactive({
    req(input$date_range)
    sales_data() %>%
      filter(Date >= input$date_range[1] & Date <= input$date_range[2])
  })
  
  # Date Sales Box
  output$date_sales_box <- renderValueBox({
    req(input$date_range)
    date_sales <- sum(filtered_date_data()$Sales)
    valueBox(
      paste0("$", format(date_sales, big.mark = ",")),
      "Total Sales for Selected Period",
      icon = icon("dollar-sign"),
      color = "green"
    )
  })
  
  # Date Profit Box
  output$date_profit_box <- renderValueBox({
    req(input$date_range)
    date_profit <- sum(filtered_date_data()$Profit)
    valueBox(
      paste0("$", format(date_profit, big.mark = ",")),
      "Total Profit for Selected Period",
      icon = icon("chart-line"),
      color = "blue"
    )
  })
  
  # Date Trend Plot
  output$date_trend_plot <- renderPlot({
    req(input$date_range)
    data <- filtered_date_data() %>%
      group_by(Date) %>%
      summarise(Sales = sum(Sales), Profit = sum(Profit))
    
    ggplot(data, aes(x = Date)) +
      geom_line(aes(y = Sales, color = "Sales"), size = 1) +
      geom_point(aes(y = Sales, color = "Sales"), size = 3) +
      geom_line(aes(y = Profit, color = "Profit"), size = 1) +
      geom_point(aes(y = Profit, color = "Profit"), size = 3) +
      scale_color_manual(values = c("Sales" = "blue", "Profit" = "red")) +
      theme_minimal() +
      labs(x = "Date", y = "Amount ($)", color = "Metric") +
      theme(legend.position = "bottom")
  })
  
  # Date Category Plot
  output$date_category_plot <- renderPlot({
    req(input$date_range)
    data <- filtered_date_data() %>%
      group_by(Product.Category) %>%
      summarise(Sales = sum(Sales))
    
    ggplot(data, aes(x = "", y = Sales, fill = Product.Category)) +
      geom_bar(stat = "identity", width = 1) +
      coord_polar("y", start = 0) +
      theme_minimal() +
      labs(fill = "Category", title = "Sales by Category") +
      theme(axis.title = element_blank(),
            axis.text = element_blank(),
            axis.ticks = element_blank())
  })
}

# Run the application
shinyApp(ui = ui, server = server)