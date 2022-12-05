library(readr)
library(glue)
library(dplyr)

data <- readr::read_delim("data/2022_day02", col_names = FALSE, col_types = "c") %>%
  dplyr::rename(opponent = X1, player = X2) %>%
  dplyr::mutate(
    result = dplyr::case_when(
      opponent == "A" & player == "X" ~ 3,
      opponent == "A" & player == "Y" ~ 6,
      opponent == "A" & player == "Z" ~ 0,
      opponent == "B" & player == "X" ~ 0,
      opponent == "B" & player == "Y" ~ 3,
      opponent == "B" & player == "Z" ~ 6,
      opponent == "C" & player == "X" ~ 6,
      opponent == "C" & player == "Y" ~ 0,
      opponent == "C" & player == "Z" ~ 3
    ) + dplyr::case_when(
      player == "X" ~ 1,
      player == "Y" ~ 2,
      player == "Z" ~ 3
    ),
    result2 = dplyr::case_when(
      opponent == "A" & player == "X" ~ 0 + 3,
      opponent == "A" & player == "Y" ~ 3 + 1,
      opponent == "A" & player == "Z" ~ 6 + 2,
      opponent == "B" & player == "X" ~ 0 + 1,
      opponent == "B" & player == "Y" ~ 3 + 2,
      opponent == "B" & player == "Z" ~ 6 + 3,
      opponent == "C" & player == "X" ~ 0 + 2,
      opponent == "C" & player == "Y" ~ 3 + 3,
      opponent == "C" & player == "Z" ~ 6 + 1 
    )
  )


part1 <- sum(data$result)

part2 <- sum(data$result2)

glue::glue(
  "Part1: {part1}
   Part2: {part2}"
)
