library(sf)
library(tidyverse)

city_council_districts <-
  read_sf("data/Portland_City_Council_Districts.shp")

ggplot() +
  geom_sf(data = city_council_districts)

city_council_districts_v2 <-
  read_sf("data/portland_city_council_districts.geojson")

ggplot() +
  geom_sf(data = city_council_districts_v2)

portland_sextants <-
  read_sf("data/portland_sextants.geojson")

portland_sextants
