library(knitr)
library(fs)
library(tidyverse)

slides_qmds <-
  dir_ls(
    regexp = ".qmd"
  )

purl_slides_qmd <- function(input_qmd) {
  output_r_file <- str_replace(input_qmd, "qmd", "R")
  output_r_file <- str_remove(output_r_file, "slides-")
  output_r_file <- str_glue("code/{output_r_file}")

  purl(
    input = input_qmd,
    output = output_r_file
  )
}

walk(slides_qmds, purl_slides_qmd)

r_files <-
  dir_ls(
    path = "code"
  )


clean_r_script <- function(file_path) {
  script_content <- readr::read_lines(file_path) |>
    tibble::as_tibble() |>
    # Remove separators, chunk options, and comment-only lines
    dplyr::filter(
      !stringr::str_detect(value, "^## -{10,}$"),
      !stringr::str_detect(value, "^#\\| .*:.*"),
      !stringr::str_detect(value, "^\\s*#")
    ) |>
    # Mark empty lines
    dplyr::mutate(
      is_empty = stringr::str_detect(value, "^\\s*$")
    ) |>
    # Remove consecutive empty lines
    dplyr::filter(
      !is_empty | (is_empty & !dplyr::lead(is_empty, default = FALSE))
    ) |>
    # Get just the content
    dplyr::pull(value)

  # Write back to file
  readr::write_lines(script_content, file_path)
}

walk(r_files, clean_r_script)
