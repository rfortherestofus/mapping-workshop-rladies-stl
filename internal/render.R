library(quarto)
library(fs)
library(purrr)

dir_ls(path = ".", glob = "*.qmd") |>
  walk(quarto_render)
