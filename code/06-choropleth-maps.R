library(tidyverse)
library(tidycensus)
library(janitor)
library(tigris)

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

speak_language_other_than_english |>
  shift_geometry() |>
  ggplot() +
  geom_sf(aes(fill = pct)) +
  theme_void() +
  scale_fill_viridis_c()

speak_language_other_than_english |>
  shift_geometry() |>
  ggplot() +
  geom_sf(
    aes(
      fill = pct,
      color = pct
    )
  ) +
  scale_fill_viridis_c(limits = c(0, 1)) +
  scale_color_viridis_c(limits = c(0, 1)) +
  theme_void()

speak_language_other_than_english |>
  shift_geometry() |>
  ggplot() +
  geom_sf(
    aes(
      fill = pct,
      color = pct
    )
  ) +
  scale_fill_viridis_c(limits = c(0, 1)) +
  scale_color_viridis_c(limits = c(0, 1)) +
  labs(
    color = NULL,
    fill = NULL
  ) +
  theme_void() +
  theme(
    legend.position = "top",
    legend.key.width = unit(2, "cm"),
    legend.key.height = unit(0.5, "cm")
  )

library(scales)

speak_language_other_than_english |>
  shift_geometry() |>
  ggplot() +
  geom_sf(
    aes(
      fill = pct,
      color = pct
    )
  ) +
  scale_fill_viridis_c(
    limits = c(0, 1),
    labels = percent_format()
  ) +
  scale_color_viridis_c(
    limits = c(0, 1),
    labels = percent_format()
  ) +
  labs(
    color = NULL,
    fill = NULL,
    title = "Percentage of People Who Speak a Language\nOther than English in Each County in the United States"
  ) +
  theme_void() +
  theme(
    legend.position = "top",
    legend.key.width = unit(2, "cm"),
    legend.key.height = unit(0.5, "cm"),
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16,
      margin = margin(
        b = 0.25,
        unit = "cm"
      )
    )
  )

