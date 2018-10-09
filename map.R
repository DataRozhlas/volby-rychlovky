# mapa nadpolovičních


library(leaflet)
library(googleway)



nad50 <- read_csv("nad50.csv") %>%
  select(obec=Obec, NUMNUTS=Okres, obyvatel=Obyvatel, strana=Strana, pct=Procent) %>%
  left_join(nuts18) %>%
  select(obec, okres=NAZEVNUTS, obyvatel, strana, pct)

results <- data.frame(lat=numeric, lng=numeric())

for (i in 1:nrow(nad50)) {
  result <- google_geocode(paste0(nad50[i,1], ",", nad50[i,2], ", ", "Czechia"), key = "AIzaSyCaa6-1gRMSIS_9Pn8EWSkUsJy3SZDcSa0")
  result <- result$results$geometry$location
  results <- rbind(results, result)
  print(result)
}

nad50 <- cbind(nad50, results)

nad50$popup <- paste0(nad50$obec, ", " , nad50$strana, " volilo ", nad50$pct, " %")

nad50$radius <- sqrt(nad50$obyvatel/pi)

m <- leaflet(data=nad50) %>%
#  setView(lng = 15.337, lat = 49.742, zoom = 7) %>%
  addTiles("https://interaktivni.rozhlas.cz/tiles/ton_b1/{z}/{x}/{y}.png") %>%
  addTiles("https://interaktivni.rozhlas.cz/tiles/ton_l2/{z}/{x}/{y}.png") %>%
  addCircleMarkers(
    ~lng,
    ~lat,
    label = ~popup,
    radius= ~radius/5,
    color= "red",
    stroke = F,
    fillOpacity = 0.5
  )

m


