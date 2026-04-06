library(tigris)
library(sf)
library(tidyverse)
library(janitor)

# https://data-msdis.opendata.arcgis.com/datasets/MSDIS::mo-hospitals/about

missouri_hospitals <-
  read_sf("dk/MO_Hospitals.geojson") |>
  clean_names() |>
  select(facility:total_beds) |>
  select(-phone)

missouri_hospitals |>
  write_sf("data/hospitals.geojson")

missouri_hospitals |>
  st_drop_geometry() |>
  write_csv("data/hospitals.csv")


missouri_counties <-
  counties(state = "MO")

missouri_counties |>
  mapview::mapview()
