library(readr)

priority <- function(x) {
  which(c(letters, LETTERS) == x)
}

data <- strsplit(readr::read_lines("data/2022_day03"), "")

part1 <- sum(sapply(data, function(x) {
  temp <- matrix(x, ncol = 2, byrow = FALSE)
  priority(unique(temp[temp[, 1] %in% temp[, 2], 1]))
}))

n <- rep(0, length(data))

for(i in seq(1, length(data), 3)){
  uni <- unique(data[[i]][data[[i]]%in%data[[i+1]]])
  n[i] <- priority(unique(uni[uni%in%data[[i+2]]]))
}

part2 <- sum(n)

glue::glue(
  "Part1: {part1}
   Part2: {part2}"
)
