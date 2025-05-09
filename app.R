
library(shiny)
library(shinydashboard)
library(leaflet)
library(plotly)
library(DT)
library(shinyWidgets)
library(shinythemes)


ui <- navbarPage(
  title = "Discover Aruba",
  theme = shinytheme("flatly"),
  
  # Custom CSS for blue titles
  header = tags$head(
    tags$style(HTML("
      .blue-title {
        color: #0077b6;
        font-weight: bold;
        font-family: 'Montserrat', sans-serif;
        font-size: 32px;
      }
      .subtitle {
        color: #0077b6;
        font-family: 'Montserrat', sans-serif;
        font-size: 24px;
        font-weight: bold;
      }
    ")),
    tags$link(rel = "stylesheet",
              href = "https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap")
  ),
  
  # Home page
  tabPanel(
    "Home",
    fluidRow(
      column(12, align = "center",
             h1("Welcome to Aruba", class = "blue-title"),
             h3("One Happy Island", style = "font-style: italic;"),
             br(),
             img(src = "https://upload.wikimedia.org/wikipedia/commons/f/f6/Flag_of_Aruba.svg",
                 height = "120px", width = "180px"),
             br(), br()
      )
    ),
    fluidRow(
      column(8, offset = 2,
             wellPanel(
               h3("About Aruba", class = "subtitle"),
               p("Aruba is a small Caribbean island located just north of Venezuela.
                 Known for its pristine white beaches, crystal-clear turquoise waters,
                 and year-round sunny weather, Aruba is a popular destination for tourists
                 from around the world. The island is part of the ABC islands
                 (Aruba, Bonaire, and Curaçao) and is a constituent country of the Kingdom
                 of the Netherlands."),
               p("With its slogan 'One Happy Island,' Aruba prides itself on its friendly
                 locals, diverse culture, and laid-back atmosphere. The official languages
                 are Dutch and Papiamento, but English and Spanish are widely spoken.")
             ),
             br(),
             wellPanel(
               h3("Quick Facts", class = "subtitle"),
               tags$ul(
                 tags$li(strong("Capital:"), "Oranjestad"),
                 tags$li(strong("Population:"), "Approximately 107,000"),
                 tags$li(strong("Area:"), "180 km² (69 sq mi)"),
                 tags$li(strong("Currency:"), "Aruban Florin (AWG)"),
                 tags$li(strong("Time Zone:"), "AST (UTC-4)"),
                 tags$li(strong("Languages:"), "Dutch, Papiamento, English, Spanish"),
                 tags$li(strong("Government:"), "Parliamentary democracy within the Kingdom of the Netherlands")
               )
             )
      )
    )
  ),
  
  # Geography tab
  tabPanel(
    "Geography",
    fluidRow(
      column(12, align = "center",
             h2("Geography of Aruba", class = "blue-title"),
             br()
      )
    ),
    fluidRow(
      column(6,
             wellPanel(
               h3("Location & Terrain"),
               p("Aruba is located in the southern Caribbean Sea, about 29 kilometers north of Venezuela's
                 Paraguaná Peninsula. The island measures approximately 32 kilometers long and 10 kilometers
                 across at its widest point."),
               p("The terrain is mostly flat with a few hills. The highest point is Mount Jamanota,
                 which rises to 188 meters (617 feet) above sea level. The interior is arid and is home to
                 unique desert-like vegetation, including the iconic divi-divi trees and various cacti."),
               h4("Climate"),
               p("Aruba enjoys a tropical semi-arid climate with warm temperatures year-round, averaging
                 about 28°C (82°F). The island lies outside the hurricane belt, making it a safe destination
                 even during hurricane season. With less than 20 inches of rainfall annually, Aruba is one of
                 the driest islands in the Caribbean.")
             )
      ),
      column(6,
             leafletOutput("map", height = "400px"),
             br(),
             wellPanel(
               h3("Natural Features"),
               tags$ul(
                 tags$li(strong("Beaches:"), "Aruba is known for its white-sand beaches, primarily on the western and southern coasts."),
                 tags$li(strong("Arikok National Park:"), "Covers approximately 18% of the island."),
                 tags$li(strong("Natural Pool (Conchi):"), "A secluded natural swimming pool surrounded by rocks."),
                 tags$li(strong("Natural Bridge:"), "A coral limestone bridge, although the main one collapsed in 2005."),
                 tags$li(strong("Limestone Caves:"), "Including Guadirikiri, Fontein, and Huliba caves.")
               )
             )
      )
    )
  ),
  
  # Attractions tab
  tabPanel(
    "Attractions",
    fluidRow(
      column(12, align = "center",
             h2("Top Attractions in Aruba", class = "blue-title"),
             br()
      )
    ),
    fluidRow(
      column(12,
             tabsetPanel(
               tabPanel("Beaches",
                        fluidRow(
                          column(12, align = "center", h3("World-Famous Beaches")),
                          column(6,
                                 wellPanel(
                                   h4("Eagle Beach"),
                                   p("Often ranked as one of the best beaches in the world, Eagle Beach
                                     features soft white sand and crystal-clear waters. It's home to the
                                     iconic fofoti trees and is a nesting site for sea turtles."),
                                   h4("Palm Beach"),
                                   p("Known for its palm-lined two-mile strip, Palm Beach is where most
                                     high-rise hotels are located. It offers calm waters perfect for swimming
                                     and water sports.")
                                 ),
                                 wellPanel(
                                   h4("Photo: Eagle Beach", style = "background-color: #e9ecef; padding: 10px; text-align: center;"),
                                   div(style = "height: 270px; background-color: #dee2e6; display: flex; justify-content: center; align-items: center;",
                                       img(src = "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/82/8d/60/eagle-beach.jpg?w=900&h=500&s=1",
                                           height = "250px", width = "450px")) #photo from tripadvisor remember to refrence
                                 )
                          ),
                          column(6,
                                 wellPanel(
                                   h4("Baby Beach"),
                                   p("A shallow, crescent-shaped lagoon perfect for families with children
                                     and snorkelers. Located near San Nicolas on the southeastern end of the island."),
                                   h4("Arashi Beach"),
                                   p("Known for excellent snorkeling and less crowded atmosphere.
                                     Located on the northwestern tip of the island.")
                                 ),
                                 wellPanel(
                                   h4("Photo: Baby Beach", style = "background-color: #e9ecef; padding: 10px; text-align: center;"),
                                   div(style = "height: 270px; background-color: #dee2e6; display: flex; justify-content: center; align-items: center;",
                                       img(src = "https://aruba.bynder.com/m/44f629f5168b0108/tablet_landscape_horizontal_rectangle-Baby-Beach.jpg",
                                           height = "250px", width = "450px")) #from Aruba travel website
                                 )
                          )
                        )
               ),
               tabPanel("Natural Attractions",
                        fluidRow(
                          column(12, align = "center", h3("Natural Wonders")),
                          column(6,
                                 wellPanel(
                                   h4("Arikok National Park"),
                                   p("Covering nearly 20% of the island, the park features unique geological,
                                     cultural and historical sites. Visitors can explore caves with indigenous
                                     drawings, sand dunes, natural pools, and native flora and fauna."),
                                   h4("Natural Pool (Conchi)"),
                                   p("A natural swimming pool sheltered by rocks, accessible only by 4x4 vehicle,
                                     horseback, or hiking.")
                                 ),
                                 wellPanel(
                                   h4("Photo: Arikok National Park", style = "background-color: #e9ecef; padding: 10px; text-align: center;"),
                                   div(style = "height: 270px; background-color: #dee2e6; display: flex; justify-content: center; align-items: center;",
                                       img(src = "https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrUTYFa70XpGPvUJuL2Fr7Zd0cPys__6C3JWKu-z9sExrISYuYoQ_oavlc4bRnvQnMFmsEYcasrJbULJY56Q3eXXPIoGdw9cPzAwtrSsP4cqq_CBa0jO8YEr1u6-zRsHLHoK-Tu=w270-h312-n-k-no",
                                           height = "250px", width = "450px"))
                                 )
                          ),
                          column(6,
                                 wellPanel(
                                   h4("Casibari Rock Formations"),
                                   p("Large tonalite boulders mysteriously stacked on top of each other
                                     in the center of the island. Visitors can climb to the top for panoramic views."),
                                   h4("Ayo Rock Formations"),
                                   p("Ancient rock formations with petroglyphs from the island's original
                                     inhabitants, the Arawak people.")
                                 ),
                                 wellPanel(
                                   h4("Photo: Rock Formations", style = "background-color: #e9ecef; padding: 10px; text-align: center;"),
                                   div(style = "height: 270px; background-color: #dee2e6; display: flex; justify-content: center; align-items: center;",
                                       img(src = "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/0b/44/86/cool-easy-climb-with.jpg?w=700&h=400&s=1",
                                           height = "250px", width = "450px"))
                                 )
                          )
                        )
               ),
               tabPanel("Cultural Sites",
                        fluidRow(
                          column(12, align = "center", h3("Cultural Attractions")),
                          column(6,
                                 wellPanel(
                                   h4("Oranjestad"),
                                   p("The colorful capital city features Dutch colonial architecture,
                                     shopping districts, and historical sites."),
                                   h4("Alto Vista Chapel"),
                                   p("Known as the 'Pilgrim's Church,' this small yellow chapel was the
                                     island's first Catholic church, built in 1750.")
                                 ),
                                 wellPanel(
                                   h4("Photo: Oranjestad", style = "background-color: #e9ecef; padding: 10px; text-align: center;"),
                                   div(style = "height: 270px; background-color: #dee2e6; display: flex; justify-content: center; align-items: center;",
                                       img(src = "data:image/jpeg;base64,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",
                                           height = "250px", width = "450px"))
                                 )
                          ),
                          column(6,
                                 wellPanel(
                                   h4("California Lighthouse"),
                                   p("Named after the steamship California that sank nearby in 1891.
                                     Offers panoramic views of the coastline."),
                                   h4("Bushiribana Gold Mill Ruins"),
                                   p("Remnants of a gold smelter that processed ore during Aruba's
                                     19th-century gold rush.")
                                 ),
                                 wellPanel(
                                   h4("Photo: California Lighthouse", style = "background-color: #e9ecef; padding: 10px; text-align: center;"),
                                   div(style = "height: 270px; background-color: #dee2e6; display: flex; justify-content: center; align-items: center;",
                                       img(src = "https://aruba.bynder.com/m/421616480dea8497/tablet_landscape_horizontal_rectangle-California-Lighthouse-.jpg",
                                           height = "250px", width = "450px"))
                                 )
                          )
                        )
               )
             )
      )
    )
  ),
  
  # Culture tab
  tabPanel(
    "Culture",
    fluidRow(
      column(12, align = "center",
             h2("Culture & Heritage", class = "blue-title"),
             br()
      )
    ),
    fluidRow(
      column(6,
             wellPanel(
               h3("People & Language"),
               p("Aruba's population is a melting pot of over 90 nationalities. The island's indigenous
                 people were Arawak, but today's population reflects centuries of diverse influences."),
               p("While Dutch is the official language, most Arubans speak Papiamento, a creole language
                 that blends Spanish, Portuguese, Dutch, English, and African languages. English and Spanish
                 are also widely spoken, making communication easy for visitors.")
             ),
             wellPanel(
               h3("Festivals & Events"),
               tags$ul(
                 tags$li(strong("Carnival:"), "The biggest cultural event spanning January to March with
                         colorful parades, music, and festivities."),
                 tags$li(strong("Aruba Hi-Winds:"), "The Caribbean's largest amateur windsurfing event."),
                 tags$li(strong("Soul Beach Music Festival:"), "Held during Memorial Day weekend."),
                 tags$li(strong("Aruba International Film Festival:"), "Showcasing local and international cinema.")
               )
             )
      ),
      column(6,
             wellPanel(
               h3("Music & Arts"),
               p("Traditional Aruban music includes tumba, tambu, waltz, mazurka, and danza. During Carnival,
                 calypso and soca music dominate. The island also has a rich tradition of storytelling and dance."),
               p("Local artisans create unique pieces inspired by the island's natural beauty and cultural heritage.
                 Ceramics, glass art, and paintings featuring vibrant colors and local scenes are common.")
             ),
             wellPanel(
               h3("Cuisine"),
               p("Aruban cuisine reflects the island's diverse cultural influences, including Dutch, Spanish, African,
                 and indigenous flavors."),
               tags$ul(
                 tags$li(strong("Keshi Yena:"), "A stuffed cheese dish considered Aruba's national dish."),
                 tags$li(strong("Pastechi:"), "Fried pastry filled with cheese, meat, or seafood."),
                 tags$li(strong("Stobá:"), "A hearty stew that can be made with goat, beef, or chicken."),
                 tags$li(strong("Pan Bati:"), "A sweet cornbread often served with soups and stews."),
                 tags$li(strong("Seafood:"), "Fresh catches like mahi-mahi, red snapper, and Caribbean lobster.")
               )
             )
      )
    )
  ),
  
  # Economy tab
  tabPanel(
    "Economy",
    fluidRow(
      column(12, align = "center",
             h2("Economy & Tourism", class = "blue-title"),
             br()
      )
    ),
    fluidRow(
      column(6,
             wellPanel(
               h3("Economic Overview"),
               p("Aruba's economy is primarily driven by tourism, which accounts for approximately
                 75% of the island's GDP. Over 1 million visitors come to Aruba annually, mainly from
                 the United States, Canada, and Europe."),
               p("Other important sectors include financial services, oil refining (though the refinery
                 has operated intermittently in recent years), and aloe cultivation and export."),
               br(),
               h4("Quick Economic Facts"),
               tags$ul(
                 tags$li(strong("GDP per capita:"), "Among the highest in the Caribbean region"),
                 tags$li(strong("Currency:"), "Aruban Florin (AWG), pegged to the US dollar"),
                 tags$li(strong("Unemployment rate:"), "Historically low compared to other Caribbean nations"),
                 tags$li(strong("Major industries:"), "Tourism, banking, aloe production, transportation")
               ),
               br(),
               wellPanel(
                 h3("Tourism Infrastructure"),
                 p("Aruba has invested heavily in tourism infrastructure:"),
                 tags$ul(
                   tags$li(strong("Accommodations:"), "From luxury resorts to boutique hotels and vacation rentals"),
                   tags$li(strong("Queen Beatrix International Airport:"), "Modern facility with direct flights from major cities"),
                   tags$li(strong("Cruise Port:"), "State-of-the-art facilities in Oranjestad"),
                   tags$li(strong("Transportation:"), "Public buses, taxis, and car rentals available island-wide")
                 ),
                 p("The government has implemented sustainable tourism practices to preserve the island's
                 natural beauty while supporting economic growth.")
               )
             ),
             
      ),
      column(6,
             plotlyOutput("tourismPlot", height = "300px"),
             br(),
             plotlyOutput("gdpPlot", height = "300px"),
             br()
             
      )
    )
  ),
  
  # Contact/About
  tabPanel(
    "About",
    fluidRow(
      column(8, offset = 2,
             wellPanel(
               h3("About This Project", class = "subtitle"),
               p("This Shiny application was created as an educational project to introduce the
                 beautiful island of Aruba. The information presented is for MA415 at Boston University"),
               br(),
               h4("References:"),
               tags$ul(
                 tags$li(a("Aruba Official Tourism Website", href = "https://www.aruba.com", target = "_blank")),
                 tags$li(a("Aruba Central Bureau of Statistics", href = "https://cbs.aw/wp/", target = "_blank")),
                 tags$li(a("Tripadvisor", href = "https://www.tripadvisor.com/", target = "_blank"))
               ),
               br(),
               h4("Project Created By:"),
               p("Junhong Park"),
               p("For any questions or feedback: Jpark3@bu.edu")
             )
      )
    )
  )
)

# Define server
server <- function(input, output) {
  
  # Create map of Aruba
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = -69.968338, lat = 12.521110, zoom = 11) %>%
      addMarkers(lng = -69.968338, lat = 12.521110, popup = "Aruba") %>%
      addMarkers(lng = -70.03349595700254, lat = 12.52286871915119, popup = "Oranjestad (Capital)") %>%
      addMarkers(lng = -70.00786110432564, lat = 12.50415996976922, popup = "Queen Beatrix International Airport") %>%
      addMarkers(lng = -70.05491142376667, lat = 12.554936709853672, popup = "Eagle Beach") %>%
      addMarkers(lng = -70.04570202115049, lat = 12.574470557492736, popup = "Palm Beach") %>%
      addMarkers(lng = -70.05116154387959, lat = 12.614761621539962, popup = "California Lighthouse") %>%
      addMarkers(lng = -69.94789016003368, lat = 12.504370894964387, popup = "Arikok National Park") %>%
      addMarkers(lng = -69.88082253921063, lat = 12.41438249363139, popup = "Baby Beach")
  })
  
  # Create tourism chart
  output$tourismPlot <- renderPlotly({
    years <- 2015:2023
    tourists <- c(1.07, 1.11, 1.07, 1.08, 1.12, 0.38, 0.81, 1.09, 1.15)
    
    tourism_data <- data.frame(Year = years, Tourists = tourists)
    
    plot_ly(tourism_data, x = ~Year, y = ~Tourists, type = 'scatter', mode = 'lines+markers',
            line = list(color = '#0077b6', width = 3),
            marker = list(color = '#00a8e8', size = 8)) %>%
      layout(title = "Annual Tourist Arrivals (millions)",
             xaxis = list(title = "Year"),
             yaxis = list(title = "Tourists (millions)"))
  })
  
  # Create GDP chart
  output$gdpPlot <- renderPlotly({
    years <- 2015:2023
    gdp <- c(2.58, 2.67, 2.71, 2.85, 2.98, 1.85, 2.38, 2.91, 3.05)
    
    gdp_data <- data.frame(Year = years, GDP = gdp)
    
    plot_ly(gdp_data, x = ~Year, y = ~GDP, type = 'bar',
            marker = list(color = '#38b000')) %>%
      layout(title = "GDP (billions USD)",
             xaxis = list(title = "Year"),
             yaxis = list(title = "GDP (billions USD)"))
  })
  
  # Create GDP per capita chart
  output$gdpPerCapitaPlot <- renderPlotly({
    years <- 2015:2023
    # Population estimates in thousands
    population <- c(103.9, 104.8, 105.6, 106.3, 106.8, 107.2, 107.6, 108.0, 108.4)
    gdp <- c(2.58, 2.67, 2.71, 2.85, 2.98, 1.85, 2.38, 2.91, 3.05)
    
    
    gdp_per_capita <- (gdp * 1000) / population
    
    gdp_capita_data <- data.frame(Year = years, GDPPerCapita = gdp_per_capita)
    
    plot_ly(gdp_capita_data, x = ~Year, y = ~GDPPerCapita, type = 'scatter', mode = 'lines+markers',
            line = list(color = '#9d4edd', width = 3),
            marker = list(color = '#7b2cbf', size = 8)) %>%
      layout(title = "GDP Per Capita (thousands USD)",
             xaxis = list(title = "Year"),
             yaxis = list(title = "GDP Per Capita (thousands USD)"))
  })
}


shinyApp(ui = ui, server = server)