library(readr)
library(dplyr)
library(glue)

data <- readr::read_csv("data/2022_day04", col_names = FALSE, col_types = "c") %>%
  dplyr::rowwise(.) %>%
  dplyr::mutate(
    x1 = list(eval(parse(text = gsub("-", ":", X1)))),
    x2 = list(eval(parse(text = gsub("-", ":", X2)))),
    full = all(x1 %in% x2) | all(x2 %in% x1),
    sec = any(x1 %in% x2)
  )

part1 <- data %>%
  dplyr::pull(full) %>%
  sum()

part2 <- data %>%
  dplyr::pull(sec) %>%
  sum()

glue::glue(
  "Part1: {part1}
   Part2: {part2}"
)
