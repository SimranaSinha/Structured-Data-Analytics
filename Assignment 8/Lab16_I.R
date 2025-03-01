# Lab 16_Question I

# Read the CSV file
df <- read.csv("countries.csv")

# Define UI 
ui <- fluidPage(
  titlePanel("Country Data"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "country",
        label = "Countries",
        choices = df$Country,
        selected = "China",
        multiple = FALSE
      )
    ),
    mainPanel(
      plotOutput("countryPlot", width = "800px", height = "600px")
    )
  )
)

# Define server 
server <- function(input, output) {
  output$countryPlot <- renderPlot({
    plot(
      df$Population, df$GDP_per_capita,
      log = "xy",  # Use logarithmic scale
      col = ifelse(df$Country == input$country, "red", "black"),
      pch = 16,
      cex = 1.2,
      xlab = "Population",
      ylab = "Per Capita GDP",
      main = "Population and GDP"
    )
    grid()
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
