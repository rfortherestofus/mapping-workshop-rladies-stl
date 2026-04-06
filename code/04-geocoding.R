library(sf)

library(tidyverse)

famous_places <-
  tribble(
    ~building                                                      ,
    ~address                                                       ,
    "White House"                                                  ,
    "1600 Pennsylvania Ave NW, Washington, DC 20500 United States" ,
    "Empire State Building"                                        ,
    "350 5th Ave, New York, NY 10118, USA"
  )

library(tidygeocoder)

famous_places |>
  geocode(address)

famous_places_sf <-
  famous_places |>
  geocode(address) |>
  st_as_sf(
    coords = c("long", "lat"),
    crs = 4326
  )

famous_places_sf

famous_places_sf |>
  mapview::mapview()

us_and_uk_head_residences <-
  tribble(
    ~building                                                      ,
    ~address                                                       ,
    "White House"                                                  ,
    "1600 Pennsylvania Ave NW, Washington, DC 20500 United States" ,
    "Number 10"                                                    ,
    "10 Downing St, London SW1A 2AA, United Kingdom"
  )

us_and_uk_head_residences

us_and_uk_head_residences |>
  geocode(address)

us_and_uk_head_residences |>
  geocode(
    address,
    method = "iq"
  )

us_and_uk_head_residences_v2 <-
  tribble(
    ~building                  ,
    ~address                   ,
    ~city                      ,
    ~state                     ,
    ~postal_code               ,
    ~country                   ,
    "White House"              ,
    "1600 Pennsylvania Ave NW" ,
    "Washington"               ,
    "DC"                       ,
    "20500"                    ,
    "United States"            ,
    "Number 10"                ,
    "10 Downing St"            ,
    "London"                   ,
    NA                         ,
    "SW1A 2AA"                 ,
    "United Kingdom"
  )

us_and_uk_head_residences_v2

us_and_uk_head_residences_v2 |>
  geocode(
    street = address,
    city = city,
    state = state,
    postalcode = postal_code,
    country = country
  )

us_and_uk_head_residences_v2 |>
  geocode(
    street = address,
    city = city,
    state = state,
    postalcode = postal_code,
    country = country,
    method = "iq"
  )

