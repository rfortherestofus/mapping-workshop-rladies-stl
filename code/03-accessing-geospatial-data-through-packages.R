library(tidycensus)

options(tigris_use_cache = TRUE)

library(rnaturalearth)

all_countries <-
  ne_countries(scale = "small")

library(mapview)

all_countries |>
  mapview()

africa <-
  ne_countries(continent = "Africa")

africa |>
  mapview()

ukraine <-
  ne_countries(country = "Ukraine")

ukraine |>
  mapview()

library(rgeoboundaries)

all_countries_v2 <-
  geoboundaries(adm_lvl = 0)

all_countries_v2 |>
  mapview()

ukraine_v2 <-
  geoboundaries(country = "Ukraine")

ukraine_v2 |>
  mapview()

geoboundaries(
  country = "Ukraine",
  adm_lvl = 1
) |>
  mapview()

geoboundaries(
  country = "Ukraine",
  adm_lvl = 2
) |>
  mapview()

library(tigris)

us_states <-
  states()

us_states

us_states |>
  mapview()

oregon_counties <-
  counties(state = "OR")

oregon_counties

oregon_counties |>
  mapview()

library(tidycensus)

acs_variables <-
  load_variables(
    year = 2023,
    dataset = "acs5",
    cache = TRUE
  )

median_household_income <-
  get_acs(
    geography = "county",
    state = "OR",
    variable = "B19013_001"
  )

median_household_income

median_household_income_sf <-
  get_acs(
    geography = "county",
    state = "OR",
    variable = "B19013_001",
    geometry = TRUE
  )

median_household_income_sf

median_household_income_sf |>
  mapview(zcol = "estimate")

