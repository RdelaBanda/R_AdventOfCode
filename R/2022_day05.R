library(readr)
library(glue)
library(dplyr)
library(stringr)
library(tibble)

input <- readLines("data/2022_day05")

data <- readr::read_lines("data/2022_day05")

move_pos <- grep("move", data)[1]

move_orders <- data[move_pos:length(data)]

crates_bottom <- max(
  as.integer(unlist(strsplit(data[move_pos - 2], ""))),
  na.rm = TRUE
)

crates <- dplyr::tibble(
  readr::read_fwf(
    file = "data/2022_day05",
    n_max = crates_bottom - 1,
    col_types = "c"
  )
) %>%
  replace(is.na(.), "") %>%
  apply(., 2, \(x)gsub("[][ ]", "", x))

stacks <- list()

for (i in seq_len(ncol(crates))) {
  stacks[[i]] <- crates[, i]
  stacks[[i]] <- stacks[[i]][stacks[[i]] != ""]
}

part1 <- stacks
part2 <- stacks

inst <- stringr::str_match(
  string = move_orders,
  pattern = "^move (?<move>[0-9]+) from (?<from>[0-9]+) to (?<to>[0-9]+)$"
) %>%
  tibble::as.tibble(.) %>%
  dplyr::select(move, from, to) %>%
  dplyr::mutate(across(everything(), as.integer))

for (i in seq_len(nrow(inst))) {
  substack <- part1[[inst$from[i]]][1:inst$move[i]]
  part1[[inst$from[i]]] <- part1[[inst$from[i]]][-(1:inst$move[i])]
  part1[[inst$to[i]]] <- c(rev(substack), part1[[inst$to[i]]])
}
part1 <- paste(sapply(part1, el), collapse = "")

for (i in seq_len(nrow(inst))) {
  substack <- part2[[inst$from[i]]][1:inst$move[i]]
  part2[[inst$from[i]]] <- part2[[inst$from[i]]][-(1:inst$move[i])]
  part2[[inst$to[i]]] <- c(substack, part2[[inst$to[i]]])
}
part2 <- paste(sapply(part2, el), collapse = "")

glue::glue(
  "Part1: {part1}
   Part2: {part2}"
)
