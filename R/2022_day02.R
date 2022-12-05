library(readr)
library(glue)

data <- readr::read_lines("data/2022_day02") %>% table(.)

part1_comb <- data.frame(AX = 4, AY = 8, AZ = 3, BX = 1, BY = 5, BZ = 9, CX = 7, CY = 2, CZ = 6)

part1 <- sum(data * c(4, 8, 3, 1, 5, 9, 7, 2, 6))

part1_comb <- data.frame(AX = 3, AY = 4, AZ = 8, BX = 1, BY = 5, BZ = 9, CX = 2, CY = 6, CZ = 7)

part2 <- sum(data * c(3, 4, 8, 1, 5, 9, 2, 6, 7))

glue::glue(
  "Part1: {part1}
   Part2: {part2}"
)
