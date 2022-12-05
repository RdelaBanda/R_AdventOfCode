data <- readr::read_lines("data/2022_day01") %>%
  as.double(.)

splits <- c(which(is.na(data)), length(data))
res <- vector(mode = "list", length = length(splits))

start <- 1

for (i in seq_len(length(splits))) {
  res[i] <- sum(data[start:(splits[i] - 1)])
  start <- splits[i] + 1
}

res <- unlist(res)

part1 <- max(res)

part2 <- sum(head(res, 3))

glue::glue(
  "Part1: {part1}
   Part2: {part2}"
)
