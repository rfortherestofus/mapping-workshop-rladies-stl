library(sf)

africa <-
  read_sf(
    "https://raw.githubusercontent.com/rfortherestofus/mapping-with-r-v2/refs/heads/main/data/africa.geojson"
  )

library(tidyverse)

ggplot() +
  geom_sf(data = africa)
