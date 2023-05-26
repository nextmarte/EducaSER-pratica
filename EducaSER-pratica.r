
library(readxl)
library(leaflet)

 coordenadas<- read.csv("https://raw.githubusercontent.com/nextmarte/Educaser-Maps/main/dados/tabela_cintra.csv")

# class(coordenadas)

coordenadas$Lon <- -1*coordenadas$Lon
coordenadas$Lat <- -1*coordenadas$Lat


latitudes <- unique(coordenadas$Lat)
longitude <- unique(coordenadas$Lon)
# Criar um mapa com base nos dados das Capitanias Hereditárias
mapa <- leaflet(coordenadas) %>%
  addTiles() %>%
  setView(lng = -45, lat = -15, zoom = 4)  # Configurar a visualização inicial do mapa

mapa

# Adicionar marcadores para cada Capitania Hereditária
mapa <- mapa %>%
  addMarkers(
    lng = ~Lon,
    lat = ~Lat,
    label = ~DONATARIO,
    popup = ~CAPITANIA
    
  )


mapa

# Adicionar linhas latitudinais
# for (lat in latitudes) {
#   for(lng in longitude){
#   mapa <- mapa %>%
#     addPolylines(
#       data = NULL,
#       lng = c(-48.7,lng),  # Longitude para traçar a linha latitudinal
#       lat = c(lat,lat),  # Latitudes para traçar a linha latitudinal
#       color = "red",
#       weight = 2
#     )
# }
# }
# mapa
# Exibir o mapa



mapa <- mapa %>%
  addPolygons(
    data = coordenadas,
    lng = ~Lon,
    lat = ~Lat,
    fillColor = "green",
    fillOpacity = 0.2,
    stroke = TRUE,
    color = "red",
    weight = 1
  )

mapa

# 
# # Adicionar polígonos para delimitar cada Capitania Hereditária
# for (i in 1:nrow(coordenadas)) {
#   if (i >= 8) {  # A partir de Itamaracá
#     mapa <- mapa %>%
#       addPolygons(
#         data = coordenadas[i, ],
#         lng = ~Lon,
#         lat = ~Lat,
#         fillColor = "blue",
#         fillOpacity = 0.3,
#         stroke = TRUE,
#         color = "black",
#         weight = 1
#       )
#   }
# }
# 
# mapa
# ...
# (Código posterior)


