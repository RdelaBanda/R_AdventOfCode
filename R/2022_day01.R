library(readr)
library(glue)

data <- as.integer(readr::read_lines("data/2022_day01"))

item <- c(0, which(is.na(data)))

elves <- vector(mode = "list", length = length(item))

for (i in seq_along(item)) {
  tmp <- ifelse(i == length(item), length(data), item[i + 1] - 1)
  elves[[i]] <- data[(item[i] + 1):tmp]
}

cal <- sapply(elves, sum)

part1 <- max(cal)

part2 <- sum(tail(sort(cal), 3))

glue::glue(
  "Part1: {part1}
   Part2: {part2}"
)
