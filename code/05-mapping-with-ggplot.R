options(tigris_use_cache = TRUE)

library(tidyverse)
library(tidycensus)
library(janitor)
library(sf)

load_variables(
  year = 2023,
  dataset = "acs5/subject",
  cache = TRUE
) |>
  filter(str_detect(name, "S1601"))

get_acs(
  geography = "county",
  variable = "S1601_C01_003",
  summary_var = "S1601_C01_001"
)

speak_language_other_than_english <-
  get_acs(
    geography = "county",
    variable = "S1601_C01_003",
    summary_var = "S1601_C01_001",
    geometry = TRUE
  ) |>
  clean_names() |>
  mutate(pct = estimate / summary_est) |>
  select(name, pct)

speak_language_other_than_english

speak_language_other_than_english |>
  ggplot() +
  geom_sf()

library(tigris)

speak_language_other_than_english |>
  shift_geometry() |>
  ggplot() +
  geom_sf()

speak_language_other_than_english |>
  shift_geometry() |>
  ggplot() +
  geom_sf(aes(fill = pct))

